/*************************************************************************\
* Copyright (c) 2007 UChicago Argonne LLC, as Operator of Argonne
*     National Laboratory.
* Copyright (c) 2002 The Regents of the University of California, as
*     Operator of Los Alamos National Laboratory.
* EPICS BASE is distributed subject to a Software License Agreement found
* in file LICENSE that is included with this distribution. 
\*************************************************************************/

/* Revision-Id: anj@aps.anl.gov-20131120222110-3o0wgh76u652ad4e */

/* Record Support Routines for Calculation records */
/*
 *      Original Author: Julie Sander and Bob Dalesio
 *      Date:            7-27-87
 */

#include <stddef.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "dbDefs.h"
#include "errlog.h"
#include "alarm.h"
#include "dbAccess.h"
#include "dbEvent.h"
#include "dbFldTypes.h"
#include "epicsMath.h"
#include "errMdef.h"
#include "recSup.h"
#include "recGbl.h"
#include "special.h"

#define GEN_SIZE_OFFSET
#include "biasdataRecord.h"
#undef  GEN_SIZE_OFFSET
#include "epicsExport.h"

/* Create RSET - Record Support Entry Table */

#define report NULL
#define initialize NULL
static long init_record(biasdataRecord *prec, int pass);
static long process(biasdataRecord *prec);
#define get_value NULL
#define cvt_dbaddr NULL
#define get_array_info NULL
#define put_array_info NULL
static long get_units(DBADDR *paddr, char *units);
static long get_precision(DBADDR *paddr, long *precision);
#define get_enum_str NULL
#define get_enum_strs NULL
#define put_enum_str NULL
static long get_graphic_double(DBADDR *paddr, struct dbr_grDouble *pgd);
static long get_ctrl_double(DBADDR *paddr, struct dbr_ctrlDouble *pcd);
static long get_alarm_double(DBADDR *paddr, struct dbr_alDouble *pad);

rset biasdataRSET={
	RSETNUMBER,
	report,
	initialize,
	init_record,
	process,
	NULL,
	get_value,
	cvt_dbaddr,
	get_array_info,
	put_array_info,
	get_units,
	get_precision,
	get_enum_str,
	get_enum_strs,
	put_enum_str,
	get_graphic_double,
	get_ctrl_double,
	get_alarm_double
};
epicsExportAddress(rset, biasdataRSET);

static void checkAlarms(biasdataRecord *prec);
static void monitor(biasdataRecord *prec);
static int fetch_values(biasdataRecord *prec);


static long init_record(biasdataRecord *prec, int pass)
{
    struct link *plink;
    double *pvalue;
    int i;

    if (pass==0) return(0);

    plink = &prec->inpa;
    pvalue = &prec->a;
    for (i = 0; i < 2; i++, plink++, pvalue++) {
	if (plink->type == CONSTANT) {
	    recGblInitConstantLink(plink, DBF_DOUBLE, pvalue);
	}
    }
    return 0;
}

static long process(biasdataRecord *prec)
{
    prec->pact = TRUE;
    if (fetch_values(prec)==0) {
    }
    else prec->udf = isnan(prec->val);
    recGblGetTimeStamp(prec);
    /* check for alarms */
    checkAlarms(prec);
    /* check event list */
    monitor(prec);
    /* process the forward scan link record */
    recGblFwdLink(prec);
    prec->pact = FALSE;
    return 0;
}


static long get_units(DBADDR *paddr, char *units)
{
    biasdataRecord *prec = (biasdataRecord *)paddr->precord;

    strncpy(units, prec->egu, DB_UNITS_SIZE);
    return 0;
}

static long get_precision(DBADDR *paddr, long *pprecision)
{
    biasdataRecord *prec = (biasdataRecord *)paddr->precord;
    int fieldIndex = dbGetFieldIndex(paddr);

    *pprecision = prec->prec;

    if (fieldIndex != biasdataRecordVAL)
	recGblGetPrec(paddr, pprecision);

    return 0;
}

static long get_graphic_double(DBADDR *paddr, struct dbr_grDouble *pgd)
{
    biasdataRecord *prec = (biasdataRecord *)paddr->precord;

    if (paddr->pfield == (void *)&prec->val ||
	paddr->pfield == (void *)&prec->hihi ||
	paddr->pfield == (void *)&prec->high ||
	paddr->pfield == (void *)&prec->low ||
	paddr->pfield == (void *)&prec->lolo) {
	pgd->upper_disp_limit = prec->hopr;
	pgd->lower_disp_limit = prec->lopr;
	return 0;
    }

    if (paddr->pfield >= (void *)&prec->a &&
	paddr->pfield <= (void *)&prec->b) {
	pgd->upper_disp_limit = prec->hopr;
	pgd->lower_disp_limit = prec->lopr;
	return 0;
    }
    if (paddr->pfield >= (void *)&prec->la &&
	paddr->pfield <= (void *)&prec->lb) {
	pgd->upper_disp_limit = prec->hopr;
	pgd->lower_disp_limit = prec->lopr;
	return 0;
    }
    recGblGetGraphicDouble(paddr, pgd);
    return 0;
}

static long get_ctrl_double(DBADDR *paddr, struct dbr_ctrlDouble *pcd)
{
    biasdataRecord *prec = (biasdataRecord *)paddr->precord;

    if (paddr->pfield == (void *)&prec->val ||
	paddr->pfield == (void *)&prec->hihi ||
	paddr->pfield == (void *)&prec->high ||
	paddr->pfield == (void *)&prec->low ||
	paddr->pfield == (void *)&prec->lolo) {
	pcd->upper_ctrl_limit = prec->hopr;
	pcd->lower_ctrl_limit = prec->lopr;
	return 0;
    }

    if (paddr->pfield >= (void *)&prec->a &&
	paddr->pfield <= (void *)&prec->b) {
	pcd->upper_ctrl_limit = prec->hopr;
	pcd->lower_ctrl_limit = prec->lopr;
	return 0;
    }
    if (paddr->pfield >= (void *)&prec->la &&
	paddr->pfield <= (void *)&prec->lb) {
	pcd->upper_ctrl_limit = prec->hopr;
	pcd->lower_ctrl_limit = prec->lopr;
	return 0;
    }
    recGblGetControlDouble(paddr, pcd);
    return 0;
}

static long get_alarm_double(DBADDR *paddr, struct dbr_alDouble *pad)
{
    biasdataRecord *prec = (biasdataRecord *)paddr->precord;

    if (paddr->pfield == (void *)&prec->val) {
        pad->upper_alarm_limit = prec->hhsv ? prec->hihi : epicsNAN;
        pad->upper_warning_limit = prec->hsv ? prec->high : epicsNAN;
        pad->lower_warning_limit = prec->lsv ? prec->low : epicsNAN;
        pad->lower_alarm_limit = prec->llsv ? prec->lolo : epicsNAN;
    } else {
	recGblGetAlarmDouble(paddr, pad);
    }
    return 0;
}

static void checkAlarms(biasdataRecord *prec)
{
    double val, hyst, lalm;
    double alev;
    epicsEnum16 asev;

    if (prec->udf) {
        recGblSetSevr(prec, UDF_ALARM, INVALID_ALARM);
        return;
    }

    val = prec->val;
    hyst = prec->hyst;
    lalm = prec->lalm;

    /* alarm condition hihi */
    asev = prec->hhsv;
    alev = prec->hihi;
    if (asev && (val >= alev || ((lalm == alev) && (val >= alev - hyst)))) {
        if (recGblSetSevr(prec, HIHI_ALARM, asev))
            prec->lalm = alev;
        return;
    }

    /* alarm condition lolo */
    asev = prec->llsv;
    alev = prec->lolo;
    if (asev && (val <= alev || ((lalm == alev) && (val <= alev + hyst)))) {
        if (recGblSetSevr(prec, LOLO_ALARM, asev))
            prec->lalm = alev;
        return;
    }

    /* alarm condition high */
    asev = prec->hsv;
    alev = prec->high;
    if (asev && (val >= alev || ((lalm == alev) && (val >= alev - hyst)))) {
        if (recGblSetSevr(prec, HIGH_ALARM, asev))
            prec->lalm = alev;
        return;
    }

    /* alarm condition low */
    asev = prec->lsv;
    alev = prec->low;
    if (asev && (val <= alev || ((lalm == alev) && (val <= alev + hyst)))) {
        if (recGblSetSevr(prec, LOW_ALARM, asev))
            prec->lalm = alev;
        return;
    }

    /* we get here only if val is out of alarm by at least hyst */
    prec->lalm = val;
    return;
}

static void monitor(biasdataRecord *prec)
{
    unsigned short monitor_mask;
    double delta, *pnew, *pprev;
    int i;

    monitor_mask = recGblResetAlarms(prec);
    /* check for value change */
    delta = prec->mlst - prec->val;
    if (delta < 0.0) delta = -delta;
    if (!(delta <= prec->mdel)) { /* Handles MDEL == NAN */
	/* post events for value change */
	monitor_mask |= DBE_VALUE;
	/* update last value monitored */
	prec->mlst = prec->val;
    }
    /* check for archive change */
    delta = prec->alst - prec->val;
    if (delta < 0.0) delta = -delta;
    if (!(delta <= prec->adel)) { /* Handles ADEL == NAN */
	/* post events on value field for archive change */
	monitor_mask |= DBE_LOG;
	/* update last archive value monitored */
	prec->alst = prec->val;
    }

    /* send out monitors connected to the value field */
    if (monitor_mask){
	db_post_events(prec, &prec->val, monitor_mask);
    }
    /* check all input fields for changes*/
    pnew = &prec->a;
    pprev = &prec->la;
    for (i = 0; i < 2; i++, pnew++, pprev++) {
	if (*pnew != *pprev ||
	    monitor_mask & DBE_ALARM) {
	    db_post_events(prec, pnew, monitor_mask | DBE_VALUE | DBE_LOG);
	    *pprev = *pnew;
	}
    }
    return;
}

static int fetch_values(biasdataRecord *prec)
{
    struct link *plink;
    unsigned short int *pvalue;
    long status = 0;
    int i;
    int sign=0;
    int exp =0;
    unsigned int data=0;
    double result=0;
    unsigned int index = 0x800000;
    int j = 0;

    plink = &prec->inpa;
    pvalue = &prec->a;
    for(i = 0; i < 2; i++, plink++, pvalue++) {
	int newStatus;

	newStatus = dbGetLink(plink, DBR_USHORT, pvalue, 0, 0);
	if (status == 0) status = newStatus;
    }
    
    sign = (prec->a & (0x8000))?-1:1;
    exp = ((prec->a >> 7) & (0xff))-127;
    data = (((prec->a ) & (0x7f))<<16) + (prec->b & (0xffff)) + 0x800000;

    for(j=0; j<24; j++)
    {
        index = 0x800000>>j;
	if((data & index) != 0)
                result += pow(2,exp - j);
    }  

    prec->val =result*sign;  
    
    return status;
}
