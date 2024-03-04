ASM_SRC		= $(sort $(wildcard *.S))
C_SRC       = $(sort $(wildcard *.c))
OBJ		    = $(patsubst %.S,%.o,$(ASM_SRC)) $(patsubst %.c,%.o,$(C_SRC))
ELF 		= bootload.elf
HEX			= bootload.hex
ASM			= bootload.asm

all:$(OBJ)
	$(RISCV_GCC) $(RISCV_GCC_OPTS) -T link.ld $(OBJ) -o $(ELF)
	${RISCV_OBJCOPY} $(ELF) $(HEX) --only-section .text
	python3 ../endian.py $(HEX)
	$(RISCV_OBJDUMP) $(ELF) > $(ASM)

%.o:%.S
	$(RISCV_GCC) $(RISCV_GCC_OPTS) -c $< -DFW_PAYLOAD_PATH=\"../elf.bin\"

%.o:%.c
	$(RISCV_GCC) $(RISCV_GCC_OPTS) -c $< 

clean:
	rm -f *.o *.asm *.elf *.bin *.hex