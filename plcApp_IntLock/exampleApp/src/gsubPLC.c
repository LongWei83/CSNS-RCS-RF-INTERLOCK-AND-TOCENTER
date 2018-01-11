#include	<vxWorks.h>

#include	<types.h>

#include	<stdioLib.h>

#include    <stdlib.h>

#include	<dbDefs.h>

#include	<genSubRecord.h>

#include	<dbCommon.h>

#include	<recSup.h>


long PrgsubInit(struct genSubRecord*  pgsub)

{

    printf("genSubInit was called\n");

    return(0);

}



long Pr1Process(pgsub)
{
    struct genSubRecord  *pgsub;
    double *valptr1;
    int s,e,temp1,temp2;
	long m,n,temp3;

    /*strcpy(a, pgsub->a); */
	/*printf("string : %s and first string : %d \n", pgsub->a,a[2]);*/
    
	temp1 = pgsub->a;
	printf("pgsub->a : %d\n", pgsub->a);
	temp2 = pgsub->b;
	printf("pgsub->b : %d\n", pgsub->b);

    s = temp1 & 0x8000;
	printf("s : %d\n", s);

	e = temp1 & 0x7F80;
	printf("e : %d\n", e);

	temp1 = temp1 & 0x7F;
	printf("temp1 : %d\n", temp1);
    temp3 = temp1<< 16;
	printf("temp3 : %f\n", temp3);

	m = temp3 + temp2;
	printf("m : %f\n", m);
	if (e !=0)
		n = ((-1)**s)*(1+m)*(2**(e-127));
	else
	    n = ((-1)**s)*(0m)*(2**(-126));
	printf("n : %f\n", n);

    pgsub->vala = (float)n;

    /*valptr1 = pgsub->vala;*/   

    return(0);
}

/*long Valve1Process(pgsub)

    struct genSubRecord  *pgsub;

{

    char  str1[3]="\0",str2[3]="\0";
    short st,st1,st2;
    strcpy(str1, pgsub->a); 
    printf("str1 : %s and pgsub->a : %s \n", str1,pgsub->a);
    strcpy(str2, pgsub->b);
    st1 = atoi(str1);
    printf("st1 is %f\n", st1);
    st2 = atoi(str2); 
    st = pgsub->vala;  
    if((st1 == 0)&&(st2 ==0)) st = 0;
    else if((st1 == 1)&&(st2 ==1)) st = 3;
    else if((st1 == 0)&&(st2 ==1)) st = 1;
    else if((st1 == 1)&&(st2 ==0)) st = 2;    
}*/

