/* C code for program sncExample, generated by snc from ../sncExample.stt */
#include <string.h>
#include <stddef.h>
#include <stdio.h>
#include <limits.h>

#include "seq_snc.h"

/* Variable declarations */
struct seqg_vars {
# line 3 "../sncExample.stt"
	short llrfAlarm1;
# line 4 "../sncExample.stt"
	short llrfAlarmToInterLock1;
# line 5 "../sncExample.stt"
	short llrfAlarm2;
# line 6 "../sncExample.stt"
	short llrfAlarmToInterLock2;
# line 7 "../sncExample.stt"
	short llrfAlarm3;
# line 8 "../sncExample.stt"
	short llrfAlarmToInterLock3;
# line 9 "../sncExample.stt"
	short llrfAlarm4;
# line 10 "../sncExample.stt"
	short llrfAlarmToInterLock4;
# line 11 "../sncExample.stt"
	short llrfAlarm5;
# line 12 "../sncExample.stt"
	short llrfAlarmToInterLock5;
# line 13 "../sncExample.stt"
	short llrfAlarm6;
# line 14 "../sncExample.stt"
	short llrfAlarmToInterLock6;
# line 15 "../sncExample.stt"
	short llrfAlarm7;
# line 16 "../sncExample.stt"
	short llrfAlarmToInterLock7;
# line 17 "../sncExample.stt"
	short llrfAlarm8;
# line 18 "../sncExample.stt"
	short llrfAlarmToInterLock8;
};


/* Function declarations */

#define seqg_var (*(struct seqg_vars *const *)seqg_env)

/* Program init func */
static void seqg_init(PROG_ID seqg_env)
{
}

/****** Code for state "a" in state set "ss1" ******/

/* Event function for state "a" in state set "ss1" */
static seqBool seqg_event_ss1_0_a(SS_ID seqg_env, int *seqg_ptrn, int *seqg_pnst)
{
# line 49 "../sncExample.stt"
	if ((seqg_var->llrfAlarm1 + seqg_var->llrfAlarm2 + seqg_var->llrfAlarm3 + seqg_var->llrfAlarm4 + seqg_var->llrfAlarm5 + seqg_var->llrfAlarm6 + seqg_var->llrfAlarm7 + seqg_var->llrfAlarm8) == 0)
	{
		*seqg_pnst = 1;
		*seqg_ptrn = 0;
		return TRUE;
	}
	return FALSE;
}

/* Action function for state "a" in state set "ss1" */
static void seqg_action_ss1_0_a(SS_ID seqg_env, int seqg_trn, int *seqg_pnst)
{
	switch(seqg_trn)
	{
	case 0:
		{
# line 50 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock1 = seqg_var->llrfAlarm1;
# line 51 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock2 = seqg_var->llrfAlarm2;
# line 52 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock3 = seqg_var->llrfAlarm3;
# line 53 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock4 = seqg_var->llrfAlarm4;
# line 54 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock5 = seqg_var->llrfAlarm5;
# line 55 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock6 = seqg_var->llrfAlarm6;
# line 56 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock7 = seqg_var->llrfAlarm7;
# line 57 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock8 = seqg_var->llrfAlarm8;
# line 59 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 8/*llrfAlarmToInterLock1*/, DEFAULT, DEFAULT_TIMEOUT);
# line 60 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 9/*llrfAlarmToInterLock2*/, DEFAULT, DEFAULT_TIMEOUT);
# line 61 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 10/*llrfAlarmToInterLock3*/, DEFAULT, DEFAULT_TIMEOUT);
# line 62 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 11/*llrfAlarmToInterLock4*/, DEFAULT, DEFAULT_TIMEOUT);
# line 63 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 12/*llrfAlarmToInterLock5*/, DEFAULT, DEFAULT_TIMEOUT);
# line 64 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 13/*llrfAlarmToInterLock6*/, DEFAULT, DEFAULT_TIMEOUT);
# line 65 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 14/*llrfAlarmToInterLock7*/, DEFAULT, DEFAULT_TIMEOUT);
# line 66 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 15/*llrfAlarmToInterLock8*/, DEFAULT, DEFAULT_TIMEOUT);
		}
		return;
	}
}

/****** Code for state "b" in state set "ss1" ******/

/* Event function for state "b" in state set "ss1" */
static seqBool seqg_event_ss1_0_b(SS_ID seqg_env, int *seqg_ptrn, int *seqg_pnst)
{
# line 70 "../sncExample.stt"
	if ((seqg_var->llrfAlarm1 + seqg_var->llrfAlarm2 + seqg_var->llrfAlarm3 + seqg_var->llrfAlarm4 + seqg_var->llrfAlarm5 + seqg_var->llrfAlarm6 + seqg_var->llrfAlarm7 + seqg_var->llrfAlarm8) > 0)
	{
		*seqg_pnst = 0;
		*seqg_ptrn = 0;
		return TRUE;
	}
	return FALSE;
}

/* Action function for state "b" in state set "ss1" */
static void seqg_action_ss1_0_b(SS_ID seqg_env, int seqg_trn, int *seqg_pnst)
{
	switch(seqg_trn)
	{
	case 0:
		{
# line 71 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock1 = seqg_var->llrfAlarm1;
# line 72 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock2 = seqg_var->llrfAlarm2;
# line 73 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock3 = seqg_var->llrfAlarm3;
# line 74 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock4 = seqg_var->llrfAlarm4;
# line 75 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock5 = seqg_var->llrfAlarm5;
# line 76 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock6 = seqg_var->llrfAlarm6;
# line 77 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock7 = seqg_var->llrfAlarm7;
# line 78 "../sncExample.stt"
			seqg_var->llrfAlarmToInterLock8 = seqg_var->llrfAlarm8;
# line 80 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 8/*llrfAlarmToInterLock1*/, DEFAULT, DEFAULT_TIMEOUT);
# line 81 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 9/*llrfAlarmToInterLock2*/, DEFAULT, DEFAULT_TIMEOUT);
# line 82 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 10/*llrfAlarmToInterLock3*/, DEFAULT, DEFAULT_TIMEOUT);
# line 83 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 11/*llrfAlarmToInterLock4*/, DEFAULT, DEFAULT_TIMEOUT);
# line 84 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 12/*llrfAlarmToInterLock5*/, DEFAULT, DEFAULT_TIMEOUT);
# line 85 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 13/*llrfAlarmToInterLock6*/, DEFAULT, DEFAULT_TIMEOUT);
# line 86 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 14/*llrfAlarmToInterLock7*/, DEFAULT, DEFAULT_TIMEOUT);
# line 87 "../sncExample.stt"
			seq_pvPutTmo(seqg_env, 15/*llrfAlarmToInterLock8*/, DEFAULT, DEFAULT_TIMEOUT);
		}
		return;
	}
}

#undef seqg_var

/************************ Tables ************************/

/* Channel table */
static seqChan seqg_chans[] = {
	/* chName, offset, varName, varType, count, eventNum, efId, monitored, queueSize, queueIndex */
	{"ACC_RCS_RRF:RRF1:LLRF:Alarm", offsetof(struct seqg_vars, llrfAlarm1), "llrfAlarm1", P_SHORT, 1, 1, 0, 1, 0, 0},
	{"ACC_RCS_RRF:RRF2:LLRF:Alarm", offsetof(struct seqg_vars, llrfAlarm2), "llrfAlarm2", P_SHORT, 1, 2, 0, 1, 0, 0},
	{"ACC_RCS_RRF:RRF3:LLRF:Alarm", offsetof(struct seqg_vars, llrfAlarm3), "llrfAlarm3", P_SHORT, 1, 3, 0, 1, 0, 0},
	{"ACC_RCS_RRF:RRF4:LLRF:Alarm", offsetof(struct seqg_vars, llrfAlarm4), "llrfAlarm4", P_SHORT, 1, 4, 0, 1, 0, 0},
	{"ACC_RCS_RRF:RRF5:LLRF:Alarm", offsetof(struct seqg_vars, llrfAlarm5), "llrfAlarm5", P_SHORT, 1, 5, 0, 1, 0, 0},
	{"ACC_RCS_RRF:RRF6:LLRF:Alarm", offsetof(struct seqg_vars, llrfAlarm6), "llrfAlarm6", P_SHORT, 1, 6, 0, 1, 0, 0},
	{"ACC_RCS_RRF:RRF7:LLRF:Alarm", offsetof(struct seqg_vars, llrfAlarm7), "llrfAlarm7", P_SHORT, 1, 7, 0, 1, 0, 0},
	{"ACC_RCS_RRF:RRF8:LLRF:Alarm", offsetof(struct seqg_vars, llrfAlarm8), "llrfAlarm8", P_SHORT, 1, 8, 0, 1, 0, 0},
	{"rcs:interLock:LLRF:llrfAlarm1:bo", offsetof(struct seqg_vars, llrfAlarmToInterLock1), "llrfAlarmToInterLock1", P_SHORT, 1, 9, 0, 0, 0, 0},
	{"rcs:interLock:LLRF:llrfAlarm2:bo", offsetof(struct seqg_vars, llrfAlarmToInterLock2), "llrfAlarmToInterLock2", P_SHORT, 1, 10, 0, 0, 0, 0},
	{"rcs:interLock:LLRF:llrfAlarm3:bo", offsetof(struct seqg_vars, llrfAlarmToInterLock3), "llrfAlarmToInterLock3", P_SHORT, 1, 11, 0, 0, 0, 0},
	{"rcs:interLock:LLRF:llrfAlarm4:bo", offsetof(struct seqg_vars, llrfAlarmToInterLock4), "llrfAlarmToInterLock4", P_SHORT, 1, 12, 0, 0, 0, 0},
	{"rcs:interLock:LLRF:llrfAlarm5:bo", offsetof(struct seqg_vars, llrfAlarmToInterLock5), "llrfAlarmToInterLock5", P_SHORT, 1, 13, 0, 0, 0, 0},
	{"rcs:interLock:LLRF:llrfAlarm6:bo", offsetof(struct seqg_vars, llrfAlarmToInterLock6), "llrfAlarmToInterLock6", P_SHORT, 1, 14, 0, 0, 0, 0},
	{"rcs:interLock:LLRF:llrfAlarm7:bo", offsetof(struct seqg_vars, llrfAlarmToInterLock7), "llrfAlarmToInterLock7", P_SHORT, 1, 15, 0, 0, 0, 0},
	{"rcs:interLock:LLRF:llrfAlarm8:bo", offsetof(struct seqg_vars, llrfAlarmToInterLock8), "llrfAlarmToInterLock8", P_SHORT, 1, 16, 0, 0, 0, 0},
};

/* Event masks for state set "ss1" */
static const seqMask seqg_mask_ss1_0_a[] = {
	0x000001fe,
};
static const seqMask seqg_mask_ss1_0_b[] = {
	0x000001fe,
};

/* State table for state set "ss1" */
static seqState seqg_states_ss1[] = {
	{
	/* state name */        "a",
	/* action function */   seqg_action_ss1_0_a,
	/* event function */    seqg_event_ss1_0_a,
	/* entry function */    0,
	/* exit function */     0,
	/* event mask array */  seqg_mask_ss1_0_a,
	/* state options */     (0)
	},
	{
	/* state name */        "b",
	/* action function */   seqg_action_ss1_0_b,
	/* event function */    seqg_event_ss1_0_b,
	/* entry function */    0,
	/* exit function */     0,
	/* event mask array */  seqg_mask_ss1_0_b,
	/* state options */     (0)
	},
};

/* State set table */
static seqSS seqg_statesets[] = {
	{
	/* state set name */    "ss1",
	/* states */            seqg_states_ss1,
	/* number of states */  2
	},
};

/* Program table (global) */
seqProgram sncExample = {
	/* magic number */      2002004,
	/* program name */      "sncExample",
	/* channels */          seqg_chans,
	/* num. channels */     16,
	/* state sets */        seqg_statesets,
	/* num. state sets */   1,
	/* user var size */     sizeof(struct seqg_vars),
	/* param */             "",
	/* num. event flags */  0,
	/* encoded options */   (0 | OPT_CONN | OPT_NEWEF | OPT_REENT),
	/* init func */         seqg_init,
	/* entry func */        0,
	/* exit func */         0,
	/* num. queues */       0
};

/* Register sequencer commands and program */
#include "epicsExport.h"
static void sncExampleRegistrar (void) {
    seqRegisterSequencerCommands();
    seqRegisterSequencerProgram (&sncExample);
}
epicsExportRegistrar(sncExampleRegistrar);