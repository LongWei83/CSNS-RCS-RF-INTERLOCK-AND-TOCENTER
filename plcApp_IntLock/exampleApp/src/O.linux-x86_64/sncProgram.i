# 1 "../sncProgram.st"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "../sncProgram.st"
# 1 "./../sncExample.stt" 1
program sncExample
double interval;
double statusFlag;
string logMsg;
double pvToSet;
int pvToSwitch;
double parameters1[36];
double parameters2[36];
double parameters3[36];
double parameters4[36];
double parameters5[36];
double parameters6[36];
double parameters7[36];
double parameters8[36];

int devNo = 0;
string pvName;

assign parameters1[0] to "AutoOnOff1:Parameter0";
assign parameters1[1] to "AutoOnOff1:Parameter1";
assign parameters1[2] to "AutoOnOff1:Parameter2";
assign parameters1[3] to "AutoOnOff1:Parameter3";
assign parameters1[4] to "AutoOnOff1:Parameter4";
assign parameters1[5] to "AutoOnOff1:Parameter5";
assign parameters1[6] to "AutoOnOff1:Parameter6";
assign parameters1[7] to "AutoOnOff1:Parameter7";
assign parameters1[8] to "AutoOnOff1:Parameter8";
assign parameters1[9] to "AutoOnOff1:Parameter9";
assign parameters1[10] to "AutoOnOff1:Parameter10";
assign parameters1[11] to "AutoOnOff1:Parameter11";
assign parameters1[12] to "AutoOnOff1:Parameter12";
assign parameters1[13] to "AutoOnOff1:Parameter13";
assign parameters1[14] to "AutoOnOff1:Parameter14";
assign parameters1[15] to "AutoOnOff1:Parameter15";
assign parameters1[16] to "AutoOnOff1:Parameter16";
assign parameters1[17] to "AutoOnOff1:Parameter17";
assign parameters1[18] to "AutoOnOff1:Parameter18";
assign parameters1[19] to "AutoOnOff1:Parameter19";
assign parameters1[20] to "AutoOnOff1:Parameter20";
assign parameters1[21] to "AutoOnOff1:Parameter21";
assign parameters1[22] to "AutoOnOff1:Parameter22";
assign parameters1[23] to "AutoOnOff1:Parameter23";
assign parameters1[24] to "AutoOnOff1:Parameter24";
assign parameters1[25] to "AutoOnOff1:Parameter25";
assign parameters1[26] to "AutoOnOff1:Parameter26";
assign parameters1[27] to "AutoOnOff1:Parameter27";
assign parameters1[28] to "AutoOnOff1:Parameter28";
assign parameters1[29] to "AutoOnOff1:Parameter29";
assign parameters1[30] to "AutoOnOff1:Parameter30";
assign parameters1[31] to "AutoOnOff1:Parameter31";
assign parameters1[32] to "AutoOnOff1:Parameter32";
assign parameters1[33] to "AutoOnOff1:Parameter33";
assign parameters1[34] to "AutoOnOff1:Parameter34";
assign parameters1[35] to "AutoOnOff1:Parameter35";

assign parameters2[0] to "AutoOnOff2:Parameter0";
assign parameters2[1] to "AutoOnOff2:Parameter1";
assign parameters2[2] to "AutoOnOff2:Parameter2";
assign parameters2[3] to "AutoOnOff2:Parameter3";
assign parameters2[4] to "AutoOnOff2:Parameter4";
assign parameters2[5] to "AutoOnOff2:Parameter5";
assign parameters2[6] to "AutoOnOff2:Parameter6";
assign parameters2[7] to "AutoOnOff2:Parameter7";
assign parameters2[8] to "AutoOnOff2:Parameter8";
assign parameters2[9] to "AutoOnOff2:Parameter9";
assign parameters2[10] to "AutoOnOff2:Parameter10";
assign parameters2[11] to "AutoOnOff2:Parameter11";
assign parameters2[12] to "AutoOnOff2:Parameter12";
assign parameters2[13] to "AutoOnOff2:Parameter13";
assign parameters2[14] to "AutoOnOff2:Parameter14";
assign parameters2[15] to "AutoOnOff2:Parameter15";
assign parameters2[16] to "AutoOnOff2:Parameter16";
assign parameters2[17] to "AutoOnOff2:Parameter17";
assign parameters2[18] to "AutoOnOff2:Parameter18";
assign parameters2[19] to "AutoOnOff2:Parameter19";
assign parameters2[20] to "AutoOnOff2:Parameter20";
assign parameters2[21] to "AutoOnOff2:Parameter21";
assign parameters2[22] to "AutoOnOff2:Parameter22";
assign parameters2[23] to "AutoOnOff2:Parameter23";
assign parameters2[24] to "AutoOnOff2:Parameter24";
assign parameters2[25] to "AutoOnOff2:Parameter25";
assign parameters2[26] to "AutoOnOff2:Parameter26";
assign parameters2[27] to "AutoOnOff2:Parameter27";
assign parameters2[28] to "AutoOnOff2:Parameter28";
assign parameters2[29] to "AutoOnOff2:Parameter29";
assign parameters2[30] to "AutoOnOff2:Parameter30";
assign parameters2[31] to "AutoOnOff2:Parameter31";
assign parameters2[32] to "AutoOnOff2:Parameter32";
assign parameters2[33] to "AutoOnOff2:Parameter33";
assign parameters2[34] to "AutoOnOff2:Parameter34";
assign parameters2[35] to "AutoOnOff2:Parameter35";

assign parameters3[0] to "AutoOnOff3:Parameter0";
assign parameters3[1] to "AutoOnOff3:Parameter1";
assign parameters3[2] to "AutoOnOff3:Parameter2";
assign parameters3[3] to "AutoOnOff3:Parameter3";
assign parameters3[4] to "AutoOnOff3:Parameter4";
assign parameters3[5] to "AutoOnOff3:Parameter5";
assign parameters3[6] to "AutoOnOff3:Parameter6";
assign parameters3[7] to "AutoOnOff3:Parameter7";
assign parameters3[8] to "AutoOnOff3:Parameter8";
assign parameters3[9] to "AutoOnOff3:Parameter9";
assign parameters3[10] to "AutoOnOff3:Parameter10";
assign parameters3[11] to "AutoOnOff3:Parameter11";
assign parameters3[12] to "AutoOnOff3:Parameter12";
assign parameters3[13] to "AutoOnOff3:Parameter13";
assign parameters3[14] to "AutoOnOff3:Parameter14";
assign parameters3[15] to "AutoOnOff3:Parameter15";
assign parameters3[16] to "AutoOnOff3:Parameter16";
assign parameters3[17] to "AutoOnOff3:Parameter17";
assign parameters3[18] to "AutoOnOff3:Parameter18";
assign parameters3[19] to "AutoOnOff3:Parameter19";
assign parameters3[20] to "AutoOnOff3:Parameter20";
assign parameters3[21] to "AutoOnOff3:Parameter21";
assign parameters3[22] to "AutoOnOff3:Parameter22";
assign parameters3[23] to "AutoOnOff3:Parameter23";
assign parameters3[24] to "AutoOnOff3:Parameter24";
assign parameters3[25] to "AutoOnOff3:Parameter25";
assign parameters3[26] to "AutoOnOff3:Parameter26";
assign parameters3[27] to "AutoOnOff3:Parameter27";
assign parameters3[28] to "AutoOnOff3:Parameter28";
assign parameters3[29] to "AutoOnOff3:Parameter29";
assign parameters3[30] to "AutoOnOff3:Parameter30";
assign parameters3[31] to "AutoOnOff3:Parameter31";
assign parameters3[32] to "AutoOnOff3:Parameter32";
assign parameters3[33] to "AutoOnOff3:Parameter33";
assign parameters3[34] to "AutoOnOff3:Parameter34";
assign parameters3[35] to "AutoOnOff3:Parameter35";

assign parameters4[0] to "AutoOnOff4:Parameter0";
assign parameters4[1] to "AutoOnOff4:Parameter1";
assign parameters4[2] to "AutoOnOff4:Parameter2";
assign parameters4[3] to "AutoOnOff4:Parameter3";
assign parameters4[4] to "AutoOnOff4:Parameter4";
assign parameters4[5] to "AutoOnOff4:Parameter5";
assign parameters4[6] to "AutoOnOff4:Parameter6";
assign parameters4[7] to "AutoOnOff4:Parameter7";
assign parameters4[8] to "AutoOnOff4:Parameter8";
assign parameters4[9] to "AutoOnOff4:Parameter9";
assign parameters4[10] to "AutoOnOff4:Parameter10";
assign parameters4[11] to "AutoOnOff4:Parameter11";
assign parameters4[12] to "AutoOnOff4:Parameter12";
assign parameters4[13] to "AutoOnOff4:Parameter13";
assign parameters4[14] to "AutoOnOff4:Parameter14";
assign parameters4[15] to "AutoOnOff4:Parameter15";
assign parameters4[16] to "AutoOnOff4:Parameter16";
assign parameters4[17] to "AutoOnOff4:Parameter17";
assign parameters4[18] to "AutoOnOff4:Parameter18";
assign parameters4[19] to "AutoOnOff4:Parameter19";
assign parameters4[20] to "AutoOnOff4:Parameter20";
assign parameters4[21] to "AutoOnOff4:Parameter21";
assign parameters4[22] to "AutoOnOff4:Parameter22";
assign parameters4[23] to "AutoOnOff4:Parameter23";
assign parameters4[24] to "AutoOnOff4:Parameter24";
assign parameters4[25] to "AutoOnOff4:Parameter25";
assign parameters4[26] to "AutoOnOff4:Parameter26";
assign parameters4[27] to "AutoOnOff4:Parameter27";
assign parameters4[28] to "AutoOnOff4:Parameter28";
assign parameters4[29] to "AutoOnOff4:Parameter29";
assign parameters4[30] to "AutoOnOff4:Parameter30";
assign parameters4[31] to "AutoOnOff4:Parameter31";
assign parameters4[32] to "AutoOnOff4:Parameter32";
assign parameters4[33] to "AutoOnOff4:Parameter33";
assign parameters4[34] to "AutoOnOff4:Parameter34";
assign parameters4[35] to "AutoOnOff4:Parameter35";

assign parameters5[0] to "AutoOnOff5:Parameter0";
assign parameters5[1] to "AutoOnOff5:Parameter1";
assign parameters5[2] to "AutoOnOff5:Parameter2";
assign parameters5[3] to "AutoOnOff5:Parameter3";
assign parameters5[4] to "AutoOnOff5:Parameter4";
assign parameters5[5] to "AutoOnOff5:Parameter5";
assign parameters5[6] to "AutoOnOff5:Parameter6";
assign parameters5[7] to "AutoOnOff5:Parameter7";
assign parameters5[8] to "AutoOnOff5:Parameter8";
assign parameters5[9] to "AutoOnOff5:Parameter9";
assign parameters5[10] to "AutoOnOff5:Parameter10";
assign parameters5[11] to "AutoOnOff5:Parameter11";
assign parameters5[12] to "AutoOnOff5:Parameter12";
assign parameters5[13] to "AutoOnOff5:Parameter13";
assign parameters5[14] to "AutoOnOff5:Parameter14";
assign parameters5[15] to "AutoOnOff5:Parameter15";
assign parameters5[16] to "AutoOnOff5:Parameter16";
assign parameters5[17] to "AutoOnOff5:Parameter17";
assign parameters5[18] to "AutoOnOff5:Parameter18";
assign parameters5[19] to "AutoOnOff5:Parameter19";
assign parameters5[20] to "AutoOnOff5:Parameter20";
assign parameters5[21] to "AutoOnOff5:Parameter21";
assign parameters5[22] to "AutoOnOff5:Parameter22";
assign parameters5[23] to "AutoOnOff5:Parameter23";
assign parameters5[24] to "AutoOnOff5:Parameter24";
assign parameters5[25] to "AutoOnOff5:Parameter25";
assign parameters5[26] to "AutoOnOff5:Parameter26";
assign parameters5[27] to "AutoOnOff5:Parameter27";
assign parameters5[28] to "AutoOnOff5:Parameter28";
assign parameters5[29] to "AutoOnOff5:Parameter29";
assign parameters5[30] to "AutoOnOff5:Parameter30";
assign parameters5[31] to "AutoOnOff5:Parameter31";
assign parameters5[32] to "AutoOnOff5:Parameter32";
assign parameters5[33] to "AutoOnOff5:Parameter33";
assign parameters5[34] to "AutoOnOff5:Parameter34";
assign parameters5[35] to "AutoOnOff5:Parameter35";

assign parameters6[0] to "AutoOnOff6:Parameter0";
assign parameters6[1] to "AutoOnOff6:Parameter1";
assign parameters6[2] to "AutoOnOff6:Parameter2";
assign parameters6[3] to "AutoOnOff6:Parameter3";
assign parameters6[4] to "AutoOnOff6:Parameter4";
assign parameters6[5] to "AutoOnOff6:Parameter5";
assign parameters6[6] to "AutoOnOff6:Parameter6";
assign parameters6[7] to "AutoOnOff6:Parameter7";
assign parameters6[8] to "AutoOnOff6:Parameter8";
assign parameters6[9] to "AutoOnOff6:Parameter9";
assign parameters6[10] to "AutoOnOff6:Parameter10";
assign parameters6[11] to "AutoOnOff6:Parameter11";
assign parameters6[12] to "AutoOnOff6:Parameter12";
assign parameters6[13] to "AutoOnOff6:Parameter13";
assign parameters6[14] to "AutoOnOff6:Parameter14";
assign parameters6[15] to "AutoOnOff6:Parameter15";
assign parameters6[16] to "AutoOnOff6:Parameter16";
assign parameters6[17] to "AutoOnOff6:Parameter17";
assign parameters6[18] to "AutoOnOff6:Parameter18";
assign parameters6[19] to "AutoOnOff6:Parameter19";
assign parameters6[20] to "AutoOnOff6:Parameter20";
assign parameters6[21] to "AutoOnOff6:Parameter21";
assign parameters6[22] to "AutoOnOff6:Parameter22";
assign parameters6[23] to "AutoOnOff6:Parameter23";
assign parameters6[24] to "AutoOnOff6:Parameter24";
assign parameters6[25] to "AutoOnOff6:Parameter25";
assign parameters6[26] to "AutoOnOff6:Parameter26";
assign parameters6[27] to "AutoOnOff6:Parameter27";
assign parameters6[28] to "AutoOnOff6:Parameter28";
assign parameters6[29] to "AutoOnOff6:Parameter29";
assign parameters6[30] to "AutoOnOff6:Parameter30";
assign parameters6[31] to "AutoOnOff6:Parameter31";
assign parameters6[32] to "AutoOnOff6:Parameter32";
assign parameters6[33] to "AutoOnOff6:Parameter33";
assign parameters6[34] to "AutoOnOff6:Parameter34";
assign parameters6[35] to "AutoOnOff6:Parameter35";

assign parameters7[0] to "AutoOnOff7:Parameter0";
assign parameters7[1] to "AutoOnOff7:Parameter1";
assign parameters7[2] to "AutoOnOff7:Parameter2";
assign parameters7[3] to "AutoOnOff7:Parameter3";
assign parameters7[4] to "AutoOnOff7:Parameter4";
assign parameters7[5] to "AutoOnOff7:Parameter5";
assign parameters7[6] to "AutoOnOff7:Parameter6";
assign parameters7[7] to "AutoOnOff7:Parameter7";
assign parameters7[8] to "AutoOnOff7:Parameter8";
assign parameters7[9] to "AutoOnOff7:Parameter9";
assign parameters7[10] to "AutoOnOff7:Parameter10";
assign parameters7[11] to "AutoOnOff7:Parameter11";
assign parameters7[12] to "AutoOnOff7:Parameter12";
assign parameters7[13] to "AutoOnOff7:Parameter13";
assign parameters7[14] to "AutoOnOff7:Parameter14";
assign parameters7[15] to "AutoOnOff7:Parameter15";
assign parameters7[16] to "AutoOnOff7:Parameter16";
assign parameters7[17] to "AutoOnOff7:Parameter17";
assign parameters7[18] to "AutoOnOff7:Parameter18";
assign parameters7[19] to "AutoOnOff7:Parameter19";
assign parameters7[20] to "AutoOnOff7:Parameter20";
assign parameters7[21] to "AutoOnOff7:Parameter21";
assign parameters7[22] to "AutoOnOff7:Parameter22";
assign parameters7[23] to "AutoOnOff7:Parameter23";
assign parameters7[24] to "AutoOnOff7:Parameter24";
assign parameters7[25] to "AutoOnOff7:Parameter25";
assign parameters7[26] to "AutoOnOff7:Parameter26";
assign parameters7[27] to "AutoOnOff7:Parameter27";
assign parameters7[28] to "AutoOnOff7:Parameter28";
assign parameters7[29] to "AutoOnOff7:Parameter29";
assign parameters7[30] to "AutoOnOff7:Parameter30";
assign parameters7[31] to "AutoOnOff7:Parameter31";
assign parameters7[32] to "AutoOnOff7:Parameter32";
assign parameters7[33] to "AutoOnOff7:Parameter33";
assign parameters7[34] to "AutoOnOff7:Parameter34";
assign parameters7[35] to "AutoOnOff7:Parameter35";

assign parameters8[0] to "AutoOnOff8:Parameter0";
assign parameters8[1] to "AutoOnOff8:Parameter1";
assign parameters8[2] to "AutoOnOff8:Parameter2";
assign parameters8[3] to "AutoOnOff8:Parameter3";
assign parameters8[4] to "AutoOnOff8:Parameter4";
assign parameters8[5] to "AutoOnOff8:Parameter5";
assign parameters8[6] to "AutoOnOff8:Parameter6";
assign parameters8[7] to "AutoOnOff8:Parameter7";
assign parameters8[8] to "AutoOnOff8:Parameter8";
assign parameters8[9] to "AutoOnOff8:Parameter9";
assign parameters8[10] to "AutoOnOff8:Parameter10";
assign parameters8[11] to "AutoOnOff8:Parameter11";
assign parameters8[12] to "AutoOnOff8:Parameter12";
assign parameters8[13] to "AutoOnOff8:Parameter13";
assign parameters8[14] to "AutoOnOff8:Parameter14";
assign parameters8[15] to "AutoOnOff8:Parameter15";
assign parameters8[16] to "AutoOnOff8:Parameter16";
assign parameters8[17] to "AutoOnOff8:Parameter17";
assign parameters8[18] to "AutoOnOff8:Parameter18";
assign parameters8[19] to "AutoOnOff8:Parameter19";
assign parameters8[20] to "AutoOnOff8:Parameter20";
assign parameters8[21] to "AutoOnOff8:Parameter21";
assign parameters8[22] to "AutoOnOff8:Parameter22";
assign parameters8[23] to "AutoOnOff8:Parameter23";
assign parameters8[24] to "AutoOnOff8:Parameter24";
assign parameters8[25] to "AutoOnOff8:Parameter25";
assign parameters8[26] to "AutoOnOff8:Parameter26";
assign parameters8[27] to "AutoOnOff8:Parameter27";
assign parameters8[28] to "AutoOnOff8:Parameter28";
assign parameters8[29] to "AutoOnOff8:Parameter29";
assign parameters8[30] to "AutoOnOff8:Parameter30";
assign parameters8[31] to "AutoOnOff8:Parameter31";
assign parameters8[32] to "AutoOnOff8:Parameter32";
assign parameters8[33] to "AutoOnOff8:Parameter33";
assign parameters8[34] to "AutoOnOff8:Parameter34";
assign parameters8[35] to "AutoOnOff8:Parameter35";


assign logMsg to "AutoOnOff:logMsg";
assign statusFlag to "AutoOnOff:StatusFlag";
assign interval to "AutoOnOff:Interval";
assign devNo to "AutoOnOff:CavityNum";

assign pvToSet to "";
assign pvToSwitch to "";
monitor interval;
monitor devNo;
monitor statusFlag;


ss ssOnOff {
    state standBy {
 when (statusFlag == 0 && delay(3)) {
     sprintf(logMsg,"StandBy...");
     pvPut(logMsg);
 } state standBy

 when (statusFlag == 1 && (devNo == 1 || devNo == 2 || devNo == 3 || devNo == 4 || devNo == 5 || devNo == 6 || devNo == 7 || devNo == 8)) {
     printf("AutoOnOff: Turn On System: OnInit\n");
 } state OnInit

 when (statusFlag == 10 && (devNo == 1 || devNo == 2 || devNo == 3 || devNo == 4 || devNo == 5 || devNo == 6 || devNo == 7 || devNo == 8)) {
     printf("AutoOnOff: Turn Off System: OffInit\n");
 } state OffInit
    }
    state OnInit {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (devNo == 1) {
            sprintf(pvName,"AutoOnOff:rcsRf%d:fixFrequency_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[0]);
     pvToSet = parameters1[0];
     pvPut(pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:workPeriod_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[1]);
     pvToSet = parameters1[1];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[2]);
     pvToSet = parameters1[2];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[3]);
     pvToSet = parameters1[3];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[5]);
     pvToSet = parameters1[5];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampPSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[6]);
     pvToSet = parameters1[6];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[7]);
     pvToSet = parameters1[7];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:biasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[8]);
     pvToSet = parameters1[8];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:fixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[9]);
     pvToSet = parameters1[9];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[10]);
     pvToSet = parameters1[10];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[11]);
     pvToSet = parameters1[11];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[12]);
     pvToSet = parameters1[12];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[13]);
     pvToSet = parameters1[13];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[14]);
     pvToSet = parameters1[14];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontBiasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[15]);
     pvToSet = parameters1[15];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontFixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[16]);
     pvToSet = parameters1[16];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[17]);
     pvToSet = parameters1[17];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[18]);
     pvToSet = parameters1[18];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:initial_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[19]);
     pvToSet = parameters1[19];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_p_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[20]);
     pvToSet = parameters1[20];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_i_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[21]);
     pvToSet = parameters1[21];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);
 } state OnInit2
 when (devNo == 2) {
            sprintf(pvName,"AutoOnOff:rcsRf%d:fixFrequency_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[0]);
     pvToSet = parameters2[0];
     pvPut(pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:workPeriod_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[1]);
     pvToSet = parameters2[1];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[2]);
     pvToSet = parameters2[2];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[3]);
     pvToSet = parameters2[3];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[5]);
     pvToSet = parameters2[5];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampPSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[6]);
     pvToSet = parameters2[6];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[7]);
     pvToSet = parameters2[7];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:biasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[8]);
     pvToSet = parameters2[8];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:fixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[9]);
     pvToSet = parameters2[9];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[10]);
     pvToSet = parameters2[10];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[11]);
     pvToSet = parameters2[11];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[12]);
     pvToSet = parameters2[12];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[13]);
     pvToSet = parameters2[13];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[14]);
     pvToSet = parameters2[14];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontBiasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[15]);
     pvToSet = parameters2[15];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontFixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[16]);
     pvToSet = parameters2[16];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[17]);
     pvToSet = parameters2[17];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[18]);
     pvToSet = parameters2[18];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:initial_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[19]);
     pvToSet = parameters2[19];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_p_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[20]);
     pvToSet = parameters2[20];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_i_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[21]);
     pvToSet = parameters2[21];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);
 } state OnInit2
 when (devNo == 3) {
            sprintf(pvName,"AutoOnOff:rcsRf%d:fixFrequency_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[0]);
     pvToSet = parameters3[0];
     pvPut(pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:workPeriod_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[1]);
     pvToSet = parameters3[1];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[2]);
     pvToSet = parameters3[2];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[3]);
     pvToSet = parameters3[3];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[5]);
     pvToSet = parameters3[5];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampPSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[6]);
     pvToSet = parameters3[6];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[7]);
     pvToSet = parameters3[7];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:biasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[8]);
     pvToSet = parameters3[8];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:fixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[9]);
     pvToSet = parameters3[9];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[10]);
     pvToSet = parameters3[10];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[11]);
     pvToSet = parameters3[11];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[12]);
     pvToSet = parameters3[12];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[13]);
     pvToSet = parameters3[13];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[14]);
     pvToSet = parameters3[14];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontBiasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[15]);
     pvToSet = parameters3[15];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontFixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[16]);
     pvToSet = parameters3[16];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[17]);
     pvToSet = parameters3[17];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[18]);
     pvToSet = parameters3[18];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:initial_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[19]);
     pvToSet = parameters3[19];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_p_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[20]);
     pvToSet = parameters3[20];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_i_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[21]);
     pvToSet = parameters3[21];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);
 } state OnInit2
 when (devNo == 4) {
            sprintf(pvName,"AutoOnOff:rcsRf%d:fixFrequency_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[0]);
     pvToSet = parameters4[0];
     pvPut(pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:workPeriod_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[1]);
     pvToSet = parameters4[1];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[2]);
     pvToSet = parameters4[2];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[3]);
     pvToSet = parameters4[3];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[5]);
     pvToSet = parameters4[5];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampPSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[6]);
     pvToSet = parameters4[6];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[7]);
     pvToSet = parameters4[7];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:biasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[8]);
     pvToSet = parameters4[8];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:fixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[9]);
     pvToSet = parameters4[9];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[10]);
     pvToSet = parameters4[10];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[11]);
     pvToSet = parameters4[11];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[12]);
     pvToSet = parameters4[12];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[13]);
     pvToSet = parameters4[13];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[14]);
     pvToSet = parameters4[14];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontBiasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[15]);
     pvToSet = parameters4[15];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontFixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[16]);
     pvToSet = parameters4[16];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[17]);
     pvToSet = parameters4[17];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[18]);
     pvToSet = parameters4[18];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:initial_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[19]);
     pvToSet = parameters4[19];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_p_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[20]);
     pvToSet = parameters4[20];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_i_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[21]);
     pvToSet = parameters4[21];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);
 } state OnInit2
 when (devNo == 5) {
            sprintf(pvName,"AutoOnOff:rcsRf%d:fixFrequency_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[0]);
     pvToSet = parameters5[0];
     pvPut(pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:workPeriod_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[1]);
     pvToSet = parameters5[1];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[2]);
     pvToSet = parameters5[2];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[3]);
     pvToSet = parameters5[3];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[5]);
     pvToSet = parameters5[5];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampPSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[6]);
     pvToSet = parameters5[6];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[7]);
     pvToSet = parameters5[7];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:biasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[8]);
     pvToSet = parameters5[8];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:fixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[9]);
     pvToSet = parameters5[9];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[10]);
     pvToSet = parameters5[10];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[11]);
     pvToSet = parameters5[11];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[12]);
     pvToSet = parameters5[12];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[13]);
     pvToSet = parameters5[13];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[14]);
     pvToSet = parameters5[14];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontBiasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[15]);
     pvToSet = parameters5[15];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontFixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[16]);
     pvToSet = parameters5[16];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[17]);
     pvToSet = parameters5[17];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[18]);
     pvToSet = parameters5[18];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:initial_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[19]);
     pvToSet = parameters5[19];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_p_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[20]);
     pvToSet = parameters5[20];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_i_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[21]);
     pvToSet = parameters5[21];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);
 } state OnInit2
 when (devNo == 6) {
            sprintf(pvName,"AutoOnOff:rcsRf%d:fixFrequency_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[0]);
     pvToSet = parameters6[0];
     pvPut(pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:workPeriod_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[1]);
     pvToSet = parameters6[1];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[2]);
     pvToSet = parameters6[2];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[3]);
     pvToSet = parameters6[3];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);


     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[5]);
     pvToSet = parameters6[5];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampPSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[6]);
     pvToSet = parameters6[6];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[7]);
     pvToSet = parameters6[7];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:biasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[8]);
     pvToSet = parameters6[8];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:fixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[9]);
     pvToSet = parameters6[9];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[10]);
     pvToSet = parameters6[10];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[11]);
     pvToSet = parameters6[11];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[12]);
     pvToSet = parameters6[12];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[13]);
     pvToSet = parameters6[13];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[14]);
     pvToSet = parameters6[14];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontBiasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[15]);
     pvToSet = parameters6[15];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontFixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[16]);
     pvToSet = parameters6[16];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[17]);
     pvToSet = parameters6[17];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[18]);
     pvToSet = parameters6[18];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:initial_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[19]);
     pvToSet = parameters6[19];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_p_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[20]);
     pvToSet = parameters6[20];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_i_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[21]);
     pvToSet = parameters6[21];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);
 } state OnInit2
 when (devNo == 7) {
            sprintf(pvName,"AutoOnOff:rcsRf%d:fixFrequency_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[0]);
     pvToSet = parameters7[0];
     pvPut(pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:workPeriod_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[1]);
     pvToSet = parameters7[1];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[2]);
     pvToSet = parameters7[2];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[3]);
     pvToSet = parameters7[3];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[5]);
     pvToSet = parameters7[5];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampPSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[6]);
     pvToSet = parameters7[6];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[7]);
     pvToSet = parameters7[7];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:biasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[8]);
     pvToSet = parameters7[8];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:fixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[9]);
     pvToSet = parameters7[9];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[10]);
     pvToSet = parameters7[10];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[11]);
     pvToSet = parameters7[11];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[12]);
     pvToSet = parameters7[12];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[13]);
     pvToSet = parameters7[13];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[14]);
     pvToSet = parameters7[14];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontBiasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[15]);
     pvToSet = parameters7[15];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontFixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[16]);
     pvToSet = parameters7[16];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[17]);
     pvToSet = parameters7[17];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[18]);
     pvToSet = parameters7[18];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:initial_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[19]);
     pvToSet = parameters7[19];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_p_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[20]);
     pvToSet = parameters7[20];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_i_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[21]);
     pvToSet = parameters7[21];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);
 } state OnInit2
 when (devNo == 8) {
            sprintf(pvName,"AutoOnOff:rcsRf%d:fixFrequency_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[0]);
     pvToSet = parameters8[0];
     pvPut(pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:workPeriod_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[1]);
     pvToSet = parameters8[1];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[2]);
     pvToSet = parameters8[2];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[3]);
     pvToSet = parameters8[3];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[5]);
     pvToSet = parameters8[5];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampPSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[6]);
     pvToSet = parameters8[6];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[7]);
     pvToSet = parameters8[7];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:biasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[8]);
     pvToSet = parameters8[8];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:fixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[9]);
     pvToSet = parameters8[9];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[10]);
     pvToSet = parameters8[10];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[11]);
     pvToSet = parameters8[11];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[12]);
     pvToSet = parameters8[12];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[13]);
     pvToSet = parameters8[13];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[14]);
     pvToSet = parameters8[14];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontBiasSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[15]);
     pvToSet = parameters8[15];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontFixTuningAngle_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[16]);
     pvToSet = parameters8[16];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTunePSet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[17]);
     pvToSet = parameters8[17];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[18]);
     pvToSet = parameters8[18];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:initial_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[19]);
     pvToSet = parameters8[19];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_p_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[20]);
     pvToSet = parameters8[20];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phase_i_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[21]);
     pvToSet = parameters8[21];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);
 } state OnInit2
    }
    state OnInit2 {
 when (delay(interval)) {
     sprintf(pvName,"AutoOnOff:rcsRf%d:pointSweep_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:sweepOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:intEnable_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:sgMode_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampFFOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneFFOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phaseOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phaseFFOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phaseModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:rfReset_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:drvReset_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:rfReset_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:drvReset_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: On Init System: End\n");
 } state OnModify
    }
    state OnModify {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(interval)) {
     printf("AutoOnOff: Turn On System: Turn On Modify\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Turn On Modify...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phaseModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Turn On Modify End\n");
 } state OnReset
    }
    state OnReset {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(interval)) {
     printf("AutoOnOff: Turn On System: Reset System\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Reset System...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:rfReset_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:drvReset_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:rfReset_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:drvReset_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Reset System End\n");
 } state OnAmpPoint
    }
    state OnAmpPoint {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (devNo == 1) {
     printf("AutoOnOff: Turn On System: Set Amp Point Value\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Set Amp Point...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[22]);
     pvToSet = parameters1[22];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Set Amp Point Value End\n");
 } state OnCloseTuneLoop
 when (devNo == 2) {
     printf("AutoOnOff: Turn On System: Set Amp Point Value\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Set Amp Point...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[22]);
     pvToSet = parameters2[22];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Set Amp Point Value End\n");
 } state OnCloseTuneLoop
 when (devNo == 3) {
     printf("AutoOnOff: Turn On System: Set Amp Point Value\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Set Amp Point...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[22]);
     pvToSet = parameters3[22];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Set Amp Point Value End\n");
 } state OnCloseTuneLoop
 when (devNo == 4) {
     printf("AutoOnOff: Turn On System: Set Amp Point Value\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Set Amp Point...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[22]);
     pvToSet = parameters4[22];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Set Amp Point Value End\n");
 } state OnCloseTuneLoop
 when (devNo == 5) {
     printf("AutoOnOff: Turn On System: Set Amp Point Value\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Set Amp Point...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[22]);
     pvToSet = parameters5[22];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Set Amp Point Value End\n");
 } state OnCloseTuneLoop
 when (devNo == 6) {
     printf("AutoOnOff: Turn On System: Set Amp Point Value\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Set Amp Point...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[22]);
     pvToSet = parameters6[22];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Set Amp Point Value End\n");
 } state OnCloseTuneLoop
 when (devNo == 7) {
     printf("AutoOnOff: Turn On System: Set Amp Point Value\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Set Amp Point...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[22]);
     pvToSet = parameters7[22];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Set Amp Point Value End\n");
 } state OnCloseTuneLoop
 when (devNo == 8) {
     printf("AutoOnOff: Turn On System: Set Amp Point Value\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Set Amp Point...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[22]);
     pvToSet = parameters8[22];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Set Amp Point Value End\n");
 } state OnCloseTuneLoop
    }
    state OnCloseTuneLoop {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(1)) {
     printf("AutoOnOff: Turn On System: Close Tune Loop\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Close Tune Loop...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Close Tune Loop End\n");
 } state OnCloseGridTune
    }
    state OnCloseGridTune {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(1)) {
     printf("AutoOnOff: Turn On System: Close Grid Tune\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Close Grid Tune...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Close Grid Tune End\n");
 } state OnTuneFF
    }
    state OnTuneFF {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(interval)) {
     printf("AutoOnOff: Turn On System: Turn On Tune FF\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Turn On Tune FF...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneFFOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Turn On Tune FF End\n");
 } state OnTuneMOff
    }
    state OnTuneMOff {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(interval*1.6)) {
     printf("AutoOnOff: Turn On System: Turn Off Tune M\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Turn Off Tune M...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Turn Off Tune M End\n");
 } state OnGridTuneISet
    }
    state OnGridTuneISet {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (devNo == 1) {
     printf("AutoOnOff: Turn On System: Tune Grid I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Grid Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[23]);
     pvToSet = parameters1[23];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnCloseAmpLoop
 when (devNo == 2) {
     printf("AutoOnOff: Turn On System: Tune Grid I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Grid Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[23]);
     pvToSet = parameters2[23];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnCloseAmpLoop
 when (devNo == 3) {
     printf("AutoOnOff: Turn On System: Tune Grid I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Grid Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[23]);
     pvToSet = parameters3[23];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnCloseAmpLoop
 when (devNo == 4) {
     printf("AutoOnOff: Turn On System: Tune Grid I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Grid Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[23]);
     pvToSet = parameters4[23];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnCloseAmpLoop
 when (devNo == 5) {
     printf("AutoOnOff: Turn On System: Tune Grid I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Grid Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[23]);
     pvToSet = parameters5[23];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnCloseAmpLoop
 when (devNo == 6) {
     printf("AutoOnOff: Turn On System: Tune Grid I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Grid Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[23]);
     pvToSet = parameters6[23];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnCloseAmpLoop
 when (devNo == 7) {
     printf("AutoOnOff: Turn On System: Tune Grid I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Grid Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[23]);
     pvToSet = parameters7[23];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnCloseAmpLoop
 when (devNo == 8) {
     printf("AutoOnOff: Turn On System: Tune Grid I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Grid Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[23]);
     pvToSet = parameters8[23];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnCloseAmpLoop
    }
    state OnCloseAmpLoop {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(interval)) {
     printf("AutoOnOff: Turn On System: Close Amp Loop\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Close Amp Loop...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Close Amp Loop End\n");
 } state OnTuneISetBreak
    }
    state OnTuneISetBreak {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy

 when (delay(interval)) {
 }state OnTuneISet
    }
    state OnTuneISet {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (devNo == 1) {
     printf("AutoOnOff: Turn On System: Tune I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[24]);
     pvToSet = parameters1[24];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[25]);
     pvToSet = parameters1[25];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[26]);
     pvToSet = parameters1[26];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[27]);
     pvToSet = parameters1[27];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnAmpFF
 when (devNo == 2) {
     printf("AutoOnOff: Turn On System: Tune I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[24]);
     pvToSet = parameters2[24];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[25]);
     pvToSet = parameters2[25];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[26]);
     pvToSet = parameters2[26];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[27]);
     pvToSet = parameters2[27];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnAmpFF
 when (devNo == 3) {
     printf("AutoOnOff: Turn On System: Tune I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[24]);
     pvToSet = parameters3[24];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[25]);
     pvToSet = parameters3[25];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[26]);
     pvToSet = parameters3[26];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[27]);
     pvToSet = parameters3[27];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnAmpFF
 when (devNo == 4) {
     printf("AutoOnOff: Turn On System: Tune I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[24]);
     pvToSet = parameters4[24];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[25]);
     pvToSet = parameters4[25];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[26]);
     pvToSet = parameters4[26];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[27]);
     pvToSet = parameters4[27];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnAmpFF
 when (devNo == 5) {
     printf("AutoOnOff: Turn On System: Tune I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[24]);
     pvToSet = parameters5[24];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[25]);
     pvToSet = parameters5[25];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[26]);
     pvToSet = parameters5[26];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[27]);
     pvToSet = parameters5[27];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnAmpFF
 when (devNo == 6) {
     printf("AutoOnOff: Turn On System: Tune I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[24]);
     pvToSet = parameters6[24];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[25]);
     pvToSet = parameters6[25];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[26]);
     pvToSet = parameters6[26];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[27]);
     pvToSet = parameters6[27];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnAmpFF
 when (devNo == 7) {
     printf("AutoOnOff: Turn On System: Tune I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[24]);
     pvToSet = parameters7[24];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[25]);
     pvToSet = parameters7[25];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[26]);
     pvToSet = parameters7[26];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[27]);
     pvToSet = parameters7[27];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnAmpFF
 when (devNo == 8) {
     printf("AutoOnOff: Turn On System: Tune I Set\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune I Set...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[24]);
     pvToSet = parameters8[24];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet1_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[25]);
     pvToSet = parameters8[25];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet2_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[26]);
     pvToSet = parameters8[26];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[27]);
     pvToSet = parameters8[27];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune I Set End\n");
 } state OnAmpFF
    }
    state OnAmpFF {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(interval)) {
     printf("AutoOnOff: Turn On System: Turn On Amp FF\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Turn On Amp FF...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampFFOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Turn On Amp FF End\n");
 } state OnAmpCoefficUp1Break
    }
    state OnAmpCoefficUp1Break {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy

 when (delay(1)) {
 }state OnAmpCoefficUp1
    }
    state OnAmpCoefficUp1 {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (devNo == 1) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[28]);
     pvToSet = parameters1[28];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 1 End\n");
 } state OnAmpCoefficUp2Break
 when (devNo == 2) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[28]);
     pvToSet = parameters2[28];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 1 End\n");
 } state OnAmpCoefficUp2Break
 when (devNo == 3) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[28]);
     pvToSet = parameters3[28];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 1 End\n");
 } state OnAmpCoefficUp2Break
 when (devNo == 4) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[28]);
     pvToSet = parameters4[28];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 1 End\n");
 } state OnAmpCoefficUp2Break
 when (devNo == 5) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[28]);
     pvToSet = parameters5[28];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 1 End\n");
 } state OnAmpCoefficUp2Break
 when (devNo == 6) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[28]);
     pvToSet = parameters6[28];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 1 End\n");
 } state OnAmpCoefficUp2Break
 when (devNo == 7) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[28]);
     pvToSet = parameters7[28];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 1 End\n");
 } state OnAmpCoefficUp2Break
 when (devNo == 8) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[28]);
     pvToSet = parameters8[28];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 1 End\n");
 } state OnAmpCoefficUp2Break
    }
    state OnAmpCoefficUp2Break {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy

 when (delay(1)) {
 }state OnAmpCoefficUp2
    }
    state OnAmpCoefficUp2 {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (devNo == 1) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[29]);
     pvToSet = parameters1[29];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 2 End\n");
 } state OnAmpCoefficUp3Break
 when (devNo == 2) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[29]);
     pvToSet = parameters2[29];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 2 End\n");
 } state OnAmpCoefficUp3Break
 when (devNo == 3) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[29]);
     pvToSet = parameters3[29];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 2 End\n");
 } state OnAmpCoefficUp3Break
 when (devNo == 4) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[29]);
     pvToSet = parameters4[29];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 2 End\n");
 } state OnAmpCoefficUp3Break
 when (devNo == 5) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[29]);
     pvToSet = parameters5[29];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 2 End\n");
 } state OnAmpCoefficUp3Break
 when (devNo == 6) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[29]);
     pvToSet = parameters6[29];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 2 End\n");
 } state OnAmpCoefficUp3Break
 when (devNo == 7) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[29]);
     pvToSet = parameters7[29];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 2 End\n");
 } state OnAmpCoefficUp3Break
 when (devNo == 8) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[29]);
     pvToSet = parameters8[29];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 2 End\n");
 } state OnAmpCoefficUp3Break
    }
    state OnAmpCoefficUp3Break {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy

 when (delay(1)) {
 }state OnAmpCoefficUp3
    }
    state OnAmpCoefficUp3 {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (devNo == 1) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[30]);
     pvToSet = parameters1[30];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 3 End\n");
 } state OnTuneComplexI
 when (devNo == 2) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[30]);
     pvToSet = parameters2[30];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 3 End\n");
 } state OnTuneComplexI
 when (devNo == 3) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[30]);
     pvToSet = parameters3[30];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 3 End\n");
 } state OnTuneComplexI
 when (devNo == 4) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[30]);
     pvToSet = parameters4[30];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 3 End\n");
 } state OnTuneComplexI
 when (devNo == 5) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[30]);
     pvToSet = parameters5[30];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 3 End\n");
 } state OnTuneComplexI
 when (devNo == 6) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[30]);
     pvToSet = parameters6[30];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 3 End\n");
 } state OnTuneComplexI
 when (devNo == 7) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[30]);
     pvToSet = parameters7[30];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 3 End\n");
 } state OnTuneComplexI
 when (devNo == 8) {
     printf("AutoOnOff: Turn On System: Amp Coeffic Up\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Coeffic Up...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampCoefficient_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[30]);
     pvToSet = parameters8[30];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Amp Coeffic Up 3 End\n");
 } state OnTuneComplexI
    }
    state OnTuneComplexI {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (devNo == 1) {
     printf("AutoOnOff: Turn On System: Tune Complex I\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune Complex I...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[31]);
     pvToSet = parameters1[31];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[32]);
     pvToSet = parameters1[32];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune Complex I End\n");
 } state OnTuneFFAgain
 when (devNo == 2) {
     printf("AutoOnOff: Turn On System: Tune Complex I\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune Complex I...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[31]);
     pvToSet = parameters2[31];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[32]);
     pvToSet = parameters2[32];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune Complex I End\n");
 } state OnTuneFFAgain
 when (devNo == 3) {
     printf("AutoOnOff: Turn On System: Tune Complex I\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune Complex I...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[31]);
     pvToSet = parameters3[31];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[32]);
     pvToSet = parameters3[32];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune Complex I End\n");
 } state OnTuneFFAgain
 when (devNo == 4) {
     printf("AutoOnOff: Turn On System: Tune Complex I\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune Complex I...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[31]);
     pvToSet = parameters4[31];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[32]);
     pvToSet = parameters4[32];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune Complex I End\n");
 } state OnTuneFFAgain
 when (devNo == 5) {
     printf("AutoOnOff: Turn On System: Tune Complex I\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune Complex I...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[31]);
     pvToSet = parameters5[31];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[32]);
     pvToSet = parameters5[32];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune Complex I End\n");
 } state OnTuneFFAgain
 when (devNo == 6) {
     printf("AutoOnOff: Turn On System: Tune Complex I\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune Complex I...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[31]);
     pvToSet = parameters6[31];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[32]);
     pvToSet = parameters6[32];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune Complex I End\n");
 } state OnTuneFFAgain
 when (devNo == 7) {
     printf("AutoOnOff: Turn On System: Tune Complex I\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune Complex I...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[31]);
     pvToSet = parameters7[31];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[32]);
     pvToSet = parameters7[32];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune Complex I End\n");
 } state OnTuneFFAgain
 when (devNo == 8) {
     printf("AutoOnOff: Turn On System: Tune Complex I\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune Complex I...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneISet_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[31]);
     pvToSet = parameters8[31];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneISet3_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[32]);
     pvToSet = parameters8[32];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Tune Complex I End\n");
 } state OnTuneFFAgain
    }
    state OnTuneFFAgain {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(1)) {
     printf("AutoOnOff: Turn On System: Tune FF Again\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Tune FF Again...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Tune FF Again End\n");
 } state OnClosePhaseLoop
    }
    state OnClosePhaseLoop {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(interval)) {
     printf("AutoOnOff: Turn On System: Close Phase Loop\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Close Phase Loop...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phaseOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Close Phase Loop End\n");
 } state OnPhaseFF
    }
    state OnPhaseFF {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (delay(interval)) {
     printf("AutoOnOff: Turn On System: Turn On Phase FF\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Turn On Phase FF...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phaseFFOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 1;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn On System: Turn On Phase FF End\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Turn On System End",devNo);
     pvPut(logMsg);
 } state OnEnd
    }
    state OnEnd {
 when (statusFlag == 10) {
     printf("AutoOnOff: Turn On System: Interrupt!!!\n");
     sprintf(logMsg,"rcsRf%d: Turn On Interrupt!!!",devNo);
     pvPut(logMsg);
 }state standBy
 when (devNo == 1) {
     sprintf(pvName,"AutoOnOff:rcsRf%d:Initial_Ref_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[33]);
     pvToSet = parameters1[33];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[34]);
     pvToSet = parameters1[34];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:RBF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters1[35]);
     pvToSet = parameters1[35];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Turn On System End\n");
     statusFlag = 0;
     pvPut(statusFlag);
            devNo = 0;
            pvPut(devNo);
            devNo = 0;
 } state standBy
 when (devNo == 2) {
     sprintf(pvName,"AutoOnOff:rcsRf%d:Initial_Ref_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[33]);
     pvToSet = parameters2[33];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[34]);
     pvToSet = parameters2[34];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:RBF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters2[35]);
     pvToSet = parameters2[35];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Turn On System End\n");
     statusFlag = 0;
     pvPut(statusFlag);
            devNo = 0;
            pvPut(devNo);
            devNo = 0;
 } state standBy
 when (devNo == 3) {
     sprintf(pvName,"AutoOnOff:rcsRf%d:Initial_Ref_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[33]);
     pvToSet = parameters3[33];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[34]);
     pvToSet = parameters3[34];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:RBF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters3[35]);
     pvToSet = parameters3[35];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Turn On System End\n");
     statusFlag = 0;
     pvPut(statusFlag);
            devNo = 0;
            pvPut(devNo);
            devNo = 0;
 } state standBy
 when (devNo == 4) {
     sprintf(pvName,"AutoOnOff:rcsRf%d:Initial_Ref_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[33]);
     pvToSet = parameters4[33];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[34]);
     pvToSet = parameters4[34];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:RBF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters4[35]);
     pvToSet = parameters4[35];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Turn On System End\n");
     statusFlag = 0;
     pvPut(statusFlag);
            devNo = 0;
            pvPut(devNo);
            devNo = 0;
 } state standBy
 when (devNo == 5) {
     sprintf(pvName,"AutoOnOff:rcsRf%d:Initial_Ref_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[33]);
     pvToSet = parameters5[33];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[34]);
     pvToSet = parameters5[34];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:RBF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters5[35]);
     pvToSet = parameters5[35];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Turn On System End\n");
     statusFlag = 0;
     pvPut(statusFlag);
            devNo = 0;
            pvPut(devNo);
            devNo = 0;
 } state standBy
 when (devNo == 6) {
     sprintf(pvName,"AutoOnOff:rcsRf%d:Initial_Ref_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[33]);
     pvToSet = parameters6[33];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[34]);
     pvToSet = parameters6[34];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:RBF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters6[35]);
     pvToSet = parameters6[35];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Turn On System End\n");
     statusFlag = 0;
     pvPut(statusFlag);
            devNo = 0;
            pvPut(devNo);
            devNo = 0;
 } state standBy
 when (devNo == 7) {
     sprintf(pvName,"AutoOnOff:rcsRf%d:Initial_Ref_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[33]);
     pvToSet = parameters7[33];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[34]);
     pvToSet = parameters7[34];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:RBF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters7[35]);
     pvToSet = parameters7[35];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Turn On System End\n");
     statusFlag = 0;
     pvPut(statusFlag);
            devNo = 0;
            pvPut(devNo);
            devNo = 0;
 } state standBy
 when (devNo == 8) {
     sprintf(pvName,"AutoOnOff:rcsRf%d:Initial_Ref_Phase_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[33]);
     pvToSet = parameters8[33];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:FF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[34]);
     pvToSet = parameters8[34];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     sprintf(pvName,"AutoOnOff:rcsRf%d:RBF_Delay_set",devNo);
     pvAssign(pvToSet,pvName);
     pvGet(parameters8[35]);
     pvToSet = parameters8[35];
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);

     printf("AutoOnOff: Turn On System: Turn On System End\n");
     statusFlag = 0;
     pvPut(statusFlag);
     devNo = 0;
     pvPut(devNo);
            devNo = 0;
 } state standBy
    }
    state OffInit {
 when (delay(0.5)) {
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Off Init",devNo);
     pvPut(logMsg);

     printf("AutoOnOff: Turn Off System: Open Phase Loop...\n");

     sprintf(pvName,"AutoOnOff:rcsRf%d:phaseOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn Off System: Open Phase Loop End\n");
 } state OffOpenGridLoop
    }
    state OffOpenGridLoop {
 when (delay(0.5)) {
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Open Grid Tune Loop",devNo);
     pvPut(logMsg);

     printf("AutoOnOff: Turn Off System: Open Grid Loop\n");

     sprintf(pvName,"AutoOnOff:rcsRf%d:frontTuneOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn Off System: Open Grid Tune Loop End\n");
 } state OffAmpZero
    }
    state OffAmpZero {
 when (delay(0.5)) {
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Amp Zero",devNo);
     pvPut(logMsg);
     printf("AutoOnOff: Turn Off System: Amp Zero\n");

     sprintf(pvName,"AutoOnOff:rcsRf%d:amp_set",devNo);
     pvAssign(pvToSet,pvName);
     pvToSet = 0;
     pvPut(pvToSet);
     printf("AutoOnOff: %s is set to: %f\n",pvName, pvToSet);
 } state OffOpenFFM
    }
    state OffOpenFFM {
 when (delay(0.5)) {
     printf("AutoOnOff: Turn Off System: Turn Off Modify\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Turn Off Modify...",devNo);
     pvPut(logMsg);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phaseModifyOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:tuneFFOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:ampFFOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     sprintf(pvName,"AutoOnOff:rcsRf%d:phaseFFOption_set",devNo);
     pvAssign(pvToSwitch,pvName);
     pvToSwitch = 0;
     pvPut(pvToSwitch);
     printf("AutoOnOff: %s is set to: %d\n",pvName, pvToSwitch);

     printf("AutoOnOff: Turn Off System: Amp Zero End\n");
     printf("AutoOnOff: Turn Off System: Turn Off System End\n");
     sprintf(logMsg,"AutoOnOff:rcsRf%d: Turn Off System End",devNo);
     pvPut(logMsg);
     statusFlag = 0;
     pvPut(statusFlag);

     devNo = 0;
     pvPut(devNo);
            devNo = 0;
 } state standBy
    }
}
# 1 "../sncProgram.st" 2
