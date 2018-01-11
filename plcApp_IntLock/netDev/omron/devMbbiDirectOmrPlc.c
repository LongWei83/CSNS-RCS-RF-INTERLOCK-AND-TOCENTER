/* devMbbiDirectOmrPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devMbbiDirectOmrPlc.c: A part of EPICS device support for CS1 PLC made by Omron
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
 * 2005/08/22 jio added TCP support for CS1W-ETN21.
 *  passing option flag to Link Field Parser was changed from by value to
 * by pointer  
 *  support of signed data for ai/ao and longin/longout
 */

#include        <mbbiDirectRecord.h>

/***************************************************************
 * Mult-bit binary input (command/response IO)
 ***************************************************************/
LOCAL long init_mbbiDirect_record(struct mbbiDirectRecord *);
LOCAL long read_mbbiDirect(struct mbbiDirectRecord *);
LOCAL long config_mbbiDirect_command(struct dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_mbbiDirect_response(struct dbCommon *, int *, uint8_t *, int *, void *, int);

INTEGERDSET devMbbiDirectOmrPlc = {
  5,
  NULL,
  netDevInit,
  init_mbbiDirect_record,
  NULL,
  read_mbbiDirect
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devMbbiDirectOmrPlc);
#endif


LOCAL long init_mbbiDirect_record( struct mbbiDirectRecord *pMbbiDirect )
{
  OMR_PLC *d;
  long ret;

  d = omr_calloc(0, 0, 0, 0, 2);

  pMbbiDirect->nobt = 16;
  pMbbiDirect->mask = 0xFFFF;
  pMbbiDirect->shft = 0;

  ret = netDevInitXxRecord(
			   (struct dbCommon *) pMbbiDirect,
			   &pMbbiDirect->inp,
			   MPF_READ | OMR_GET_PROTO | OMR_TIMEOUT,
			   d,
			   omr_parse_link,
			   config_mbbiDirect_command,
			   parse_mbbiDirect_response
			   );
  if (ret == OK)
    {
      d->mpfopt = MPF_OPTION_PTR(pMbbiDirect->dpvt);
      d->mpfvar = MPF_VAR_PTR(pMbbiDirect->dpvt);
    }

  return ret;
}


LOCAL long read_mbbiDirect(struct mbbiDirectRecord *pMbbiDirect)
{
  return netDevReadWriteXx((struct dbCommon *) pMbbiDirect);
}


LOCAL long config_mbbiDirect_command(
				     struct dbCommon *pxx,
				     int *option,
				     uint8_t *buf,
				     int *len,
				     void *device,
				     int transaction_id
				     )
{
  struct mbbiDirectRecord *pmbbiDirect = (struct mbbiDirectRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_config_command(
			    buf,
			    len,
			    &pmbbiDirect->rval,
			    DBF_ULONG,
			    1,
			    option,
			    d,
			    transaction_id
			    );
} 


LOCAL long parse_mbbiDirect_response(
				     struct dbCommon *pxx,
				     int *option,
				     uint8_t *buf,
				     int *len,
				     void *device,
				     int transaction_id
				     )
{
  struct mbbiDirectRecord *pmbbiDirect = (struct mbbiDirectRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_parse_response(
			    buf,
			    len,
			    &pmbbiDirect->rval,
			    DBF_ULONG,
			    1,
			    option,
			    d,
			    transaction_id
			    );
}


