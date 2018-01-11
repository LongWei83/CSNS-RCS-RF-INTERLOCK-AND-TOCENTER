/* devMbbiDirectYewPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devMbbiDirectYewPlc: A part of EPICS device support for FA-M3 PLC made by
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

#include        <mbbiDirectRecord.h>

#ifndef EPICS_REVISION
#include <epicsVersion.h>
#endif
#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
#include <epicsExport.h>
#endif

/***************************************************************
 * Mult-bit binary input (command/response IO)
 ***************************************************************/
LOCAL long init_mbbiDirect_record(struct mbbiDirectRecord *);
LOCAL long read_mbbiDirect(struct mbbiDirectRecord *);
LOCAL long config_mbbiDirect_command(struct dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_mbbiDirect_response(struct dbCommon *, int *, uint8_t *, int *, void *, int);

INTEGERDSET devMbbiDirectYewPlc = {
  5,
  NULL,
  netDevInit,
  init_mbbiDirect_record,
  NULL,
  read_mbbiDirect
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devMbbiDirectYewPlc);
#endif


LOCAL long init_mbbiDirect_record( struct mbbiDirectRecord *pMbbiDirect )
{
  pMbbiDirect->nobt = 16;
  pMbbiDirect->mask = 0xFFFF;
  pMbbiDirect->shft = 0;

  return netDevInitXxRecord(
			    (struct dbCommon *) pMbbiDirect,
			    &pMbbiDirect->inp,
			    MPF_READ | YEW_GET_PROTO | DEFAULT_TIMEOUT,
			    yew_calloc(0, 0, 0, 2),
			    yew_parse_link,
			    config_mbbiDirect_command,
			    parse_mbbiDirect_response
			    );
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

  return yew_config_command(
			    buf,
			    len,
			    &pmbbiDirect->rval,
			    DBF_ULONG,
			    1,
			    option,
			    (YEW_PLC *) device
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

  return yew_parse_response(
			    buf,
			    len,
			    &pmbbiDirect->rval,
			    DBF_ULONG,
			    1,
			    option,
			    (YEW_PLC *) device
			    );
}


