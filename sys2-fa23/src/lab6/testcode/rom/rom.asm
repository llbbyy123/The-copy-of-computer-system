
./rom.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <_start1>:
   0:	00100093          	addi	ra,zero,1
   4:	00100113          	addi	sp,zero,1
   8:	00500213          	addi	tp,zero,5

000000000000000c <fibonacci>:
   c:	002081b3          	add	gp,ra,sp
  10:	003100b3          	add	ra,sp,gp
  14:	00308133          	add	sp,ra,gp
  18:	fff20213          	addi	tp,tp,-1
  1c:	fe4018e3          	bne	zero,tp,c <fibonacci>
  20:	63d00293          	addi	t0,zero,1597
  24:	00511863          	bne	sp,t0,34 <fail1>

0000000000000028 <pass1>:
  28:	0010009b          	addiw	ra,zero,1
  2c:	01f09093          	slli	ra,ra,0x1f
  30:	00008067          	jalr	zero,0(ra)

0000000000000034 <fail1>:
  34:	c0001073          	unimp
  38:	ffdff06f          	jal	zero,34 <fail1>

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	2241                	.2byte	0x2241
   2:	0000                	.2byte	0x0
   4:	7200                	.2byte	0x7200
   6:	7369                	.2byte	0x7369
   8:	01007663          	bgeu	zero,a6,14 <fibonacci+0x8>
   c:	0018                	.2byte	0x18
   e:	0000                	.2byte	0x0
  10:	7205                	.2byte	0x7205
  12:	3676                	.2byte	0x3676
  14:	6934                	.2byte	0x6934
  16:	7032                	.2byte	0x7032
  18:	5f31                	.2byte	0x5f31
  1a:	697a                	.2byte	0x697a
  1c:	32727363          	bgeu	tp,t2,342 <fail1+0x30e>
  20:	3070                	.2byte	0x3070
	...
