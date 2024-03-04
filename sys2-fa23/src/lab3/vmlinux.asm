
../../vmlinux:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_start>:
.extern start_kernel

.section .text.entry
.globl _start, _end
_start:
  la sp, _end
    80200000:	00002117          	auipc	sp,0x2
    80200004:	00010113          	mv	sp,sp
  lui t0, 1
    80200008:	000012b7          	lui	t0,0x1
  add sp,sp,t0
    8020000c:	00510133          	add	sp,sp,t0
  jal ra, start_kernel
    80200010:	0ac000ef          	jal	ra,802000bc <start_kernel>

0000000080200014 <sbi_ecall>:

struct sbiret sbi_ecall(int ext, int fid, uint64 arg0,
                        uint64 arg1, uint64 arg2,
                        uint64 arg3, uint64 arg4,
                        uint64 arg5)
{ 
    80200014:	fa010113          	addi	sp,sp,-96 # 80201fa0 <_erodata+0xf87>
    80200018:	04813c23          	sd	s0,88(sp)
    8020001c:	06010413          	addi	s0,sp,96
    80200020:	fcc43823          	sd	a2,-48(s0)
    80200024:	fcd43423          	sd	a3,-56(s0)
    80200028:	fce43023          	sd	a4,-64(s0)
    8020002c:	faf43c23          	sd	a5,-72(s0)
    80200030:	fb043823          	sd	a6,-80(s0)
    80200034:	fb143423          	sd	a7,-88(s0)
    80200038:	00050793          	mv	a5,a0
    8020003c:	fcf42e23          	sw	a5,-36(s0)
    80200040:	00058793          	mv	a5,a1
    80200044:	fcf42c23          	sw	a5,-40(s0)
  struct sbiret return_value;
  __asm__ volatile (
    80200048:	fdc42783          	lw	a5,-36(s0)
    8020004c:	00078813          	mv	a6,a5
    80200050:	fd842783          	lw	a5,-40(s0)
    80200054:	00078893          	mv	a7,a5
    80200058:	fd043783          	ld	a5,-48(s0)
    8020005c:	fc843703          	ld	a4,-56(s0)
    80200060:	fc043683          	ld	a3,-64(s0)
    80200064:	fb843603          	ld	a2,-72(s0)
    80200068:	fb043583          	ld	a1,-80(s0)
    8020006c:	fa843503          	ld	a0,-88(s0)
    80200070:	00080893          	mv	a7,a6
    80200074:	00088813          	mv	a6,a7
    80200078:	00078513          	mv	a0,a5
    8020007c:	00070593          	mv	a1,a4
    80200080:	00068613          	mv	a2,a3
    80200084:	00060693          	mv	a3,a2
    80200088:	00058713          	mv	a4,a1
    8020008c:	00050793          	mv	a5,a0
    80200090:	00000073          	ecall
    80200094:	00050713          	mv	a4,a0
    80200098:	00058793          	mv	a5,a1
    8020009c:	fee43023          	sd	a4,-32(s0)
    802000a0:	fef43423          	sd	a5,-24(s0)
          [arg4] "r" (arg4), 
          [arg5] "r" (arg5)
        : "memory"
    );
  
}
    802000a4:	00000013          	nop
    802000a8:	00070513          	mv	a0,a4
    802000ac:	00078593          	mv	a1,a5
    802000b0:	05813403          	ld	s0,88(sp)
    802000b4:	06010113          	addi	sp,sp,96
    802000b8:	00008067          	ret

00000000802000bc <start_kernel>:
#include "print.h"
#include "sbi.h"

extern void test();

int start_kernel() {
    802000bc:	ff010113          	addi	sp,sp,-16
    802000c0:	00113423          	sd	ra,8(sp)
    802000c4:	00813023          	sd	s0,0(sp)
    802000c8:	01010413          	addi	s0,sp,16
    puti(2022);
    802000cc:	7e600513          	li	a0,2022
    802000d0:	0b4000ef          	jal	ra,80200184 <puti>
    puts(" ZJU Computer System II\n");
    802000d4:	00001517          	auipc	a0,0x1
    802000d8:	f2c50513          	addi	a0,a0,-212 # 80201000 <_srodata>
    802000dc:	030000ef          	jal	ra,8020010c <puts>

    test(); // DO NOT DELETE !!!
    802000e0:	01c000ef          	jal	ra,802000fc <test>

	return 0;
    802000e4:	00000793          	li	a5,0
}
    802000e8:	00078513          	mv	a0,a5
    802000ec:	00813083          	ld	ra,8(sp)
    802000f0:	00013403          	ld	s0,0(sp)
    802000f4:	01010113          	addi	sp,sp,16
    802000f8:	00008067          	ret

00000000802000fc <test>:
#include "print.h"
#include "defs.h"

// Please do not modify

void test() {
    802000fc:	ff010113          	addi	sp,sp,-16
    80200100:	00813423          	sd	s0,8(sp)
    80200104:	01010413          	addi	s0,sp,16
    while (1);
    80200108:	0000006f          	j	80200108 <test+0xc>

000000008020010c <puts>:
#include "print.h"
#include "sbi.h"

void puts(char *s) {
    8020010c:	fd010113          	addi	sp,sp,-48
    80200110:	02113423          	sd	ra,40(sp)
    80200114:	02813023          	sd	s0,32(sp)
    80200118:	03010413          	addi	s0,sp,48
    8020011c:	fca43c23          	sd	a0,-40(s0)
  char charcter;
  while((charcter=*s)!='\0'){
    80200120:	0340006f          	j	80200154 <puts+0x48>
    sbi_ecall(0x1,0x0,charcter,0,0,0,0,0);
    80200124:	fef44603          	lbu	a2,-17(s0)
    80200128:	00000893          	li	a7,0
    8020012c:	00000813          	li	a6,0
    80200130:	00000793          	li	a5,0
    80200134:	00000713          	li	a4,0
    80200138:	00000693          	li	a3,0
    8020013c:	00000593          	li	a1,0
    80200140:	00100513          	li	a0,1
    80200144:	ed1ff0ef          	jal	ra,80200014 <sbi_ecall>
    s++;
    80200148:	fd843783          	ld	a5,-40(s0)
    8020014c:	00178793          	addi	a5,a5,1
    80200150:	fcf43c23          	sd	a5,-40(s0)
  while((charcter=*s)!='\0'){
    80200154:	fd843783          	ld	a5,-40(s0)
    80200158:	0007c783          	lbu	a5,0(a5)
    8020015c:	fef407a3          	sb	a5,-17(s0)
    80200160:	fef44783          	lbu	a5,-17(s0)
    80200164:	0ff7f793          	zext.b	a5,a5
    80200168:	fa079ee3          	bnez	a5,80200124 <puts+0x18>
  }
}
    8020016c:	00000013          	nop
    80200170:	00000013          	nop
    80200174:	02813083          	ld	ra,40(sp)
    80200178:	02013403          	ld	s0,32(sp)
    8020017c:	03010113          	addi	sp,sp,48
    80200180:	00008067          	ret

0000000080200184 <puti>:

void puti(int x) {
    80200184:	f7010113          	addi	sp,sp,-144
    80200188:	08113423          	sd	ra,136(sp)
    8020018c:	08813023          	sd	s0,128(sp)
    80200190:	09010413          	addi	s0,sp,144
    80200194:	00050793          	mv	a5,a0
    80200198:	f6f42e23          	sw	a5,-132(s0)
  char number[100];
  int n=0,i,val=x;
    8020019c:	fe042623          	sw	zero,-20(s0)
    802001a0:	f7c42783          	lw	a5,-132(s0)
    802001a4:	fef42223          	sw	a5,-28(s0)
  while(x!=0){
    802001a8:	0540006f          	j	802001fc <puti+0x78>
    number[n]=x%10+'0';
    802001ac:	f7c42783          	lw	a5,-132(s0)
    802001b0:	00078713          	mv	a4,a5
    802001b4:	00a00793          	li	a5,10
    802001b8:	02f767bb          	remw	a5,a4,a5
    802001bc:	0007879b          	sext.w	a5,a5
    802001c0:	0ff7f793          	zext.b	a5,a5
    802001c4:	0307879b          	addiw	a5,a5,48
    802001c8:	0ff7f713          	zext.b	a4,a5
    802001cc:	fec42783          	lw	a5,-20(s0)
    802001d0:	ff078793          	addi	a5,a5,-16
    802001d4:	008787b3          	add	a5,a5,s0
    802001d8:	f8e78823          	sb	a4,-112(a5)
    n++;
    802001dc:	fec42783          	lw	a5,-20(s0)
    802001e0:	0017879b          	addiw	a5,a5,1
    802001e4:	fef42623          	sw	a5,-20(s0)
    x=x/10;
    802001e8:	f7c42783          	lw	a5,-132(s0)
    802001ec:	00078713          	mv	a4,a5
    802001f0:	00a00793          	li	a5,10
    802001f4:	02f747bb          	divw	a5,a4,a5
    802001f8:	f6f42e23          	sw	a5,-132(s0)
  while(x!=0){
    802001fc:	f7c42783          	lw	a5,-132(s0)
    80200200:	0007879b          	sext.w	a5,a5
    80200204:	fa0794e3          	bnez	a5,802001ac <puti+0x28>
  }
  for(i=n-1;i>-1;i--){
    80200208:	fec42783          	lw	a5,-20(s0)
    8020020c:	fff7879b          	addiw	a5,a5,-1
    80200210:	fef42423          	sw	a5,-24(s0)
    80200214:	0440006f          	j	80200258 <puti+0xd4>
    sbi_ecall(0x1,0x0,number[i],0,0,0,0,0);
    80200218:	fe842783          	lw	a5,-24(s0)
    8020021c:	ff078793          	addi	a5,a5,-16
    80200220:	008787b3          	add	a5,a5,s0
    80200224:	f907c783          	lbu	a5,-112(a5)
    80200228:	00078613          	mv	a2,a5
    8020022c:	00000893          	li	a7,0
    80200230:	00000813          	li	a6,0
    80200234:	00000793          	li	a5,0
    80200238:	00000713          	li	a4,0
    8020023c:	00000693          	li	a3,0
    80200240:	00000593          	li	a1,0
    80200244:	00100513          	li	a0,1
    80200248:	dcdff0ef          	jal	ra,80200014 <sbi_ecall>
  for(i=n-1;i>-1;i--){
    8020024c:	fe842783          	lw	a5,-24(s0)
    80200250:	fff7879b          	addiw	a5,a5,-1
    80200254:	fef42423          	sw	a5,-24(s0)
    80200258:	fe842783          	lw	a5,-24(s0)
    8020025c:	0007879b          	sext.w	a5,a5
    80200260:	fa07dce3          	bgez	a5,80200218 <puti+0x94>
  }
}
    80200264:	00000013          	nop
    80200268:	00000013          	nop
    8020026c:	08813083          	ld	ra,136(sp)
    80200270:	08013403          	ld	s0,128(sp)
    80200274:	09010113          	addi	sp,sp,144
    80200278:	00008067          	ret
