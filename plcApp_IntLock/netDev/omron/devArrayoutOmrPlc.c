/* devArrayoutOmrPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devArrayoutOmrPlc.c: A part of EPICS device support for CS1 PLC made by Omron
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

#include        <arrayoutRecord.h>

/***************************************************************
 * Arrayout (command/response IO)
 ***************************************************************/
LOCAL long init_arrayout_record(struct arrayoutRecord *);
LOCAL long write_arrayout(struct arrayoutRecord *);
LOCAL long config_arrayout_command(struct dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_arrayout_response(struct dbCommon *, int *, uint8_t *, int *, void *, int);

INTEGERDSET devAroOmrPlc = {
  5,
  NULL,
  netDevInit,
  init_arrayout_record,
  NULL,
  write_arrayout
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devAroOmrPlc);
#endif

static uint16_t *u16_val;

LOCAL long init_arrayout_record(struct arrayoutRecord *paro)
{
  OMR_PLC *d;
  long ret;

  u16_val = (uint16_t *) calloc(2*paro->nelm, sizeofTypes[DBF_USHORT]);

  if (!u16_val)
    {
      errlogPrintf("devWaveformOmrPlc: calloc failed\n");
      return ERROR;
    }

  d = omr_calloc(0, 0, 0, 0, 2);

  ret = netDevInitXxRecord(
			   (struct dbCommon *) paro,
			   &paro->out,
			   MPF_WRITE | OMR_GET_PROTO | OMR_TIMEOUT,
			   d,
			   omr_parse_link,
			   config_arrayout_command,
			   parse_arrayout_response
			   );
  if (ret == OK)
    {
      d->mpfopt = MPF_OPTION_PTR(paro->dpvt);
      d->mpfvar = MPF_VAR_PTR(paro->dpvt);
    }

  return ret;
}


LOCAL long write_arrayout(struct arrayoutRecord *paro)
{
  TRANSACTION *t = (TRANSACTION *) paro->dpvt;
  OMR_PLC *d = (OMR_PLC *) t->device;

  /*
   * make sure that those below are cleared in the event that
   * a multi-step transfer is terminated by an error in the
   * middle of transacton
   */
  d->nleft = 0;
  d->noff = 0;

  return netDevReadWriteXx((struct dbCommon *) paro);
}


LOCAL long config_arrayout_command(
				   struct dbCommon *pxx,
				   int *option,
				   uint8_t *buf,
				   int *len,
				   void *device,
				   int transaction_id
				   )
{
  struct arrayoutRecord *paro = (struct arrayoutRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_config_command(
			    buf,
			    len,
			    paro->bptr,
			    paro->ftvl,
			    paro->nelm,
			    option,
			    d,
			    transaction_id
			    );
} 


LOCAL long parse_arrayout_response(
				   struct dbCommon *pxx,
				   int *option,
				   uint8_t *buf,
				   int *len,
				   void *device,
				   int transaction_id
				   )
{
  struct arrayoutRecord *paro = (struct arrayoutRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;
  long ret;

  ret = omr_parse_response(
			   buf,
			   len,
			   paro->bptr,
			   paro->ftvl,
			   paro->nelm,
			   option,
			   d,
			   transaction_id
			   );

  switch (ret)
    {
    case NOT_DONE:
      paro->nowt = d->noff;
    case 0:
      paro->nowt = paro->nelm;
    default:
      ;
    }

  return ret;
}


