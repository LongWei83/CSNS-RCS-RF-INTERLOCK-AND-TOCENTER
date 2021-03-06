TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += exampleSupport

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
DBDINC += biasdataRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd
DBD += caPutLog.dbd

# Compile and add the code to the support library
exampleSupport_SRCS += xxxRecord.c
exampleSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
exampleSupport_SRCS += dbSubExample.c
exampleSupport_SRCS += exampleHello.c
exampleSupport_SRCS += initTrace.c

#exampleSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = example
# example.dbd will be created and installed
DBD += example.dbd

# example.dbd will be made up from these files:
example_DBD += base.dbd
example_DBD += xxxSupport.dbd
example_DBD += dbSubExample.dbd
example_DBD += exampleHello.dbd
example_DBD += initTrace.dbd
example_DBD += common.dbd
example_DBD += yew.dbd
example_DBD += biasdataRecord.dbd
example_DBD += caPutLog.dbd

# example_registerRecordDeviceDriver.cpp derives from example.dbd
example_SRCS += example_registerRecordDeviceDriver.cpp
example_SRCS += biasdataRecord.c

# Build the main IOC entry point on workstation OSs.
example_SRCS_DEFAULT += exampleMain.cpp
example_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
example_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
example_LIBS += exampleSupport
example_LIBS += netDev
example_LIBS += caPutLog



# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into exampleSupport
    # sncExample_SNCFLAGS += +r
    # example_DBD += sncExample.dbd
    # exampleSupport_SRCS += sncExample.stt
    # exampleSupport_LIBS += seq pv
    # example_LIBS += seq pv

    # Build sncProgram as a standalone program
    # PROD_HOST += sncProgram
    # sncProgram_SNCFLAGS += +m
    # sncProgram_SRCS += sncProgram.st
    # sncProgram_LIBS += seq pv
    # sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)

    # Build sncExample into exampleSupport
    sncExample2_SNCFLAGS += +r
    example_DBD += sncExample2.dbd
    exampleSupport_SRCS += sncExample2.stt
    exampleSupport_LIBS += seq pv
    example_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram2
    sncProgram2_SNCFLAGS += +m
    sncProgram2_SRCS += sncProgram2.st
    sncProgram2_LIBS += seq pv
    sncProgram2_LIBS += $(EPICS_BASE_HOST_LIBS)

endif

# Finally link to the EPICS Base libraries
example_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

