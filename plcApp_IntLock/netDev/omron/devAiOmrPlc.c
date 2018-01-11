/* devAiOmrPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devAiOmrPlc.c: A part of EPICS device support for CS1 PLC made by Omron
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
 * 2006/02/22 jio: added support for long word and floating point data,
 * made all integer data signed
 */

#include        <aiRecord.h>
#include        <menuConvert.h>

/***************************************************************
 * Analog input (command/response IO)
 ***************************************************************/
LOCAL long init_ai_record(struct aiRecord *);
LOCAL long read_ai(struct aiRecord *);
LOCAL long ai_linear_convert(struct aiRecord *, int);
LOCAL long config_ai_command(dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_ai_response(dbCommon *, int *, uint8_t *, int *, void *, int);

FLOATDSET devAiOmrPlc = {
  6,
  NULL,
  netDevInit,
  init_ai_record,
  NULL,
  read_ai,
  ai_linear_convert
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devAiOmrPlc);
#endif


LOCAL long init_ai_record(struct aiRecord *pai)
{
  OMR_PLC *d;
  long ret;

  d = omr_calloc(0, 0, 0, 0, 2);

  if (pai->linr == menuConvertLINEAR)
    {
      pai->eslo = (pai->eguf - pai->egul) / 0xFFFF;
      pai->roff = 0;
    }

  ret = netDevInitXxRecord(
			   (struct dbCommon *) pai,
			   &pai->inp,
			   MPF_READ | OMR_GET_PROTO | OMR_TIMEOUT,
			   d,
			   omr_parse_link,
			   config_ai_command,
			   parse_ai_response
			   );
  if (ret == OK)
    {
      d->mpfopt = MPF_OPTION_PTR(pai->dpvt);
      d->mpfvar = MPF_VAR_PTR(pai->dpvt);
    }

  return ret;
}


LOCAL long read_ai(struct aiRecord *pai)
{
  return netDevReadWriteXx((struct dbCommon *) pai);
}


LOCAL long ai_linear_convert(struct aiRecord *pai, int after)
{
  if (!after) return OK;

  if (pai->linr == menuConvertLINEAR)
    {
      pai->eslo = (pai->eguf - pai->egul) / 0xFFFF;
      pai->roff = 0;
    }

  return OK;
}


LOCAL long config_ai_command(
			     struct dbCommon *pxx,
			     int *option,
			     uint8_t *buf,
			     int *len,
			     void *device,
			     int transaction_id
			     )
{
  struct aiRecord *pai = (struct aiRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_config_command(
			    buf,
			    len,
			    &pai->rval,
			    DBF_ULONG,
			    (d->dword || d->fpdat)? 2:1,
			    option,
			    d,
			    transaction_id
			    );
} 


LOCAL long parse_ai_response(
			     struct dbCommon *pxx,
			     int *option,
			     uint8_t *buf,
			     int *len,
			     void *device,
			     int transaction_id
			     )
{
  struct aiRecord *pai = (struct aiRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;
  long ret;

  if (d->dword || d->fpdat)
    {
      uint16_t u16_val[2];
      uint32_t u32_val;

      ret = omr_parse_response(
			       buf,
			       len,
			       &u16_val[0],
			       DBF_USHORT,
			       2,
			       option,
			       (OMR_PLC *) d,
			       transaction_id
			       );

      u32_val = u16_val[1] << 16 | u16_val[0];

      if (d->dword)
	{
	  pai->rval = u32_val;
	}
      else
	{
	  float *pfloat = (float *) &u32_val;
	  pai->val = (double) *pfloat;
	  if (ret == OK)
	    {
	      ret = 2; /* Don't convert */
	    }
	}
    }
  else
    {
      ret = omr_parse_response(
			       buf,
			       len,
			       &pai->rval,
			       DBF_LONG,
			       1,
			       option,
			       (OMR_PLC *) d,
			       transaction_id
			       );
    }

  return ret;
}



