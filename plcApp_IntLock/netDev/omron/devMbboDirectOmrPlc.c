/* devMbboDirectOmrPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devMbboDirectOmrPlc.c: A part of EPICS device support for CS1 PLC made by Omron
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

#include        <mbboDirectRecord.h>

/***************************************************************
 * Mult-bit binary output (command/response IO)
 ***************************************************************/
LOCAL long init_mbboDirect_record(struct mbboDirectRecord *);
LOCAL long write_mbboDirect(struct mbboDirectRecord *);
LOCAL long config_mbboDirect_command(struct dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_mbboDirect_response(struct dbCommon *, int *, uint8_t *, int *, void *, int);

INTEGERDSET devMbboDirectOmrPlc = {
  5,
  NULL,
  netDevInit,
  init_mbboDirect_record,
  NULL,
  write_mbboDirect
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devMbboDirectOmrPlc);
#endif


LOCAL long init_mbboDirect_record(struct mbboDirectRecord *pMbboDirect)
{
  OMR_PLC *d;
  long ret;

  d = omr_calloc(0, 0, 0, 0, 2);

  pMbboDirect->nobt = 16;
  pMbboDirect->mask = 0xFFFF;
  pMbboDirect->shft = 0;

  ret = netDevInitXxRecord(
			   (struct dbCommon *) pMbboDirect,
			   &pMbboDirect->out,
			   MPF_WRITE | OMR_GET_PROTO | OMR_TIMEOUT,
			   d,
			   omr_parse_link,
			   config_mbboDirect_command,
			   parse_mbboDirect_response
			   );
  if (ret == OK)
    {
      d->mpfopt = MPF_OPTION_PTR(pMbboDirect->dpvt);
      d->mpfvar = MPF_VAR_PTR(pMbboDirect->dpvt);
    }

  return ret;
}


LOCAL long write_mbboDirect(struct mbboDirectRecord *pMbboDirect)
{
  return netDevReadWriteXx((struct dbCommon *) pMbboDirect);
}


LOCAL long config_mbboDirect_command(
				     struct dbCommon *pxx,
				     int *option,
				     uint8_t *buf,
				     int *len,
				     void *device,
				     int transaction_id
				     )
{
  struct mbboDirectRecord *pmbboDirect = (struct mbboDirectRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_config_command(
			    buf,
			    len,
			    &pmbboDirect->rval,
			    DBF_ULONG,
			    1,
			    option,
			    d,
			    transaction_id
			    );
} 


LOCAL long parse_mbboDirect_response(
				     struct dbCommon *pxx,
				     int *option,
				     uint8_t *buf,
				     int *len,
				     void *device,
				     int transaction_id
				     )
{
  struct mbboDirectRecord *pmbboDirect = (struct mbboDirectRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_parse_response(
			    buf,
			    len,
			    &pmbboDirect->rval,
			    DBF_ULONG,
			    1,
			    option,
			    d,
			    transaction_id
			    );
}


