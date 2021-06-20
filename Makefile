################################
# Settings paths and variables #
################################

BINPATH = /c/nxp/lpcxpresso_8.2.2_650/lpcxpresso/tools/bin

CC = $(BINPATH)/arm-none-eabi-gcc.exe
OBJCOPY = $(BINPATH)/arm-non-eabi-objcopy.exe
SIZE = $(BINPATH)/arm-none-eabi-size.exe

CFLAGS = -nostdlib
CFLAGS += -DCORE_M4
CFLAGS += -D__MULTICORE_NONE
CFLAGS += -Wall
CFLAGS += -mcpu=cortex-m4
CFLAGS += -mthumb
CFLAGS += -fsingle-precision-constant
CFLAGS += -O0
CFLAGS += -fno-builtin
CFLAGS += -mfpu=fpv4-sp-d16
CFLAGS += -mfloat-abi=softfp

TARGET = main

APPSRC = main.S
APPSRC += reset.S
APPSRC += irq.S
APPSRC += scu.S
APPSRC += gpio.S

APPOBJ = $(APPSRC:.S=.o)

#########################
#         Rules         #
#########################
.PHONY: all clean

all: $(TARGET).elf

%.o:%.S
	$(info Assembling $<)
	$(CC) -c -o $@ $(CFLAGS) $^

$(TARGET).elf: $(APPOBJ)
	$(info Linking $@ $<)
	$(CC) -Wl,--gc-sections -o $@ $(APPOBJ) $(CFLAGS) -T main.ld -Wl,-Map,$(TARGET).map 
	$(SIZE) $@

# $(TARGET).bin:$(TARGET).elf
# 	$(info Converting $< to $@)

clean:
	rm -rf *.o
	rm -rf $(TARGET).map $(TARGET).elf
