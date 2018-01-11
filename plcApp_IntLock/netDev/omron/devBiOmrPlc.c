/* devBiOmrPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devBiOmrPlc.c: A part of EPICS device support for CS1 PLC made by Omron
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

#include        <biRecord.h>

/***************************************************************
 * Binary input (command/response IO)
 ***************************************************************/
LOCAL long init_bi_record(struct biRecord *);
LOCAL long read_bi(struct biRecord *);
LOCAL long config_bi_command(struct dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_bi_response(struct dbCommon *, int *, uint8_t *, int *, void *, int);

INTEGERDSET devBiOmrPlc = {
  5,
  NULL,
  netDevInit,
  init_bi_record,
  NULL,
  read_bi
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devBiOmrPlc);
#endif


LOCAL long init_bi_record(struct biRecord *pbi)
{
  OMR_PLC *d;
  long ret;

  d = omr_calloc(0, 0, 0, 0, 1);

  pbi->mask = 1;

  ret = netDevInitXxRecord(
			   (struct dbCommon *) pbi,
			   &pbi->inp,
			   MPF_READ | OMR_GET_PROTO | OMR_TIMEOUT,
			   d,
			   omr_parse_link,
			   config_bi_command,
			   parse_bi_response
			   );
  if (ret == OK)
    {
      d->mpfopt = MPF_OPTION_PTR(pbi->dpvt);
      d->mpfvar = MPF_VAR_PTR(pbi->dpvt);
    }

  return ret;
}


LOCAL long read_bi(struct biRecord *pbi)
{
  return netDevReadWriteXx((struct dbCommon *) pbi);
}


LOCAL long config_bi_command(
			     struct dbCommon *pxx,
			     int *option,
			     uint8_t *buf,
			     int *len,
			     void *device,
			     int transaction_id
			     )
{
  struct biRecord *pbi = (struct biRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_config_command(
			    buf,
			    len,
			    &pbi->rval,
			    DBF_ULONG,
			    1,
			    option,
			    d,
			    transaction_id
			    );
} 


LOCAL long parse_bi_response(
			     struct dbCommon *pxx,
			     int *option,
			     uint8_t *buf,
			     int *len,
			     void *device,
			     int transaction_id
)
{
  struct biRecord *pbi = (struct biRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_parse_response(
			    buf,
			    len,
			    &pbi->rval,
			    DBF_ULONG,
			    1,
			    option,
			    d,
			    transaction_id
			    );
}


