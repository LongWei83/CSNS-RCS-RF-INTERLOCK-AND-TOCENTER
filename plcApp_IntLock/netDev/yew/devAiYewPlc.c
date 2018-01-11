/* devAiYewPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devAiYewPlc: A part of EPICS device support for FA-M3 PLC made by Yokogawa
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
 * 2006/02/22 jio: added support for long word and floating point data,
 * made all integer data signed
 */


#include        <aiRecord.h>
#include        <menuConvert.h>

#ifndef EPICS_REVISION
#include <epicsVersion.h>
#endif
#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
#include <epicsExport.h>
#endif

/***************************************************************
 * Analog input (command/response IO)
 ***************************************************************/
LOCAL long init_ai_record(struct aiRecord *);
LOCAL long read_ai(struct aiRecord *);
LOCAL long ai_linear_convert(struct aiRecord *, int);
LOCAL long config_ai_command(dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_ai_response(dbCommon *, int *, uint8_t *, int *, void *, int);

FLOATDSET devAiYewPlc = {
  6,
  NULL,
  netDevInit,
  init_ai_record,
  NULL,
  read_ai,
  ai_linear_convert
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devAiYewPlc);
#endif


LOCAL long init_ai_record(struct aiRecord *pai)
{
  if (pai->linr == menuConvertLINEAR)
    {
      pai->eslo = (pai->eguf - pai->egul) / 0xFFFF;
      pai->roff = 0;
    }

  return netDevInitXxRecord(
			    (struct dbCommon *) pai,
			    &pai->inp,
			    MPF_READ | YEW_GET_PROTO | DEFAULT_TIMEOUT,
			    yew_calloc(0, 0, 0, 2),
			    yew_parse_link,
			    config_ai_command,
			    parse_ai_response
			    );
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
  YEW_PLC *d = (YEW_PLC *) device;

  return yew_config_command(
			    buf,
			    len,
			    &pai->rval, /* not referenced */
			    DBF_LONG,   /* not referenced */
			    (d->dword || d->fpdat)? 2:1,
			    option,
			    d
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
  YEW_PLC *d = (YEW_PLC *) device;
  long ret;

  if (d->dword || d->fpdat)
    {
      uint16_t u16_val[2];
      uint32_t u32_val;

      ret = yew_parse_response(
			       buf,
			       len,
			       &u16_val[0],
			       DBF_USHORT,
			       2,
			       option,
			       d
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
      ret = yew_parse_response(
			       buf,
			       len,
			       &pai->rval,
			       DBF_LONG,
			       1,
			       option,
			       d
			       );
    }

  return ret;
}


