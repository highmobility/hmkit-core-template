#Include HMKit Core
HMKIT_CORE  := $(shell cd ./hmkit-core/; pwd)

VPATH += ./
#VPATH += $(HM_BT_CORE)

#HMKit Core hal and callback files
SRC += hmkit_core_crypto_hal.c
SRC += hmkit_core_debug_hal.c
SRC += hmkit_core_connectivity_hal.c
SRC += hmkit_core_persistence_hal.c
SRC += hmkit_core_api_callback.c

SRC += main.c

#HMKit Core
SRC += ${HMKIT_CORE}/hmkit_core.c
SRC += ${HMKIT_CORE}/hmkit_core_cert.c
SRC += ${HMKIT_CORE}/hmkit_core_conf_access.c
SRC += ${HMKIT_CORE}/hmkit_core_api.c
SRC += ${HMKIT_CORE}/hmkit_core_log.c

# .o for .c
SRC_OBJ = $(SRC:.c=.o)

CC=gcc
CFLAGS  += -g -std=gnu99 -Wall -Wmissing-prototypes -Wstrict-prototypes -Wshadow -Wunused-parameter
CFLAGS += -I$(HMKIT_CORE)
APP_SOURCES := ./
CFLAGS += -I$(APP_SOURCES)

default: hmkit
all: hmkit

hmkit: ${SRC_OBJ}
	${CC} $^ ${CFLAGS} -o hmkit

clean:
	rm -f  *.o
	rm -f  ${HMKIT_CORE}/*.o
	rm -f  hmkit
	rm -rf ${HMKIT_OBJ}/*.o
