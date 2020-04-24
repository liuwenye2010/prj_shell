#
#  Description: 
#    Make file to build one library using the GNU tool chain
# 
#-------------------------------------------------------------------------------

CC = g++

CONF := ./sys.conf

BUILD := build
SRC   := src
AR    := ar
NM    := nm

TARGET := cygwin

include $(CONF)

CPPFLAGS = -I./include \
	-DBUILD_ENV=NATIVE \
	-DSIMULATION \
	-D_CRT_SECURE_NO_WARNINGS \
	-fpermissive 

ifeq ($(TARGET),)
	TARGET=linux32
endif	

ifeq ($(TARGET),linux64)
	CPPFLAGS += -fPIC
endif
ifeq ($(TARGET),linux32)
	CPPFLAGS += -m32 -fPIC
endif
ifeq ($(TARGET),cygwin)
	CPPFLAGS += -m32
endif
	
libraries = libsys_$(TARGET).a
$(info libraries = ${libraries})
sources_sys = \
	./src/func_1.c \
	./src/func_2.c 


objects_sys := $(patsubst ./src/%.c, ./build/%.o,${sources_sys})
$(info objects_sys = ${objects_sys})

${libraries}:${objects_sys}
	$(AR) cru $@ $^ 
	$(NM) $@ > $@.nm

${objects_sys}:./build/%.o:./src/%.c
	$(CC) -c $(CPPFLAGS) $< -o $@

	
all: ${libraries} 

clean:
	@rm ./build/*.o
	@rm *.a
  
@PHONY: all clean
