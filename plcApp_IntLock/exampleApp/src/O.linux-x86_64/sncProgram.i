# 1 "../sncProgram.st"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "../sncProgram.st"
# 1 "./../sncExample.stt" 1
program sncExample

short llrfAlarm1;
short llrfAlarmToInterLock1;
short llrfAlarm2;
short llrfAlarmToInterLock2;
short llrfAlarm3;
short llrfAlarmToInterLock3;
short llrfAlarm4;
short llrfAlarmToInterLock4;
short llrfAlarm5;
short llrfAlarmToInterLock5;
short llrfAlarm6;
short llrfAlarmToInterLock6;
short llrfAlarm7;
short llrfAlarmToInterLock7;
short llrfAlarm8;
short llrfAlarmToInterLock8;

assign llrfAlarm1 to "ACC_RCS_RRF:RRF1:LLRF:Alarm";
assign llrfAlarm2 to "ACC_RCS_RRF:RRF2:LLRF:Alarm";
assign llrfAlarm3 to "ACC_RCS_RRF:RRF3:LLRF:Alarm";
assign llrfAlarm4 to "ACC_RCS_RRF:RRF4:LLRF:Alarm";
assign llrfAlarm5 to "ACC_RCS_RRF:RRF5:LLRF:Alarm";
assign llrfAlarm6 to "ACC_RCS_RRF:RRF6:LLRF:Alarm";
assign llrfAlarm7 to "ACC_RCS_RRF:RRF7:LLRF:Alarm";
assign llrfAlarm8 to "ACC_RCS_RRF:RRF8:LLRF:Alarm";
assign llrfAlarmToInterLock1 to "rcs:interLock:LLRF:llrfAlarm1:bo";
assign llrfAlarmToInterLock2 to "rcs:interLock:LLRF:llrfAlarm2:bo";
assign llrfAlarmToInterLock3 to "rcs:interLock:LLRF:llrfAlarm3:bo";
assign llrfAlarmToInterLock4 to "rcs:interLock:LLRF:llrfAlarm4:bo";
assign llrfAlarmToInterLock5 to "rcs:interLock:LLRF:llrfAlarm5:bo";
assign llrfAlarmToInterLock6 to "rcs:interLock:LLRF:llrfAlarm6:bo";
assign llrfAlarmToInterLock7 to "rcs:interLock:LLRF:llrfAlarm7:bo";
assign llrfAlarmToInterLock8 to "rcs:interLock:LLRF:llrfAlarm8:bo";

monitor llrfAlarm1;
monitor llrfAlarm2;
monitor llrfAlarm3;
monitor llrfAlarm4;
monitor llrfAlarm5;
monitor llrfAlarm6;
monitor llrfAlarm7;
monitor llrfAlarm8;


ss ss1 {
    state a {
        when ((llrfAlarm1 + llrfAlarm2 + llrfAlarm3 + llrfAlarm4 + llrfAlarm5 +llrfAlarm6 + llrfAlarm7 + llrfAlarm8) == 0) {
     llrfAlarmToInterLock1 = llrfAlarm1;
            llrfAlarmToInterLock2 = llrfAlarm2;
            llrfAlarmToInterLock3 = llrfAlarm3;
            llrfAlarmToInterLock4 = llrfAlarm4;
            llrfAlarmToInterLock5 = llrfAlarm5;
            llrfAlarmToInterLock6 = llrfAlarm6;
            llrfAlarmToInterLock7 = llrfAlarm7;
            llrfAlarmToInterLock8 = llrfAlarm8;

            pvPut(llrfAlarmToInterLock1);
            pvPut(llrfAlarmToInterLock2);
            pvPut(llrfAlarmToInterLock3);
            pvPut(llrfAlarmToInterLock4);
            pvPut(llrfAlarmToInterLock5);
            pvPut(llrfAlarmToInterLock6);
            pvPut(llrfAlarmToInterLock7);
            pvPut(llrfAlarmToInterLock8);
        } state b
    }
    state b {
        when ((llrfAlarm1 + llrfAlarm2 + llrfAlarm3 + llrfAlarm4 + llrfAlarm5 + llrfAlarm6 + llrfAlarm7 + llrfAlarm8)>0) {
            llrfAlarmToInterLock1 = llrfAlarm1;
            llrfAlarmToInterLock2 = llrfAlarm2;
            llrfAlarmToInterLock3 = llrfAlarm3;
            llrfAlarmToInterLock4 = llrfAlarm4;
            llrfAlarmToInterLock5 = llrfAlarm5;
            llrfAlarmToInterLock6 = llrfAlarm6;
            llrfAlarmToInterLock7 = llrfAlarm7;
            llrfAlarmToInterLock8 = llrfAlarm8;

            pvPut(llrfAlarmToInterLock1);
            pvPut(llrfAlarmToInterLock2);
            pvPut(llrfAlarmToInterLock3);
            pvPut(llrfAlarmToInterLock4);
            pvPut(llrfAlarmToInterLock5);
            pvPut(llrfAlarmToInterLock6);
            pvPut(llrfAlarmToInterLock7);
            pvPut(llrfAlarmToInterLock8);
        } state a
    }
}
# 1 "../sncProgram.st" 2
