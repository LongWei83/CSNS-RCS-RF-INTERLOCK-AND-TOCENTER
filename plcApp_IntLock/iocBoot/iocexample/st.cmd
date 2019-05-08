#!../../bin/linux-x86/example

## You may have to change example to something else
## everywhere it appears in this file

cd /home/long/Epics/apps/plcApp_IntLock

## Register all support components
dbLoadDatabase("dbd/example.dbd")
dbLoadDatabase("dbd/common.dbd")
dbLoadDatabase("dbd/yew.dbd")
example_registerRecordDeviceDriver pdbbase

## Load record instances

dbLoadRecords "db/interLock.db"
dbLoadRecords "db/toCenter.db"
dbLoadRecords "db/toArchive.db"
dbLoadRecords "db/biasAll.db"
dbLoadRecords "db/autoOnOff.db"

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit


iocInit

seq sncExample2
