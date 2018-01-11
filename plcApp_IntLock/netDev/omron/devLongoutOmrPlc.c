/* devLongoutOmrPlc.c */
/****************************************************************************
 *                         COPYRIGHT NOTIFICATION
 *
 * devLongoutOmrPlc.c: A part of EPICS device support for CS1 PLC made by Omron
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

#include        <longoutRecord.h>

/***************************************************************
 * Long output (command/respons IO)
 ***************************************************************/
LOCAL long init_longout_record(struct longoutRecord *);
LOCAL long write_longout(struct longoutRecord *);
LOCAL long config_longout_command(struct dbCommon *, int *, uint8_t *, int *, void *, int);
LOCAL long parse_longout_response(struct dbCommon *, int *, uint8_t *, int *, void *, int);

INTEGERDSET devLoOmrPlc = {
  5,
  NULL,
  netDevInit,
  init_longout_record,
  NULL,
  write_longout
};

#if EPICS_REVISION == 14 && EPICS_MODIFICATION >= 2
epicsExportAddress(dset, devLoOmrPlc);
#endif


LOCAL long init_longout_record(struct longoutRecord *plongout)
{
  OMR_PLC *d;
  long ret;

  d = omr_calloc(0, 0, 0, 0, 2);

  ret = netDevInitXxRecord(
			   (struct dbCommon *) plongout,
			   &plongout->out,
			   MPF_WRITE | OMR_GET_PROTO | OMR_TIMEOUT,
			   d,
			   omr_parse_link,
			   config_longout_command,
			   parse_longout_response
			   );
  if (ret == OK)
    {
      d->mpfopt = MPF_OPTION_PTR(plongout->dpvt);
      d->mpfvar = MPF_VAR_PTR(plongout->dpvt);
    }

  return ret;
}


LOCAL long write_longout(struct longoutRecord *plongout)
{
  return netDevReadWriteXx((struct dbCommon *) plongout);
}


LOCAL long config_longout_command(
				  struct dbCommon *pxx,
				  int *option,
				  uint8_t *buf,
				  int *len,
				  void *device,
				  int transaction_id
				  )
{
  struct longoutRecord *plongout = (struct longoutRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;
  long ret;

  if (d->dword)
    {
      uint16_t u16_val[2];

      u16_val[0] = plongout->val >>  0;
      u16_val[1] = plongout->val >> 16;

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
			       &plongout->val,
			       DBF_LONG,
			       1,
			       option,
			       d,
			       transaction_id
			       );
    }
  
  return ret;
} 


LOCAL long parse_longout_response(
				  struct dbCommon *pxx,
				  int *option,
				  uint8_t *buf,
				  int *len,
				  void *device,
				  int transaction_id
				  )
{
  struct longoutRecord *plongout = (struct longoutRecord *)pxx;
  OMR_PLC *d = (OMR_PLC *) device;

  return omr_parse_response(
			    buf,
			    len,
			    &plongout->val,
			    DBF_ULONG,
			    (d->dword)? 2:1,
			    option,
			    d,
			    transaction_id
			    );
}


