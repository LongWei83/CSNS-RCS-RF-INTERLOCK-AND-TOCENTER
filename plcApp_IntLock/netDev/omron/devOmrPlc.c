/* devOmrPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devOmrPlc: EPICS device support for CS1 PLC made by Omron
 * Copyright (C) 2004  Misaki Komiyama (RIKEN)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 ****************************************************************************/
/* Author: Misaki Komiyama (RIKEN, misaki@riken.jp) */
/* Current Author: Jun-ichi Odagiri, (KEK, jun-ichi.odagiri@kek.jp) */
/* Modification Log:
 * -----------------
 * 2005/08/22 jio
 *  added TCP support for CS1W-ETN21.
 *  passing option flag to Link Field Parser was changed from by value to
 * by pointer  
 *  added support of signed data for ai/ao and longin/longout records
 * 2005/12/23 jio
 *  reduced timeout value down to 0.1 second
 * 2006/01/12 jio
 *  enabled to select TCP/UDP dinamically
 * 2006/02/22 jio: added support for long word and floating point data,
 * made all integer data signed
 */

#include        <dbFldTypes.h>

#include        "drvNetMpf.h"
#include        "devNetDev.h"

#ifndef EPICS_REVISION
#include <epicsVersion.h>
#endif
#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
#include <epicsExport.h>
#endif

#define OMR_CMND_LENGTH(x) (18 + (isTcp(x)? 16:0))
#define OMR_DATA_OFFSET(x) (14 + (isTcp(x)? 16:0))
#define OMR_DEFAULT_UNIT  0x00
#define OMR_DEFAULT_PORT  9600
#define OMR_GET_PROTO omr_get_protocol()
#define OMR_MAX_NDATA 128
#define OMR_NEEDS_SWAP (0x00ff != htons(0x00ff))
#define OMR_DNA_MAX 127
#define ETN01_DA1_MAX 126
#define OMR_SNA_MAX 127
#define ETN01_SA1_MAX 126
#define ETN02_FNA_MAX 254
#define OMR_ICF_COM 0x80
#define OMR_ICF_RES 0xc0
#define OMR_RSV     0x00
#define OMR_GCT     0x02
#define SA1(x) (isTcp(x)? (d->sa1? d->sa1:(d->mpfvar)[0]):d->sa1)
#define DA1(x) (isTcp(x)? (d->da1? d->da1:(d->mpfvar)[1]):d->da1)
#define OMR_TIMEOUT (TICK_PER_SECOND/10 | MPF_FINETMO)

LOCAL int sizeofTypes[] = {0,1,1,2,2,4,4,4,8,2};

static int omr_da1_max;
static int omr_sa1_max;

LOCAL long omr_parse_link(
			  struct link *,
			  struct sockaddr_in *,
			  int *,
			  void *
			  );
LOCAL int omr_get_protocol(void);
LOCAL void *omr_calloc(int, int, int, int, int);


typedef struct
{
  unsigned int      unit;
  unsigned int      type;
  unsigned int      chan;
  unsigned int      bit;
  unsigned int      width;
  unsigned int      dna;
  unsigned int      da1;
  unsigned int      sna;
  unsigned int      sa1;
  unsigned int      nleft;
  unsigned int      noff;
  unsigned int      dword;
  unsigned int      fpdat;
  unsigned int      model;
  unsigned int     *mpfopt;
  unsigned int     *mpfvar;
  char             *lopt;
} OMR_PLC;

LOCAL long omr_config_command(uint8_t *, int *, void *, int, int, int *, OMR_PLC *, int);
LOCAL long omr_parse_response(uint8_t *, int *, void *, int, int, int *, OMR_PLC *, int);

int omrPlcUseTcp = 0;


LOCAL int omr_get_protocol(void)
{
  if (omrPlcUseTcp)
    {
      return MPF_TCP;
    }

  return MPF_UDP;
}


LOCAL void *omr_calloc(
		       int unit,
		       int type,
		       int chan,
		       int bit,
		       int width
		       )
{
  OMR_PLC *d;

  d = (OMR_PLC *) calloc(1, sizeof(OMR_PLC));
  if (!d)
    {
      errlogPrintf("devOmrPlc: calloc failed\n");
      return NULL;
    }
      
  d->unit   = unit;
  d->type   = type;
  d->chan   = chan;
  d->bit    = bit;
  d->width  = width;

  return d;
}



#include        "devAiOmrPlc.c"
#include        "devAoOmrPlc.c"
#include        "devBiOmrPlc.c"
#include        "devBoOmrPlc.c"
#include        "devLonginOmrPlc.c"
#include        "devLongoutOmrPlc.c"
#include        "devMbbiDirectOmrPlc.c"
#include        "devMbboDirectOmrPlc.c"
#include        "devWaveformOmrPlc.c"
/*
#include        "devArrayoutOmrPlc.c"
*/


#define MAX_NUM_ETN_MODELS  3

static char *etn_model[MAX_NUM_ETN_MODELS] =
{
  "ETN01",
  "ETN11",
  "ETN21"
};

enum {etn01, etn11, etn21};


/*********************************************************************************
 * Link field parser for command/response I/O
 *********************************************************************************/
LOCAL long omr_parse_link(
			  struct link *plink,
			  struct sockaddr_in *peer_addr,
			  int *option,
			  void *device
			  )
{
  char *protocol = NULL;
  char *route = NULL;
  char *unit  = NULL;
  char *type  = NULL;
  char *addr  = NULL;
  char *lopt  = NULL;
  OMR_PLC *d = (OMR_PLC *) device;

  if (parseLinkPlcCommon(
			 plink,
			 peer_addr,
			 &protocol,
			 &route, /* dummy */
			 &unit,
			 &type,
			 &addr,
			 &lopt
			 ))
    {
      errlogPrintf("devOmrPlc: illeagal input specification\n");
      return ERROR;
    }

  if (!peer_addr->sin_port)
    {
      peer_addr->sin_port = htons(OMR_DEFAULT_PORT);
      LOGMSG("devOmrPlc: port: 0x%04x\n",ntohs(peer_addr->sin_port),
	     0,0,0,0,0,0,0,0);
    }

  if (unit)
    {
      if (strncmp(unit, "0x", 2) == 0)
	{
	  if (sscanf(unit, "%x", &d->unit) != 1)
	    {
	      errlogPrintf("devOmrPlc: can't get unit\n");
	      return ERROR;
	    }
	}
      else
	{
	  if (sscanf(unit, "%d", &d->unit) != 1)
	    {
	      errlogPrintf("devOmrPlc: can't get unit\n");
	      return ERROR;
	    }
	}
      LOGMSG("devOmrPlc: unit: %d\n",d->unit,0,0,0,0,0,0,0,0);
    }
  else
    {
      d->unit = OMR_DEFAULT_UNIT;
      LOGMSG("devOmrPlc: unit: %d\n",d->unit,0,0,0,0,0,0,0,0);
    }

  if (type)
    {
      if (strncmp(type, "0x", 2) == 0)
	{
	  if (sscanf(type, "%x", &d->type) != 1)
	    {
	      errlogPrintf("devOmrPlc: can't get device type\n");
	      return ERROR;
	    }
	}
      else
	{
	  if (sscanf(type, "%d", &d->type) != 1)
	    {
	      errlogPrintf("devOmrPlc: can't get device type\n");
	      return ERROR;
	    }
	}
    }
  else
    {
      errlogPrintf("devOmrPlc: device type not specified\n");
      return ERROR;
    }

  if (addr)
    {
      if (d->width == 1)
	{
	  /* bit device */

	  char *pc = strchr(addr, ':');

	  if (pc)
	    {
	      /* bit specified, addr = "chan:bit" */

	      *pc++ = '\0';

	      if (strncmp(pc, "0x", 2) == 0)
		{
		  if (sscanf(pc, "%x", &d->bit) != 1)
		    {
		      errlogPrintf("devOmrPlc: can't get bit address\n");
		      return ERROR;
		    }
		}
	      else
		{
		  if (sscanf(pc, "%d", &d->bit) != 1)
		    {
		      errlogPrintf("devOmrPlc: can't get bit address\n");
		      return ERROR;
		    }
		}
	    }
	  else
	    {
	      d->bit = 0;
	    }
	}

      if (strncmp(addr, "0x", 2) == 0)
	{
	  if (sscanf(addr, "%x", &d->chan) != 1)
	    {
	      errlogPrintf("devOmrPlc: can't get channel address\n");
	      return ERROR;
	    }
	}
      else
	{
	  if (sscanf(addr, "%d", &d->chan) != 1)
	    {
	      errlogPrintf("devOmrPlc: can't get channel address\n");
	      return ERROR;
	    }
	}
    }
  else
    {
      errlogPrintf("devOmrPlc: addr not specified\n");
      return ERROR;
    }

  /* set options to the default values */

  d->dna = 0x00;
  d->da1 = 0x00;
  d->sna = 0x00;
  d->sa1 = 0x00;

  d->model = etn01;
  *option |= MPF_SAMEPORT;
  omr_da1_max = ETN01_DA1_MAX;
  omr_sa1_max = ETN01_SA1_MAX;

  d->dword = 0;
  d->fpdat = 0;

  if (lopt)
    {
      /* lopt = "D1:5,S2:3,ETN21,s */

      char *pD = strchr(lopt, 'D');
      char *pS = strchr(lopt, 'S');
      char *pE = strchr(lopt, 'E');
      char *pL = strchr(lopt, 'L');
      char *pF = strchr(lopt, 'F');
      char *pC = lopt;

      LOGMSG("devOmrPlc: getting FINS node addr etc. from link option ...\n",
	     0,0,0,0,0,0,0,0,0);

      for (; pC = strchr(pC, ',');)
	{
	  *pC++ = '\0';
	}

      if (pD)  /* destination address specified */
	{
	  pC = strchr(pD++, ':');

	  if (!pC)
	    {
	      errlogPrintf("devOmrPlc: can't find DA1\n");
	      return ERROR;
	    }

	  *pC++ = '\0';

	  if (strncmp(pD, "0x", 2) == 0)
	    {
	      if (sscanf(pD, "%x", &d->dna) != 1)
		{
		  errlogPrintf("devOmrPlc: can't get DNA\n");
		  return ERROR;
		}

	      LOGMSG("devOmrPlc: d->dna: 0x%02x\n",d->dna,0,0,0,0,0,0,0,0);
	    }
	  else
	    {
	      if (sscanf(pD, "%d", &d->dna) != 1)
		{
		  errlogPrintf("devOmrPlc: can't get DNA\n");
		  return ERROR;
		}

	      LOGMSG("devOmrPlc: d->dna: 0x%02x\n",d->dna,0,0,0,0,0,0,0,0);
	    }

	  if (strncmp(pC, "0x", 2) == 0)
	    {
	      if (sscanf(pC, "%x", &d->da1) != 1)
		{
		  errlogPrintf("devOmrPlc: can't get DA1\n");
		  return ERROR;
		}

	      LOGMSG("devOmrPlc: d->da1: 0x%02x\n",d->da1,0,0,0,0,0,0,0,0);
	    }
	  else
	    {
	      if (sscanf(pC, "%d", &d->da1) != 1)
		{
		  errlogPrintf("devOmrPlc: can't get DA1\n");
		  return ERROR;
		}

	      LOGMSG("devOmrPlc: d->da1: 0x%02x\n",d->da1,0,0,0,0,0,0,0,0);
	    }
	}

      if (pS)  /* source address specified */
	{
	  pC = strchr(pS++, ':');

	  if (!pC)
	    {
	      errlogPrintf("devOmrPlc: can't find SA1\n");
	      return ERROR;
	    }

	  *pC++ = '\0';

	  if (strncmp(pS, "0x", 2) == 0)
	    {
	      if (sscanf(pS, "%x", &d->sna) != 1)
		{
		  errlogPrintf("devOmrPlc: can't get SNA\n");
		  return ERROR;
		}

	      LOGMSG("devOmrPlc: d->sna: 0x%02x\n",d->sna,0,0,0,0,0,0,0,0);
	    }
	  else
	    {
	      if (sscanf(pS, "%d", &d->sna) != 1)
		{
		  errlogPrintf("devOmrPlc: can't get SNA\n");
		  return ERROR;
		}

	      LOGMSG("devOmrPlc: d->sna: 0x%02x\n",d->sna,0,0,0,0,0,0,0,0);
	    }

	  if (strncmp(pC, "0x", 2) == 0)
	    {
	      if (sscanf(pC, "%x", &d->sa1) != 1)
		{
		  errlogPrintf("devOmrPlc: can't get SA1\n");
		  return ERROR;
		}

	      LOGMSG("devOmrPlc: d->sa1: 0x%02x\n",d->sa1,0,0,0,0,0,0,0,0);
	    }
	  else
	    {
	      if (sscanf(pC, "%d", &d->sa1) != 1)
		{
		  errlogPrintf("devOmrPlc: can't get SA1\n");
		  return ERROR;
		}

	      LOGMSG("devOmrPlc: d->sa1: 0x%02x\n",d->sa1,0,0,0,0,0,0,0,0);
	    }
	}

      if (d->dna == d->sna)  /* on the same network */
	{
	  d->dna = 0x00;
	  d->sna = 0x00;
	}

      if (pE)  /* Ethernet unit model specified */
	{
	  int i = 0;
	  int found = 0;
	  char **pmodel = etn_model;

	  LOGMSG("devOmrPlc: Ethernet unit model specified: %s\n",
		 pE,0,0,0,0,0,0,0,0);

	  for (; i < MAX_NUM_ETN_MODELS; i++)
	    {
	      LOGMSG("devOmrPlc: checking model with: %s\n",
		     pmodel[i],0,0,0,0,0,0,0,0);

	      if (strncmp(pE, pmodel[i], 5) == 0)
		{
		  LOGMSG("devOmrPlc: found: %s\n",pmodel[i],0,0,0,0,0,0,0,0);
		  found = 1;
		  d->model = i;
		  break;
		}
	    }

	  if (!found)
	    {
	      errlogPrintf("devOmrPlc: unknown model: %s\n", pE);
	      return ERROR;
	    }

	  switch (d->model)
	    {
	    case etn01:
	    case etn11:
	      /* default, alredy set */
	      break;
	    case etn21:
	      *option &= ~MPF_SAMEPORT;
	      omr_da1_max = ETN02_FNA_MAX;
	      omr_sa1_max = ETN02_FNA_MAX;
	      break;
	    default:
	      /* shoud not be here */
	      errlogPrintf("devOmrPlc: unknown model: %s\n", pE);
	      return ERROR;
	    }
	}

      if (pL)  /* treat data as long word data */
	{
	  d->dword = 1;
	  LOGMSG("devOmrPlc: found option to handle the data as long word data\n",0,0,0,0,0,0,0,0,0);
	}

      if (pF)  /* treat data as floating point data */
	{
	  d->fpdat = 1;
	  LOGMSG("devOmrPlc: found option to handle the data as floating point data\n",
		 0,0,0,0,0,0,0,0,0);
	}

      d->lopt = lopt;
    }

  if (protocol)
    {
      if (strncmp(protocol, "TCP", 3) == 0 ||
	  strncmp(protocol, "tcp", 3) == 0)
	{
	  switch (d->model)
	    {
	    case etn01:
	    case etn11:
	      errlogPrintf("devOmrPlc: %s does not support TCP\n", etn_model[d->model]);
	      return ERROR;
	    case etn21:
	      setTcp(*option);
	      break;
	    default:
	      /* shoud not be here */
	      errlogPrintf("devOmrPlc: unknown model (index):%d\n", d->model);
	      return ERROR;
	    }
	}
      else if (strncmp(protocol, "UDP", 3) == 0 ||
	       strncmp(protocol, "udp", 3) == 0)
	{
	  setUdp(*option);
	}
      else
	{
	  errlogPrintf("devOmrPlc: unrecognized protocol\n");
	  return ERROR;
	}
    }

  if (!d->da1)
    {
      LOGMSG("devOmrPlc: getting FINS node addr from ip addr ...\n",0,0,0,0,0,0,0,0,0);

      d->da1 = ntohl(peer_addr->sin_addr.s_addr) & 0x000000ff;

      LOGMSG("devOmrPlc: plc_ip: 0x%08x\n",ntohl(peer_addr->sin_addr.s_addr),0,0,0,0,0,0,0,0);
      LOGMSG("devOmrPlc: d->da1: 0x%02x\n",d->da1,0,0,0,0,0,0,0,0);
    }

  if (!d->sa1)
    {
      uint32_t ioc_ip;

      ioc_ip = netDevGetSelfId();
      if (ioc_ip == (uint32_t) ntohl(inet_addr("127.0.0.1")))
	{
	  if (isTcp(*option))
	    {
	      errlogPrintf("devOmrPlc: will use automatic allocation procedure for SA1\n");
	      ioc_ip = 0; /* use automatic allocation procedure */
	    }
	  else
	    {
	      errlogPrintf("devOmrPlc: can't get SA1 from IOC IP since it is localhost\n");
	      errlogPrintf("devOmrPlc: use DNS or /etc/hosts to make IOC IP available\n");
	      return ERROR;
	    }
	}
      d->sa1 = (int) (ioc_ip & 0x000000ff);

      LOGMSG("devOmrPlc: ioc_ip: 0x%08x\n",netDevGetSelfId(),0,0,0,0,0,0,0,0);
      LOGMSG("devOmrPlc: d->sa1: 0x%02x\n",d->sa1,0,0,0,0,0,0,0,0);
    }

  if (d->dna < 0 || d->dna > OMR_DNA_MAX)
    {
      errlogPrintf("devOmrPlc: DNA out of range(given:%d, max:%d)\n",
		   d->dna, OMR_DNA_MAX);
      return ERROR;
    }

  if (d->da1 <= 0 || d->da1 > omr_da1_max)
    {
      errlogPrintf("devOmrPlc: DA1 out of range(given:%d, max:%d)\n",
		   d->da1, omr_da1_max);
      return ERROR;
    }

  if (d->sna < 0 || d->sna > OMR_SNA_MAX)
    {
      errlogPrintf("devOmrPlc: SNA out of range(given:%d, max:%d)\n",
		   d->sna, OMR_SNA_MAX);
      return ERROR;
    }

  if ((d->sa1  < 0 || d->sa1 > omr_sa1_max) ||
      (d->sa1 == 0 && d->model != etn21))
    {
      errlogPrintf("devOmrPlc: SA1 out of range(given:%d, max:%d)\n",
		   d->sa1, omr_sa1_max);
      return ERROR;
    }

  switch (d->width)
    {
    case 1:
      {
	switch (d->type)
	  {
	    /*
	     * ADD ENTRIES HERE TO EXTEND THE DEVICE TYPES SUPPORTED
	     */
	  case 0x02:    /* I/O Memory Area : DM  (bit)*/
	    break;
	  case 0x30:    /* I/O Memory Area : CIO (bit)*/
	    break;
	  case 0x31:    /* I/O Memory Area : WR  (bit)*/
	    break;
	  case 0x32:    /* I/O Memory Area : HR  (bit)*/
	    break;
	  default:
	    errlogPrintf("devOmrPlc: illeagal device specification \'%x\' (width %d)\n",
			 d->type, d->width);
	    return ERROR;
	  }
      }
      break;
    case 2:
      {
	switch (d->type)
	  {
	    /*
	     * ADD ENTRIES HERE TO EXTEND THE DEVICE TYPES SUPPORTED
	     */
	  case 0x82:    /* I/O Memory Area : DM for both CS1 mode and CV mode */
	    break;
	  case 0xB0:    /* I/O Memory Area : CIO for CS1 mode */
	    break;
	  case 0xB1:    /* I/O Memory Area : WR for CS1 mode */
	    break;
	  case 0xB2:    /* I/O Memory Area : HR for CS1 mode */
	    break;
	  case 0x80:    /* I/O Memory Area : HR for CV mode */
	    break;
	  default:
	    errlogPrintf("devOmrPlc: unknown device type \'%x\'\n", d->type);
	    return ERROR;
	  }
      }
      break;
    default:
      errlogPrintf("devOmrPlc: illeagal data width %d\n", d->width);
      return ERROR;
    }

  return OK;
}





/******************************************************************************
 * Command constructor for command/response I/O
 ******************************************************************************/
LOCAL long omr_config_command(
			      uint8_t *buf,    /* driver buf addr     */
			      int     *len,    /* driver buf size     */
			      void    *bptr,   /* record buf addr     */
			      int      ftvl,   /* record field type   */
			      int      ndata,  /* n to be transferred */
			      int     *option, /* direction etc.      */
			      OMR_PLC *d,
			      int      sid
			      )
{
  int nread;
  int nwrite;
  int n;
  int offset = 0;

  LOGMSG("devOmrPlc: omr_config_command(0x%08x,%d,0x%08x,%d,%d,%d,0x%08x)\n",
	 buf,*len,bptr,ftvl,ndata,*option,d,0,0);

  if (isTcp(*option) && isReconn(*d->mpfopt))
    {
      /* FINS NODE ADRESS DATA SEND (CLIENT TO SERVER) Command */  

      buf[ 0] = 'F';           /* Header */
      buf[ 1] = 'I';
      buf[ 2] = 'N';
      buf[ 3] = 'S';
      buf[ 4] = 0x00;          /* Length */
      buf[ 5] = 0x00;
      buf[ 6] = 0x00;
      buf[ 7] = 0x0C;
      buf[ 8] = 0x00;          /* Command */
      buf[ 9] = 0x00;
      buf[10] = 0x00;
      buf[11] = 0x00;
      buf[12] = 0x00;          /* Error Code */
      buf[13] = 0x00;
      buf[14] = 0x00;
      buf[15] = 0x00;
      buf[16] = d->sa1 >> 24;  /* Client Node Addr */
      buf[17] = d->sa1 >> 16;
      buf[18] = d->sa1 >>  8;
      buf[19] = d->sa1;        /* if SA1 is 0, get it by using automatic allocation procedure */

      *len = 20;

      return OK;
    }

  if (ndata > OMR_MAX_NDATA)
    {
      if (!d->noff)
	{
	  /* for the first time */
	  d->nleft = ndata;
	}

      n = (d->nleft > OMR_MAX_NDATA) ? OMR_MAX_NDATA : d->nleft;
    }
  else
    {
      n = ndata;
    }

  nwrite = isWrite(*option) ? (d->width)*n : 0;

  if (*len < OMR_CMND_LENGTH(*option) + nwrite)
    {
      errlogPrintf("devOmrPlc: buffer is running short\n");
      return ERROR;
    }

  if (isTcp(*option))
    {
      int length = 8 + 18 + nwrite;

      /* FINS FRAME SEND Command */  

      buf[ 0] = 'F';           /* Header */
      buf[ 1] = 'I';
      buf[ 2] = 'N';
      buf[ 3] = 'S';
      buf[ 4] = 0x00;          /* Length */
      buf[ 5] = 0x00;
      buf[ 6] = 0x00;
      buf[ 7] = length;        /* Length of data from Command up to end of FINS frame */
      buf[ 8] = 0x00;          /* Command */
      buf[ 9] = 0x00;
      buf[10] = 0x00;
      buf[11] = 0x02;
      buf[12] = 0x00;          /* Error Code */
      buf[13] = 0x00;
      buf[14] = 0x00;
      buf[15] = 0x00;

      offset += 16;
    }

  buf[offset +  0] = OMR_ICF_COM;                /* ICF */
  buf[offset +  1] = OMR_RSV;                    /* RSV */
  buf[offset +  2] = OMR_GCT;                    /* GCT */
  buf[offset +  3] = d->dna;                     /* DNA */
  buf[offset +  4] = DA1(*option);               /* DA1, send to */
  buf[offset +  5] = d->unit;                    /* DA2, 0x00(CPU) by default */
  buf[offset +  6] = d->sna;                     /* SNA */
  buf[offset +  7] = SA1(*option);               /* SA1, sent from */
  buf[offset +  8] = 0x00;                       /* SA2 */
  buf[offset +  9] = sid;                        /* SID */
  buf[offset + 10] = 0x01;                       /* MRC */
  buf[offset + 11] = isRead(*option)? 0x01:0x02; /* SRC */
  buf[offset + 12] = d->type;                    /* I/O Memory Area           */ 
  buf[offset + 13] = (d->chan + d->noff) >> 8;   /* channel (high byte)       */
  buf[offset + 14] = (d->chan + d->noff);        /* channel (low  byte)       */
  buf[offset + 15] = d->bit;                     /* bit in the channel        */
  buf[offset + 16] = n >> 8;                     /* n of data   (high byte)   */
  buf[offset + 17] = n;                          /* n of data   (low  byte)   */

  if (isWrite(*option))
    {
      if (fromRecordVal(
			&buf[OMR_CMND_LENGTH(*option)],
			d->width,
			bptr,
			d->noff,
			ftvl,
			n,
			OMR_NEEDS_SWAP
			))
	{
	  errlogPrintf("devOmrPlc: illeagal command\n");
	  return ERROR;
	}
    }

  *len = OMR_CMND_LENGTH(*option) + nwrite;

  /*
  nread  = isRead(*option)? (d->width)*n:0;
  return (OMR_DATA_OFFSET + nread);
  */

  return OK;
}




/*******************************************************************************
 * Response parser for command/response I/O
 *******************************************************************************/
LOCAL long omr_parse_response(
			      uint8_t *buf,    /* driver buf addr     */
			      int     *len,    /* driver buf size     */
			      void    *bptr,   /* record buf addr     */
			      int      ftvl,   /* record field type   */
			      int      ndata,  /* n to be transferred */
			      int     *option, /* direction etc.      */
			      OMR_PLC *d,
			      int      sid
			      )
{
  int nread;
  int n;
  int ret;
  int offset = 0;

  LOGMSG("devOmrPlc: omr_parse_response(0x%08x,%d,0x%08x,%d,%d,%d,0x%08x)\n",
	 buf,len,bptr,ftvl,ndata,*option,d,0,0);

  if (isTcp(*option) && isReconn(*d->mpfopt))
    {
      /* should be FINS NODE ADRESS DATA SEND (SERVER TO CLIENT) Command */  

      if (
	  buf[ 0] != 'F'       ||      /* Header */
	  buf[ 1] != 'I'       ||
	  buf[ 2] != 'N'       ||
	  buf[ 3] != 'S'
	  )
	{
	  errlogPrintf("devOmrPlc: got unexpected FINS/TCP header upon connection\n");
	  return ERROR;
	}

      switch (buf[11]) /* Command */
	{
	case 0x06:
	  errlogPrintf("devOmrPlc: got CONNECTION CONFIRMATION upon connection\n");
	  return NOT_MINE;
	case 0x03:
	  errlogPrintf("devOmrPlc: got FINS FRAME SEND ERROR NORTIFICATION [0x%02x] upon connection\n",
		       buf[15]);
	  return ERROR;
	case 0x01:
	  if (buf[15] != 0x00) /* Error Code */
	    {
	      errlogPrintf("devOmrPlc: got error [0x%02x] upon connection\n",
			   buf[15]);
	      return ERROR;
	    }
	  if (buf[ 7] != 0x10) /* Length */
	    {
	      errlogPrintf("devOmrPlc: wrong length message upon connection\n");
	      return ERROR;
	    }
	  break;
	default:
	  errlogPrintf("devOmrPlc: unexpected FINS/TCP Command [0x%02x] upon connection\n",
		       buf[11]);
	  return ERROR;
	}

      if (NUM_MPF_VAR < 2)
	{
	  errlogPrintf("devOmrPlc: not enough room in mpf_var for node adresses\n");
	  return ERROR;
	}

      if (d->sa1)
	{
	  if (buf[19] != d->sa1) /* Client node address */
	    {
	      errlogPrintf("devOmrPlc: client node address dose not match\n");
	      return ERROR;
	    }
	}

      (d->mpfvar)[0] = buf[19]; /* Client node address */
      (d->mpfvar)[1] = buf[23]; /* Server node address */

      setStatic(*d->mpfopt);

      return NOT_DONE;
    }

  if (ndata > OMR_MAX_NDATA)
    {
      n   = (d->nleft > OMR_MAX_NDATA) ? OMR_MAX_NDATA : d->nleft;
      ret = (d->nleft > OMR_MAX_NDATA) ? NOT_DONE : 0;
    }
  else
    {
      n = ndata;
      ret = 0;
    }

  nread  = isRead(*option)? (d->width)*n:0; 

  if (isTcp(*option))
    {
      if (
	  buf[ 0] != 'F'       ||      /* Header */
	  buf[ 1] != 'I'       ||
	  buf[ 2] != 'N'       ||
	  buf[ 3] != 'S'
	  )
	{
	  errlogPrintf("devOmrPlc: got unexpected FINS/TCP header\n");
	  return ERROR;
	} 

      switch (buf[11]) /* Command */
	{
	case 0x06:
	  errlogPrintf("devOmrPlc: got CONNECTION CONFIRMATION\n");
	  return NOT_MINE;
	case 0x03:
	  errlogPrintf("devOmrPlc: got FINS FRAME SEND ERROR NORTIFICATION [0x%02x]\n",
		       buf[15]);
	  return ERROR;
	case 0x02:
	  break;
	default:
	  errlogPrintf("devOmrPlc: unexpected FINS/TCP Command [0x%02x]\n",
		       buf[11]);
	  return ERROR;
	}

      /* No need to check the additional four bytes of Error Code since
       * it's not used. Just skip the bytes.
       */
      offset += 16;
    }

  if (
      buf[offset + 0] != OMR_ICF_RES   ||      /* ICF */
      buf[offset + 1] != OMR_RSV       ||      /* RSV */
      buf[offset + 2] != OMR_GCT       ||      /* GCT */
      buf[offset + 3] != d->sna        ||      /* DNA, seen by PLC */
      buf[offset + 4] != SA1(*option)  ||      /* DA1, seen by PLC */
      buf[offset + 5] != 0x00          ||      /* DA2, seen by PLC */
      buf[offset + 6] != d->dna        ||      /* SNA, seen by PLC */
      buf[offset + 7] != DA1(*option)  ||      /* SA1, seen by PLC */
      buf[offset + 8] != d->unit       ||      /* SA2, seen by PLC */
      buf[offset + 9] != (uint8_t) sid         /* SID */
      )
    {
      errlogPrintf("devOmrPlc: FINS header dose not match\n");
      /*
      printf("sid = 0x%02x\n", (uint8_t) sid);
      */
      printf("sa1 = %d\n", d->sa1);

      return NOT_MINE;
    }

  if (
      buf[offset + 10] != 0x01 ||                      /* ICF */
      buf[offset + 11] != (isRead(*option)? 0x01:0x02) /* RSV */
      )
    {
      return ERROR;
    }

  if (
      buf[offset + 12] != 0x00 ||                /* res code (main) */
      buf[offset + 13] != 0x00                   /* res code (sub)  */
      )
    {
      errlogPrintf("devOmrPlc: ERROR response code was returned (0x%02X,0x%02X)\n",
		   buf[offset + 12], buf[offset + 13]);
      return ERROR;
    }

  if (isRead(*option))
    {
      if (toRecordVal(
		      bptr,
		      d->noff,
		      ftvl,
		      &buf[OMR_DATA_OFFSET(*option)],
		      d->width,
		      n,
		      OMR_NEEDS_SWAP
		      ))
	{
	  errlogPrintf("devOmrPlc: illeagal or error response\n");
	  return ERROR;
	}
    }

  if (ndata > OMR_MAX_NDATA)
    {
      d->nleft -= n;
      d->noff  += n;

      if (!d->nleft)
	{
	  /* for the last time */
	  d->noff = 0;
	}
    }

  return ret;
}



