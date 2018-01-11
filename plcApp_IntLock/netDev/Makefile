TOP= ..

include $(TOP)/configure/CONFIG

NETDEV = $(TOP)/netDev

LIBRARY_IOC += netDev
netDev_LIBS += $(EPICS_BASE_IOC_LIBS)

SRC_DIRS += $(NETDEV)/common
DBD += common.dbd
INC += drvNetMpf.h
INC += devNetDev.h
netDev_SRCS += drvNetMpf.c
netDev_SRCS += devNetDev.c
netDev_SRCS += netDevLib.

SRC_DIRS += $(NETDEV)/yew
DBD += yew.dbd
netDev_SRCS += devYewPlc.c

SRC_DIRS += $(NETDEV)/omron
DBD += omron.dbd
netDev_SRCS += devOmrPlc.c

include $(TOP)/configure/RULES

