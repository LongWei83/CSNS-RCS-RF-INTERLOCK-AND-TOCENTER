#include <stdio.h>

#include <dbDefs.h>
#include <registryFunction.h>
#include <subRecord.h>
#include <aSubRecord.h>
#include <epicsExport.h>
#include <dbAccess.h>

int mySubDebug;

static long mySubInit(subRecord *precord)
{
    if (mySubDebug)
        printf("Record %s called mySubInit(%p)\n",
               precord->name, (void*) precord);
    return 0;
}

static long mySubProcess(subRecord *precord)
{
    if (mySubDebug)
        printf("Record %s called mySubProcess(%p)\n",
               precord->name, (void*) precord);
    return 0;
}

static long myAsubInit(aSubRecord *precord)
{
    if (mySubDebug)
        printf("Record %s called myAsubInit(%p)\n",
               precord->name, (void*) precord);
    return 0;
}

static long myAsubProcess(aSubRecord *precord)
{
    if (mySubDebug)
        printf("Record %s called myAsubProcess(%p)\n",
               precord->name, (void*) precord);
    return 0;
}

static long addWV(aSubRecord *precord)
{
	double *a;
	double *b;
	double *c;
	double *d;
	double *e;
	double *f;
	
	double *aDest;
	int i;
	
	unsigned long noa;
	unsigned long nod;

	noa = precord->noa;
	nod = precord->nod;

	a = (double *)precord->a;
	b = (double *)precord->b;
	c = (double *)precord->c;
	d = (double *)precord->d;
	e = (double *)precord->e;
	f = (double *)precord->f;
	aDest = (double *)precord->vala;
	
	for (i=0;i<noa;i++)
	{
		aDest[i] = a[i] * b[0] + c[0] + d[i] * e[0] + f[0];
	}

	return 0;
}


static long stringChoose(aSubRecord *precord)
{
	char *a;
	char *aDest;
	char *bDest;
	char *c;
	double b;
	
	unsigned long noa;
	a = (char *)precord->a;
	c = (char *)precord->c;
	int strsize;
	aDest = (char *)precord->vala;
	bDest = (char *)precord->valb;

	noa = precord->noa;
	strsize = (int)noa;

	
	
	dbGetLink(&precord->inpa, DBR_STRING, precord->a, 0, &noa);
	dbGetLink(&precord->inpb, DBR_DOUBLE, &b, 0, 1);
	
    if(strcmp(a,c)!=0)
    {
	/*printf("b is %f\n",b);*/
	if(b == 0)
	{
		strncpy(bDest, a, strsize);
	}
	else
	{
		strncpy(aDest, a, strsize);
	}
    }

	strncpy(c,a,strsize);
	return 0;
}

static long stringRunning(aSubRecord *precord)
{
        char *a;
	char *b;
        char *aDest;
        double c;

        unsigned long noa;
	unsigned long nob;
        a = (char *)precord->a;
        b = (char *)precord->b;
        int strsize_a;
	int strsize_b;
        aDest = (char *)precord->vala;

        noa = precord->noa;
	nob = precord->nob;
        strsize_a = (int)noa;
	strsize_b = (int)nob;



        dbGetLink(&precord->inpa, DBR_STRING, precord->a, 0, &noa);
	dbGetLink(&precord->inpb, DBR_STRING, precord->b, 0, &nob);
        dbGetLink(&precord->inpc, DBR_DOUBLE, &c, 0, 1);

        if(c == 0)
        {
                strncpy(aDest, a, strsize_a);
        }
        else
        {
                strncpy(aDest, b, strsize_b);
        }

        return 0;
}

/* Register these symbols for use by IOC code: */

epicsExportAddress(int, mySubDebug);
epicsRegisterFunction(mySubInit);
epicsRegisterFunction(mySubProcess);
epicsRegisterFunction(myAsubInit);
epicsRegisterFunction(myAsubProcess);
epicsRegisterFunction(stringChoose);
epicsRegisterFunction(addWV);
epicsRegisterFunction(stringRunning);
