RISCV_PREFIX ?= riscv64-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -march=rv64i -mabi=lp64 -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump -Mno-aliases -D
RISCV_OBJCOPY ?= $(RISCV_PREFIX)objcopy -O verilog --verilog-data-width 8 --readonly-text

TESTCASE ?= rtype
TESTCASE_SOURCE := $(TESTCASE)/$(TESTCASE).S
TESTCASE_ELF := $(TESTCASE)/$(TESTCASE).elf
TESTCASE_ASM := $(TESTCASE)/$(TESTCASE).asm
TESTCASE_HEX := $(TESTCASE)/$(TESTCASE).hex

ifeq ($(TESTCASE),rtype)
	RISCV_GCC_OPTS += -DNOBRANCH
else ifeq ($(TESTCASE),itype)
	RISCV_GCC_OPTS += -DNOBRANCH
endif

gen:
	$(RISCV_GCC) $(RISCV_GCC_OPTS) -Tlink.ld $(TESTCASE_SOURCE) -o $(TESTCASE_ELF)
	$(RISCV_OBJDUMP) $(TESTCASE_ELF) > $(TESTCASE_ASM)
	$(RISCV_OBJCOPY) $(TESTCASE_ELF) $(TESTCASE_HEX)