/* devAoOmrPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devAoOmrPlc.c: A part of EPICS device support for CS1 PLC made by Omron
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

#include        <aoRecord.h>
#include        <menuConvert.h>

/***************************************************************
 * Analog output (command/response IO)
 ***************************************************************/
LOCAL long init_ao_record(struct aoRecord *);
LOCAL long write_ao(struct aoRecord *);
LOCAL long ao_linear_convert(struct aoRecord *, int);
LOCAL long config_ao_command(struct dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_ao_response(struct dbCommon *, int *, uint8_t *, int *, void *, int);

FLOATDSET devAoOmrPlc = {
  6,
  NULL,
  netDevInit,
  init_ao_record,
  NULL,
  write_ao,
  ao_linear_convert
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devAoOmrPlc);
#endif


LOCAL long init_ao_record(struct aoRecord *pao)
{
  OMR_PLC *d;
  long ret;

  d = omr_calloc(0, 0, 0, 0, 2);

  if (pao->linr == menuConvertLINEAR)
    {
      pao->eslo = (pao->eguf - pao->egul) / 0xFFFF;
      pao->roff = 0;
    }

  ret = netDevInitXxRecord(
			   (struct dbCommon *) pao,
			   &pao->out,
			   MPF_WRITE | OMR_GET_PROTO | OMR_TIMEOUT,
			   d,
			   omr_parse_link,
			   config_ao_command,
			   parse_ao_response
			   );
  if (ret == OK)
    {
      d->mpfopt = MPF_OPTION_PTR(pao->dpvt);
      d->mpfvar = MPF_VAR_PTR(pao->dpvt);
    }

  return ret;
}


LOCAL long write_ao(struct aoRecord *pao)
{
  return netDevReadWriteXx((struct dbCommon *) pao);
}


LOCAL long ao_linear_convert(struct aoRecord *pao, int after)
{
  if (!after) return OK;

  if (pao->linr == menuConvertLINEAR)
    {
      pao->eslo = (pao->eguf - pao->egul) / 0xFFFF;
      pao->roff = 0;
    }

  return OK;
}


LOCAL long config_ao_command(
			     struct dbCommon *pxx,
			     int *option,
			     uint8_t *buf,
			     int *len,
			     void *device,
			     int transaction_id
			     )
{
  struct aoRecord *pao = (struct aoRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;
  long ret;

  if (d->dword || d->fpdat)
    {
      uint16_t u16_val[2];
      uint32_t u32_val;

      if (d->dword)
	{
	  u32_val = pao->rval;
	}
      else
	{
	  float flt_val = (float) pao->val;
	  u32_val = *((uint32_t *) &flt_val);
	}

      u16_val[0] = u32_val >>  0;
      u16_val[1] = u32_val >> 16;

      ret = omr_config_command(
			       buf,
			       len,
			       &u16_val[0],
			       DBF_USHORT,
			       2,
			       option,
			       d,
			       transaction_id
			       );
    }
  else
    {
      ret = omr_config_command(
			       buf,
			       len,
			       &pao->rval,
			       DBF_LONG,
			       1,
			       option,
			       d,
			       transaction_id
			       );
    }

  return ret;
} 


LOCAL long parse_ao_response(
			     struct dbCommon *pxx,
			     int *option,
			     uint8_t *buf,
			     int *len,
			     void *device,
			     int transaction_id
			     )
{
  struct aoRecord *pao = (struct aoRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_parse_response(
			    buf,
			    len,
			    &pao->rval,
			    DBF_ULONG,
			    (d->dword || d->fpdat)? 2:1,
			    option,
			    d,
			    transaction_id
			    );
}


