
../../vmlinux:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_start>:
.extern start_kernel

.section .text.init
.globl _start, _end
_start:
  la sp, _end
    80200000:	00005117          	auipc	sp,0x5
    80200004:	00010113          	mv	sp,sp
  lui t0,1
    80200008:	000012b7          	lui	t0,0x1
  add sp,sp,t0
    8020000c:	00510133          	add	sp,sp,t0
  call mm_init
    80200010:	3c8000ef          	jal	ra,802003d8 <mm_init>
  call task_init
    80200014:	408000ef          	jal	ra,8020041c <task_init>

  la t0, _traps
    80200018:	00000297          	auipc	t0,0x0
    8020001c:	06c28293          	addi	t0,t0,108 # 80200084 <_traps>
  csrw stvec, t0
    80200020:	10529073          	csrw	stvec,t0
  csrr t0,sie
    80200024:	104022f3          	csrr	t0,sie
  ori t0,t0,0x20
    80200028:	0202e293          	ori	t0,t0,32
  csrw sie,t0
    8020002c:	10429073          	csrw	sie,t0
  rdtime t0
    80200030:	c01022f3          	rdtime	t0
  lui t1, 0x989
    80200034:	00989337          	lui	t1,0x989
  addi t1, t1, 0x680
    80200038:	68030313          	addi	t1,t1,1664 # 989680 <_start-0x7f876980>
  add t0, t0, t1
    8020003c:	006282b3          	add	t0,t0,t1
  li a7, 0x00
    80200040:	00000893          	li	a7,0
  li a6, 0x0
    80200044:	00000813          	li	a6,0
  li a5, 0x0
    80200048:	00000793          	li	a5,0
  li a4, 0x0
    8020004c:	00000713          	li	a4,0
  li a3, 0x0
    80200050:	00000693          	li	a3,0
  li a2, 0x0
    80200054:	00000613          	li	a2,0
  li a1, 0x0
    80200058:	00000593          	li	a1,0
  mv a0, t0
    8020005c:	00028513          	mv	a0,t0
  ecall
    80200060:	00000073          	ecall
  csrr t0,sstatus
    80200064:	100022f3          	csrr	t0,sstatus
  ori t0,t0,0x2
    80200068:	0022e293          	ori	t0,t0,2
  csrw sstatus,t0
    8020006c:	10029073          	csrw	sstatus,t0
  la sp, _end
    80200070:	00005117          	auipc	sp,0x5
    80200074:	f9010113          	addi	sp,sp,-112 # 80205000 <_end>
  lui t0, 2
    80200078:	000022b7          	lui	t0,0x2
  add sp,sp,t0
    8020007c:	00510133          	add	sp,sp,t0
  jal ra, start_kernel
    80200080:	285000ef          	jal	ra,80200b04 <start_kernel>

0000000080200084 <_traps>:
    .align 2
    .globl _traps 
    .global __dummy
    .global __switch_to
_traps:
    addi sp,sp,-256
    80200084:	f0010113          	addi	sp,sp,-256
    sd ra,0(sp)
    80200088:	00113023          	sd	ra,0(sp)
    sd sp,8(sp)
    8020008c:	00213423          	sd	sp,8(sp)
    sd gp,16(sp)
    80200090:	00313823          	sd	gp,16(sp)
    sd tp,24(sp)
    80200094:	00413c23          	sd	tp,24(sp)
    sd t0,32(sp)
    80200098:	02513023          	sd	t0,32(sp)
    sd t1,40(sp)
    8020009c:	02613423          	sd	t1,40(sp)
    sd t2,48(sp)
    802000a0:	02713823          	sd	t2,48(sp)
    sd fp,56(sp)
    802000a4:	02813c23          	sd	s0,56(sp)
    sd s1,64(sp)
    802000a8:	04913023          	sd	s1,64(sp)
    sd a0,72(sp)
    802000ac:	04a13423          	sd	a0,72(sp)
    sd a1,80(sp)
    802000b0:	04b13823          	sd	a1,80(sp)
    sd a2,88(sp)
    802000b4:	04c13c23          	sd	a2,88(sp)
    sd a3,96(sp)
    802000b8:	06d13023          	sd	a3,96(sp)
    sd a4,104(sp)
    802000bc:	06e13423          	sd	a4,104(sp)
    sd a5,112(sp)
    802000c0:	06f13823          	sd	a5,112(sp)
    sd a6,120(sp)
    802000c4:	07013c23          	sd	a6,120(sp)
    sd a7,128(sp)
    802000c8:	09113023          	sd	a7,128(sp)
    sd s2,136(sp)
    802000cc:	09213423          	sd	s2,136(sp)
    sd s3,144(sp)
    802000d0:	09313823          	sd	s3,144(sp)
    sd s4,152(sp)
    802000d4:	09413c23          	sd	s4,152(sp)
    sd s5,160(sp)
    802000d8:	0b513023          	sd	s5,160(sp)
    sd s6,168(sp)
    802000dc:	0b613423          	sd	s6,168(sp)
    sd s7,176(sp)
    802000e0:	0b713823          	sd	s7,176(sp)
    sd s8,184(sp)
    802000e4:	0b813c23          	sd	s8,184(sp)
    sd s9,192(sp)
    802000e8:	0d913023          	sd	s9,192(sp)
    sd s10,200(sp)
    802000ec:	0da13423          	sd	s10,200(sp)
    sd s11,208(sp)
    802000f0:	0db13823          	sd	s11,208(sp)
    sd t3,216(sp)
    802000f4:	0dc13c23          	sd	t3,216(sp)
    sd t4,224(sp)
    802000f8:	0fd13023          	sd	t4,224(sp)
    sd t5,232(sp)
    802000fc:	0fe13423          	sd	t5,232(sp)
    sd t6,240(sp)
    80200100:	0ff13823          	sd	t6,240(sp)

    csrr t0,sepc
    80200104:	141022f3          	csrr	t0,sepc
    sd t0,248(sp)
    80200108:	0e513c23          	sd	t0,248(sp)

    mv a1, t0
    8020010c:	00028593          	mv	a1,t0
    csrr a0,scause
    80200110:	14202573          	csrr	a0,scause
    call trap_handler
    80200114:	185000ef          	jal	ra,80200a98 <trap_handler>

    ld t0,248(sp)
    80200118:	0f813283          	ld	t0,248(sp)
    csrw sepc,t0
    8020011c:	14129073          	csrw	sepc,t0
    ld ra,0(sp)
    80200120:	00013083          	ld	ra,0(sp)
    ld gp,16(sp)
    80200124:	01013183          	ld	gp,16(sp)
    ld tp,24(sp)
    80200128:	01813203          	ld	tp,24(sp)
    ld t0,32(sp)
    8020012c:	02013283          	ld	t0,32(sp)
    ld t1,40(sp)
    80200130:	02813303          	ld	t1,40(sp)
    ld t2,48(sp)
    80200134:	03013383          	ld	t2,48(sp)
    ld fp,56(sp)
    80200138:	03813403          	ld	s0,56(sp)
    ld s1,64(sp)
    8020013c:	04013483          	ld	s1,64(sp)
    ld a0,72(sp)
    80200140:	04813503          	ld	a0,72(sp)
    ld a1,80(sp)
    80200144:	05013583          	ld	a1,80(sp)
    ld a2,88(sp)
    80200148:	05813603          	ld	a2,88(sp)
    ld a3,96(sp)
    8020014c:	06013683          	ld	a3,96(sp)
    ld a4,104(sp)
    80200150:	06813703          	ld	a4,104(sp)
    ld a5,112(sp)
    80200154:	07013783          	ld	a5,112(sp)
    ld a6,120(sp)
    80200158:	07813803          	ld	a6,120(sp)
    ld a7,128(sp)
    8020015c:	08013883          	ld	a7,128(sp)
    ld s2,136(sp)
    80200160:	08813903          	ld	s2,136(sp)
    ld s3,144(sp)
    80200164:	09013983          	ld	s3,144(sp)
    ld s4,152(sp)
    80200168:	09813a03          	ld	s4,152(sp)
    ld s5,160(sp)
    8020016c:	0a013a83          	ld	s5,160(sp)
    ld s6,168(sp)
    80200170:	0a813b03          	ld	s6,168(sp)
    ld s7,176(sp)
    80200174:	0b013b83          	ld	s7,176(sp)
    ld s8,184(sp)
    80200178:	0b813c03          	ld	s8,184(sp)
    ld s9,192(sp)
    8020017c:	0c013c83          	ld	s9,192(sp)
    ld s10,200(sp)
    80200180:	0c813d03          	ld	s10,200(sp)
    ld s11,208(sp)
    80200184:	0d013d83          	ld	s11,208(sp)
    ld t3,216(sp)
    80200188:	0d813e03          	ld	t3,216(sp)
    ld t4,224(sp)
    8020018c:	0e013e83          	ld	t4,224(sp)
    ld t5,232(sp)
    80200190:	0e813f03          	ld	t5,232(sp)
    ld t6,240(sp)
    80200194:	0f013f83          	ld	t6,240(sp)
    ld sp,8(sp)
    80200198:	00813103          	ld	sp,8(sp)

    addi sp,sp,256
    8020019c:	10010113          	addi	sp,sp,256
    sret
    802001a0:	10200073          	sret

00000000802001a4 <__dummy>:
__dummy:
    la t0, dummy
    802001a4:	00000297          	auipc	t0,0x0
    802001a8:	75828293          	addi	t0,t0,1880 # 802008fc <dummy>
    csrw sepc, t0
    802001ac:	14129073          	csrw	sepc,t0
    sret
    802001b0:	10200073          	sret

00000000802001b4 <__switch_to>:
__switch_to:
    sd ra,40(a0)
    802001b4:	02153423          	sd	ra,40(a0)
    sd sp,48(a0)
    802001b8:	02253823          	sd	sp,48(a0)
    sd s0,56(a0)
    802001bc:	02853c23          	sd	s0,56(a0)
    sd s1,64(a0)
    802001c0:	04953023          	sd	s1,64(a0)
    sd s2,72(a0)
    802001c4:	05253423          	sd	s2,72(a0)
    sd s3,80(a0)
    802001c8:	05353823          	sd	s3,80(a0)
    sd s4,88(a0)
    802001cc:	05453c23          	sd	s4,88(a0)
    sd s5,96(a0)
    802001d0:	07553023          	sd	s5,96(a0)
    sd s6,104(a0)
    802001d4:	07653423          	sd	s6,104(a0)
    sd s7,112(a0)
    802001d8:	07753823          	sd	s7,112(a0)
    sd s8,120(a0)
    802001dc:	07853c23          	sd	s8,120(a0)
    sd s9,128(a0)
    802001e0:	09953023          	sd	s9,128(a0)
    sd s10,136(a0)
    802001e4:	09a53423          	sd	s10,136(a0)
    sd s11,144(a0)
    802001e8:	09b53823          	sd	s11,144(a0)

    ld ra,40(a1)
    802001ec:	0285b083          	ld	ra,40(a1)
    ld sp,48(a1)
    802001f0:	0305b103          	ld	sp,48(a1)
    ld s0,56(a1)
    802001f4:	0385b403          	ld	s0,56(a1)
    ld s1,64(a1)
    802001f8:	0405b483          	ld	s1,64(a1)
    ld s2,72(a1)
    802001fc:	0485b903          	ld	s2,72(a1)
    ld s3,80(a1)
    80200200:	0505b983          	ld	s3,80(a1)
    ld s4,88(a1)
    80200204:	0585ba03          	ld	s4,88(a1)
    ld s5,96(a1)
    80200208:	0605ba83          	ld	s5,96(a1)
    ld s6,104(a1)
    8020020c:	0685bb03          	ld	s6,104(a1)
    ld s7,112(a1)
    80200210:	0705bb83          	ld	s7,112(a1)
    ld s8,120(a1)
    80200214:	0785bc03          	ld	s8,120(a1)
    ld s9,128(a1)
    80200218:	0805bc83          	ld	s9,128(a1)
    ld s10,136(a1)
    8020021c:	0885bd03          	ld	s10,136(a1)
    ld s11,144(a1)
    80200220:	0905bd83          	ld	s11,144(a1)

    ret
    80200224:	00008067          	ret

0000000080200228 <get_cycles>:
// clock.c


unsigned long TIMECLOCK = 10000000;

unsigned long get_cycles() {
    80200228:	fe010113          	addi	sp,sp,-32
    8020022c:	00813c23          	sd	s0,24(sp)
    80200230:	02010413          	addi	s0,sp,32
    unsigned long ret;
    __asm__ volatile(
    80200234:	c01022f3          	rdtime	t0
    80200238:	00028793          	mv	a5,t0
    8020023c:	fef43423          	sd	a5,-24(s0)
        "rdtime t0\n"
        "mv %[ret],t0\n"
        : [ret] "=r" (ret)
        :: "memory"
    );
    return ret;
    80200240:	fe843783          	ld	a5,-24(s0)
}
    80200244:	00078513          	mv	a0,a5
    80200248:	01813403          	ld	s0,24(sp)
    8020024c:	02010113          	addi	sp,sp,32
    80200250:	00008067          	ret

0000000080200254 <clock_set_next_event>:

void clock_set_next_event() {
    80200254:	fe010113          	addi	sp,sp,-32
    80200258:	00113c23          	sd	ra,24(sp)
    8020025c:	00813823          	sd	s0,16(sp)
    80200260:	02010413          	addi	s0,sp,32
    unsigned long next = get_cycles() + TIMECLOCK;
    80200264:	fc5ff0ef          	jal	ra,80200228 <get_cycles>
    80200268:	00050713          	mv	a4,a0
    8020026c:	00003797          	auipc	a5,0x3
    80200270:	d9478793          	addi	a5,a5,-620 # 80203000 <TIMECLOCK>
    80200274:	0007b783          	ld	a5,0(a5)
    80200278:	00f707b3          	add	a5,a4,a5
    8020027c:	fef43423          	sd	a5,-24(s0)
    sbi_ecall(0,0,next,0,0,0,0,0);
    80200280:	00000893          	li	a7,0
    80200284:	00000813          	li	a6,0
    80200288:	00000793          	li	a5,0
    8020028c:	00000713          	li	a4,0
    80200290:	00000693          	li	a3,0
    80200294:	fe843603          	ld	a2,-24(s0)
    80200298:	00000593          	li	a1,0
    8020029c:	00000513          	li	a0,0
    802002a0:	750000ef          	jal	ra,802009f0 <sbi_ecall>
    802002a4:	00000013          	nop
    802002a8:	01813083          	ld	ra,24(sp)
    802002ac:	01013403          	ld	s0,16(sp)
    802002b0:	02010113          	addi	sp,sp,32
    802002b4:	00008067          	ret

00000000802002b8 <kalloc>:

struct {
    struct run *freelist;
} kmem;

uint64 kalloc() {
    802002b8:	fe010113          	addi	sp,sp,-32
    802002bc:	00813c23          	sd	s0,24(sp)
    802002c0:	02010413          	addi	s0,sp,32
    struct run *r;

    r = kmem.freelist;
    802002c4:	00004797          	auipc	a5,0x4
    802002c8:	d3c78793          	addi	a5,a5,-708 # 80204000 <kmem>
    802002cc:	0007b783          	ld	a5,0(a5)
    802002d0:	fef43423          	sd	a5,-24(s0)
    kmem.freelist = r->next;
    802002d4:	fe843783          	ld	a5,-24(s0)
    802002d8:	0007b703          	ld	a4,0(a5)
    802002dc:	00004797          	auipc	a5,0x4
    802002e0:	d2478793          	addi	a5,a5,-732 # 80204000 <kmem>
    802002e4:	00e7b023          	sd	a4,0(a5)
    
    //memset((void *)r, 0x0, PGSIZE);
    return (uint64) r;
    802002e8:	fe843783          	ld	a5,-24(s0)
}
    802002ec:	00078513          	mv	a0,a5
    802002f0:	01813403          	ld	s0,24(sp)
    802002f4:	02010113          	addi	sp,sp,32
    802002f8:	00008067          	ret

00000000802002fc <kfree>:

void kfree(uint64 addr) {
    802002fc:	fd010113          	addi	sp,sp,-48
    80200300:	02813423          	sd	s0,40(sp)
    80200304:	03010413          	addi	s0,sp,48
    80200308:	fca43c23          	sd	a0,-40(s0)
    struct run *r;

    // PGSIZE align 
    addr = addr & ~(PGSIZE - 1);
    8020030c:	fd843703          	ld	a4,-40(s0)
    80200310:	fffff7b7          	lui	a5,0xfffff
    80200314:	00f777b3          	and	a5,a4,a5
    80200318:	fcf43c23          	sd	a5,-40(s0)

    //memset((void *)addr, 0x0, (uint64)PGSIZE);

    r = (struct run *)addr;
    8020031c:	fd843783          	ld	a5,-40(s0)
    80200320:	fef43423          	sd	a5,-24(s0)
    r->next = kmem.freelist;
    80200324:	00004797          	auipc	a5,0x4
    80200328:	cdc78793          	addi	a5,a5,-804 # 80204000 <kmem>
    8020032c:	0007b703          	ld	a4,0(a5)
    80200330:	fe843783          	ld	a5,-24(s0)
    80200334:	00e7b023          	sd	a4,0(a5)
    kmem.freelist = r;
    80200338:	00004797          	auipc	a5,0x4
    8020033c:	cc878793          	addi	a5,a5,-824 # 80204000 <kmem>
    80200340:	fe843703          	ld	a4,-24(s0)
    80200344:	00e7b023          	sd	a4,0(a5)

    return ;
    80200348:	00000013          	nop
}
    8020034c:	02813403          	ld	s0,40(sp)
    80200350:	03010113          	addi	sp,sp,48
    80200354:	00008067          	ret

0000000080200358 <kfreerange>:

void kfreerange(char *start, char *end) {
    80200358:	fd010113          	addi	sp,sp,-48
    8020035c:	02113423          	sd	ra,40(sp)
    80200360:	02813023          	sd	s0,32(sp)
    80200364:	03010413          	addi	s0,sp,48
    80200368:	fca43c23          	sd	a0,-40(s0)
    8020036c:	fcb43823          	sd	a1,-48(s0)
    char *addr = (char *)PGROUNDUP((uint64)start);
    80200370:	fd843703          	ld	a4,-40(s0)
    80200374:	000017b7          	lui	a5,0x1
    80200378:	fff78793          	addi	a5,a5,-1 # fff <_start-0x801ff001>
    8020037c:	00f70733          	add	a4,a4,a5
    80200380:	fffff7b7          	lui	a5,0xfffff
    80200384:	00f777b3          	and	a5,a4,a5
    80200388:	fef43423          	sd	a5,-24(s0)
    for (; (uint64)(addr) + PGSIZE <= (uint64)end; addr += PGSIZE) {
    8020038c:	0200006f          	j	802003ac <kfreerange+0x54>
        kfree((uint64)addr);
    80200390:	fe843783          	ld	a5,-24(s0)
    80200394:	00078513          	mv	a0,a5
    80200398:	f65ff0ef          	jal	ra,802002fc <kfree>
    for (; (uint64)(addr) + PGSIZE <= (uint64)end; addr += PGSIZE) {
    8020039c:	fe843703          	ld	a4,-24(s0)
    802003a0:	000017b7          	lui	a5,0x1
    802003a4:	00f707b3          	add	a5,a4,a5
    802003a8:	fef43423          	sd	a5,-24(s0)
    802003ac:	fe843703          	ld	a4,-24(s0)
    802003b0:	000017b7          	lui	a5,0x1
    802003b4:	00f70733          	add	a4,a4,a5
    802003b8:	fd043783          	ld	a5,-48(s0)
    802003bc:	fce7fae3          	bgeu	a5,a4,80200390 <kfreerange+0x38>
    }
}
    802003c0:	00000013          	nop
    802003c4:	00000013          	nop
    802003c8:	02813083          	ld	ra,40(sp)
    802003cc:	02013403          	ld	s0,32(sp)
    802003d0:	03010113          	addi	sp,sp,48
    802003d4:	00008067          	ret

00000000802003d8 <mm_init>:

void mm_init(void) {
    802003d8:	ff010113          	addi	sp,sp,-16
    802003dc:	00113423          	sd	ra,8(sp)
    802003e0:	00813023          	sd	s0,0(sp)
    802003e4:	01010413          	addi	s0,sp,16
    kfreerange(_end, (char *)PHY_END);
    802003e8:	01100793          	li	a5,17
    802003ec:	01b79593          	slli	a1,a5,0x1b
    802003f0:	00005517          	auipc	a0,0x5
    802003f4:	c1050513          	addi	a0,a0,-1008 # 80205000 <_end>
    802003f8:	f61ff0ef          	jal	ra,80200358 <kfreerange>
    printk("...mm_init done!\n");
    802003fc:	00002517          	auipc	a0,0x2
    80200400:	c0450513          	addi	a0,a0,-1020 # 80202000 <_srodata>
    80200404:	4a9000ef          	jal	ra,802010ac <printk>
}
    80200408:	00000013          	nop
    8020040c:	00813083          	ld	ra,8(sp)
    80200410:	00013403          	ld	s0,0(sp)
    80200414:	01010113          	addi	sp,sp,16
    80200418:	00008067          	ret

000000008020041c <task_init>:
struct task_struct* idle;           // idle process
struct task_struct* current;        // 指向当前运行线程的 `task_struct`
struct task_struct* task[NR_TASKS]; // 线程数组，所有的线程都保存在此
extern void __switch_to(struct task_struct* prev, struct task_struct* next);

void task_init() {
    8020041c:	fe010113          	addi	sp,sp,-32
    80200420:	00113c23          	sd	ra,24(sp)
    80200424:	00813823          	sd	s0,16(sp)
    80200428:	02010413          	addi	s0,sp,32
    // 3. 由于 idle 不参与调度 可以将其 counter / priority 设置为 0
    // 4. 设置 idle 的 pid 为 0
    // 5. 将 current 和 task[0] 指向 idle

    /* YOUR CODE HERE */
    idle=(struct task_struct*)kalloc();
    8020042c:	e8dff0ef          	jal	ra,802002b8 <kalloc>
    80200430:	00050793          	mv	a5,a0
    80200434:	00078713          	mv	a4,a5
    80200438:	00004797          	auipc	a5,0x4
    8020043c:	bd078793          	addi	a5,a5,-1072 # 80204008 <idle>
    80200440:	00e7b023          	sd	a4,0(a5)
    idle->state=TASK_RUNNING;
    80200444:	00004797          	auipc	a5,0x4
    80200448:	bc478793          	addi	a5,a5,-1084 # 80204008 <idle>
    8020044c:	0007b783          	ld	a5,0(a5)
    80200450:	0007b423          	sd	zero,8(a5)
    idle->counter=0;
    80200454:	00004797          	auipc	a5,0x4
    80200458:	bb478793          	addi	a5,a5,-1100 # 80204008 <idle>
    8020045c:	0007b783          	ld	a5,0(a5)
    80200460:	0007b823          	sd	zero,16(a5)
    idle->priority=0;
    80200464:	00004797          	auipc	a5,0x4
    80200468:	ba478793          	addi	a5,a5,-1116 # 80204008 <idle>
    8020046c:	0007b783          	ld	a5,0(a5)
    80200470:	0007bc23          	sd	zero,24(a5)
    idle->pid=0;
    80200474:	00004797          	auipc	a5,0x4
    80200478:	b9478793          	addi	a5,a5,-1132 # 80204008 <idle>
    8020047c:	0007b783          	ld	a5,0(a5)
    80200480:	0207b023          	sd	zero,32(a5)
    current=idle;
    80200484:	00004797          	auipc	a5,0x4
    80200488:	b8478793          	addi	a5,a5,-1148 # 80204008 <idle>
    8020048c:	0007b703          	ld	a4,0(a5)
    80200490:	00004797          	auipc	a5,0x4
    80200494:	b8078793          	addi	a5,a5,-1152 # 80204010 <current>
    80200498:	00e7b023          	sd	a4,0(a5)
    task[0]=idle;
    8020049c:	00004797          	auipc	a5,0x4
    802004a0:	b6c78793          	addi	a5,a5,-1172 # 80204008 <idle>
    802004a4:	0007b703          	ld	a4,0(a5)
    802004a8:	00004797          	auipc	a5,0x4
    802004ac:	b7878793          	addi	a5,a5,-1160 # 80204020 <task>
    802004b0:	00e7b023          	sd	a4,0(a5)
    // 3. 为 task[1] ~ task[NR_TASKS - 1] 设置 `thread_struct` 中的 `ra` 和 `sp`, 
    // 4. 其中 `ra` 设置为 __dummy （见 4.3.2）的地址， `sp` 设置为 该线程申请的物理页的高地址

    /* YOUR CODE HERE */
    int i;
    for(i=1;i<NR_TASKS;i++){
    802004b4:	00100793          	li	a5,1
    802004b8:	fef42623          	sw	a5,-20(s0)
    802004bc:	1200006f          	j	802005dc <task_init+0x1c0>
        task[i]=(struct task_struct*)kalloc();
    802004c0:	df9ff0ef          	jal	ra,802002b8 <kalloc>
    802004c4:	00050793          	mv	a5,a0
    802004c8:	00078693          	mv	a3,a5
    802004cc:	00004717          	auipc	a4,0x4
    802004d0:	b5470713          	addi	a4,a4,-1196 # 80204020 <task>
    802004d4:	fec42783          	lw	a5,-20(s0)
    802004d8:	00379793          	slli	a5,a5,0x3
    802004dc:	00f707b3          	add	a5,a4,a5
    802004e0:	00d7b023          	sd	a3,0(a5)
        task[i]->state=TASK_RUNNING;
    802004e4:	00004717          	auipc	a4,0x4
    802004e8:	b3c70713          	addi	a4,a4,-1220 # 80204020 <task>
    802004ec:	fec42783          	lw	a5,-20(s0)
    802004f0:	00379793          	slli	a5,a5,0x3
    802004f4:	00f707b3          	add	a5,a4,a5
    802004f8:	0007b783          	ld	a5,0(a5)
    802004fc:	0007b423          	sd	zero,8(a5)
        task[i]->counter=0;
    80200500:	00004717          	auipc	a4,0x4
    80200504:	b2070713          	addi	a4,a4,-1248 # 80204020 <task>
    80200508:	fec42783          	lw	a5,-20(s0)
    8020050c:	00379793          	slli	a5,a5,0x3
    80200510:	00f707b3          	add	a5,a4,a5
    80200514:	0007b783          	ld	a5,0(a5)
    80200518:	0007b823          	sd	zero,16(a5)
        task[i]->priority=rand()%5+PRIORITY_MIN;
    8020051c:	411000ef          	jal	ra,8020112c <rand>
    80200520:	00050713          	mv	a4,a0
    80200524:	00500793          	li	a5,5
    80200528:	02f77733          	remu	a4,a4,a5
    8020052c:	00004697          	auipc	a3,0x4
    80200530:	af468693          	addi	a3,a3,-1292 # 80204020 <task>
    80200534:	fec42783          	lw	a5,-20(s0)
    80200538:	00379793          	slli	a5,a5,0x3
    8020053c:	00f687b3          	add	a5,a3,a5
    80200540:	0007b783          	ld	a5,0(a5)
    80200544:	00170713          	addi	a4,a4,1
    80200548:	00e7bc23          	sd	a4,24(a5)
        task[i]->pid=i;
    8020054c:	00004717          	auipc	a4,0x4
    80200550:	ad470713          	addi	a4,a4,-1324 # 80204020 <task>
    80200554:	fec42783          	lw	a5,-20(s0)
    80200558:	00379793          	slli	a5,a5,0x3
    8020055c:	00f707b3          	add	a5,a4,a5
    80200560:	0007b783          	ld	a5,0(a5)
    80200564:	fec42703          	lw	a4,-20(s0)
    80200568:	02e7b023          	sd	a4,32(a5)
        task[i]->thread.ra=(uint64)__dummy;
    8020056c:	00004717          	auipc	a4,0x4
    80200570:	ab470713          	addi	a4,a4,-1356 # 80204020 <task>
    80200574:	fec42783          	lw	a5,-20(s0)
    80200578:	00379793          	slli	a5,a5,0x3
    8020057c:	00f707b3          	add	a5,a4,a5
    80200580:	0007b783          	ld	a5,0(a5)
    80200584:	00000717          	auipc	a4,0x0
    80200588:	c2070713          	addi	a4,a4,-992 # 802001a4 <__dummy>
    8020058c:	02e7b423          	sd	a4,40(a5)
        task[i]->thread.sp=(uint64)task[i]+PGSIZE;
    80200590:	00004717          	auipc	a4,0x4
    80200594:	a9070713          	addi	a4,a4,-1392 # 80204020 <task>
    80200598:	fec42783          	lw	a5,-20(s0)
    8020059c:	00379793          	slli	a5,a5,0x3
    802005a0:	00f707b3          	add	a5,a4,a5
    802005a4:	0007b783          	ld	a5,0(a5)
    802005a8:	00078693          	mv	a3,a5
    802005ac:	00004717          	auipc	a4,0x4
    802005b0:	a7470713          	addi	a4,a4,-1420 # 80204020 <task>
    802005b4:	fec42783          	lw	a5,-20(s0)
    802005b8:	00379793          	slli	a5,a5,0x3
    802005bc:	00f707b3          	add	a5,a4,a5
    802005c0:	0007b783          	ld	a5,0(a5)
    802005c4:	00001737          	lui	a4,0x1
    802005c8:	00e68733          	add	a4,a3,a4
    802005cc:	02e7b823          	sd	a4,48(a5)
    for(i=1;i<NR_TASKS;i++){
    802005d0:	fec42783          	lw	a5,-20(s0)
    802005d4:	0017879b          	addiw	a5,a5,1
    802005d8:	fef42623          	sw	a5,-20(s0)
    802005dc:	fec42783          	lw	a5,-20(s0)
    802005e0:	0007871b          	sext.w	a4,a5
    802005e4:	00300793          	li	a5,3
    802005e8:	ece7dce3          	bge	a5,a4,802004c0 <task_init+0xa4>
    }
    printk("...proc_init done!\n");
    802005ec:	00002517          	auipc	a0,0x2
    802005f0:	a2c50513          	addi	a0,a0,-1492 # 80202018 <_srodata+0x18>
    802005f4:	2b9000ef          	jal	ra,802010ac <printk>
}
    802005f8:	00000013          	nop
    802005fc:	01813083          	ld	ra,24(sp)
    80200600:	01013403          	ld	s0,16(sp)
    80200604:	02010113          	addi	sp,sp,32
    80200608:	00008067          	ret

000000008020060c <switch_to>:

void switch_to(struct task_struct* next) {
    8020060c:	fd010113          	addi	sp,sp,-48
    80200610:	02113423          	sd	ra,40(sp)
    80200614:	02813023          	sd	s0,32(sp)
    80200618:	03010413          	addi	s0,sp,48
    8020061c:	fca43c23          	sd	a0,-40(s0)
    /* YOUR CODE HERE */
    if(next!=current){
    80200620:	00004797          	auipc	a5,0x4
    80200624:	9f078793          	addi	a5,a5,-1552 # 80204010 <current>
    80200628:	0007b783          	ld	a5,0(a5)
    8020062c:	fd843703          	ld	a4,-40(s0)
    80200630:	04f70e63          	beq	a4,a5,8020068c <switch_to+0x80>
        printk("switch to [PID = %d PRIORITY = %d COUNTER = %d]\n",next->pid,next->priority,next->counter);
    80200634:	fd843783          	ld	a5,-40(s0)
    80200638:	0207b703          	ld	a4,32(a5)
    8020063c:	fd843783          	ld	a5,-40(s0)
    80200640:	0187b603          	ld	a2,24(a5)
    80200644:	fd843783          	ld	a5,-40(s0)
    80200648:	0107b783          	ld	a5,16(a5)
    8020064c:	00078693          	mv	a3,a5
    80200650:	00070593          	mv	a1,a4
    80200654:	00002517          	auipc	a0,0x2
    80200658:	9dc50513          	addi	a0,a0,-1572 # 80202030 <_srodata+0x30>
    8020065c:	251000ef          	jal	ra,802010ac <printk>
        struct task_struct* pre=current;
    80200660:	00004797          	auipc	a5,0x4
    80200664:	9b078793          	addi	a5,a5,-1616 # 80204010 <current>
    80200668:	0007b783          	ld	a5,0(a5)
    8020066c:	fef43423          	sd	a5,-24(s0)
        current=next;
    80200670:	00004797          	auipc	a5,0x4
    80200674:	9a078793          	addi	a5,a5,-1632 # 80204010 <current>
    80200678:	fd843703          	ld	a4,-40(s0)
    8020067c:	00e7b023          	sd	a4,0(a5)
        __switch_to(pre,next);
    80200680:	fd843583          	ld	a1,-40(s0)
    80200684:	fe843503          	ld	a0,-24(s0)
    80200688:	b2dff0ef          	jal	ra,802001b4 <__switch_to>
    }
}
    8020068c:	00000013          	nop
    80200690:	02813083          	ld	ra,40(sp)
    80200694:	02013403          	ld	s0,32(sp)
    80200698:	03010113          	addi	sp,sp,48
    8020069c:	00008067          	ret

00000000802006a0 <do_timer>:

void do_timer(void) {
    802006a0:	ff010113          	addi	sp,sp,-16
    802006a4:	00113423          	sd	ra,8(sp)
    802006a8:	00813023          	sd	s0,0(sp)
    802006ac:	01010413          	addi	s0,sp,16
    /* 1. 将当前进程的counter--，如果结果大于零则直接返回*/
    /* 2. 否则进行进程调度 */
    if(current->counter==0||current==idle){
    802006b0:	00004797          	auipc	a5,0x4
    802006b4:	96078793          	addi	a5,a5,-1696 # 80204010 <current>
    802006b8:	0007b783          	ld	a5,0(a5)
    802006bc:	0107b783          	ld	a5,16(a5)
    802006c0:	02078063          	beqz	a5,802006e0 <do_timer+0x40>
    802006c4:	00004797          	auipc	a5,0x4
    802006c8:	94c78793          	addi	a5,a5,-1716 # 80204010 <current>
    802006cc:	0007b703          	ld	a4,0(a5)
    802006d0:	00004797          	auipc	a5,0x4
    802006d4:	93878793          	addi	a5,a5,-1736 # 80204008 <idle>
    802006d8:	0007b783          	ld	a5,0(a5)
    802006dc:	00f71663          	bne	a4,a5,802006e8 <do_timer+0x48>
        schedule();
    802006e0:	04c000ef          	jal	ra,8020072c <schedule>
    }else{
        current->counter--;
        if(current->counter==0)
            schedule();
    }
}
    802006e4:	0340006f          	j	80200718 <do_timer+0x78>
        current->counter--;
    802006e8:	00004797          	auipc	a5,0x4
    802006ec:	92878793          	addi	a5,a5,-1752 # 80204010 <current>
    802006f0:	0007b783          	ld	a5,0(a5)
    802006f4:	0107b703          	ld	a4,16(a5)
    802006f8:	fff70713          	addi	a4,a4,-1 # fff <_start-0x801ff001>
    802006fc:	00e7b823          	sd	a4,16(a5)
        if(current->counter==0)
    80200700:	00004797          	auipc	a5,0x4
    80200704:	91078793          	addi	a5,a5,-1776 # 80204010 <current>
    80200708:	0007b783          	ld	a5,0(a5)
    8020070c:	0107b783          	ld	a5,16(a5)
    80200710:	00079463          	bnez	a5,80200718 <do_timer+0x78>
            schedule();
    80200714:	018000ef          	jal	ra,8020072c <schedule>
}
    80200718:	00000013          	nop
    8020071c:	00813083          	ld	ra,8(sp)
    80200720:	00013403          	ld	s0,0(sp)
    80200724:	01010113          	addi	sp,sp,16
    80200728:	00008067          	ret

000000008020072c <schedule>:

void schedule(void) {
    8020072c:	fe010113          	addi	sp,sp,-32
    80200730:	00113c23          	sd	ra,24(sp)
    80200734:	00813823          	sd	s0,16(sp)
    80200738:	02010413          	addi	s0,sp,32
    /* YOUR CODE HERE */
    int i;
    int min=32657;
    8020073c:	000087b7          	lui	a5,0x8
    80200740:	f9178793          	addi	a5,a5,-111 # 7f91 <_start-0x801f806f>
    80200744:	fef42423          	sw	a5,-24(s0)
    struct task_struct* next=idle;
    80200748:	00004797          	auipc	a5,0x4
    8020074c:	8c078793          	addi	a5,a5,-1856 # 80204008 <idle>
    80200750:	0007b783          	ld	a5,0(a5)
    80200754:	fef43023          	sd	a5,-32(s0)
    while(1){
        for(i=1;i<NR_TASKS;i++){
    80200758:	00100793          	li	a5,1
    8020075c:	fef42623          	sw	a5,-20(s0)
    80200760:	0900006f          	j	802007f0 <schedule+0xc4>
            if(task[i]->counter!=0&&task[i]->counter<min){
    80200764:	00004717          	auipc	a4,0x4
    80200768:	8bc70713          	addi	a4,a4,-1860 # 80204020 <task>
    8020076c:	fec42783          	lw	a5,-20(s0)
    80200770:	00379793          	slli	a5,a5,0x3
    80200774:	00f707b3          	add	a5,a4,a5
    80200778:	0007b783          	ld	a5,0(a5)
    8020077c:	0107b783          	ld	a5,16(a5)
    80200780:	06078263          	beqz	a5,802007e4 <schedule+0xb8>
    80200784:	00004717          	auipc	a4,0x4
    80200788:	89c70713          	addi	a4,a4,-1892 # 80204020 <task>
    8020078c:	fec42783          	lw	a5,-20(s0)
    80200790:	00379793          	slli	a5,a5,0x3
    80200794:	00f707b3          	add	a5,a4,a5
    80200798:	0007b783          	ld	a5,0(a5)
    8020079c:	0107b703          	ld	a4,16(a5)
    802007a0:	fe842783          	lw	a5,-24(s0)
    802007a4:	04f77063          	bgeu	a4,a5,802007e4 <schedule+0xb8>
                min=task[i]->counter;
    802007a8:	00004717          	auipc	a4,0x4
    802007ac:	87870713          	addi	a4,a4,-1928 # 80204020 <task>
    802007b0:	fec42783          	lw	a5,-20(s0)
    802007b4:	00379793          	slli	a5,a5,0x3
    802007b8:	00f707b3          	add	a5,a4,a5
    802007bc:	0007b783          	ld	a5,0(a5)
    802007c0:	0107b783          	ld	a5,16(a5)
    802007c4:	fef42423          	sw	a5,-24(s0)
                next=task[i];
    802007c8:	00004717          	auipc	a4,0x4
    802007cc:	85870713          	addi	a4,a4,-1960 # 80204020 <task>
    802007d0:	fec42783          	lw	a5,-20(s0)
    802007d4:	00379793          	slli	a5,a5,0x3
    802007d8:	00f707b3          	add	a5,a4,a5
    802007dc:	0007b783          	ld	a5,0(a5)
    802007e0:	fef43023          	sd	a5,-32(s0)
        for(i=1;i<NR_TASKS;i++){
    802007e4:	fec42783          	lw	a5,-20(s0)
    802007e8:	0017879b          	addiw	a5,a5,1
    802007ec:	fef42623          	sw	a5,-20(s0)
    802007f0:	fec42783          	lw	a5,-20(s0)
    802007f4:	0007871b          	sext.w	a4,a5
    802007f8:	00300793          	li	a5,3
    802007fc:	f6e7d4e3          	bge	a5,a4,80200764 <schedule+0x38>
            }
        }
        if(next!=idle)
    80200800:	00004797          	auipc	a5,0x4
    80200804:	80878793          	addi	a5,a5,-2040 # 80204008 <idle>
    80200808:	0007b783          	ld	a5,0(a5)
    8020080c:	fe043703          	ld	a4,-32(s0)
    80200810:	0cf71663          	bne	a4,a5,802008dc <schedule+0x1b0>
            break;
        for(i=1;i<NR_TASKS;i++){
    80200814:	00100793          	li	a5,1
    80200818:	fef42623          	sw	a5,-20(s0)
    8020081c:	0ac0006f          	j	802008c8 <schedule+0x19c>
            task[i]->counter=task[i]->priority;
    80200820:	00004717          	auipc	a4,0x4
    80200824:	80070713          	addi	a4,a4,-2048 # 80204020 <task>
    80200828:	fec42783          	lw	a5,-20(s0)
    8020082c:	00379793          	slli	a5,a5,0x3
    80200830:	00f707b3          	add	a5,a4,a5
    80200834:	0007b703          	ld	a4,0(a5)
    80200838:	00003697          	auipc	a3,0x3
    8020083c:	7e868693          	addi	a3,a3,2024 # 80204020 <task>
    80200840:	fec42783          	lw	a5,-20(s0)
    80200844:	00379793          	slli	a5,a5,0x3
    80200848:	00f687b3          	add	a5,a3,a5
    8020084c:	0007b783          	ld	a5,0(a5)
    80200850:	01873703          	ld	a4,24(a4)
    80200854:	00e7b823          	sd	a4,16(a5)
            printk("SET [PID = %d PRIORITY = %d COUNTER = %d]\n", task[i]->pid, task[i]->priority, task[i]->counter);
    80200858:	00003717          	auipc	a4,0x3
    8020085c:	7c870713          	addi	a4,a4,1992 # 80204020 <task>
    80200860:	fec42783          	lw	a5,-20(s0)
    80200864:	00379793          	slli	a5,a5,0x3
    80200868:	00f707b3          	add	a5,a4,a5
    8020086c:	0007b783          	ld	a5,0(a5)
    80200870:	0207b583          	ld	a1,32(a5)
    80200874:	00003717          	auipc	a4,0x3
    80200878:	7ac70713          	addi	a4,a4,1964 # 80204020 <task>
    8020087c:	fec42783          	lw	a5,-20(s0)
    80200880:	00379793          	slli	a5,a5,0x3
    80200884:	00f707b3          	add	a5,a4,a5
    80200888:	0007b783          	ld	a5,0(a5)
    8020088c:	0187b603          	ld	a2,24(a5)
    80200890:	00003717          	auipc	a4,0x3
    80200894:	79070713          	addi	a4,a4,1936 # 80204020 <task>
    80200898:	fec42783          	lw	a5,-20(s0)
    8020089c:	00379793          	slli	a5,a5,0x3
    802008a0:	00f707b3          	add	a5,a4,a5
    802008a4:	0007b783          	ld	a5,0(a5)
    802008a8:	0107b783          	ld	a5,16(a5)
    802008ac:	00078693          	mv	a3,a5
    802008b0:	00001517          	auipc	a0,0x1
    802008b4:	7b850513          	addi	a0,a0,1976 # 80202068 <_srodata+0x68>
    802008b8:	7f4000ef          	jal	ra,802010ac <printk>
        for(i=1;i<NR_TASKS;i++){
    802008bc:	fec42783          	lw	a5,-20(s0)
    802008c0:	0017879b          	addiw	a5,a5,1
    802008c4:	fef42623          	sw	a5,-20(s0)
    802008c8:	fec42783          	lw	a5,-20(s0)
    802008cc:	0007871b          	sext.w	a4,a5
    802008d0:	00300793          	li	a5,3
    802008d4:	f4e7d6e3          	bge	a5,a4,80200820 <schedule+0xf4>
        for(i=1;i<NR_TASKS;i++){
    802008d8:	e81ff06f          	j	80200758 <schedule+0x2c>
            break;
    802008dc:	00000013          	nop
        }
    }
    switch_to(next);
    802008e0:	fe043503          	ld	a0,-32(s0)
    802008e4:	d29ff0ef          	jal	ra,8020060c <switch_to>
}
    802008e8:	00000013          	nop
    802008ec:	01813083          	ld	ra,24(sp)
    802008f0:	01013403          	ld	s0,16(sp)
    802008f4:	02010113          	addi	sp,sp,32
    802008f8:	00008067          	ret

00000000802008fc <dummy>:

void dummy() {
    802008fc:	fd010113          	addi	sp,sp,-48
    80200900:	02113423          	sd	ra,40(sp)
    80200904:	02813023          	sd	s0,32(sp)
    80200908:	03010413          	addi	s0,sp,48
uint64 MOD = 1000000007;
    8020090c:	3b9ad7b7          	lui	a5,0x3b9ad
    80200910:	a0778793          	addi	a5,a5,-1529 # 3b9aca07 <_start-0x448535f9>
    80200914:	fcf43c23          	sd	a5,-40(s0)
uint64 auto_inc_local_var = 0;
    80200918:	fe043423          	sd	zero,-24(s0)
int last_counter = -1; // 记录上一个counter
    8020091c:	fff00793          	li	a5,-1
    80200920:	fef42223          	sw	a5,-28(s0)
int last_last_counter = -1; // 记录上上个counter
    80200924:	fff00793          	li	a5,-1
    80200928:	fef42023          	sw	a5,-32(s0)
while(1) {
    if (last_counter == -1 || current->counter != last_counter) {
    8020092c:	fe442783          	lw	a5,-28(s0)
    80200930:	0007871b          	sext.w	a4,a5
    80200934:	fff00793          	li	a5,-1
    80200938:	00f70e63          	beq	a4,a5,80200954 <dummy+0x58>
    8020093c:	00003797          	auipc	a5,0x3
    80200940:	6d478793          	addi	a5,a5,1748 # 80204010 <current>
    80200944:	0007b783          	ld	a5,0(a5)
    80200948:	0107b703          	ld	a4,16(a5)
    8020094c:	fe442783          	lw	a5,-28(s0)
    80200950:	04f70e63          	beq	a4,a5,802009ac <dummy+0xb0>
        last_last_counter = last_counter;
    80200954:	fe442783          	lw	a5,-28(s0)
    80200958:	fef42023          	sw	a5,-32(s0)
        last_counter = current->counter;
    8020095c:	00003797          	auipc	a5,0x3
    80200960:	6b478793          	addi	a5,a5,1716 # 80204010 <current>
    80200964:	0007b783          	ld	a5,0(a5)
    80200968:	0107b783          	ld	a5,16(a5)
    8020096c:	fef42223          	sw	a5,-28(s0)
        auto_inc_local_var = (auto_inc_local_var + 1) % MOD;
    80200970:	fe843783          	ld	a5,-24(s0)
    80200974:	00178713          	addi	a4,a5,1
    80200978:	fd843783          	ld	a5,-40(s0)
    8020097c:	02f777b3          	remu	a5,a4,a5
    80200980:	fef43423          	sd	a5,-24(s0)
        printk("[PID = %d] is running. auto_inc_local_var = %d\n", current->pid, auto_inc_local_var); 
    80200984:	00003797          	auipc	a5,0x3
    80200988:	68c78793          	addi	a5,a5,1676 # 80204010 <current>
    8020098c:	0007b783          	ld	a5,0(a5)
    80200990:	0207b783          	ld	a5,32(a5)
    80200994:	fe843603          	ld	a2,-24(s0)
    80200998:	00078593          	mv	a1,a5
    8020099c:	00001517          	auipc	a0,0x1
    802009a0:	6fc50513          	addi	a0,a0,1788 # 80202098 <_srodata+0x98>
    802009a4:	708000ef          	jal	ra,802010ac <printk>
    if (last_counter == -1 || current->counter != last_counter) {
    802009a8:	0440006f          	j	802009ec <dummy+0xf0>
    } else if((last_last_counter == 0 || last_last_counter == -1) && last_counter == 1) { // counter恒为1的情况
    802009ac:	fe042783          	lw	a5,-32(s0)
    802009b0:	0007879b          	sext.w	a5,a5
    802009b4:	00078a63          	beqz	a5,802009c8 <dummy+0xcc>
    802009b8:	fe042783          	lw	a5,-32(s0)
    802009bc:	0007871b          	sext.w	a4,a5
    802009c0:	fff00793          	li	a5,-1
    802009c4:	f6f714e3          	bne	a4,a5,8020092c <dummy+0x30>
    802009c8:	fe442783          	lw	a5,-28(s0)
    802009cc:	0007871b          	sext.w	a4,a5
    802009d0:	00100793          	li	a5,1
    802009d4:	f4f71ce3          	bne	a4,a5,8020092c <dummy+0x30>
        // 这里比较 tricky，不要求理解。
        last_counter = 0; 
    802009d8:	fe042223          	sw	zero,-28(s0)
        current->counter = 0;
    802009dc:	00003797          	auipc	a5,0x3
    802009e0:	63478793          	addi	a5,a5,1588 # 80204010 <current>
    802009e4:	0007b783          	ld	a5,0(a5)
    802009e8:	0007b823          	sd	zero,16(a5)
    if (last_counter == -1 || current->counter != last_counter) {
    802009ec:	f41ff06f          	j	8020092c <dummy+0x30>

00000000802009f0 <sbi_ecall>:

struct sbiret sbi_ecall(int ext, int fid, uint64 arg0,
                        uint64 arg1, uint64 arg2,
                        uint64 arg3, uint64 arg4,
                        uint64 arg5)
{ 
    802009f0:	fa010113          	addi	sp,sp,-96
    802009f4:	04813c23          	sd	s0,88(sp)
    802009f8:	06010413          	addi	s0,sp,96
    802009fc:	fcc43823          	sd	a2,-48(s0)
    80200a00:	fcd43423          	sd	a3,-56(s0)
    80200a04:	fce43023          	sd	a4,-64(s0)
    80200a08:	faf43c23          	sd	a5,-72(s0)
    80200a0c:	fb043823          	sd	a6,-80(s0)
    80200a10:	fb143423          	sd	a7,-88(s0)
    80200a14:	00050793          	mv	a5,a0
    80200a18:	fcf42e23          	sw	a5,-36(s0)
    80200a1c:	00058793          	mv	a5,a1
    80200a20:	fcf42c23          	sw	a5,-40(s0)
  struct sbiret return_value;
  __asm__ volatile (
    80200a24:	fdc42783          	lw	a5,-36(s0)
    80200a28:	00078813          	mv	a6,a5
    80200a2c:	fd842783          	lw	a5,-40(s0)
    80200a30:	00078893          	mv	a7,a5
    80200a34:	fd043783          	ld	a5,-48(s0)
    80200a38:	fc843703          	ld	a4,-56(s0)
    80200a3c:	fc043683          	ld	a3,-64(s0)
    80200a40:	fb843603          	ld	a2,-72(s0)
    80200a44:	fb043583          	ld	a1,-80(s0)
    80200a48:	fa843503          	ld	a0,-88(s0)
    80200a4c:	00080893          	mv	a7,a6
    80200a50:	00088813          	mv	a6,a7
    80200a54:	00078513          	mv	a0,a5
    80200a58:	00070593          	mv	a1,a4
    80200a5c:	00068613          	mv	a2,a3
    80200a60:	00060693          	mv	a3,a2
    80200a64:	00058713          	mv	a4,a1
    80200a68:	00050793          	mv	a5,a0
    80200a6c:	00000073          	ecall
    80200a70:	00050713          	mv	a4,a0
    80200a74:	00058793          	mv	a5,a1
    80200a78:	fee43023          	sd	a4,-32(s0)
    80200a7c:	fef43423          	sd	a5,-24(s0)
          [arg4] "r" (arg4), 
          [arg5] "r" (arg5)
        : "memory"
    );
  
}
    80200a80:	00000013          	nop
    80200a84:	00070513          	mv	a0,a4
    80200a88:	00078593          	mv	a1,a5
    80200a8c:	05813403          	ld	s0,88(sp)
    80200a90:	06010113          	addi	sp,sp,96
    80200a94:	00008067          	ret

0000000080200a98 <trap_handler>:

// trap.c 

void trap_handler(unsigned long scause, unsigned long sepc) {
    80200a98:	fd010113          	addi	sp,sp,-48
    80200a9c:	02113423          	sd	ra,40(sp)
    80200aa0:	02813023          	sd	s0,32(sp)
    80200aa4:	03010413          	addi	s0,sp,48
    80200aa8:	fca43c23          	sd	a0,-40(s0)
    80200aac:	fcb43823          	sd	a1,-48(s0)
    int x;
    x=scause>>63&&(scause%16==5);
    80200ab0:	fd843783          	ld	a5,-40(s0)
    80200ab4:	0007de63          	bgez	a5,80200ad0 <trap_handler+0x38>
    80200ab8:	fd843783          	ld	a5,-40(s0)
    80200abc:	00f7f713          	andi	a4,a5,15
    80200ac0:	00500793          	li	a5,5
    80200ac4:	00f71663          	bne	a4,a5,80200ad0 <trap_handler+0x38>
    80200ac8:	00100793          	li	a5,1
    80200acc:	0080006f          	j	80200ad4 <trap_handler+0x3c>
    80200ad0:	00000793          	li	a5,0
    80200ad4:	fef42623          	sw	a5,-20(s0)
    if(x==1){
    80200ad8:	fec42783          	lw	a5,-20(s0)
    80200adc:	0007871b          	sext.w	a4,a5
    80200ae0:	00100793          	li	a5,1
    80200ae4:	00f71663          	bne	a4,a5,80200af0 <trap_handler+0x58>
        //printk("[S] Supervisor Mode Timer Interrupt\n");
        clock_set_next_event();
    80200ae8:	f6cff0ef          	jal	ra,80200254 <clock_set_next_event>
        do_timer();
    80200aec:	bb5ff0ef          	jal	ra,802006a0 <do_timer>
    }
    80200af0:	00000013          	nop
    80200af4:	02813083          	ld	ra,40(sp)
    80200af8:	02013403          	ld	s0,32(sp)
    80200afc:	03010113          	addi	sp,sp,48
    80200b00:	00008067          	ret

0000000080200b04 <start_kernel>:
#include "printk.h"
#include "sbi.h"

extern void test();

int start_kernel() {
    80200b04:	ff010113          	addi	sp,sp,-16
    80200b08:	00113423          	sd	ra,8(sp)
    80200b0c:	00813023          	sd	s0,0(sp)
    80200b10:	01010413          	addi	s0,sp,16
    printk("2022 ZJU Computer System II\n");
    80200b14:	00001517          	auipc	a0,0x1
    80200b18:	5b450513          	addi	a0,a0,1460 # 802020c8 <_srodata+0xc8>
    80200b1c:	590000ef          	jal	ra,802010ac <printk>

    test(); // DO NOT DELETE !!!
    80200b20:	01c000ef          	jal	ra,80200b3c <test>

	return 0;
    80200b24:	00000793          	li	a5,0
}
    80200b28:	00078513          	mv	a0,a5
    80200b2c:	00813083          	ld	ra,8(sp)
    80200b30:	00013403          	ld	s0,0(sp)
    80200b34:	01010113          	addi	sp,sp,16
    80200b38:	00008067          	ret

0000000080200b3c <test>:
#include "printk.h"
#include "defs.h"

// Please do not modify

void test() {
    80200b3c:	fe010113          	addi	sp,sp,-32
    80200b40:	00813c23          	sd	s0,24(sp)
    80200b44:	02010413          	addi	s0,sp,32
    unsigned long record_time = 0; 
    80200b48:	fe043423          	sd	zero,-24(s0)
    while (1) {
    unsigned long present_time;
    __asm__ volatile("rdtime %[t]" : [t] "=r" (present_time) : : "memory");
    80200b4c:	c01027f3          	rdtime	a5
    80200b50:	fef43023          	sd	a5,-32(s0)
    present_time /= 10000000;
    80200b54:	fe043703          	ld	a4,-32(s0)
    80200b58:	009897b7          	lui	a5,0x989
    80200b5c:	68078793          	addi	a5,a5,1664 # 989680 <_start-0x7f876980>
    80200b60:	02f757b3          	divu	a5,a4,a5
    80200b64:	fef43023          	sd	a5,-32(s0)
    if (record_time < present_time) {
    80200b68:	fe843703          	ld	a4,-24(s0)
    80200b6c:	fe043783          	ld	a5,-32(s0)
    80200b70:	fcf77ee3          	bgeu	a4,a5,80200b4c <test+0x10>
        //printk("kernel is running! Time: %lus\n", present_time);
        record_time = present_time; 
    80200b74:	fe043783          	ld	a5,-32(s0)
    80200b78:	fef43423          	sd	a5,-24(s0)
    while (1) {
    80200b7c:	fd1ff06f          	j	80200b4c <test+0x10>

0000000080200b80 <putc>:
#include "printk.h"
#include "sbi.h"

void putc(char c) {
    80200b80:	fe010113          	addi	sp,sp,-32
    80200b84:	00113c23          	sd	ra,24(sp)
    80200b88:	00813823          	sd	s0,16(sp)
    80200b8c:	02010413          	addi	s0,sp,32
    80200b90:	00050793          	mv	a5,a0
    80200b94:	fef407a3          	sb	a5,-17(s0)
  sbi_ecall(SBI_PUTCHAR, 0, c, 0, 0, 0, 0, 0);
    80200b98:	fef44603          	lbu	a2,-17(s0)
    80200b9c:	00000893          	li	a7,0
    80200ba0:	00000813          	li	a6,0
    80200ba4:	00000793          	li	a5,0
    80200ba8:	00000713          	li	a4,0
    80200bac:	00000693          	li	a3,0
    80200bb0:	00000593          	li	a1,0
    80200bb4:	00100513          	li	a0,1
    80200bb8:	e39ff0ef          	jal	ra,802009f0 <sbi_ecall>
}
    80200bbc:	00000013          	nop
    80200bc0:	01813083          	ld	ra,24(sp)
    80200bc4:	01013403          	ld	s0,16(sp)
    80200bc8:	02010113          	addi	sp,sp,32
    80200bcc:	00008067          	ret

0000000080200bd0 <vprintfmt>:

static int vprintfmt(void(*putch)(char), const char *fmt, va_list vl) {
    80200bd0:	f2010113          	addi	sp,sp,-224
    80200bd4:	0c113c23          	sd	ra,216(sp)
    80200bd8:	0c813823          	sd	s0,208(sp)
    80200bdc:	0e010413          	addi	s0,sp,224
    80200be0:	f2a43c23          	sd	a0,-200(s0)
    80200be4:	f2b43823          	sd	a1,-208(s0)
    80200be8:	f2c43423          	sd	a2,-216(s0)
    int in_format = 0, longarg = 0;
    80200bec:	fe042623          	sw	zero,-20(s0)
    80200bf0:	fe042423          	sw	zero,-24(s0)
    size_t pos = 0;
    80200bf4:	fe043023          	sd	zero,-32(s0)
    for( ; *fmt; fmt++) {
    80200bf8:	48c0006f          	j	80201084 <vprintfmt+0x4b4>
        if (in_format) {
    80200bfc:	fec42783          	lw	a5,-20(s0)
    80200c00:	0007879b          	sext.w	a5,a5
    80200c04:	42078663          	beqz	a5,80201030 <vprintfmt+0x460>
            switch(*fmt) {
    80200c08:	f3043783          	ld	a5,-208(s0)
    80200c0c:	0007c783          	lbu	a5,0(a5)
    80200c10:	0007879b          	sext.w	a5,a5
    80200c14:	f9d7869b          	addiw	a3,a5,-99
    80200c18:	0006871b          	sext.w	a4,a3
    80200c1c:	01500793          	li	a5,21
    80200c20:	44e7ea63          	bltu	a5,a4,80201074 <vprintfmt+0x4a4>
    80200c24:	02069793          	slli	a5,a3,0x20
    80200c28:	0207d793          	srli	a5,a5,0x20
    80200c2c:	00279713          	slli	a4,a5,0x2
    80200c30:	00001797          	auipc	a5,0x1
    80200c34:	4b878793          	addi	a5,a5,1208 # 802020e8 <_srodata+0xe8>
    80200c38:	00f707b3          	add	a5,a4,a5
    80200c3c:	0007a783          	lw	a5,0(a5)
    80200c40:	0007871b          	sext.w	a4,a5
    80200c44:	00001797          	auipc	a5,0x1
    80200c48:	4a478793          	addi	a5,a5,1188 # 802020e8 <_srodata+0xe8>
    80200c4c:	00f707b3          	add	a5,a4,a5
    80200c50:	00078067          	jr	a5
                case 'l': { 
                    longarg = 1; 
    80200c54:	00100793          	li	a5,1
    80200c58:	fef42423          	sw	a5,-24(s0)
                    break; 
    80200c5c:	41c0006f          	j	80201078 <vprintfmt+0x4a8>
                }
                
                case 'x': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
    80200c60:	fe842783          	lw	a5,-24(s0)
    80200c64:	0007879b          	sext.w	a5,a5
    80200c68:	00078c63          	beqz	a5,80200c80 <vprintfmt+0xb0>
    80200c6c:	f2843783          	ld	a5,-216(s0)
    80200c70:	00878713          	addi	a4,a5,8
    80200c74:	f2e43423          	sd	a4,-216(s0)
    80200c78:	0007b783          	ld	a5,0(a5)
    80200c7c:	0140006f          	j	80200c90 <vprintfmt+0xc0>
    80200c80:	f2843783          	ld	a5,-216(s0)
    80200c84:	00878713          	addi	a4,a5,8
    80200c88:	f2e43423          	sd	a4,-216(s0)
    80200c8c:	0007a783          	lw	a5,0(a5)
    80200c90:	f8f43c23          	sd	a5,-104(s0)

                    int hexdigits = 2 * (longarg ? sizeof(long) : sizeof(int)) - 1;
    80200c94:	fe842783          	lw	a5,-24(s0)
    80200c98:	0007879b          	sext.w	a5,a5
    80200c9c:	00078663          	beqz	a5,80200ca8 <vprintfmt+0xd8>
    80200ca0:	00f00793          	li	a5,15
    80200ca4:	0080006f          	j	80200cac <vprintfmt+0xdc>
    80200ca8:	00700793          	li	a5,7
    80200cac:	f8f42a23          	sw	a5,-108(s0)
                    for(int halfbyte = hexdigits; halfbyte >= 0; halfbyte--) {
    80200cb0:	f9442783          	lw	a5,-108(s0)
    80200cb4:	fcf42e23          	sw	a5,-36(s0)
    80200cb8:	0840006f          	j	80200d3c <vprintfmt+0x16c>
                        int hex = (num >> (4*halfbyte)) & 0xF;
    80200cbc:	fdc42783          	lw	a5,-36(s0)
    80200cc0:	0027979b          	slliw	a5,a5,0x2
    80200cc4:	0007879b          	sext.w	a5,a5
    80200cc8:	f9843703          	ld	a4,-104(s0)
    80200ccc:	40f757b3          	sra	a5,a4,a5
    80200cd0:	0007879b          	sext.w	a5,a5
    80200cd4:	00f7f793          	andi	a5,a5,15
    80200cd8:	f8f42823          	sw	a5,-112(s0)
                        char hexchar = (hex < 10 ? '0' + hex : 'a' + hex - 10);
    80200cdc:	f9042783          	lw	a5,-112(s0)
    80200ce0:	0007871b          	sext.w	a4,a5
    80200ce4:	00900793          	li	a5,9
    80200ce8:	00e7cc63          	blt	a5,a4,80200d00 <vprintfmt+0x130>
    80200cec:	f9042783          	lw	a5,-112(s0)
    80200cf0:	0ff7f793          	zext.b	a5,a5
    80200cf4:	0307879b          	addiw	a5,a5,48
    80200cf8:	0ff7f793          	zext.b	a5,a5
    80200cfc:	0140006f          	j	80200d10 <vprintfmt+0x140>
    80200d00:	f9042783          	lw	a5,-112(s0)
    80200d04:	0ff7f793          	zext.b	a5,a5
    80200d08:	0577879b          	addiw	a5,a5,87
    80200d0c:	0ff7f793          	zext.b	a5,a5
    80200d10:	f8f407a3          	sb	a5,-113(s0)
                        putch(hexchar);
    80200d14:	f8f44703          	lbu	a4,-113(s0)
    80200d18:	f3843783          	ld	a5,-200(s0)
    80200d1c:	00070513          	mv	a0,a4
    80200d20:	000780e7          	jalr	a5
                        pos++;
    80200d24:	fe043783          	ld	a5,-32(s0)
    80200d28:	00178793          	addi	a5,a5,1
    80200d2c:	fef43023          	sd	a5,-32(s0)
                    for(int halfbyte = hexdigits; halfbyte >= 0; halfbyte--) {
    80200d30:	fdc42783          	lw	a5,-36(s0)
    80200d34:	fff7879b          	addiw	a5,a5,-1
    80200d38:	fcf42e23          	sw	a5,-36(s0)
    80200d3c:	fdc42783          	lw	a5,-36(s0)
    80200d40:	0007879b          	sext.w	a5,a5
    80200d44:	f607dce3          	bgez	a5,80200cbc <vprintfmt+0xec>
                    }
                    longarg = 0; in_format = 0; 
    80200d48:	fe042423          	sw	zero,-24(s0)
    80200d4c:	fe042623          	sw	zero,-20(s0)
                    break;
    80200d50:	3280006f          	j	80201078 <vprintfmt+0x4a8>
                }
            
                case 'd': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
    80200d54:	fe842783          	lw	a5,-24(s0)
    80200d58:	0007879b          	sext.w	a5,a5
    80200d5c:	00078c63          	beqz	a5,80200d74 <vprintfmt+0x1a4>
    80200d60:	f2843783          	ld	a5,-216(s0)
    80200d64:	00878713          	addi	a4,a5,8
    80200d68:	f2e43423          	sd	a4,-216(s0)
    80200d6c:	0007b783          	ld	a5,0(a5)
    80200d70:	0140006f          	j	80200d84 <vprintfmt+0x1b4>
    80200d74:	f2843783          	ld	a5,-216(s0)
    80200d78:	00878713          	addi	a4,a5,8
    80200d7c:	f2e43423          	sd	a4,-216(s0)
    80200d80:	0007a783          	lw	a5,0(a5)
    80200d84:	fcf43823          	sd	a5,-48(s0)
                    if (num < 0) {
    80200d88:	fd043783          	ld	a5,-48(s0)
    80200d8c:	0207d463          	bgez	a5,80200db4 <vprintfmt+0x1e4>
                        num = -num; putch('-');
    80200d90:	fd043783          	ld	a5,-48(s0)
    80200d94:	40f007b3          	neg	a5,a5
    80200d98:	fcf43823          	sd	a5,-48(s0)
    80200d9c:	f3843783          	ld	a5,-200(s0)
    80200da0:	02d00513          	li	a0,45
    80200da4:	000780e7          	jalr	a5
                        pos++;
    80200da8:	fe043783          	ld	a5,-32(s0)
    80200dac:	00178793          	addi	a5,a5,1
    80200db0:	fef43023          	sd	a5,-32(s0)
                    }
                    int bits = 0;
    80200db4:	fc042623          	sw	zero,-52(s0)
                    char decchar[25] = {'0', 0};
    80200db8:	03000793          	li	a5,48
    80200dbc:	f6f43023          	sd	a5,-160(s0)
    80200dc0:	f6043423          	sd	zero,-152(s0)
    80200dc4:	f6043823          	sd	zero,-144(s0)
    80200dc8:	f6040c23          	sb	zero,-136(s0)
                    for (long tmp = num; tmp; bits++) {
    80200dcc:	fd043783          	ld	a5,-48(s0)
    80200dd0:	fcf43023          	sd	a5,-64(s0)
    80200dd4:	0480006f          	j	80200e1c <vprintfmt+0x24c>
                        decchar[bits] = (tmp % 10) + '0';
    80200dd8:	fc043703          	ld	a4,-64(s0)
    80200ddc:	00a00793          	li	a5,10
    80200de0:	02f767b3          	rem	a5,a4,a5
    80200de4:	0ff7f793          	zext.b	a5,a5
    80200de8:	0307879b          	addiw	a5,a5,48
    80200dec:	0ff7f713          	zext.b	a4,a5
    80200df0:	fcc42783          	lw	a5,-52(s0)
    80200df4:	ff078793          	addi	a5,a5,-16
    80200df8:	008787b3          	add	a5,a5,s0
    80200dfc:	f6e78823          	sb	a4,-144(a5)
                        tmp /= 10;
    80200e00:	fc043703          	ld	a4,-64(s0)
    80200e04:	00a00793          	li	a5,10
    80200e08:	02f747b3          	div	a5,a4,a5
    80200e0c:	fcf43023          	sd	a5,-64(s0)
                    for (long tmp = num; tmp; bits++) {
    80200e10:	fcc42783          	lw	a5,-52(s0)
    80200e14:	0017879b          	addiw	a5,a5,1
    80200e18:	fcf42623          	sw	a5,-52(s0)
    80200e1c:	fc043783          	ld	a5,-64(s0)
    80200e20:	fa079ce3          	bnez	a5,80200dd8 <vprintfmt+0x208>
                    }

                    for (int i = bits; i >= 0; i--) {
    80200e24:	fcc42783          	lw	a5,-52(s0)
    80200e28:	faf42e23          	sw	a5,-68(s0)
    80200e2c:	02c0006f          	j	80200e58 <vprintfmt+0x288>
                        putch(decchar[i]);
    80200e30:	fbc42783          	lw	a5,-68(s0)
    80200e34:	ff078793          	addi	a5,a5,-16
    80200e38:	008787b3          	add	a5,a5,s0
    80200e3c:	f707c703          	lbu	a4,-144(a5)
    80200e40:	f3843783          	ld	a5,-200(s0)
    80200e44:	00070513          	mv	a0,a4
    80200e48:	000780e7          	jalr	a5
                    for (int i = bits; i >= 0; i--) {
    80200e4c:	fbc42783          	lw	a5,-68(s0)
    80200e50:	fff7879b          	addiw	a5,a5,-1
    80200e54:	faf42e23          	sw	a5,-68(s0)
    80200e58:	fbc42783          	lw	a5,-68(s0)
    80200e5c:	0007879b          	sext.w	a5,a5
    80200e60:	fc07d8e3          	bgez	a5,80200e30 <vprintfmt+0x260>
                    }
                    pos += bits + 1;
    80200e64:	fcc42783          	lw	a5,-52(s0)
    80200e68:	0017879b          	addiw	a5,a5,1
    80200e6c:	0007879b          	sext.w	a5,a5
    80200e70:	00078713          	mv	a4,a5
    80200e74:	fe043783          	ld	a5,-32(s0)
    80200e78:	00e787b3          	add	a5,a5,a4
    80200e7c:	fef43023          	sd	a5,-32(s0)
                    longarg = 0; in_format = 0; 
    80200e80:	fe042423          	sw	zero,-24(s0)
    80200e84:	fe042623          	sw	zero,-20(s0)
                    break;
    80200e88:	1f00006f          	j	80201078 <vprintfmt+0x4a8>
                }

                case 'u': {
                    unsigned long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
    80200e8c:	fe842783          	lw	a5,-24(s0)
    80200e90:	0007879b          	sext.w	a5,a5
    80200e94:	00078c63          	beqz	a5,80200eac <vprintfmt+0x2dc>
    80200e98:	f2843783          	ld	a5,-216(s0)
    80200e9c:	00878713          	addi	a4,a5,8
    80200ea0:	f2e43423          	sd	a4,-216(s0)
    80200ea4:	0007b783          	ld	a5,0(a5)
    80200ea8:	0140006f          	j	80200ebc <vprintfmt+0x2ec>
    80200eac:	f2843783          	ld	a5,-216(s0)
    80200eb0:	00878713          	addi	a4,a5,8
    80200eb4:	f2e43423          	sd	a4,-216(s0)
    80200eb8:	0007a783          	lw	a5,0(a5)
    80200ebc:	f8f43023          	sd	a5,-128(s0)
                    int bits = 0;
    80200ec0:	fa042c23          	sw	zero,-72(s0)
                    char decchar[25] = {'0', 0};
    80200ec4:	03000793          	li	a5,48
    80200ec8:	f4f43023          	sd	a5,-192(s0)
    80200ecc:	f4043423          	sd	zero,-184(s0)
    80200ed0:	f4043823          	sd	zero,-176(s0)
    80200ed4:	f4040c23          	sb	zero,-168(s0)
                    for (long tmp = num; tmp; bits++) {
    80200ed8:	f8043783          	ld	a5,-128(s0)
    80200edc:	faf43823          	sd	a5,-80(s0)
    80200ee0:	0480006f          	j	80200f28 <vprintfmt+0x358>
                        decchar[bits] = (tmp % 10) + '0';
    80200ee4:	fb043703          	ld	a4,-80(s0)
    80200ee8:	00a00793          	li	a5,10
    80200eec:	02f767b3          	rem	a5,a4,a5
    80200ef0:	0ff7f793          	zext.b	a5,a5
    80200ef4:	0307879b          	addiw	a5,a5,48
    80200ef8:	0ff7f713          	zext.b	a4,a5
    80200efc:	fb842783          	lw	a5,-72(s0)
    80200f00:	ff078793          	addi	a5,a5,-16
    80200f04:	008787b3          	add	a5,a5,s0
    80200f08:	f4e78823          	sb	a4,-176(a5)
                        tmp /= 10;
    80200f0c:	fb043703          	ld	a4,-80(s0)
    80200f10:	00a00793          	li	a5,10
    80200f14:	02f747b3          	div	a5,a4,a5
    80200f18:	faf43823          	sd	a5,-80(s0)
                    for (long tmp = num; tmp; bits++) {
    80200f1c:	fb842783          	lw	a5,-72(s0)
    80200f20:	0017879b          	addiw	a5,a5,1
    80200f24:	faf42c23          	sw	a5,-72(s0)
    80200f28:	fb043783          	ld	a5,-80(s0)
    80200f2c:	fa079ce3          	bnez	a5,80200ee4 <vprintfmt+0x314>
                    }

                    for (int i = bits; i >= 0; i--) {
    80200f30:	fb842783          	lw	a5,-72(s0)
    80200f34:	faf42623          	sw	a5,-84(s0)
    80200f38:	02c0006f          	j	80200f64 <vprintfmt+0x394>
                        putch(decchar[i]);
    80200f3c:	fac42783          	lw	a5,-84(s0)
    80200f40:	ff078793          	addi	a5,a5,-16
    80200f44:	008787b3          	add	a5,a5,s0
    80200f48:	f507c703          	lbu	a4,-176(a5)
    80200f4c:	f3843783          	ld	a5,-200(s0)
    80200f50:	00070513          	mv	a0,a4
    80200f54:	000780e7          	jalr	a5
                    for (int i = bits; i >= 0; i--) {
    80200f58:	fac42783          	lw	a5,-84(s0)
    80200f5c:	fff7879b          	addiw	a5,a5,-1
    80200f60:	faf42623          	sw	a5,-84(s0)
    80200f64:	fac42783          	lw	a5,-84(s0)
    80200f68:	0007879b          	sext.w	a5,a5
    80200f6c:	fc07d8e3          	bgez	a5,80200f3c <vprintfmt+0x36c>
                    }
                    pos += bits + 1;
    80200f70:	fb842783          	lw	a5,-72(s0)
    80200f74:	0017879b          	addiw	a5,a5,1
    80200f78:	0007879b          	sext.w	a5,a5
    80200f7c:	00078713          	mv	a4,a5
    80200f80:	fe043783          	ld	a5,-32(s0)
    80200f84:	00e787b3          	add	a5,a5,a4
    80200f88:	fef43023          	sd	a5,-32(s0)
                    longarg = 0; in_format = 0; 
    80200f8c:	fe042423          	sw	zero,-24(s0)
    80200f90:	fe042623          	sw	zero,-20(s0)
                    break;
    80200f94:	0e40006f          	j	80201078 <vprintfmt+0x4a8>
                }

                case 's': {
                    const char* str = va_arg(vl, const char*);
    80200f98:	f2843783          	ld	a5,-216(s0)
    80200f9c:	00878713          	addi	a4,a5,8
    80200fa0:	f2e43423          	sd	a4,-216(s0)
    80200fa4:	0007b783          	ld	a5,0(a5)
    80200fa8:	faf43023          	sd	a5,-96(s0)
                    while (*str) {
    80200fac:	0300006f          	j	80200fdc <vprintfmt+0x40c>
                        putch(*str);
    80200fb0:	fa043783          	ld	a5,-96(s0)
    80200fb4:	0007c703          	lbu	a4,0(a5)
    80200fb8:	f3843783          	ld	a5,-200(s0)
    80200fbc:	00070513          	mv	a0,a4
    80200fc0:	000780e7          	jalr	a5
                        pos++; 
    80200fc4:	fe043783          	ld	a5,-32(s0)
    80200fc8:	00178793          	addi	a5,a5,1
    80200fcc:	fef43023          	sd	a5,-32(s0)
                        str++;
    80200fd0:	fa043783          	ld	a5,-96(s0)
    80200fd4:	00178793          	addi	a5,a5,1
    80200fd8:	faf43023          	sd	a5,-96(s0)
                    while (*str) {
    80200fdc:	fa043783          	ld	a5,-96(s0)
    80200fe0:	0007c783          	lbu	a5,0(a5)
    80200fe4:	fc0796e3          	bnez	a5,80200fb0 <vprintfmt+0x3e0>
                    }
                    longarg = 0; in_format = 0; 
    80200fe8:	fe042423          	sw	zero,-24(s0)
    80200fec:	fe042623          	sw	zero,-20(s0)
                    break;
    80200ff0:	0880006f          	j	80201078 <vprintfmt+0x4a8>
                }

                case 'c': {
                    char ch = (char)va_arg(vl,int);
    80200ff4:	f2843783          	ld	a5,-216(s0)
    80200ff8:	00878713          	addi	a4,a5,8
    80200ffc:	f2e43423          	sd	a4,-216(s0)
    80201000:	0007a783          	lw	a5,0(a5)
    80201004:	f6f40fa3          	sb	a5,-129(s0)
                    putch(ch);
    80201008:	f7f44703          	lbu	a4,-129(s0)
    8020100c:	f3843783          	ld	a5,-200(s0)
    80201010:	00070513          	mv	a0,a4
    80201014:	000780e7          	jalr	a5
                    pos++;
    80201018:	fe043783          	ld	a5,-32(s0)
    8020101c:	00178793          	addi	a5,a5,1
    80201020:	fef43023          	sd	a5,-32(s0)
                    longarg = 0; in_format = 0; 
    80201024:	fe042423          	sw	zero,-24(s0)
    80201028:	fe042623          	sw	zero,-20(s0)
                    break;
    8020102c:	04c0006f          	j	80201078 <vprintfmt+0x4a8>
                }
                default:
                    break;
            }
        }
        else if(*fmt == '%') {
    80201030:	f3043783          	ld	a5,-208(s0)
    80201034:	0007c783          	lbu	a5,0(a5)
    80201038:	00078713          	mv	a4,a5
    8020103c:	02500793          	li	a5,37
    80201040:	00f71863          	bne	a4,a5,80201050 <vprintfmt+0x480>
          in_format = 1;
    80201044:	00100793          	li	a5,1
    80201048:	fef42623          	sw	a5,-20(s0)
    8020104c:	02c0006f          	j	80201078 <vprintfmt+0x4a8>
        }
        else {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            putch(*fmt);
    80201050:	f3043783          	ld	a5,-208(s0)
    80201054:	0007c703          	lbu	a4,0(a5)
    80201058:	f3843783          	ld	a5,-200(s0)
    8020105c:	00070513          	mv	a0,a4
    80201060:	000780e7          	jalr	a5
            pos++;
    80201064:	fe043783          	ld	a5,-32(s0)
    80201068:	00178793          	addi	a5,a5,1
    8020106c:	fef43023          	sd	a5,-32(s0)
    80201070:	0080006f          	j	80201078 <vprintfmt+0x4a8>
                    break;
    80201074:	00000013          	nop
    for( ; *fmt; fmt++) {
    80201078:	f3043783          	ld	a5,-208(s0)
    8020107c:	00178793          	addi	a5,a5,1
    80201080:	f2f43823          	sd	a5,-208(s0)
    80201084:	f3043783          	ld	a5,-208(s0)
    80201088:	0007c783          	lbu	a5,0(a5)
    8020108c:	b60798e3          	bnez	a5,80200bfc <vprintfmt+0x2c>
        }
    }
    return pos;
    80201090:	fe043783          	ld	a5,-32(s0)
    80201094:	0007879b          	sext.w	a5,a5
}
    80201098:	00078513          	mv	a0,a5
    8020109c:	0d813083          	ld	ra,216(sp)
    802010a0:	0d013403          	ld	s0,208(sp)
    802010a4:	0e010113          	addi	sp,sp,224
    802010a8:	00008067          	ret

00000000802010ac <printk>:



int printk(const char* s, ...) {
    802010ac:	f9010113          	addi	sp,sp,-112
    802010b0:	02113423          	sd	ra,40(sp)
    802010b4:	02813023          	sd	s0,32(sp)
    802010b8:	03010413          	addi	s0,sp,48
    802010bc:	fca43c23          	sd	a0,-40(s0)
    802010c0:	00b43423          	sd	a1,8(s0)
    802010c4:	00c43823          	sd	a2,16(s0)
    802010c8:	00d43c23          	sd	a3,24(s0)
    802010cc:	02e43023          	sd	a4,32(s0)
    802010d0:	02f43423          	sd	a5,40(s0)
    802010d4:	03043823          	sd	a6,48(s0)
    802010d8:	03143c23          	sd	a7,56(s0)
    int res = 0;
    802010dc:	fe042623          	sw	zero,-20(s0)
    va_list vl;
    va_start(vl, s);
    802010e0:	04040793          	addi	a5,s0,64
    802010e4:	fcf43823          	sd	a5,-48(s0)
    802010e8:	fd043783          	ld	a5,-48(s0)
    802010ec:	fc878793          	addi	a5,a5,-56
    802010f0:	fef43023          	sd	a5,-32(s0)
    res = vprintfmt(putc, s, vl);
    802010f4:	fe043783          	ld	a5,-32(s0)
    802010f8:	00078613          	mv	a2,a5
    802010fc:	fd843583          	ld	a1,-40(s0)
    80201100:	00000517          	auipc	a0,0x0
    80201104:	a8050513          	addi	a0,a0,-1408 # 80200b80 <putc>
    80201108:	ac9ff0ef          	jal	ra,80200bd0 <vprintfmt>
    8020110c:	00050793          	mv	a5,a0
    80201110:	fef42623          	sw	a5,-20(s0)
    va_end(vl);
    return res;
    80201114:	fec42783          	lw	a5,-20(s0)
}
    80201118:	00078513          	mv	a0,a5
    8020111c:	02813083          	ld	ra,40(sp)
    80201120:	02013403          	ld	s0,32(sp)
    80201124:	07010113          	addi	sp,sp,112
    80201128:	00008067          	ret

000000008020112c <rand>:

int initialize = 0;
int r[1000];
int t = 0;

uint64 rand() {
    8020112c:	fe010113          	addi	sp,sp,-32
    80201130:	00813c23          	sd	s0,24(sp)
    80201134:	02010413          	addi	s0,sp,32
    int i;

    if (initialize == 0) {
    80201138:	00003797          	auipc	a5,0x3
    8020113c:	ee078793          	addi	a5,a5,-288 # 80204018 <initialize>
    80201140:	0007a783          	lw	a5,0(a5)
    80201144:	1e079463          	bnez	a5,8020132c <rand+0x200>
        r[0] = SEED;
    80201148:	00003797          	auipc	a5,0x3
    8020114c:	ef878793          	addi	a5,a5,-264 # 80204040 <r>
    80201150:	00d00713          	li	a4,13
    80201154:	00e7a023          	sw	a4,0(a5)
        for (i = 1; i < 31; i++) {
    80201158:	00100793          	li	a5,1
    8020115c:	fef42623          	sw	a5,-20(s0)
    80201160:	0c40006f          	j	80201224 <rand+0xf8>
            r[i] = (16807LL * r[i - 1]) % 2147483647;
    80201164:	fec42783          	lw	a5,-20(s0)
    80201168:	fff7879b          	addiw	a5,a5,-1
    8020116c:	0007879b          	sext.w	a5,a5
    80201170:	00003717          	auipc	a4,0x3
    80201174:	ed070713          	addi	a4,a4,-304 # 80204040 <r>
    80201178:	00279793          	slli	a5,a5,0x2
    8020117c:	00f707b3          	add	a5,a4,a5
    80201180:	0007a783          	lw	a5,0(a5)
    80201184:	00078713          	mv	a4,a5
    80201188:	000047b7          	lui	a5,0x4
    8020118c:	1a778793          	addi	a5,a5,423 # 41a7 <_start-0x801fbe59>
    80201190:	02f70733          	mul	a4,a4,a5
    80201194:	800007b7          	lui	a5,0x80000
    80201198:	fff7c793          	not	a5,a5
    8020119c:	02f767b3          	rem	a5,a4,a5
    802011a0:	0007871b          	sext.w	a4,a5
    802011a4:	00003697          	auipc	a3,0x3
    802011a8:	e9c68693          	addi	a3,a3,-356 # 80204040 <r>
    802011ac:	fec42783          	lw	a5,-20(s0)
    802011b0:	00279793          	slli	a5,a5,0x2
    802011b4:	00f687b3          	add	a5,a3,a5
    802011b8:	00e7a023          	sw	a4,0(a5) # ffffffff80000000 <_end+0xfffffffeffdfb000>
            if (r[i] < 0) {
    802011bc:	00003717          	auipc	a4,0x3
    802011c0:	e8470713          	addi	a4,a4,-380 # 80204040 <r>
    802011c4:	fec42783          	lw	a5,-20(s0)
    802011c8:	00279793          	slli	a5,a5,0x2
    802011cc:	00f707b3          	add	a5,a4,a5
    802011d0:	0007a783          	lw	a5,0(a5)
    802011d4:	0407d263          	bgez	a5,80201218 <rand+0xec>
                r[i] += 2147483647;
    802011d8:	00003717          	auipc	a4,0x3
    802011dc:	e6870713          	addi	a4,a4,-408 # 80204040 <r>
    802011e0:	fec42783          	lw	a5,-20(s0)
    802011e4:	00279793          	slli	a5,a5,0x2
    802011e8:	00f707b3          	add	a5,a4,a5
    802011ec:	0007a703          	lw	a4,0(a5)
    802011f0:	800007b7          	lui	a5,0x80000
    802011f4:	fff7c793          	not	a5,a5
    802011f8:	00f707bb          	addw	a5,a4,a5
    802011fc:	0007871b          	sext.w	a4,a5
    80201200:	00003697          	auipc	a3,0x3
    80201204:	e4068693          	addi	a3,a3,-448 # 80204040 <r>
    80201208:	fec42783          	lw	a5,-20(s0)
    8020120c:	00279793          	slli	a5,a5,0x2
    80201210:	00f687b3          	add	a5,a3,a5
    80201214:	00e7a023          	sw	a4,0(a5) # ffffffff80000000 <_end+0xfffffffeffdfb000>
        for (i = 1; i < 31; i++) {
    80201218:	fec42783          	lw	a5,-20(s0)
    8020121c:	0017879b          	addiw	a5,a5,1
    80201220:	fef42623          	sw	a5,-20(s0)
    80201224:	fec42783          	lw	a5,-20(s0)
    80201228:	0007871b          	sext.w	a4,a5
    8020122c:	01e00793          	li	a5,30
    80201230:	f2e7dae3          	bge	a5,a4,80201164 <rand+0x38>
            }
        }
        for (i = 31; i < 34; i++) {
    80201234:	01f00793          	li	a5,31
    80201238:	fef42623          	sw	a5,-20(s0)
    8020123c:	0480006f          	j	80201284 <rand+0x158>
            r[i] = r[i - 31];
    80201240:	fec42783          	lw	a5,-20(s0)
    80201244:	fe17879b          	addiw	a5,a5,-31
    80201248:	0007879b          	sext.w	a5,a5
    8020124c:	00003717          	auipc	a4,0x3
    80201250:	df470713          	addi	a4,a4,-524 # 80204040 <r>
    80201254:	00279793          	slli	a5,a5,0x2
    80201258:	00f707b3          	add	a5,a4,a5
    8020125c:	0007a703          	lw	a4,0(a5)
    80201260:	00003697          	auipc	a3,0x3
    80201264:	de068693          	addi	a3,a3,-544 # 80204040 <r>
    80201268:	fec42783          	lw	a5,-20(s0)
    8020126c:	00279793          	slli	a5,a5,0x2
    80201270:	00f687b3          	add	a5,a3,a5
    80201274:	00e7a023          	sw	a4,0(a5)
        for (i = 31; i < 34; i++) {
    80201278:	fec42783          	lw	a5,-20(s0)
    8020127c:	0017879b          	addiw	a5,a5,1
    80201280:	fef42623          	sw	a5,-20(s0)
    80201284:	fec42783          	lw	a5,-20(s0)
    80201288:	0007871b          	sext.w	a4,a5
    8020128c:	02100793          	li	a5,33
    80201290:	fae7d8e3          	bge	a5,a4,80201240 <rand+0x114>
        }
        for (i = 34; i < 344; i++) {
    80201294:	02200793          	li	a5,34
    80201298:	fef42623          	sw	a5,-20(s0)
    8020129c:	0700006f          	j	8020130c <rand+0x1e0>
            r[i] = r[i - 31] + r[i - 3];
    802012a0:	fec42783          	lw	a5,-20(s0)
    802012a4:	fe17879b          	addiw	a5,a5,-31
    802012a8:	0007879b          	sext.w	a5,a5
    802012ac:	00003717          	auipc	a4,0x3
    802012b0:	d9470713          	addi	a4,a4,-620 # 80204040 <r>
    802012b4:	00279793          	slli	a5,a5,0x2
    802012b8:	00f707b3          	add	a5,a4,a5
    802012bc:	0007a703          	lw	a4,0(a5)
    802012c0:	fec42783          	lw	a5,-20(s0)
    802012c4:	ffd7879b          	addiw	a5,a5,-3
    802012c8:	0007879b          	sext.w	a5,a5
    802012cc:	00003697          	auipc	a3,0x3
    802012d0:	d7468693          	addi	a3,a3,-652 # 80204040 <r>
    802012d4:	00279793          	slli	a5,a5,0x2
    802012d8:	00f687b3          	add	a5,a3,a5
    802012dc:	0007a783          	lw	a5,0(a5)
    802012e0:	00f707bb          	addw	a5,a4,a5
    802012e4:	0007871b          	sext.w	a4,a5
    802012e8:	00003697          	auipc	a3,0x3
    802012ec:	d5868693          	addi	a3,a3,-680 # 80204040 <r>
    802012f0:	fec42783          	lw	a5,-20(s0)
    802012f4:	00279793          	slli	a5,a5,0x2
    802012f8:	00f687b3          	add	a5,a3,a5
    802012fc:	00e7a023          	sw	a4,0(a5)
        for (i = 34; i < 344; i++) {
    80201300:	fec42783          	lw	a5,-20(s0)
    80201304:	0017879b          	addiw	a5,a5,1
    80201308:	fef42623          	sw	a5,-20(s0)
    8020130c:	fec42783          	lw	a5,-20(s0)
    80201310:	0007871b          	sext.w	a4,a5
    80201314:	15700793          	li	a5,343
    80201318:	f8e7d4e3          	bge	a5,a4,802012a0 <rand+0x174>
        }

		initialize = 1;
    8020131c:	00003797          	auipc	a5,0x3
    80201320:	cfc78793          	addi	a5,a5,-772 # 80204018 <initialize>
    80201324:	00100713          	li	a4,1
    80201328:	00e7a023          	sw	a4,0(a5)
    }

	t = t % 656;
    8020132c:	00003797          	auipc	a5,0x3
    80201330:	cf078793          	addi	a5,a5,-784 # 8020401c <t>
    80201334:	0007a783          	lw	a5,0(a5)
    80201338:	00078713          	mv	a4,a5
    8020133c:	29000793          	li	a5,656
    80201340:	02f767bb          	remw	a5,a4,a5
    80201344:	0007871b          	sext.w	a4,a5
    80201348:	00003797          	auipc	a5,0x3
    8020134c:	cd478793          	addi	a5,a5,-812 # 8020401c <t>
    80201350:	00e7a023          	sw	a4,0(a5)

    r[t + 344] = r[t + 344 - 31] + r[t + 344 - 3];
    80201354:	00003797          	auipc	a5,0x3
    80201358:	cc878793          	addi	a5,a5,-824 # 8020401c <t>
    8020135c:	0007a783          	lw	a5,0(a5)
    80201360:	1397879b          	addiw	a5,a5,313
    80201364:	0007879b          	sext.w	a5,a5
    80201368:	00003717          	auipc	a4,0x3
    8020136c:	cd870713          	addi	a4,a4,-808 # 80204040 <r>
    80201370:	00279793          	slli	a5,a5,0x2
    80201374:	00f707b3          	add	a5,a4,a5
    80201378:	0007a683          	lw	a3,0(a5)
    8020137c:	00003797          	auipc	a5,0x3
    80201380:	ca078793          	addi	a5,a5,-864 # 8020401c <t>
    80201384:	0007a783          	lw	a5,0(a5)
    80201388:	1557879b          	addiw	a5,a5,341
    8020138c:	0007879b          	sext.w	a5,a5
    80201390:	00003717          	auipc	a4,0x3
    80201394:	cb070713          	addi	a4,a4,-848 # 80204040 <r>
    80201398:	00279793          	slli	a5,a5,0x2
    8020139c:	00f707b3          	add	a5,a4,a5
    802013a0:	0007a703          	lw	a4,0(a5)
    802013a4:	00003797          	auipc	a5,0x3
    802013a8:	c7878793          	addi	a5,a5,-904 # 8020401c <t>
    802013ac:	0007a783          	lw	a5,0(a5)
    802013b0:	1587879b          	addiw	a5,a5,344
    802013b4:	0007879b          	sext.w	a5,a5
    802013b8:	00e6873b          	addw	a4,a3,a4
    802013bc:	0007071b          	sext.w	a4,a4
    802013c0:	00003697          	auipc	a3,0x3
    802013c4:	c8068693          	addi	a3,a3,-896 # 80204040 <r>
    802013c8:	00279793          	slli	a5,a5,0x2
    802013cc:	00f687b3          	add	a5,a3,a5
    802013d0:	00e7a023          	sw	a4,0(a5)
    
	t++;
    802013d4:	00003797          	auipc	a5,0x3
    802013d8:	c4878793          	addi	a5,a5,-952 # 8020401c <t>
    802013dc:	0007a783          	lw	a5,0(a5)
    802013e0:	0017879b          	addiw	a5,a5,1
    802013e4:	0007871b          	sext.w	a4,a5
    802013e8:	00003797          	auipc	a5,0x3
    802013ec:	c3478793          	addi	a5,a5,-972 # 8020401c <t>
    802013f0:	00e7a023          	sw	a4,0(a5)

    return (uint64)r[t - 1 + 344];
    802013f4:	00003797          	auipc	a5,0x3
    802013f8:	c2878793          	addi	a5,a5,-984 # 8020401c <t>
    802013fc:	0007a783          	lw	a5,0(a5)
    80201400:	1577879b          	addiw	a5,a5,343
    80201404:	0007879b          	sext.w	a5,a5
    80201408:	00003717          	auipc	a4,0x3
    8020140c:	c3870713          	addi	a4,a4,-968 # 80204040 <r>
    80201410:	00279793          	slli	a5,a5,0x2
    80201414:	00f707b3          	add	a5,a4,a5
    80201418:	0007a783          	lw	a5,0(a5)
}
    8020141c:	00078513          	mv	a0,a5
    80201420:	01813403          	ld	s0,24(sp)
    80201424:	02010113          	addi	sp,sp,32
    80201428:	00008067          	ret

000000008020142c <memset>:
#include "string.h"

void *memset(void *dst, int c, uint64 n) {
    8020142c:	fc010113          	addi	sp,sp,-64
    80201430:	02813c23          	sd	s0,56(sp)
    80201434:	04010413          	addi	s0,sp,64
    80201438:	fca43c23          	sd	a0,-40(s0)
    8020143c:	00058793          	mv	a5,a1
    80201440:	fcc43423          	sd	a2,-56(s0)
    80201444:	fcf42a23          	sw	a5,-44(s0)
    char *cdst = (char *)dst;
    80201448:	fd843783          	ld	a5,-40(s0)
    8020144c:	fef43023          	sd	a5,-32(s0)
    for (uint64 i = 0; i < n; ++i)
    80201450:	fe043423          	sd	zero,-24(s0)
    80201454:	0280006f          	j	8020147c <memset+0x50>
        cdst[i] = c;
    80201458:	fe043703          	ld	a4,-32(s0)
    8020145c:	fe843783          	ld	a5,-24(s0)
    80201460:	00f707b3          	add	a5,a4,a5
    80201464:	fd442703          	lw	a4,-44(s0)
    80201468:	0ff77713          	zext.b	a4,a4
    8020146c:	00e78023          	sb	a4,0(a5)
    for (uint64 i = 0; i < n; ++i)
    80201470:	fe843783          	ld	a5,-24(s0)
    80201474:	00178793          	addi	a5,a5,1
    80201478:	fef43423          	sd	a5,-24(s0)
    8020147c:	fe843703          	ld	a4,-24(s0)
    80201480:	fc843783          	ld	a5,-56(s0)
    80201484:	fcf76ae3          	bltu	a4,a5,80201458 <memset+0x2c>

    return dst;
    80201488:	fd843783          	ld	a5,-40(s0)
}
    8020148c:	00078513          	mv	a0,a5
    80201490:	03813403          	ld	s0,56(sp)
    80201494:	04010113          	addi	sp,sp,64
    80201498:	00008067          	ret
