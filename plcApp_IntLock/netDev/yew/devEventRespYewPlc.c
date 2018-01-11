/* devEventRespYewPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devEventRespYewPlc: A part of EPICS device support for FA-M3 PLC made by
 * Yokogawa
 * Copyright (C) 2004  Jun-ichi Odagiri (KEK)
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
/* Author: Jun-ichi Odagiri (jun-ichi.odagiri@kek.jp, KEK) */
/* Modification Log:
 * -----------------
 * 2005/08/22 jio
 *  passing option flag to Link Field Parser was changed from by value to
 * by pointer  
 */

#include        <eventRespRecord.h>

#ifndef EPICS_REVISION
#include <epicsVersion.h>
#endif
#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
#include <epicsExport.h>
#endif

#define YEW_EVRESP_SIZE 8
#define YEW_EVDT_OFFSET 2

int yewPlcEventUseDirect;

/***************************************************************
 * EventResp (event driven IO)
 ***************************************************************/
LOCAL long init_eventResp_record(struct eventRespRecord *);
LOCAL long config_eventResp_response(struct dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_eventResp_event(struct dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long read_eventResp(struct eventRespRecord *);

INTEGERDSET devEventRespYewPlc = {
  5,
  NULL,
  netDevInit,
  init_eventResp_record,
  netDevGetIoIntInfo,
  read_eventResp
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devEventRespYewPlc);
#endif


LOCAL long init_eventResp_record(struct eventRespRecord *per)
{

  return netDevInitXxRecord(
			    (struct dbCommon *) per,
			    &per->inp,
			    MPF_EVENT | MPF_WRITE | YEW_GET_PROTO | DEFAULT_TIMEOUT,
			    yew_calloc(0, 0, 0, 2),
			    yew_parse_link,
			    config_eventResp_response,
			    parse_eventResp_event
			    );
}



LOCAL long read_eventResp(struct eventRespRecord *per)
{
  TRANSACTION *t = (TRANSACTION *) per->dpvt;
  YEW_PLC *d = (YEW_PLC *) t->device;

  /*
   * make sure that those below are cleared in the event that
   * a multi-step transfer is terminated by an error in the
   * middle of transacton
   */
  d->nleft = 0;
  d->noff = 0;

  return netDevReadWriteXx((struct dbCommon *) per);
}



LOCAL long config_eventResp_response(
				    struct dbCommon *pxx,
				    int *option,
				    uint8_t *buf,
				    int *len,
				    void *device,
				    int transaction_id
				    )
{
  struct eventRespRecord *peventResp = (struct eventRespRecord *)pxx;

  return yew_config_response(
			     buf,
			     len,
			     peventResp->pres,
			     peventResp->ftvl,
			     peventResp->nres,
			     option,
			     (YEW_PLC *) device
			     );
} 


LOCAL long parse_eventResp_event(
				struct dbCommon *pxx,
				int *option,
				uint8_t *buf,
				int *len,
				void *device,
				int transaction_id
				)
{
  struct eventRespRecord *peventResp = (struct eventRespRecord *)pxx;
  YEW_PLC *d = (YEW_PLC *) device;
  long ret;

  ret = yew_parse_event(
			buf,
			len,
			peventResp->bptr,
			peventResp->ftvl,
			peventResp->nelm,
			option,
			d
			);

  switch (ret)
    {
    case NOT_DONE:
      peventResp->nord = d->noff;
    case 0:
      peventResp->nord = peventResp->nelm;
    default:
      ;
    }

  return ret;
}



/********************************************************************************
 * Response constructor for event driven I/O
 ********************************************************************************/
LOCAL long yew_config_response(
			       uint8_t *buf,    /* driver buf addr     */
			       int     *len,    /* driver buf size     */
			       void    *bptr,   /* record buf addr     */
			       int      ftvl,   /* record field type   */
			       int      ndata,  /* n to be transferred */
			       int     *option, /* direction (R/W)     */
			       YEW_PLC *d
			       )
{
  /*int nread  = isRead(*option)?  (d->width)*ndata:0;*/ 
  int nwrite = isWrite(*option)? (d->width)*ndata:0; 
  int data_offset;

  LOGMSG("devYewPlcEvent: yew_config_response(0x%08x,%d,0x%08x,%d,%d,%d,0x%08x)\n",
	 buf,*len,bptr,ftvl,ndata,*option,d,0,0);

  if (yewPlcEventUseDirect)
    {
      /* direct addressing */

      *len = 2;
      *((uint16_t *)&buf[0]) = htons (0x4f4b);

      LOGMSG("devYewPlcEvent: yew_config_response The response is :(%d,%d,%d)\n",
	     buf[0],buf[1],buf[2],0,0,0,0,0,0);
    }
  else
    {
      /* indirect addressing */

      if (*len < YEW_EVRESP_SIZE + nwrite)
	{
	  errlogPrintf("devYewPlcEvent: running short of buffer\n");
	  return ERROR;
	}
      *len = YEW_EVRESP_SIZE + nwrite;
      data_offset = YEW_EVRESP_SIZE;

      *((uint8_t  *) &buf[0]) = d->unit;                         /* CPU No.     */
      *((uint8_t  *) &buf[1]) = d->type;                         /* device type */
      *((uint32_t *) &buf[2]) = htonl(d->addr);                  /* device addr */
      *((uint16_t *) &buf[6]) = isWrite(*option) ? htons(ndata) : 0; /* n of data   */
    }

  if (isWrite(*option))
    {
      if (fromRecordVal(
			&buf[data_offset],
			d->width,
			bptr,
			0,
			ftvl,
			ndata,
			YEW_NEEDS_SWAP
			))
	{
	  errlogPrintf("devYewPlcEvent: illeagal command\n");
	  return ERROR;
	}
    }

  return OK;
} 




/********************************************************************************
 * Event parser for event driven I/O
 ********************************************************************************/
LOCAL long yew_parse_event(
			   uint8_t *buf,    /* driver buf addr     */
			   int     *len,    /* driver buf size     */
			   void    *bptr,   /* record buf addr     */
			   int      ftvl,   /* record field type   */
			   int      ndata,  /* n to be transferred */
			   int     *option, /* direction (R/W)     */
			   YEW_PLC *d
			   )
{
  /*int nread  = isRead(*option)? (d->width)*ndata:0; */
  uint16_t nread;
  nread = ntohs(*((uint16_t *) &buf[0]));

  LOGMSG("devYewPlcEvent: yew_parse_event(0x%08x,%d,0x%08x,%d,%d,%d,0x%08x)\n",
	 buf,len,bptr,ftvl,ndata,*option,d,0,0);

  if (yewPlcEventUseDirect)
    {

      LOGMSG("devYewPlcEvent: yewPlcEvent Use Direct mode \n",
	     0,0,0,0,0,0,0,0,0);

      if (nread > 26)
	{
	  errlogPrintf("devYewPlcEvent: event data size does not match (nread > 26) (%d)\n",
		       nread);
	  return ERROR;

	}
    }
  else
    {
      LOGMSG("devYewPlcEvent: yewPlcEvent Use Indirect mode \n",
	     0,0,0,0,0,0,0,0,0);

      if (nread > 128)
	{
	  errlogPrintf("devYewPlcEvent: event data size does not match (nread > 128) (%d)\n",
		       nread);
	  return ERROR;

	}

    }

  /*  if (*len != ((int)nread + 2))
    {
      errlogPrintf("devYewPlcEvent: event data size does not match (%d, %d)\n",
		   nread, *len);
      return ERROR;
    }
  */

   if (toRecordVal(
		   bptr,
		   0,
		   ftvl,
		   &buf[YEW_EVDT_OFFSET],
		   sizeofTypes[ftvl],
		   ndata,
		   YEW_NEEDS_SWAP
		   ))
     {
       errlogPrintf("devYewPlcEvent: illeagal or error response\n");
       return ERROR;
     }
    
   return OK;
}







