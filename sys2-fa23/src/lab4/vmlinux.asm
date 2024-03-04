
../../vmlinux:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_start>:
.extern start_kernel

.section .text.init
.globl _start, _end
_start:
  la t0, _traps
    80200000:	00000297          	auipc	t0,0x0
    80200004:	06c28293          	addi	t0,t0,108 # 8020006c <_traps>
  csrw stvec, t0
    80200008:	10529073          	csrw	stvec,t0
  csrr t0,sie
    8020000c:	104022f3          	csrr	t0,sie
  ori t0,t0,0x20
    80200010:	0202e293          	ori	t0,t0,32
  csrw sie,t0
    80200014:	10429073          	csrw	sie,t0
  rdtime t0
    80200018:	c01022f3          	rdtime	t0
  lui t1, 0x989
    8020001c:	00989337          	lui	t1,0x989
  addi t1, t1, 0x680
    80200020:	68030313          	addi	t1,t1,1664 # 989680 <_start-0x7f876980>
  add t0, t0, t1
    80200024:	006282b3          	add	t0,t0,t1
  li a7, 0x00
    80200028:	00000893          	li	a7,0
  li a6, 0x0
    8020002c:	00000813          	li	a6,0
  li a5, 0x0
    80200030:	00000793          	li	a5,0
  li a4, 0x0
    80200034:	00000713          	li	a4,0
  li a3, 0x0
    80200038:	00000693          	li	a3,0
  li a2, 0x0
    8020003c:	00000613          	li	a2,0
  li a1, 0x0
    80200040:	00000593          	li	a1,0
  mv a0, t0
    80200044:	00028513          	mv	a0,t0
  ecall
    80200048:	00000073          	ecall
  csrr t0,sstatus
    8020004c:	100022f3          	csrr	t0,sstatus
  ori t0,t0,0x2
    80200050:	0022e293          	ori	t0,t0,2
  csrw sstatus,t0
    80200054:	10029073          	csrw	sstatus,t0
  la sp, _end
    80200058:	00003117          	auipc	sp,0x3
    8020005c:	fa810113          	addi	sp,sp,-88 # 80203000 <_ebss>
  lui t0, 1
    80200060:	000012b7          	lui	t0,0x1
  add sp,sp,t0
    80200064:	00510133          	add	sp,sp,t0
  jal ra, start_kernel
    80200068:	2d0000ef          	jal	ra,80200338 <start_kernel>

000000008020006c <_traps>:
    .section .text.entry
    .align 2
    .globl _traps 
_traps:
    addi sp,sp,-256
    8020006c:	f0010113          	addi	sp,sp,-256
    sd ra,0(sp)
    80200070:	00113023          	sd	ra,0(sp)
    sd sp,8(sp)
    80200074:	00213423          	sd	sp,8(sp)
    sd gp,16(sp)
    80200078:	00313823          	sd	gp,16(sp)
    sd tp,24(sp)
    8020007c:	00413c23          	sd	tp,24(sp)
    sd t0,32(sp)
    80200080:	02513023          	sd	t0,32(sp)
    sd t1,40(sp)
    80200084:	02613423          	sd	t1,40(sp)
    sd t2,48(sp)
    80200088:	02713823          	sd	t2,48(sp)
    sd fp,56(sp)
    8020008c:	02813c23          	sd	s0,56(sp)
    sd s1,64(sp)
    80200090:	04913023          	sd	s1,64(sp)
    sd a0,72(sp)
    80200094:	04a13423          	sd	a0,72(sp)
    sd a1,80(sp)
    80200098:	04b13823          	sd	a1,80(sp)
    sd a2,88(sp)
    8020009c:	04c13c23          	sd	a2,88(sp)
    sd a3,96(sp)
    802000a0:	06d13023          	sd	a3,96(sp)
    sd a4,104(sp)
    802000a4:	06e13423          	sd	a4,104(sp)
    sd a5,112(sp)
    802000a8:	06f13823          	sd	a5,112(sp)
    sd a6,120(sp)
    802000ac:	07013c23          	sd	a6,120(sp)
    sd a7,128(sp)
    802000b0:	09113023          	sd	a7,128(sp)
    sd s2,136(sp)
    802000b4:	09213423          	sd	s2,136(sp)
    sd s3,144(sp)
    802000b8:	09313823          	sd	s3,144(sp)
    sd s4,152(sp)
    802000bc:	09413c23          	sd	s4,152(sp)
    sd s5,160(sp)
    802000c0:	0b513023          	sd	s5,160(sp)
    sd s6,168(sp)
    802000c4:	0b613423          	sd	s6,168(sp)
    sd s7,176(sp)
    802000c8:	0b713823          	sd	s7,176(sp)
    sd s8,184(sp)
    802000cc:	0b813c23          	sd	s8,184(sp)
    sd s9,192(sp)
    802000d0:	0d913023          	sd	s9,192(sp)
    sd s10,200(sp)
    802000d4:	0da13423          	sd	s10,200(sp)
    sd s11,208(sp)
    802000d8:	0db13823          	sd	s11,208(sp)
    sd t3,216(sp)
    802000dc:	0dc13c23          	sd	t3,216(sp)
    sd t4,224(sp)
    802000e0:	0fd13023          	sd	t4,224(sp)
    sd t5,232(sp)
    802000e4:	0fe13423          	sd	t5,232(sp)
    sd t6,240(sp)
    802000e8:	0ff13823          	sd	t6,240(sp)

    csrr t0,sepc
    802000ec:	141022f3          	csrr	t0,sepc
    sd t0,248(sp)
    802000f0:	0e513c23          	sd	t0,248(sp)

    mv a1, t0
    802000f4:	00028593          	mv	a1,t0
    csrr a0,scause
    802000f8:	14202573          	csrr	a0,scause
    call trap_handler
    802000fc:	1c8000ef          	jal	ra,802002c4 <trap_handler>

    ld t0,248(sp)
    80200100:	0f813283          	ld	t0,248(sp)
    csrw sepc,t0
    80200104:	14129073          	csrw	sepc,t0
    ld ra,0(sp)
    80200108:	00013083          	ld	ra,0(sp)
    ld gp,16(sp)
    8020010c:	01013183          	ld	gp,16(sp)
    ld tp,24(sp)
    80200110:	01813203          	ld	tp,24(sp)
    ld t0,32(sp)
    80200114:	02013283          	ld	t0,32(sp)
    ld t1,40(sp)
    80200118:	02813303          	ld	t1,40(sp)
    ld t2,48(sp)
    8020011c:	03013383          	ld	t2,48(sp)
    ld fp,56(sp)
    80200120:	03813403          	ld	s0,56(sp)
    ld s1,64(sp)
    80200124:	04013483          	ld	s1,64(sp)
    ld a0,72(sp)
    80200128:	04813503          	ld	a0,72(sp)
    ld a1,80(sp)
    8020012c:	05013583          	ld	a1,80(sp)
    ld a2,88(sp)
    80200130:	05813603          	ld	a2,88(sp)
    ld a3,96(sp)
    80200134:	06013683          	ld	a3,96(sp)
    ld a4,104(sp)
    80200138:	06813703          	ld	a4,104(sp)
    ld a5,112(sp)
    8020013c:	07013783          	ld	a5,112(sp)
    ld a6,120(sp)
    80200140:	07813803          	ld	a6,120(sp)
    ld a7,128(sp)
    80200144:	08013883          	ld	a7,128(sp)
    ld s2,136(sp)
    80200148:	08813903          	ld	s2,136(sp)
    ld s3,144(sp)
    8020014c:	09013983          	ld	s3,144(sp)
    ld s4,152(sp)
    80200150:	09813a03          	ld	s4,152(sp)
    ld s5,160(sp)
    80200154:	0a013a83          	ld	s5,160(sp)
    ld s6,168(sp)
    80200158:	0a813b03          	ld	s6,168(sp)
    ld s7,176(sp)
    8020015c:	0b013b83          	ld	s7,176(sp)
    ld s8,184(sp)
    80200160:	0b813c03          	ld	s8,184(sp)
    ld s9,192(sp)
    80200164:	0c013c83          	ld	s9,192(sp)
    ld s10,200(sp)
    80200168:	0c813d03          	ld	s10,200(sp)
    ld s11,208(sp)
    8020016c:	0d013d83          	ld	s11,208(sp)
    ld t3,216(sp)
    80200170:	0d813e03          	ld	t3,216(sp)
    ld t4,224(sp)
    80200174:	0e013e83          	ld	t4,224(sp)
    ld t5,232(sp)
    80200178:	0e813f03          	ld	t5,232(sp)
    ld t6,240(sp)
    8020017c:	0f013f83          	ld	t6,240(sp)
    ld sp,8(sp)
    80200180:	00813103          	ld	sp,8(sp)

    addi sp,sp,256
    80200184:	10010113          	addi	sp,sp,256
    sret
    80200188:	10200073          	sret

000000008020018c <get_cycles>:
// clock.c


unsigned long TIMECLOCK = 10000000;

unsigned long get_cycles() {
    8020018c:	fe010113          	addi	sp,sp,-32
    80200190:	00813c23          	sd	s0,24(sp)
    80200194:	02010413          	addi	s0,sp,32
    unsigned long ret;
    __asm__ volatile(
    80200198:	c01022f3          	rdtime	t0
    8020019c:	00028793          	mv	a5,t0
    802001a0:	fef43423          	sd	a5,-24(s0)
        "rdtime t0\n"
        "mv %[ret],t0\n"
        : [ret] "=r" (ret)
        :: "memory"
    );
    return ret;
    802001a4:	fe843783          	ld	a5,-24(s0)
}
    802001a8:	00078513          	mv	a0,a5
    802001ac:	01813403          	ld	s0,24(sp)
    802001b0:	02010113          	addi	sp,sp,32
    802001b4:	00008067          	ret

00000000802001b8 <clock_set_next_event>:

void clock_set_next_event() {
    802001b8:	fe010113          	addi	sp,sp,-32
    802001bc:	00113c23          	sd	ra,24(sp)
    802001c0:	00813823          	sd	s0,16(sp)
    802001c4:	02010413          	addi	s0,sp,32
    unsigned long next = get_cycles() + TIMECLOCK;
    802001c8:	fc5ff0ef          	jal	ra,8020018c <get_cycles>
    802001cc:	00050713          	mv	a4,a0
    802001d0:	00002797          	auipc	a5,0x2
    802001d4:	e3078793          	addi	a5,a5,-464 # 80202000 <TIMECLOCK>
    802001d8:	0007b783          	ld	a5,0(a5)
    802001dc:	00f707b3          	add	a5,a4,a5
    802001e0:	fef43423          	sd	a5,-24(s0)
    sbi_ecall(0,0,next,0,0,0,0,0);
    802001e4:	00000893          	li	a7,0
    802001e8:	00000813          	li	a6,0
    802001ec:	00000793          	li	a5,0
    802001f0:	00000713          	li	a4,0
    802001f4:	00000693          	li	a3,0
    802001f8:	fe843603          	ld	a2,-24(s0)
    802001fc:	00000593          	li	a1,0
    80200200:	00000513          	li	a0,0
    80200204:	018000ef          	jal	ra,8020021c <sbi_ecall>
    80200208:	00000013          	nop
    8020020c:	01813083          	ld	ra,24(sp)
    80200210:	01013403          	ld	s0,16(sp)
    80200214:	02010113          	addi	sp,sp,32
    80200218:	00008067          	ret

000000008020021c <sbi_ecall>:

struct sbiret sbi_ecall(int ext, int fid, uint64 arg0,
                        uint64 arg1, uint64 arg2,
                        uint64 arg3, uint64 arg4,
                        uint64 arg5)
{ 
    8020021c:	fa010113          	addi	sp,sp,-96
    80200220:	04813c23          	sd	s0,88(sp)
    80200224:	06010413          	addi	s0,sp,96
    80200228:	fcc43823          	sd	a2,-48(s0)
    8020022c:	fcd43423          	sd	a3,-56(s0)
    80200230:	fce43023          	sd	a4,-64(s0)
    80200234:	faf43c23          	sd	a5,-72(s0)
    80200238:	fb043823          	sd	a6,-80(s0)
    8020023c:	fb143423          	sd	a7,-88(s0)
    80200240:	00050793          	mv	a5,a0
    80200244:	fcf42e23          	sw	a5,-36(s0)
    80200248:	00058793          	mv	a5,a1
    8020024c:	fcf42c23          	sw	a5,-40(s0)
  struct sbiret return_value;
  __asm__ volatile (
    80200250:	fdc42783          	lw	a5,-36(s0)
    80200254:	00078813          	mv	a6,a5
    80200258:	fd842783          	lw	a5,-40(s0)
    8020025c:	00078893          	mv	a7,a5
    80200260:	fd043783          	ld	a5,-48(s0)
    80200264:	fc843703          	ld	a4,-56(s0)
    80200268:	fc043683          	ld	a3,-64(s0)
    8020026c:	fb843603          	ld	a2,-72(s0)
    80200270:	fb043583          	ld	a1,-80(s0)
    80200274:	fa843503          	ld	a0,-88(s0)
    80200278:	00080893          	mv	a7,a6
    8020027c:	00088813          	mv	a6,a7
    80200280:	00078513          	mv	a0,a5
    80200284:	00070593          	mv	a1,a4
    80200288:	00068613          	mv	a2,a3
    8020028c:	00060693          	mv	a3,a2
    80200290:	00058713          	mv	a4,a1
    80200294:	00050793          	mv	a5,a0
    80200298:	00000073          	ecall
    8020029c:	00050713          	mv	a4,a0
    802002a0:	00058793          	mv	a5,a1
    802002a4:	fee43023          	sd	a4,-32(s0)
    802002a8:	fef43423          	sd	a5,-24(s0)
          [arg4] "r" (arg4), 
          [arg5] "r" (arg5)
        : "memory"
    );
  
}
    802002ac:	00000013          	nop
    802002b0:	00070513          	mv	a0,a4
    802002b4:	00078593          	mv	a1,a5
    802002b8:	05813403          	ld	s0,88(sp)
    802002bc:	06010113          	addi	sp,sp,96
    802002c0:	00008067          	ret

00000000802002c4 <trap_handler>:

// trap.c 

void trap_handler(unsigned long scause, unsigned long sepc) {
    802002c4:	fd010113          	addi	sp,sp,-48
    802002c8:	02113423          	sd	ra,40(sp)
    802002cc:	02813023          	sd	s0,32(sp)
    802002d0:	03010413          	addi	s0,sp,48
    802002d4:	fca43c23          	sd	a0,-40(s0)
    802002d8:	fcb43823          	sd	a1,-48(s0)
    int x;
    x=scause>>63&&(scause%16==5);
    802002dc:	fd843783          	ld	a5,-40(s0)
    802002e0:	0007de63          	bgez	a5,802002fc <trap_handler+0x38>
    802002e4:	fd843783          	ld	a5,-40(s0)
    802002e8:	00f7f713          	andi	a4,a5,15
    802002ec:	00500793          	li	a5,5
    802002f0:	00f71663          	bne	a4,a5,802002fc <trap_handler+0x38>
    802002f4:	00100793          	li	a5,1
    802002f8:	0080006f          	j	80200300 <trap_handler+0x3c>
    802002fc:	00000793          	li	a5,0
    80200300:	fef42623          	sw	a5,-20(s0)
    if(x==1){
    80200304:	fec42783          	lw	a5,-20(s0)
    80200308:	0007871b          	sext.w	a4,a5
    8020030c:	00100793          	li	a5,1
    80200310:	00f71a63          	bne	a4,a5,80200324 <trap_handler+0x60>
        printk("[S] Supervisor Mode Timer Interrupt\n");
    80200314:	00001517          	auipc	a0,0x1
    80200318:	cec50513          	addi	a0,a0,-788 # 80201000 <_srodata>
    8020031c:	5d8000ef          	jal	ra,802008f4 <printk>
        clock_set_next_event();
    80200320:	e99ff0ef          	jal	ra,802001b8 <clock_set_next_event>
    }
    80200324:	00000013          	nop
    80200328:	02813083          	ld	ra,40(sp)
    8020032c:	02013403          	ld	s0,32(sp)
    80200330:	03010113          	addi	sp,sp,48
    80200334:	00008067          	ret

0000000080200338 <start_kernel>:
#include "printk.h"
#include "sbi.h"

extern void test();

int start_kernel() {
    80200338:	ff010113          	addi	sp,sp,-16
    8020033c:	00113423          	sd	ra,8(sp)
    80200340:	00813023          	sd	s0,0(sp)
    80200344:	01010413          	addi	s0,sp,16
    printk("2022 ZJU Computer System II\n");
    80200348:	00001517          	auipc	a0,0x1
    8020034c:	ce050513          	addi	a0,a0,-800 # 80201028 <_srodata+0x28>
    80200350:	5a4000ef          	jal	ra,802008f4 <printk>

    test(); // DO NOT DELETE !!!
    80200354:	01c000ef          	jal	ra,80200370 <test>

	return 0;
    80200358:	00000793          	li	a5,0
}
    8020035c:	00078513          	mv	a0,a5
    80200360:	00813083          	ld	ra,8(sp)
    80200364:	00013403          	ld	s0,0(sp)
    80200368:	01010113          	addi	sp,sp,16
    8020036c:	00008067          	ret

0000000080200370 <test>:
#include "printk.h"
#include "defs.h"

// Please do not modify

void test() {
    80200370:	fe010113          	addi	sp,sp,-32
    80200374:	00113c23          	sd	ra,24(sp)
    80200378:	00813823          	sd	s0,16(sp)
    8020037c:	02010413          	addi	s0,sp,32
    unsigned long record_time = 0; 
    80200380:	fe043423          	sd	zero,-24(s0)
    while (1) {
    unsigned long present_time;
    __asm__ volatile("rdtime %[t]" : [t] "=r" (present_time) : : "memory");
    80200384:	c01027f3          	rdtime	a5
    80200388:	fef43023          	sd	a5,-32(s0)
    present_time /= 10000000;
    8020038c:	fe043703          	ld	a4,-32(s0)
    80200390:	009897b7          	lui	a5,0x989
    80200394:	68078793          	addi	a5,a5,1664 # 989680 <_start-0x7f876980>
    80200398:	02f757b3          	divu	a5,a4,a5
    8020039c:	fef43023          	sd	a5,-32(s0)
    if (record_time < present_time) {
    802003a0:	fe843703          	ld	a4,-24(s0)
    802003a4:	fe043783          	ld	a5,-32(s0)
    802003a8:	fcf77ee3          	bgeu	a4,a5,80200384 <test+0x14>
        printk("kernel is running! Time: %lus\n", present_time);
    802003ac:	fe043583          	ld	a1,-32(s0)
    802003b0:	00001517          	auipc	a0,0x1
    802003b4:	c9850513          	addi	a0,a0,-872 # 80201048 <_srodata+0x48>
    802003b8:	53c000ef          	jal	ra,802008f4 <printk>
        record_time = present_time; 
    802003bc:	fe043783          	ld	a5,-32(s0)
    802003c0:	fef43423          	sd	a5,-24(s0)
    while (1) {
    802003c4:	fc1ff06f          	j	80200384 <test+0x14>

00000000802003c8 <putc>:
#include "printk.h"
#include "sbi.h"

void putc(char c) {
    802003c8:	fe010113          	addi	sp,sp,-32
    802003cc:	00113c23          	sd	ra,24(sp)
    802003d0:	00813823          	sd	s0,16(sp)
    802003d4:	02010413          	addi	s0,sp,32
    802003d8:	00050793          	mv	a5,a0
    802003dc:	fef407a3          	sb	a5,-17(s0)
  sbi_ecall(SBI_PUTCHAR, 0, c, 0, 0, 0, 0, 0);
    802003e0:	fef44603          	lbu	a2,-17(s0)
    802003e4:	00000893          	li	a7,0
    802003e8:	00000813          	li	a6,0
    802003ec:	00000793          	li	a5,0
    802003f0:	00000713          	li	a4,0
    802003f4:	00000693          	li	a3,0
    802003f8:	00000593          	li	a1,0
    802003fc:	00100513          	li	a0,1
    80200400:	e1dff0ef          	jal	ra,8020021c <sbi_ecall>
}
    80200404:	00000013          	nop
    80200408:	01813083          	ld	ra,24(sp)
    8020040c:	01013403          	ld	s0,16(sp)
    80200410:	02010113          	addi	sp,sp,32
    80200414:	00008067          	ret

0000000080200418 <vprintfmt>:

static int vprintfmt(void(*putch)(char), const char *fmt, va_list vl) {
    80200418:	f2010113          	addi	sp,sp,-224
    8020041c:	0c113c23          	sd	ra,216(sp)
    80200420:	0c813823          	sd	s0,208(sp)
    80200424:	0e010413          	addi	s0,sp,224
    80200428:	f2a43c23          	sd	a0,-200(s0)
    8020042c:	f2b43823          	sd	a1,-208(s0)
    80200430:	f2c43423          	sd	a2,-216(s0)
    int in_format = 0, longarg = 0;
    80200434:	fe042623          	sw	zero,-20(s0)
    80200438:	fe042423          	sw	zero,-24(s0)
    size_t pos = 0;
    8020043c:	fe043023          	sd	zero,-32(s0)
    for( ; *fmt; fmt++) {
    80200440:	48c0006f          	j	802008cc <vprintfmt+0x4b4>
        if (in_format) {
    80200444:	fec42783          	lw	a5,-20(s0)
    80200448:	0007879b          	sext.w	a5,a5
    8020044c:	42078663          	beqz	a5,80200878 <vprintfmt+0x460>
            switch(*fmt) {
    80200450:	f3043783          	ld	a5,-208(s0)
    80200454:	0007c783          	lbu	a5,0(a5)
    80200458:	0007879b          	sext.w	a5,a5
    8020045c:	f9d7869b          	addiw	a3,a5,-99
    80200460:	0006871b          	sext.w	a4,a3
    80200464:	01500793          	li	a5,21
    80200468:	44e7ea63          	bltu	a5,a4,802008bc <vprintfmt+0x4a4>
    8020046c:	02069793          	slli	a5,a3,0x20
    80200470:	0207d793          	srli	a5,a5,0x20
    80200474:	00279713          	slli	a4,a5,0x2
    80200478:	00001797          	auipc	a5,0x1
    8020047c:	bf078793          	addi	a5,a5,-1040 # 80201068 <_srodata+0x68>
    80200480:	00f707b3          	add	a5,a4,a5
    80200484:	0007a783          	lw	a5,0(a5)
    80200488:	0007871b          	sext.w	a4,a5
    8020048c:	00001797          	auipc	a5,0x1
    80200490:	bdc78793          	addi	a5,a5,-1060 # 80201068 <_srodata+0x68>
    80200494:	00f707b3          	add	a5,a4,a5
    80200498:	00078067          	jr	a5
                case 'l': { 
                    longarg = 1; 
    8020049c:	00100793          	li	a5,1
    802004a0:	fef42423          	sw	a5,-24(s0)
                    break; 
    802004a4:	41c0006f          	j	802008c0 <vprintfmt+0x4a8>
                }
                
                case 'x': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
    802004a8:	fe842783          	lw	a5,-24(s0)
    802004ac:	0007879b          	sext.w	a5,a5
    802004b0:	00078c63          	beqz	a5,802004c8 <vprintfmt+0xb0>
    802004b4:	f2843783          	ld	a5,-216(s0)
    802004b8:	00878713          	addi	a4,a5,8
    802004bc:	f2e43423          	sd	a4,-216(s0)
    802004c0:	0007b783          	ld	a5,0(a5)
    802004c4:	0140006f          	j	802004d8 <vprintfmt+0xc0>
    802004c8:	f2843783          	ld	a5,-216(s0)
    802004cc:	00878713          	addi	a4,a5,8
    802004d0:	f2e43423          	sd	a4,-216(s0)
    802004d4:	0007a783          	lw	a5,0(a5)
    802004d8:	f8f43c23          	sd	a5,-104(s0)

                    int hexdigits = 2 * (longarg ? sizeof(long) : sizeof(int)) - 1;
    802004dc:	fe842783          	lw	a5,-24(s0)
    802004e0:	0007879b          	sext.w	a5,a5
    802004e4:	00078663          	beqz	a5,802004f0 <vprintfmt+0xd8>
    802004e8:	00f00793          	li	a5,15
    802004ec:	0080006f          	j	802004f4 <vprintfmt+0xdc>
    802004f0:	00700793          	li	a5,7
    802004f4:	f8f42a23          	sw	a5,-108(s0)
                    for(int halfbyte = hexdigits; halfbyte >= 0; halfbyte--) {
    802004f8:	f9442783          	lw	a5,-108(s0)
    802004fc:	fcf42e23          	sw	a5,-36(s0)
    80200500:	0840006f          	j	80200584 <vprintfmt+0x16c>
                        int hex = (num >> (4*halfbyte)) & 0xF;
    80200504:	fdc42783          	lw	a5,-36(s0)
    80200508:	0027979b          	slliw	a5,a5,0x2
    8020050c:	0007879b          	sext.w	a5,a5
    80200510:	f9843703          	ld	a4,-104(s0)
    80200514:	40f757b3          	sra	a5,a4,a5
    80200518:	0007879b          	sext.w	a5,a5
    8020051c:	00f7f793          	andi	a5,a5,15
    80200520:	f8f42823          	sw	a5,-112(s0)
                        char hexchar = (hex < 10 ? '0' + hex : 'a' + hex - 10);
    80200524:	f9042783          	lw	a5,-112(s0)
    80200528:	0007871b          	sext.w	a4,a5
    8020052c:	00900793          	li	a5,9
    80200530:	00e7cc63          	blt	a5,a4,80200548 <vprintfmt+0x130>
    80200534:	f9042783          	lw	a5,-112(s0)
    80200538:	0ff7f793          	zext.b	a5,a5
    8020053c:	0307879b          	addiw	a5,a5,48
    80200540:	0ff7f793          	zext.b	a5,a5
    80200544:	0140006f          	j	80200558 <vprintfmt+0x140>
    80200548:	f9042783          	lw	a5,-112(s0)
    8020054c:	0ff7f793          	zext.b	a5,a5
    80200550:	0577879b          	addiw	a5,a5,87
    80200554:	0ff7f793          	zext.b	a5,a5
    80200558:	f8f407a3          	sb	a5,-113(s0)
                        putch(hexchar);
    8020055c:	f8f44703          	lbu	a4,-113(s0)
    80200560:	f3843783          	ld	a5,-200(s0)
    80200564:	00070513          	mv	a0,a4
    80200568:	000780e7          	jalr	a5
                        pos++;
    8020056c:	fe043783          	ld	a5,-32(s0)
    80200570:	00178793          	addi	a5,a5,1
    80200574:	fef43023          	sd	a5,-32(s0)
                    for(int halfbyte = hexdigits; halfbyte >= 0; halfbyte--) {
    80200578:	fdc42783          	lw	a5,-36(s0)
    8020057c:	fff7879b          	addiw	a5,a5,-1
    80200580:	fcf42e23          	sw	a5,-36(s0)
    80200584:	fdc42783          	lw	a5,-36(s0)
    80200588:	0007879b          	sext.w	a5,a5
    8020058c:	f607dce3          	bgez	a5,80200504 <vprintfmt+0xec>
                    }
                    longarg = 0; in_format = 0; 
    80200590:	fe042423          	sw	zero,-24(s0)
    80200594:	fe042623          	sw	zero,-20(s0)
                    break;
    80200598:	3280006f          	j	802008c0 <vprintfmt+0x4a8>
                }
            
                case 'd': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
    8020059c:	fe842783          	lw	a5,-24(s0)
    802005a0:	0007879b          	sext.w	a5,a5
    802005a4:	00078c63          	beqz	a5,802005bc <vprintfmt+0x1a4>
    802005a8:	f2843783          	ld	a5,-216(s0)
    802005ac:	00878713          	addi	a4,a5,8
    802005b0:	f2e43423          	sd	a4,-216(s0)
    802005b4:	0007b783          	ld	a5,0(a5)
    802005b8:	0140006f          	j	802005cc <vprintfmt+0x1b4>
    802005bc:	f2843783          	ld	a5,-216(s0)
    802005c0:	00878713          	addi	a4,a5,8
    802005c4:	f2e43423          	sd	a4,-216(s0)
    802005c8:	0007a783          	lw	a5,0(a5)
    802005cc:	fcf43823          	sd	a5,-48(s0)
                    if (num < 0) {
    802005d0:	fd043783          	ld	a5,-48(s0)
    802005d4:	0207d463          	bgez	a5,802005fc <vprintfmt+0x1e4>
                        num = -num; putch('-');
    802005d8:	fd043783          	ld	a5,-48(s0)
    802005dc:	40f007b3          	neg	a5,a5
    802005e0:	fcf43823          	sd	a5,-48(s0)
    802005e4:	f3843783          	ld	a5,-200(s0)
    802005e8:	02d00513          	li	a0,45
    802005ec:	000780e7          	jalr	a5
                        pos++;
    802005f0:	fe043783          	ld	a5,-32(s0)
    802005f4:	00178793          	addi	a5,a5,1
    802005f8:	fef43023          	sd	a5,-32(s0)
                    }
                    int bits = 0;
    802005fc:	fc042623          	sw	zero,-52(s0)
                    char decchar[25] = {'0', 0};
    80200600:	03000793          	li	a5,48
    80200604:	f6f43023          	sd	a5,-160(s0)
    80200608:	f6043423          	sd	zero,-152(s0)
    8020060c:	f6043823          	sd	zero,-144(s0)
    80200610:	f6040c23          	sb	zero,-136(s0)
                    for (long tmp = num; tmp; bits++) {
    80200614:	fd043783          	ld	a5,-48(s0)
    80200618:	fcf43023          	sd	a5,-64(s0)
    8020061c:	0480006f          	j	80200664 <vprintfmt+0x24c>
                        decchar[bits] = (tmp % 10) + '0';
    80200620:	fc043703          	ld	a4,-64(s0)
    80200624:	00a00793          	li	a5,10
    80200628:	02f767b3          	rem	a5,a4,a5
    8020062c:	0ff7f793          	zext.b	a5,a5
    80200630:	0307879b          	addiw	a5,a5,48
    80200634:	0ff7f713          	zext.b	a4,a5
    80200638:	fcc42783          	lw	a5,-52(s0)
    8020063c:	ff078793          	addi	a5,a5,-16
    80200640:	008787b3          	add	a5,a5,s0
    80200644:	f6e78823          	sb	a4,-144(a5)
                        tmp /= 10;
    80200648:	fc043703          	ld	a4,-64(s0)
    8020064c:	00a00793          	li	a5,10
    80200650:	02f747b3          	div	a5,a4,a5
    80200654:	fcf43023          	sd	a5,-64(s0)
                    for (long tmp = num; tmp; bits++) {
    80200658:	fcc42783          	lw	a5,-52(s0)
    8020065c:	0017879b          	addiw	a5,a5,1
    80200660:	fcf42623          	sw	a5,-52(s0)
    80200664:	fc043783          	ld	a5,-64(s0)
    80200668:	fa079ce3          	bnez	a5,80200620 <vprintfmt+0x208>
                    }

                    for (int i = bits; i >= 0; i--) {
    8020066c:	fcc42783          	lw	a5,-52(s0)
    80200670:	faf42e23          	sw	a5,-68(s0)
    80200674:	02c0006f          	j	802006a0 <vprintfmt+0x288>
                        putch(decchar[i]);
    80200678:	fbc42783          	lw	a5,-68(s0)
    8020067c:	ff078793          	addi	a5,a5,-16
    80200680:	008787b3          	add	a5,a5,s0
    80200684:	f707c703          	lbu	a4,-144(a5)
    80200688:	f3843783          	ld	a5,-200(s0)
    8020068c:	00070513          	mv	a0,a4
    80200690:	000780e7          	jalr	a5
                    for (int i = bits; i >= 0; i--) {
    80200694:	fbc42783          	lw	a5,-68(s0)
    80200698:	fff7879b          	addiw	a5,a5,-1
    8020069c:	faf42e23          	sw	a5,-68(s0)
    802006a0:	fbc42783          	lw	a5,-68(s0)
    802006a4:	0007879b          	sext.w	a5,a5
    802006a8:	fc07d8e3          	bgez	a5,80200678 <vprintfmt+0x260>
                    }
                    pos += bits + 1;
    802006ac:	fcc42783          	lw	a5,-52(s0)
    802006b0:	0017879b          	addiw	a5,a5,1
    802006b4:	0007879b          	sext.w	a5,a5
    802006b8:	00078713          	mv	a4,a5
    802006bc:	fe043783          	ld	a5,-32(s0)
    802006c0:	00e787b3          	add	a5,a5,a4
    802006c4:	fef43023          	sd	a5,-32(s0)
                    longarg = 0; in_format = 0; 
    802006c8:	fe042423          	sw	zero,-24(s0)
    802006cc:	fe042623          	sw	zero,-20(s0)
                    break;
    802006d0:	1f00006f          	j	802008c0 <vprintfmt+0x4a8>
                }

                case 'u': {
                    unsigned long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
    802006d4:	fe842783          	lw	a5,-24(s0)
    802006d8:	0007879b          	sext.w	a5,a5
    802006dc:	00078c63          	beqz	a5,802006f4 <vprintfmt+0x2dc>
    802006e0:	f2843783          	ld	a5,-216(s0)
    802006e4:	00878713          	addi	a4,a5,8
    802006e8:	f2e43423          	sd	a4,-216(s0)
    802006ec:	0007b783          	ld	a5,0(a5)
    802006f0:	0140006f          	j	80200704 <vprintfmt+0x2ec>
    802006f4:	f2843783          	ld	a5,-216(s0)
    802006f8:	00878713          	addi	a4,a5,8
    802006fc:	f2e43423          	sd	a4,-216(s0)
    80200700:	0007a783          	lw	a5,0(a5)
    80200704:	f8f43023          	sd	a5,-128(s0)
                    int bits = 0;
    80200708:	fa042c23          	sw	zero,-72(s0)
                    char decchar[25] = {'0', 0};
    8020070c:	03000793          	li	a5,48
    80200710:	f4f43023          	sd	a5,-192(s0)
    80200714:	f4043423          	sd	zero,-184(s0)
    80200718:	f4043823          	sd	zero,-176(s0)
    8020071c:	f4040c23          	sb	zero,-168(s0)
                    for (long tmp = num; tmp; bits++) {
    80200720:	f8043783          	ld	a5,-128(s0)
    80200724:	faf43823          	sd	a5,-80(s0)
    80200728:	0480006f          	j	80200770 <vprintfmt+0x358>
                        decchar[bits] = (tmp % 10) + '0';
    8020072c:	fb043703          	ld	a4,-80(s0)
    80200730:	00a00793          	li	a5,10
    80200734:	02f767b3          	rem	a5,a4,a5
    80200738:	0ff7f793          	zext.b	a5,a5
    8020073c:	0307879b          	addiw	a5,a5,48
    80200740:	0ff7f713          	zext.b	a4,a5
    80200744:	fb842783          	lw	a5,-72(s0)
    80200748:	ff078793          	addi	a5,a5,-16
    8020074c:	008787b3          	add	a5,a5,s0
    80200750:	f4e78823          	sb	a4,-176(a5)
                        tmp /= 10;
    80200754:	fb043703          	ld	a4,-80(s0)
    80200758:	00a00793          	li	a5,10
    8020075c:	02f747b3          	div	a5,a4,a5
    80200760:	faf43823          	sd	a5,-80(s0)
                    for (long tmp = num; tmp; bits++) {
    80200764:	fb842783          	lw	a5,-72(s0)
    80200768:	0017879b          	addiw	a5,a5,1
    8020076c:	faf42c23          	sw	a5,-72(s0)
    80200770:	fb043783          	ld	a5,-80(s0)
    80200774:	fa079ce3          	bnez	a5,8020072c <vprintfmt+0x314>
                    }

                    for (int i = bits; i >= 0; i--) {
    80200778:	fb842783          	lw	a5,-72(s0)
    8020077c:	faf42623          	sw	a5,-84(s0)
    80200780:	02c0006f          	j	802007ac <vprintfmt+0x394>
                        putch(decchar[i]);
    80200784:	fac42783          	lw	a5,-84(s0)
    80200788:	ff078793          	addi	a5,a5,-16
    8020078c:	008787b3          	add	a5,a5,s0
    80200790:	f507c703          	lbu	a4,-176(a5)
    80200794:	f3843783          	ld	a5,-200(s0)
    80200798:	00070513          	mv	a0,a4
    8020079c:	000780e7          	jalr	a5
                    for (int i = bits; i >= 0; i--) {
    802007a0:	fac42783          	lw	a5,-84(s0)
    802007a4:	fff7879b          	addiw	a5,a5,-1
    802007a8:	faf42623          	sw	a5,-84(s0)
    802007ac:	fac42783          	lw	a5,-84(s0)
    802007b0:	0007879b          	sext.w	a5,a5
    802007b4:	fc07d8e3          	bgez	a5,80200784 <vprintfmt+0x36c>
                    }
                    pos += bits + 1;
    802007b8:	fb842783          	lw	a5,-72(s0)
    802007bc:	0017879b          	addiw	a5,a5,1
    802007c0:	0007879b          	sext.w	a5,a5
    802007c4:	00078713          	mv	a4,a5
    802007c8:	fe043783          	ld	a5,-32(s0)
    802007cc:	00e787b3          	add	a5,a5,a4
    802007d0:	fef43023          	sd	a5,-32(s0)
                    longarg = 0; in_format = 0; 
    802007d4:	fe042423          	sw	zero,-24(s0)
    802007d8:	fe042623          	sw	zero,-20(s0)
                    break;
    802007dc:	0e40006f          	j	802008c0 <vprintfmt+0x4a8>
                }

                case 's': {
                    const char* str = va_arg(vl, const char*);
    802007e0:	f2843783          	ld	a5,-216(s0)
    802007e4:	00878713          	addi	a4,a5,8
    802007e8:	f2e43423          	sd	a4,-216(s0)
    802007ec:	0007b783          	ld	a5,0(a5)
    802007f0:	faf43023          	sd	a5,-96(s0)
                    while (*str) {
    802007f4:	0300006f          	j	80200824 <vprintfmt+0x40c>
                        putch(*str);
    802007f8:	fa043783          	ld	a5,-96(s0)
    802007fc:	0007c703          	lbu	a4,0(a5)
    80200800:	f3843783          	ld	a5,-200(s0)
    80200804:	00070513          	mv	a0,a4
    80200808:	000780e7          	jalr	a5
                        pos++; 
    8020080c:	fe043783          	ld	a5,-32(s0)
    80200810:	00178793          	addi	a5,a5,1
    80200814:	fef43023          	sd	a5,-32(s0)
                        str++;
    80200818:	fa043783          	ld	a5,-96(s0)
    8020081c:	00178793          	addi	a5,a5,1
    80200820:	faf43023          	sd	a5,-96(s0)
                    while (*str) {
    80200824:	fa043783          	ld	a5,-96(s0)
    80200828:	0007c783          	lbu	a5,0(a5)
    8020082c:	fc0796e3          	bnez	a5,802007f8 <vprintfmt+0x3e0>
                    }
                    longarg = 0; in_format = 0; 
    80200830:	fe042423          	sw	zero,-24(s0)
    80200834:	fe042623          	sw	zero,-20(s0)
                    break;
    80200838:	0880006f          	j	802008c0 <vprintfmt+0x4a8>
                }

                case 'c': {
                    char ch = (char)va_arg(vl,int);
    8020083c:	f2843783          	ld	a5,-216(s0)
    80200840:	00878713          	addi	a4,a5,8
    80200844:	f2e43423          	sd	a4,-216(s0)
    80200848:	0007a783          	lw	a5,0(a5)
    8020084c:	f6f40fa3          	sb	a5,-129(s0)
                    putch(ch);
    80200850:	f7f44703          	lbu	a4,-129(s0)
    80200854:	f3843783          	ld	a5,-200(s0)
    80200858:	00070513          	mv	a0,a4
    8020085c:	000780e7          	jalr	a5
                    pos++;
    80200860:	fe043783          	ld	a5,-32(s0)
    80200864:	00178793          	addi	a5,a5,1
    80200868:	fef43023          	sd	a5,-32(s0)
                    longarg = 0; in_format = 0; 
    8020086c:	fe042423          	sw	zero,-24(s0)
    80200870:	fe042623          	sw	zero,-20(s0)
                    break;
    80200874:	04c0006f          	j	802008c0 <vprintfmt+0x4a8>
                }
                default:
                    break;
            }
        }
        else if(*fmt == '%') {
    80200878:	f3043783          	ld	a5,-208(s0)
    8020087c:	0007c783          	lbu	a5,0(a5)
    80200880:	00078713          	mv	a4,a5
    80200884:	02500793          	li	a5,37
    80200888:	00f71863          	bne	a4,a5,80200898 <vprintfmt+0x480>
          in_format = 1;
    8020088c:	00100793          	li	a5,1
    80200890:	fef42623          	sw	a5,-20(s0)
    80200894:	02c0006f          	j	802008c0 <vprintfmt+0x4a8>
        }
        else {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            putch(*fmt);
    80200898:	f3043783          	ld	a5,-208(s0)
    8020089c:	0007c703          	lbu	a4,0(a5)
    802008a0:	f3843783          	ld	a5,-200(s0)
    802008a4:	00070513          	mv	a0,a4
    802008a8:	000780e7          	jalr	a5
            pos++;
    802008ac:	fe043783          	ld	a5,-32(s0)
    802008b0:	00178793          	addi	a5,a5,1
    802008b4:	fef43023          	sd	a5,-32(s0)
    802008b8:	0080006f          	j	802008c0 <vprintfmt+0x4a8>
                    break;
    802008bc:	00000013          	nop
    for( ; *fmt; fmt++) {
    802008c0:	f3043783          	ld	a5,-208(s0)
    802008c4:	00178793          	addi	a5,a5,1
    802008c8:	f2f43823          	sd	a5,-208(s0)
    802008cc:	f3043783          	ld	a5,-208(s0)
    802008d0:	0007c783          	lbu	a5,0(a5)
    802008d4:	b60798e3          	bnez	a5,80200444 <vprintfmt+0x2c>
        }
    }
    return pos;
    802008d8:	fe043783          	ld	a5,-32(s0)
    802008dc:	0007879b          	sext.w	a5,a5
}
    802008e0:	00078513          	mv	a0,a5
    802008e4:	0d813083          	ld	ra,216(sp)
    802008e8:	0d013403          	ld	s0,208(sp)
    802008ec:	0e010113          	addi	sp,sp,224
    802008f0:	00008067          	ret

00000000802008f4 <printk>:



int printk(const char* s, ...) {
    802008f4:	f9010113          	addi	sp,sp,-112
    802008f8:	02113423          	sd	ra,40(sp)
    802008fc:	02813023          	sd	s0,32(sp)
    80200900:	03010413          	addi	s0,sp,48
    80200904:	fca43c23          	sd	a0,-40(s0)
    80200908:	00b43423          	sd	a1,8(s0)
    8020090c:	00c43823          	sd	a2,16(s0)
    80200910:	00d43c23          	sd	a3,24(s0)
    80200914:	02e43023          	sd	a4,32(s0)
    80200918:	02f43423          	sd	a5,40(s0)
    8020091c:	03043823          	sd	a6,48(s0)
    80200920:	03143c23          	sd	a7,56(s0)
    int res = 0;
    80200924:	fe042623          	sw	zero,-20(s0)
    va_list vl;
    va_start(vl, s);
    80200928:	04040793          	addi	a5,s0,64
    8020092c:	fcf43823          	sd	a5,-48(s0)
    80200930:	fd043783          	ld	a5,-48(s0)
    80200934:	fc878793          	addi	a5,a5,-56
    80200938:	fef43023          	sd	a5,-32(s0)
    res = vprintfmt(putc, s, vl);
    8020093c:	fe043783          	ld	a5,-32(s0)
    80200940:	00078613          	mv	a2,a5
    80200944:	fd843583          	ld	a1,-40(s0)
    80200948:	00000517          	auipc	a0,0x0
    8020094c:	a8050513          	addi	a0,a0,-1408 # 802003c8 <putc>
    80200950:	ac9ff0ef          	jal	ra,80200418 <vprintfmt>
    80200954:	00050793          	mv	a5,a0
    80200958:	fef42623          	sw	a5,-20(s0)
    va_end(vl);
    return res;
    8020095c:	fec42783          	lw	a5,-20(s0)
}
    80200960:	00078513          	mv	a0,a5
    80200964:	02813083          	ld	ra,40(sp)
    80200968:	02013403          	ld	s0,32(sp)
    8020096c:	07010113          	addi	sp,sp,112
    80200970:	00008067          	ret
