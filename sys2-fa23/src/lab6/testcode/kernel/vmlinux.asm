
../../vmlinux:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_start>:
.extern start_kernel
.section .text.init
.globl _start
.globl _end
_start:
  la sp, stack_top
    80200000:	00005117          	auipc	sp,0x5
    80200004:	02010113          	addi	sp,sp,32 # 80205020 <task>
  call mm_init
    80200008:	39c000ef          	jal	ra,802003a4 <mm_init>
  call task_init
    8020000c:	3dc000ef          	jal	ra,802003e8 <task_init>
  la t0, _traps
    80200010:	00000297          	auipc	t0,0x0
    80200014:	05428293          	addi	t0,t0,84 # 80200064 <_traps>
  csrw stvec, t0
    80200018:	10529073          	csrw	stvec,t0
  csrr t0,sie
    8020001c:	104022f3          	csrr	t0,sie
  ori t0,t0,0x20
    80200020:	0202e293          	ori	t0,t0,32
  csrw sie,t0
    80200024:	10429073          	csrw	sie,t0
  lui t1, 0x2
    80200028:	00002337          	lui	t1,0x2
  addi t1, t1, 0x710
    8020002c:	71030313          	addi	t1,t1,1808 # 2710 <_start-0x801fd8f0>
  li a7, 0x00
    80200030:	00000893          	li	a7,0
  li a6, 0x0
    80200034:	00000813          	li	a6,0
  li a5, 0x0
    80200038:	00000793          	li	a5,0
  li a4, 0x0
    8020003c:	00000713          	li	a4,0
  li a3, 0x0
    80200040:	00000693          	li	a3,0
  li a2, 0x0
    80200044:	00000613          	li	a2,0
  li a1, 0x0
    80200048:	00000593          	li	a1,0
  mv a0, t1
    8020004c:	00030513          	mv	a0,t1
  ecall
    80200050:	00000073          	ecall
  csrr t0,sstatus
    80200054:	100022f3          	csrr	t0,sstatus
  ori t0,t0,0x2
    80200058:	0022e293          	ori	t0,t0,2
  csrw sstatus,t0
    8020005c:	10029073          	csrw	sstatus,t0
  jal ra, start_kernel
    80200060:	26d000ef          	jal	ra,80200acc <start_kernel>

0000000080200064 <_traps>:
    .align 2
    .globl _traps 
    .global __dummy
    .global __switch_to
_traps:
    addi sp,sp,-256
    80200064:	f0010113          	addi	sp,sp,-256
    sd ra,0(sp)
    80200068:	00113023          	sd	ra,0(sp)
    sd sp,8(sp)
    8020006c:	00213423          	sd	sp,8(sp)
    sd gp,16(sp)
    80200070:	00313823          	sd	gp,16(sp)
    sd tp,24(sp)
    80200074:	00413c23          	sd	tp,24(sp)
    sd t0,32(sp)
    80200078:	02513023          	sd	t0,32(sp)
    sd t1,40(sp)
    8020007c:	02613423          	sd	t1,40(sp)
    sd t2,48(sp)
    80200080:	02713823          	sd	t2,48(sp)
    sd fp,56(sp)
    80200084:	02813c23          	sd	s0,56(sp)
    sd s1,64(sp)
    80200088:	04913023          	sd	s1,64(sp)
    sd a0,72(sp)
    8020008c:	04a13423          	sd	a0,72(sp)
    sd a1,80(sp)
    80200090:	04b13823          	sd	a1,80(sp)
    sd a2,88(sp)
    80200094:	04c13c23          	sd	a2,88(sp)
    sd a3,96(sp)
    80200098:	06d13023          	sd	a3,96(sp)
    sd a4,104(sp)
    8020009c:	06e13423          	sd	a4,104(sp)
    sd a5,112(sp)
    802000a0:	06f13823          	sd	a5,112(sp)
    sd a6,120(sp)
    802000a4:	07013c23          	sd	a6,120(sp)
    sd a7,128(sp)
    802000a8:	09113023          	sd	a7,128(sp)
    sd s2,136(sp)
    802000ac:	09213423          	sd	s2,136(sp)
    sd s3,144(sp)
    802000b0:	09313823          	sd	s3,144(sp)
    sd s4,152(sp)
    802000b4:	09413c23          	sd	s4,152(sp)
    sd s5,160(sp)
    802000b8:	0b513023          	sd	s5,160(sp)
    sd s6,168(sp)
    802000bc:	0b613423          	sd	s6,168(sp)
    sd s7,176(sp)
    802000c0:	0b713823          	sd	s7,176(sp)
    sd s8,184(sp)
    802000c4:	0b813c23          	sd	s8,184(sp)
    sd s9,192(sp)
    802000c8:	0d913023          	sd	s9,192(sp)
    sd s10,200(sp)
    802000cc:	0da13423          	sd	s10,200(sp)
    sd s11,208(sp)
    802000d0:	0db13823          	sd	s11,208(sp)
    sd t3,216(sp)
    802000d4:	0dc13c23          	sd	t3,216(sp)
    sd t4,224(sp)
    802000d8:	0fd13023          	sd	t4,224(sp)
    sd t5,232(sp)
    802000dc:	0fe13423          	sd	t5,232(sp)
    sd t6,240(sp)
    802000e0:	0ff13823          	sd	t6,240(sp)

    csrr t0,sepc
    802000e4:	141022f3          	csrr	t0,sepc
    sd t0,248(sp)
    802000e8:	0e513c23          	sd	t0,248(sp)

    mv a1, t0
    802000ec:	00028593          	mv	a1,t0
    csrr a0,scause
    802000f0:	14202573          	csrr	a0,scause
    call trap_handler
    802000f4:	161000ef          	jal	ra,80200a54 <trap_handler>

    ld t0,248(sp)
    802000f8:	0f813283          	ld	t0,248(sp)
    csrw sepc,t0
    802000fc:	14129073          	csrw	sepc,t0
    ld ra,0(sp)
    80200100:	00013083          	ld	ra,0(sp)
    ld gp,16(sp)
    80200104:	01013183          	ld	gp,16(sp)
    ld tp,24(sp)
    80200108:	01813203          	ld	tp,24(sp)
    ld t0,32(sp)
    8020010c:	02013283          	ld	t0,32(sp)
    ld t1,40(sp)
    80200110:	02813303          	ld	t1,40(sp)
    ld t2,48(sp)
    80200114:	03013383          	ld	t2,48(sp)
    ld fp,56(sp)
    80200118:	03813403          	ld	s0,56(sp)
    ld s1,64(sp)
    8020011c:	04013483          	ld	s1,64(sp)
    ld a0,72(sp)
    80200120:	04813503          	ld	a0,72(sp)
    ld a1,80(sp)
    80200124:	05013583          	ld	a1,80(sp)
    ld a2,88(sp)
    80200128:	05813603          	ld	a2,88(sp)
    ld a3,96(sp)
    8020012c:	06013683          	ld	a3,96(sp)
    ld a4,104(sp)
    80200130:	06813703          	ld	a4,104(sp)
    ld a5,112(sp)
    80200134:	07013783          	ld	a5,112(sp)
    ld a6,120(sp)
    80200138:	07813803          	ld	a6,120(sp)
    ld a7,128(sp)
    8020013c:	08013883          	ld	a7,128(sp)
    ld s2,136(sp)
    80200140:	08813903          	ld	s2,136(sp)
    ld s3,144(sp)
    80200144:	09013983          	ld	s3,144(sp)
    ld s4,152(sp)
    80200148:	09813a03          	ld	s4,152(sp)
    ld s5,160(sp)
    8020014c:	0a013a83          	ld	s5,160(sp)
    ld s6,168(sp)
    80200150:	0a813b03          	ld	s6,168(sp)
    ld s7,176(sp)
    80200154:	0b013b83          	ld	s7,176(sp)
    ld s8,184(sp)
    80200158:	0b813c03          	ld	s8,184(sp)
    ld s9,192(sp)
    8020015c:	0c013c83          	ld	s9,192(sp)
    ld s10,200(sp)
    80200160:	0c813d03          	ld	s10,200(sp)
    ld s11,208(sp)
    80200164:	0d013d83          	ld	s11,208(sp)
    ld t3,216(sp)
    80200168:	0d813e03          	ld	t3,216(sp)
    ld t4,224(sp)
    8020016c:	0e013e83          	ld	t4,224(sp)
    ld t5,232(sp)
    80200170:	0e813f03          	ld	t5,232(sp)
    ld t6,240(sp)
    80200174:	0f013f83          	ld	t6,240(sp)
    ld sp,8(sp)
    80200178:	00813103          	ld	sp,8(sp)

    addi sp,sp,256
    8020017c:	10010113          	addi	sp,sp,256
    sret
    80200180:	10200073          	sret

0000000080200184 <__dummy>:
__dummy:
    la t0, dummy
    80200184:	00000297          	auipc	t0,0x0
    80200188:	73428293          	addi	t0,t0,1844 # 802008b8 <dummy>
    csrw sepc, t0
    8020018c:	14129073          	csrw	sepc,t0
    sret
    80200190:	10200073          	sret

0000000080200194 <__switch_to>:
__switch_to:
    sd ra,40(a0)
    80200194:	02153423          	sd	ra,40(a0)
    sd sp,48(a0)
    80200198:	02253823          	sd	sp,48(a0)
    sd s0,56(a0)
    8020019c:	02853c23          	sd	s0,56(a0)
    sd s1,64(a0)
    802001a0:	04953023          	sd	s1,64(a0)
    sd s2,72(a0)
    802001a4:	05253423          	sd	s2,72(a0)
    sd s3,80(a0)
    802001a8:	05353823          	sd	s3,80(a0)
    sd s4,88(a0)
    802001ac:	05453c23          	sd	s4,88(a0)
    sd s5,96(a0)
    802001b0:	07553023          	sd	s5,96(a0)
    sd s6,104(a0)
    802001b4:	07653423          	sd	s6,104(a0)
    sd s7,112(a0)
    802001b8:	07753823          	sd	s7,112(a0)
    sd s8,120(a0)
    802001bc:	07853c23          	sd	s8,120(a0)
    sd s9,128(a0)
    802001c0:	09953023          	sd	s9,128(a0)
    sd s10,136(a0)
    802001c4:	09a53423          	sd	s10,136(a0)
    sd s11,144(a0)
    802001c8:	09b53823          	sd	s11,144(a0)

    ld ra,40(a1)
    802001cc:	0285b083          	ld	ra,40(a1)
    ld sp,48(a1)
    802001d0:	0305b103          	ld	sp,48(a1)
    ld s0,56(a1)
    802001d4:	0385b403          	ld	s0,56(a1)
    ld s1,64(a1)
    802001d8:	0405b483          	ld	s1,64(a1)
    ld s2,72(a1)
    802001dc:	0485b903          	ld	s2,72(a1)
    ld s3,80(a1)
    802001e0:	0505b983          	ld	s3,80(a1)
    ld s4,88(a1)
    802001e4:	0585ba03          	ld	s4,88(a1)
    ld s5,96(a1)
    802001e8:	0605ba83          	ld	s5,96(a1)
    ld s6,104(a1)
    802001ec:	0685bb03          	ld	s6,104(a1)
    ld s7,112(a1)
    802001f0:	0705bb83          	ld	s7,112(a1)
    ld s8,120(a1)
    802001f4:	0785bc03          	ld	s8,120(a1)
    ld s9,128(a1)
    802001f8:	0805bc83          	ld	s9,128(a1)
    ld s10,136(a1)
    802001fc:	0885bd03          	ld	s10,136(a1)
    ld s11,144(a1)
    80200200:	0905bd83          	ld	s11,144(a1)

    ret
    80200204:	00008067          	ret

0000000080200208 <get_cycles>:
// clock.c


unsigned long TIMECLOCK = 0x100000;

unsigned long get_cycles() {
    80200208:	fe010113          	addi	sp,sp,-32
    8020020c:	00813c23          	sd	s0,24(sp)
    80200210:	02010413          	addi	s0,sp,32
    unsigned long ret;
    __asm__ volatile(
    80200214:	c01022f3          	rdtime	t0
    80200218:	00028793          	mv	a5,t0
    8020021c:	fef43423          	sd	a5,-24(s0)
        "rdtime t0\n"
        "mv %[ret],t0\n"
        : [ret] "=r" (ret)
        :: "memory"
    );
    return ret;
    80200220:	fe843783          	ld	a5,-24(s0)
}
    80200224:	00078513          	mv	a0,a5
    80200228:	01813403          	ld	s0,24(sp)
    8020022c:	02010113          	addi	sp,sp,32
    80200230:	00008067          	ret

0000000080200234 <clock_set_next_event>:

void clock_set_next_event() {
    80200234:	ff010113          	addi	sp,sp,-16
    80200238:	00113423          	sd	ra,8(sp)
    8020023c:	00813023          	sd	s0,0(sp)
    80200240:	01010413          	addi	s0,sp,16
    sbi_ecall(0,0,TIMECLOCK,0,0,0,0,0);
    80200244:	00003797          	auipc	a5,0x3
    80200248:	dbc78793          	addi	a5,a5,-580 # 80203000 <TIMECLOCK>
    8020024c:	0007b603          	ld	a2,0(a5)
    80200250:	00000893          	li	a7,0
    80200254:	00000813          	li	a6,0
    80200258:	00000793          	li	a5,0
    8020025c:	00000713          	li	a4,0
    80200260:	00000693          	li	a3,0
    80200264:	00000593          	li	a1,0
    80200268:	00000513          	li	a0,0
    8020026c:	748000ef          	jal	ra,802009b4 <sbi_ecall>
    80200270:	00000013          	nop
    80200274:	00813083          	ld	ra,8(sp)
    80200278:	00013403          	ld	s0,0(sp)
    8020027c:	01010113          	addi	sp,sp,16
    80200280:	00008067          	ret

0000000080200284 <kalloc>:

struct {
    struct run *freelist;
} kmem;

uint64 kalloc() {
    80200284:	fe010113          	addi	sp,sp,-32
    80200288:	00813c23          	sd	s0,24(sp)
    8020028c:	02010413          	addi	s0,sp,32
    struct run *r;

    r = kmem.freelist;
    80200290:	00004797          	auipc	a5,0x4
    80200294:	d7078793          	addi	a5,a5,-656 # 80204000 <kmem>
    80200298:	0007b783          	ld	a5,0(a5)
    8020029c:	fef43423          	sd	a5,-24(s0)
    kmem.freelist = r->next;
    802002a0:	fe843783          	ld	a5,-24(s0)
    802002a4:	0007b703          	ld	a4,0(a5)
    802002a8:	00004797          	auipc	a5,0x4
    802002ac:	d5878793          	addi	a5,a5,-680 # 80204000 <kmem>
    802002b0:	00e7b023          	sd	a4,0(a5)
    
    //memset((void *)r, 0x0, PGSIZE);
    return (uint64) r;
    802002b4:	fe843783          	ld	a5,-24(s0)
}
    802002b8:	00078513          	mv	a0,a5
    802002bc:	01813403          	ld	s0,24(sp)
    802002c0:	02010113          	addi	sp,sp,32
    802002c4:	00008067          	ret

00000000802002c8 <kfree>:

void kfree(uint64 addr) {
    802002c8:	fd010113          	addi	sp,sp,-48
    802002cc:	02813423          	sd	s0,40(sp)
    802002d0:	03010413          	addi	s0,sp,48
    802002d4:	fca43c23          	sd	a0,-40(s0)
    struct run *r;

    // PGSIZE align 
    addr = addr & ~(PGSIZE - 1);
    802002d8:	fd843703          	ld	a4,-40(s0)
    802002dc:	fffff7b7          	lui	a5,0xfffff
    802002e0:	00f777b3          	and	a5,a4,a5
    802002e4:	fcf43c23          	sd	a5,-40(s0)

    //memset((void *)addr, 0x0, (uint64)PGSIZE);

    r = (struct run *)addr;
    802002e8:	fd843783          	ld	a5,-40(s0)
    802002ec:	fef43423          	sd	a5,-24(s0)
    r->next = kmem.freelist;
    802002f0:	00004797          	auipc	a5,0x4
    802002f4:	d1078793          	addi	a5,a5,-752 # 80204000 <kmem>
    802002f8:	0007b703          	ld	a4,0(a5)
    802002fc:	fe843783          	ld	a5,-24(s0)
    80200300:	00e7b023          	sd	a4,0(a5)
    kmem.freelist = r;
    80200304:	00004797          	auipc	a5,0x4
    80200308:	cfc78793          	addi	a5,a5,-772 # 80204000 <kmem>
    8020030c:	fe843703          	ld	a4,-24(s0)
    80200310:	00e7b023          	sd	a4,0(a5)

    return ;
    80200314:	00000013          	nop
}
    80200318:	02813403          	ld	s0,40(sp)
    8020031c:	03010113          	addi	sp,sp,48
    80200320:	00008067          	ret

0000000080200324 <kfreerange>:

void kfreerange(char *start, char *end) {
    80200324:	fd010113          	addi	sp,sp,-48
    80200328:	02113423          	sd	ra,40(sp)
    8020032c:	02813023          	sd	s0,32(sp)
    80200330:	03010413          	addi	s0,sp,48
    80200334:	fca43c23          	sd	a0,-40(s0)
    80200338:	fcb43823          	sd	a1,-48(s0)
    char *addr = (char *)PGROUNDUP((uint64)start);
    8020033c:	fd843703          	ld	a4,-40(s0)
    80200340:	000017b7          	lui	a5,0x1
    80200344:	fff78793          	addi	a5,a5,-1 # fff <_start-0x801ff001>
    80200348:	00f70733          	add	a4,a4,a5
    8020034c:	fffff7b7          	lui	a5,0xfffff
    80200350:	00f777b3          	and	a5,a4,a5
    80200354:	fef43423          	sd	a5,-24(s0)
    for (; (uint64)(addr) + PGSIZE <= (uint64)end; addr += PGSIZE) {
    80200358:	0200006f          	j	80200378 <kfreerange+0x54>
        kfree((uint64)addr);
    8020035c:	fe843783          	ld	a5,-24(s0)
    80200360:	00078513          	mv	a0,a5
    80200364:	f65ff0ef          	jal	ra,802002c8 <kfree>
    for (; (uint64)(addr) + PGSIZE <= (uint64)end; addr += PGSIZE) {
    80200368:	fe843703          	ld	a4,-24(s0)
    8020036c:	000017b7          	lui	a5,0x1
    80200370:	00f707b3          	add	a5,a4,a5
    80200374:	fef43423          	sd	a5,-24(s0)
    80200378:	fe843703          	ld	a4,-24(s0)
    8020037c:	000017b7          	lui	a5,0x1
    80200380:	00f70733          	add	a4,a4,a5
    80200384:	fd043783          	ld	a5,-48(s0)
    80200388:	fce7fae3          	bgeu	a5,a4,8020035c <kfreerange+0x38>
    }
}
    8020038c:	00000013          	nop
    80200390:	00000013          	nop
    80200394:	02813083          	ld	ra,40(sp)
    80200398:	02013403          	ld	s0,32(sp)
    8020039c:	03010113          	addi	sp,sp,48
    802003a0:	00008067          	ret

00000000802003a4 <mm_init>:

void mm_init(void) {
    802003a4:	ff010113          	addi	sp,sp,-16
    802003a8:	00113423          	sd	ra,8(sp)
    802003ac:	00813023          	sd	s0,0(sp)
    802003b0:	01010413          	addi	s0,sp,16
    kfreerange(_end, (char *)PHY_END);
    802003b4:	080217b7          	lui	a5,0x8021
    802003b8:	00479593          	slli	a1,a5,0x4
    802003bc:	00006517          	auipc	a0,0x6
    802003c0:	c4450513          	addi	a0,a0,-956 # 80206000 <_end>
    802003c4:	f61ff0ef          	jal	ra,80200324 <kfreerange>
    printk("mm_init done\n");
    802003c8:	00002517          	auipc	a0,0x2
    802003cc:	c3850513          	addi	a0,a0,-968 # 80202000 <_srodata>
    802003d0:	669000ef          	jal	ra,80201238 <printk>
}
    802003d4:	00000013          	nop
    802003d8:	00813083          	ld	ra,8(sp)
    802003dc:	00013403          	ld	s0,0(sp)
    802003e0:	01010113          	addi	sp,sp,16
    802003e4:	00008067          	ret

00000000802003e8 <task_init>:
struct task_struct* idle;           // idle process
struct task_struct* current;        // 指向当前运行线程的 `task_struct`
struct task_struct* task[NR_TASKS]; // 线程数组，所有的线程都保存在此
extern void __switch_to(struct task_struct* prev, struct task_struct* next);

void task_init() {
    802003e8:	fe010113          	addi	sp,sp,-32
    802003ec:	00113c23          	sd	ra,24(sp)
    802003f0:	00813823          	sd	s0,16(sp)
    802003f4:	02010413          	addi	s0,sp,32
    // 3. 由于 idle 不参与调度 可以将其 counter / priority 设置为 0
    // 4. 设置 idle 的 pid 为 0
    // 5. 将 current 和 task[0] 指向 idle

    /* YOUR CODE HERE */
    idle=(struct task_struct*)kalloc();
    802003f8:	e8dff0ef          	jal	ra,80200284 <kalloc>
    802003fc:	00050793          	mv	a5,a0
    80200400:	00078713          	mv	a4,a5
    80200404:	00004797          	auipc	a5,0x4
    80200408:	c0478793          	addi	a5,a5,-1020 # 80204008 <idle>
    8020040c:	00e7b023          	sd	a4,0(a5)
    idle->state=TASK_RUNNING;
    80200410:	00004797          	auipc	a5,0x4
    80200414:	bf878793          	addi	a5,a5,-1032 # 80204008 <idle>
    80200418:	0007b783          	ld	a5,0(a5)
    8020041c:	0007b423          	sd	zero,8(a5)
    idle->counter=0;
    80200420:	00004797          	auipc	a5,0x4
    80200424:	be878793          	addi	a5,a5,-1048 # 80204008 <idle>
    80200428:	0007b783          	ld	a5,0(a5)
    8020042c:	0007b823          	sd	zero,16(a5)
    idle->priority=0;
    80200430:	00004797          	auipc	a5,0x4
    80200434:	bd878793          	addi	a5,a5,-1064 # 80204008 <idle>
    80200438:	0007b783          	ld	a5,0(a5)
    8020043c:	0007bc23          	sd	zero,24(a5)
    idle->pid=0;
    80200440:	00004797          	auipc	a5,0x4
    80200444:	bc878793          	addi	a5,a5,-1080 # 80204008 <idle>
    80200448:	0007b783          	ld	a5,0(a5)
    8020044c:	0207b023          	sd	zero,32(a5)
    current=idle;
    80200450:	00004797          	auipc	a5,0x4
    80200454:	bb878793          	addi	a5,a5,-1096 # 80204008 <idle>
    80200458:	0007b703          	ld	a4,0(a5)
    8020045c:	00004797          	auipc	a5,0x4
    80200460:	bb478793          	addi	a5,a5,-1100 # 80204010 <current>
    80200464:	00e7b023          	sd	a4,0(a5)
    task[0]=idle;
    80200468:	00004797          	auipc	a5,0x4
    8020046c:	ba078793          	addi	a5,a5,-1120 # 80204008 <idle>
    80200470:	0007b703          	ld	a4,0(a5)
    80200474:	00005797          	auipc	a5,0x5
    80200478:	bac78793          	addi	a5,a5,-1108 # 80205020 <task>
    8020047c:	00e7b023          	sd	a4,0(a5)
    // 3. 为 task[1] ~ task[NR_TASKS - 1] 设置 `thread_struct` 中的 `ra` 和 `sp`, 
    // 4. 其中 `ra` 设置为 __dummy （见 4.3.2）的地址， `sp` 设置为 该线程申请的物理页的高地址

    /* YOUR CODE HERE */
    int i;
    for(i=1;i<NR_TASKS;i++){
    80200480:	00100793          	li	a5,1
    80200484:	fef42623          	sw	a5,-20(s0)
    80200488:	1300006f          	j	802005b8 <task_init+0x1d0>
        task[i]=(struct task_struct*)kalloc();
    8020048c:	df9ff0ef          	jal	ra,80200284 <kalloc>
    80200490:	00050793          	mv	a5,a0
    80200494:	00078693          	mv	a3,a5
    80200498:	00005717          	auipc	a4,0x5
    8020049c:	b8870713          	addi	a4,a4,-1144 # 80205020 <task>
    802004a0:	fec42783          	lw	a5,-20(s0)
    802004a4:	00379793          	slli	a5,a5,0x3
    802004a8:	00f707b3          	add	a5,a4,a5
    802004ac:	00d7b023          	sd	a3,0(a5)
        task[i]->state=TASK_RUNNING;
    802004b0:	00005717          	auipc	a4,0x5
    802004b4:	b7070713          	addi	a4,a4,-1168 # 80205020 <task>
    802004b8:	fec42783          	lw	a5,-20(s0)
    802004bc:	00379793          	slli	a5,a5,0x3
    802004c0:	00f707b3          	add	a5,a4,a5
    802004c4:	0007b783          	ld	a5,0(a5)
    802004c8:	0007b423          	sd	zero,8(a5)
        task[i]->counter=0;
    802004cc:	00005717          	auipc	a4,0x5
    802004d0:	b5470713          	addi	a4,a4,-1196 # 80205020 <task>
    802004d4:	fec42783          	lw	a5,-20(s0)
    802004d8:	00379793          	slli	a5,a5,0x3
    802004dc:	00f707b3          	add	a5,a4,a5
    802004e0:	0007b783          	ld	a5,0(a5)
    802004e4:	0007b823          	sd	zero,16(a5)
        task[i]->priority=int_mod(rand(),5)+PRIORITY_MIN;
    802004e8:	5d1000ef          	jal	ra,802012b8 <rand>
    802004ec:	00050793          	mv	a5,a0
    802004f0:	00500593          	li	a1,5
    802004f4:	00078513          	mv	a0,a5
    802004f8:	610000ef          	jal	ra,80200b08 <int_mod>
    802004fc:	00050793          	mv	a5,a0
    80200500:	0017879b          	addiw	a5,a5,1
    80200504:	0007869b          	sext.w	a3,a5
    80200508:	00005717          	auipc	a4,0x5
    8020050c:	b1870713          	addi	a4,a4,-1256 # 80205020 <task>
    80200510:	fec42783          	lw	a5,-20(s0)
    80200514:	00379793          	slli	a5,a5,0x3
    80200518:	00f707b3          	add	a5,a4,a5
    8020051c:	0007b783          	ld	a5,0(a5)
    80200520:	00068713          	mv	a4,a3
    80200524:	00e7bc23          	sd	a4,24(a5)
        task[i]->pid=i;
    80200528:	00005717          	auipc	a4,0x5
    8020052c:	af870713          	addi	a4,a4,-1288 # 80205020 <task>
    80200530:	fec42783          	lw	a5,-20(s0)
    80200534:	00379793          	slli	a5,a5,0x3
    80200538:	00f707b3          	add	a5,a4,a5
    8020053c:	0007b783          	ld	a5,0(a5)
    80200540:	fec42703          	lw	a4,-20(s0)
    80200544:	02e7b023          	sd	a4,32(a5)
        task[i]->thread.ra=(uint64)__dummy;
    80200548:	00005717          	auipc	a4,0x5
    8020054c:	ad870713          	addi	a4,a4,-1320 # 80205020 <task>
    80200550:	fec42783          	lw	a5,-20(s0)
    80200554:	00379793          	slli	a5,a5,0x3
    80200558:	00f707b3          	add	a5,a4,a5
    8020055c:	0007b783          	ld	a5,0(a5)
    80200560:	00000717          	auipc	a4,0x0
    80200564:	c2470713          	addi	a4,a4,-988 # 80200184 <__dummy>
    80200568:	02e7b423          	sd	a4,40(a5)
        task[i]->thread.sp=(uint64)task[i]+PGSIZE;
    8020056c:	00005717          	auipc	a4,0x5
    80200570:	ab470713          	addi	a4,a4,-1356 # 80205020 <task>
    80200574:	fec42783          	lw	a5,-20(s0)
    80200578:	00379793          	slli	a5,a5,0x3
    8020057c:	00f707b3          	add	a5,a4,a5
    80200580:	0007b783          	ld	a5,0(a5)
    80200584:	00078693          	mv	a3,a5
    80200588:	00005717          	auipc	a4,0x5
    8020058c:	a9870713          	addi	a4,a4,-1384 # 80205020 <task>
    80200590:	fec42783          	lw	a5,-20(s0)
    80200594:	00379793          	slli	a5,a5,0x3
    80200598:	00f707b3          	add	a5,a4,a5
    8020059c:	0007b783          	ld	a5,0(a5)
    802005a0:	00001737          	lui	a4,0x1
    802005a4:	00e68733          	add	a4,a3,a4
    802005a8:	02e7b823          	sd	a4,48(a5)
    for(i=1;i<NR_TASKS;i++){
    802005ac:	fec42783          	lw	a5,-20(s0)
    802005b0:	0017879b          	addiw	a5,a5,1
    802005b4:	fef42623          	sw	a5,-20(s0)
    802005b8:	fec42783          	lw	a5,-20(s0)
    802005bc:	0007871b          	sext.w	a4,a5
    802005c0:	00300793          	li	a5,3
    802005c4:	ece7d4e3          	bge	a5,a4,8020048c <task_init+0xa4>
    }
    printk("proc_init done!\n");
    802005c8:	00002517          	auipc	a0,0x2
    802005cc:	a4850513          	addi	a0,a0,-1464 # 80202010 <_srodata+0x10>
    802005d0:	469000ef          	jal	ra,80201238 <printk>
}
    802005d4:	00000013          	nop
    802005d8:	01813083          	ld	ra,24(sp)
    802005dc:	01013403          	ld	s0,16(sp)
    802005e0:	02010113          	addi	sp,sp,32
    802005e4:	00008067          	ret

00000000802005e8 <switch_to>:

void switch_to(struct task_struct* next) {
    802005e8:	fd010113          	addi	sp,sp,-48
    802005ec:	02113423          	sd	ra,40(sp)
    802005f0:	02813023          	sd	s0,32(sp)
    802005f4:	03010413          	addi	s0,sp,48
    802005f8:	fca43c23          	sd	a0,-40(s0)
    /* YOUR CODE HERE */
    if(next!=current){
    802005fc:	00004797          	auipc	a5,0x4
    80200600:	a1478793          	addi	a5,a5,-1516 # 80204010 <current>
    80200604:	0007b783          	ld	a5,0(a5)
    80200608:	fd843703          	ld	a4,-40(s0)
    8020060c:	04f70a63          	beq	a4,a5,80200660 <switch_to+0x78>
        printk("switchtoPID%d:%d \n",next->pid,next->counter);
    80200610:	fd843783          	ld	a5,-40(s0)
    80200614:	0207b703          	ld	a4,32(a5)
    80200618:	fd843783          	ld	a5,-40(s0)
    8020061c:	0107b783          	ld	a5,16(a5)
    80200620:	00078613          	mv	a2,a5
    80200624:	00070593          	mv	a1,a4
    80200628:	00002517          	auipc	a0,0x2
    8020062c:	a0050513          	addi	a0,a0,-1536 # 80202028 <_srodata+0x28>
    80200630:	409000ef          	jal	ra,80201238 <printk>
        struct task_struct* pre=current;
    80200634:	00004797          	auipc	a5,0x4
    80200638:	9dc78793          	addi	a5,a5,-1572 # 80204010 <current>
    8020063c:	0007b783          	ld	a5,0(a5)
    80200640:	fef43423          	sd	a5,-24(s0)
        current=next;
    80200644:	00004797          	auipc	a5,0x4
    80200648:	9cc78793          	addi	a5,a5,-1588 # 80204010 <current>
    8020064c:	fd843703          	ld	a4,-40(s0)
    80200650:	00e7b023          	sd	a4,0(a5)
        __switch_to(pre,next);
    80200654:	fd843583          	ld	a1,-40(s0)
    80200658:	fe843503          	ld	a0,-24(s0)
    8020065c:	b39ff0ef          	jal	ra,80200194 <__switch_to>
    }
}
    80200660:	00000013          	nop
    80200664:	02813083          	ld	ra,40(sp)
    80200668:	02013403          	ld	s0,32(sp)
    8020066c:	03010113          	addi	sp,sp,48
    80200670:	00008067          	ret

0000000080200674 <do_timer>:

void do_timer(void) {
    80200674:	ff010113          	addi	sp,sp,-16
    80200678:	00113423          	sd	ra,8(sp)
    8020067c:	00813023          	sd	s0,0(sp)
    80200680:	01010413          	addi	s0,sp,16
    /* 1. 将当前进程的counter--，如果结果大于零则直接返回*/
    /* 2. 否则进行进程调度 */
    if(current->counter==0||current==idle){
    80200684:	00004797          	auipc	a5,0x4
    80200688:	98c78793          	addi	a5,a5,-1652 # 80204010 <current>
    8020068c:	0007b783          	ld	a5,0(a5)
    80200690:	0107b783          	ld	a5,16(a5)
    80200694:	02078063          	beqz	a5,802006b4 <do_timer+0x40>
    80200698:	00004797          	auipc	a5,0x4
    8020069c:	97878793          	addi	a5,a5,-1672 # 80204010 <current>
    802006a0:	0007b703          	ld	a4,0(a5)
    802006a4:	00004797          	auipc	a5,0x4
    802006a8:	96478793          	addi	a5,a5,-1692 # 80204008 <idle>
    802006ac:	0007b783          	ld	a5,0(a5)
    802006b0:	00f71663          	bne	a4,a5,802006bc <do_timer+0x48>
        schedule();
    802006b4:	04c000ef          	jal	ra,80200700 <schedule>
    }else{
        current->counter--;
        if(current->counter==0)
            schedule();
    }
}
    802006b8:	0340006f          	j	802006ec <do_timer+0x78>
        current->counter--;
    802006bc:	00004797          	auipc	a5,0x4
    802006c0:	95478793          	addi	a5,a5,-1708 # 80204010 <current>
    802006c4:	0007b783          	ld	a5,0(a5)
    802006c8:	0107b703          	ld	a4,16(a5)
    802006cc:	fff70713          	addi	a4,a4,-1 # fff <_start-0x801ff001>
    802006d0:	00e7b823          	sd	a4,16(a5)
        if(current->counter==0)
    802006d4:	00004797          	auipc	a5,0x4
    802006d8:	93c78793          	addi	a5,a5,-1732 # 80204010 <current>
    802006dc:	0007b783          	ld	a5,0(a5)
    802006e0:	0107b783          	ld	a5,16(a5)
    802006e4:	00079463          	bnez	a5,802006ec <do_timer+0x78>
            schedule();
    802006e8:	018000ef          	jal	ra,80200700 <schedule>
}
    802006ec:	00000013          	nop
    802006f0:	00813083          	ld	ra,8(sp)
    802006f4:	00013403          	ld	s0,0(sp)
    802006f8:	01010113          	addi	sp,sp,16
    802006fc:	00008067          	ret

0000000080200700 <schedule>:

void schedule(void) {
    80200700:	fe010113          	addi	sp,sp,-32
    80200704:	00113c23          	sd	ra,24(sp)
    80200708:	00813823          	sd	s0,16(sp)
    8020070c:	02010413          	addi	s0,sp,32
    /* YOUR CODE HERE */
    int i;
    int min=32657;
    80200710:	000087b7          	lui	a5,0x8
    80200714:	f9178793          	addi	a5,a5,-111 # 7f91 <_start-0x801f806f>
    80200718:	fef42423          	sw	a5,-24(s0)
    struct task_struct* next=idle;
    8020071c:	00004797          	auipc	a5,0x4
    80200720:	8ec78793          	addi	a5,a5,-1812 # 80204008 <idle>
    80200724:	0007b783          	ld	a5,0(a5)
    80200728:	fef43023          	sd	a5,-32(s0)
    while(1){
        for(i=1;i<NR_TASKS;i++){
    8020072c:	00100793          	li	a5,1
    80200730:	fef42623          	sw	a5,-20(s0)
    80200734:	0900006f          	j	802007c4 <schedule+0xc4>
            if(task[i]->counter!=0&&task[i]->counter<min){
    80200738:	00005717          	auipc	a4,0x5
    8020073c:	8e870713          	addi	a4,a4,-1816 # 80205020 <task>
    80200740:	fec42783          	lw	a5,-20(s0)
    80200744:	00379793          	slli	a5,a5,0x3
    80200748:	00f707b3          	add	a5,a4,a5
    8020074c:	0007b783          	ld	a5,0(a5)
    80200750:	0107b783          	ld	a5,16(a5)
    80200754:	06078263          	beqz	a5,802007b8 <schedule+0xb8>
    80200758:	00005717          	auipc	a4,0x5
    8020075c:	8c870713          	addi	a4,a4,-1848 # 80205020 <task>
    80200760:	fec42783          	lw	a5,-20(s0)
    80200764:	00379793          	slli	a5,a5,0x3
    80200768:	00f707b3          	add	a5,a4,a5
    8020076c:	0007b783          	ld	a5,0(a5)
    80200770:	0107b703          	ld	a4,16(a5)
    80200774:	fe842783          	lw	a5,-24(s0)
    80200778:	04f77063          	bgeu	a4,a5,802007b8 <schedule+0xb8>
                min=task[i]->counter;
    8020077c:	00005717          	auipc	a4,0x5
    80200780:	8a470713          	addi	a4,a4,-1884 # 80205020 <task>
    80200784:	fec42783          	lw	a5,-20(s0)
    80200788:	00379793          	slli	a5,a5,0x3
    8020078c:	00f707b3          	add	a5,a4,a5
    80200790:	0007b783          	ld	a5,0(a5)
    80200794:	0107b783          	ld	a5,16(a5)
    80200798:	fef42423          	sw	a5,-24(s0)
                next=task[i];
    8020079c:	00005717          	auipc	a4,0x5
    802007a0:	88470713          	addi	a4,a4,-1916 # 80205020 <task>
    802007a4:	fec42783          	lw	a5,-20(s0)
    802007a8:	00379793          	slli	a5,a5,0x3
    802007ac:	00f707b3          	add	a5,a4,a5
    802007b0:	0007b783          	ld	a5,0(a5)
    802007b4:	fef43023          	sd	a5,-32(s0)
        for(i=1;i<NR_TASKS;i++){
    802007b8:	fec42783          	lw	a5,-20(s0)
    802007bc:	0017879b          	addiw	a5,a5,1
    802007c0:	fef42623          	sw	a5,-20(s0)
    802007c4:	fec42783          	lw	a5,-20(s0)
    802007c8:	0007871b          	sext.w	a4,a5
    802007cc:	00300793          	li	a5,3
    802007d0:	f6e7d4e3          	bge	a5,a4,80200738 <schedule+0x38>
            }
        }
        if(next!=idle)
    802007d4:	00004797          	auipc	a5,0x4
    802007d8:	83478793          	addi	a5,a5,-1996 # 80204008 <idle>
    802007dc:	0007b783          	ld	a5,0(a5)
    802007e0:	fe043703          	ld	a4,-32(s0)
    802007e4:	0af71a63          	bne	a4,a5,80200898 <schedule+0x198>
            break;
        for(i=1;i<NR_TASKS;i++){
    802007e8:	00100793          	li	a5,1
    802007ec:	fef42623          	sw	a5,-20(s0)
    802007f0:	0940006f          	j	80200884 <schedule+0x184>
            task[i]->counter=task[i]->priority;
    802007f4:	00005717          	auipc	a4,0x5
    802007f8:	82c70713          	addi	a4,a4,-2004 # 80205020 <task>
    802007fc:	fec42783          	lw	a5,-20(s0)
    80200800:	00379793          	slli	a5,a5,0x3
    80200804:	00f707b3          	add	a5,a4,a5
    80200808:	0007b703          	ld	a4,0(a5)
    8020080c:	00005697          	auipc	a3,0x5
    80200810:	81468693          	addi	a3,a3,-2028 # 80205020 <task>
    80200814:	fec42783          	lw	a5,-20(s0)
    80200818:	00379793          	slli	a5,a5,0x3
    8020081c:	00f687b3          	add	a5,a3,a5
    80200820:	0007b783          	ld	a5,0(a5)
    80200824:	01873703          	ld	a4,24(a4)
    80200828:	00e7b823          	sd	a4,16(a5)
            printk("SETPID%d:%d \n", task[i]->pid, task[i]->counter);
    8020082c:	00004717          	auipc	a4,0x4
    80200830:	7f470713          	addi	a4,a4,2036 # 80205020 <task>
    80200834:	fec42783          	lw	a5,-20(s0)
    80200838:	00379793          	slli	a5,a5,0x3
    8020083c:	00f707b3          	add	a5,a4,a5
    80200840:	0007b783          	ld	a5,0(a5)
    80200844:	0207b683          	ld	a3,32(a5)
    80200848:	00004717          	auipc	a4,0x4
    8020084c:	7d870713          	addi	a4,a4,2008 # 80205020 <task>
    80200850:	fec42783          	lw	a5,-20(s0)
    80200854:	00379793          	slli	a5,a5,0x3
    80200858:	00f707b3          	add	a5,a4,a5
    8020085c:	0007b783          	ld	a5,0(a5)
    80200860:	0107b783          	ld	a5,16(a5)
    80200864:	00078613          	mv	a2,a5
    80200868:	00068593          	mv	a1,a3
    8020086c:	00001517          	auipc	a0,0x1
    80200870:	7d450513          	addi	a0,a0,2004 # 80202040 <_srodata+0x40>
    80200874:	1c5000ef          	jal	ra,80201238 <printk>
        for(i=1;i<NR_TASKS;i++){
    80200878:	fec42783          	lw	a5,-20(s0)
    8020087c:	0017879b          	addiw	a5,a5,1
    80200880:	fef42623          	sw	a5,-20(s0)
    80200884:	fec42783          	lw	a5,-20(s0)
    80200888:	0007871b          	sext.w	a4,a5
    8020088c:	00300793          	li	a5,3
    80200890:	f6e7d2e3          	bge	a5,a4,802007f4 <schedule+0xf4>
        for(i=1;i<NR_TASKS;i++){
    80200894:	e99ff06f          	j	8020072c <schedule+0x2c>
            break;
    80200898:	00000013          	nop
        }
    }
    switch_to(next);
    8020089c:	fe043503          	ld	a0,-32(s0)
    802008a0:	d49ff0ef          	jal	ra,802005e8 <switch_to>
}
    802008a4:	00000013          	nop
    802008a8:	01813083          	ld	ra,24(sp)
    802008ac:	01013403          	ld	s0,16(sp)
    802008b0:	02010113          	addi	sp,sp,32
    802008b4:	00008067          	ret

00000000802008b8 <dummy>:

void dummy() {
    802008b8:	fd010113          	addi	sp,sp,-48
    802008bc:	02113423          	sd	ra,40(sp)
    802008c0:	02813023          	sd	s0,32(sp)
    802008c4:	03010413          	addi	s0,sp,48
uint64 MOD = 1000000007;
    802008c8:	3b9ad7b7          	lui	a5,0x3b9ad
    802008cc:	a0778793          	addi	a5,a5,-1529 # 3b9aca07 <_start-0x448535f9>
    802008d0:	fcf43c23          	sd	a5,-40(s0)
uint64 auto_inc_local_var = 0;
    802008d4:	fe043423          	sd	zero,-24(s0)
int last_counter = -1; // 记录上一个counter
    802008d8:	fff00793          	li	a5,-1
    802008dc:	fef42223          	sw	a5,-28(s0)
int last_last_counter = -1; // 记录上上个counter
    802008e0:	fff00793          	li	a5,-1
    802008e4:	fef42023          	sw	a5,-32(s0)
while(1) {
    if (last_counter == -1 || current->counter != last_counter) {
    802008e8:	fe442783          	lw	a5,-28(s0)
    802008ec:	0007871b          	sext.w	a4,a5
    802008f0:	fff00793          	li	a5,-1
    802008f4:	00f70e63          	beq	a4,a5,80200910 <dummy+0x58>
    802008f8:	00003797          	auipc	a5,0x3
    802008fc:	71878793          	addi	a5,a5,1816 # 80204010 <current>
    80200900:	0007b783          	ld	a5,0(a5)
    80200904:	0107b703          	ld	a4,16(a5)
    80200908:	fe442783          	lw	a5,-28(s0)
    8020090c:	06f70263          	beq	a4,a5,80200970 <dummy+0xb8>
        last_last_counter = last_counter;
    80200910:	fe442783          	lw	a5,-28(s0)
    80200914:	fef42023          	sw	a5,-32(s0)
        last_counter = current->counter;
    80200918:	00003797          	auipc	a5,0x3
    8020091c:	6f878793          	addi	a5,a5,1784 # 80204010 <current>
    80200920:	0007b783          	ld	a5,0(a5)
    80200924:	0107b783          	ld	a5,16(a5)
    80200928:	fef42223          	sw	a5,-28(s0)
        auto_inc_local_var = int_mod((auto_inc_local_var + 1), MOD);
    8020092c:	fe843783          	ld	a5,-24(s0)
    80200930:	00178793          	addi	a5,a5,1
    80200934:	fd843583          	ld	a1,-40(s0)
    80200938:	00078513          	mv	a0,a5
    8020093c:	1cc000ef          	jal	ra,80200b08 <int_mod>
    80200940:	00050793          	mv	a5,a0
    80200944:	fef43423          	sd	a5,-24(s0)
        printk("PID%d:%d \n", current->pid, auto_inc_local_var); 
    80200948:	00003797          	auipc	a5,0x3
    8020094c:	6c878793          	addi	a5,a5,1736 # 80204010 <current>
    80200950:	0007b783          	ld	a5,0(a5)
    80200954:	0207b783          	ld	a5,32(a5)
    80200958:	fe843603          	ld	a2,-24(s0)
    8020095c:	00078593          	mv	a1,a5
    80200960:	00001517          	auipc	a0,0x1
    80200964:	6f050513          	addi	a0,a0,1776 # 80202050 <_srodata+0x50>
    80200968:	0d1000ef          	jal	ra,80201238 <printk>
    if (last_counter == -1 || current->counter != last_counter) {
    8020096c:	0440006f          	j	802009b0 <dummy+0xf8>
    } else if((last_last_counter == 0 || last_last_counter == -1) && last_counter == 1) { // counter恒为1的情况
    80200970:	fe042783          	lw	a5,-32(s0)
    80200974:	0007879b          	sext.w	a5,a5
    80200978:	00078a63          	beqz	a5,8020098c <dummy+0xd4>
    8020097c:	fe042783          	lw	a5,-32(s0)
    80200980:	0007871b          	sext.w	a4,a5
    80200984:	fff00793          	li	a5,-1
    80200988:	f6f710e3          	bne	a4,a5,802008e8 <dummy+0x30>
    8020098c:	fe442783          	lw	a5,-28(s0)
    80200990:	0007871b          	sext.w	a4,a5
    80200994:	00100793          	li	a5,1
    80200998:	f4f718e3          	bne	a4,a5,802008e8 <dummy+0x30>
        // 这里比较 tricky，不要求理解。
        last_counter = 0; 
    8020099c:	fe042223          	sw	zero,-28(s0)
        current->counter = 0;
    802009a0:	00003797          	auipc	a5,0x3
    802009a4:	67078793          	addi	a5,a5,1648 # 80204010 <current>
    802009a8:	0007b783          	ld	a5,0(a5)
    802009ac:	0007b823          	sd	zero,16(a5)
    if (last_counter == -1 || current->counter != last_counter) {
    802009b0:	f39ff06f          	j	802008e8 <dummy+0x30>

00000000802009b4 <sbi_ecall>:

struct sbiret sbi_ecall(int ext, int fid, uint64 arg0,
                        uint64 arg1, uint64 arg2,
                        uint64 arg3, uint64 arg4,
                        uint64 arg5)
{ 
    802009b4:	fa010113          	addi	sp,sp,-96
    802009b8:	04813c23          	sd	s0,88(sp)
    802009bc:	06010413          	addi	s0,sp,96
    802009c0:	fcc43823          	sd	a2,-48(s0)
    802009c4:	fcd43423          	sd	a3,-56(s0)
    802009c8:	fce43023          	sd	a4,-64(s0)
    802009cc:	faf43c23          	sd	a5,-72(s0)
    802009d0:	fb043823          	sd	a6,-80(s0)
    802009d4:	fb143423          	sd	a7,-88(s0)
    802009d8:	00050793          	mv	a5,a0
    802009dc:	fcf42e23          	sw	a5,-36(s0)
    802009e0:	00058793          	mv	a5,a1
    802009e4:	fcf42c23          	sw	a5,-40(s0)
  struct sbiret return_value;
  __asm__ volatile (
    802009e8:	fdc42783          	lw	a5,-36(s0)
    802009ec:	fd842703          	lw	a4,-40(s0)
    802009f0:	fd043683          	ld	a3,-48(s0)
    802009f4:	fc843603          	ld	a2,-56(s0)
    802009f8:	fc043583          	ld	a1,-64(s0)
    802009fc:	fb843503          	ld	a0,-72(s0)
    80200a00:	fb043803          	ld	a6,-80(s0)
    80200a04:	fa843883          	ld	a7,-88(s0)
    80200a08:	00078893          	mv	a7,a5
    80200a0c:	00070813          	mv	a6,a4
    80200a10:	00068513          	mv	a0,a3
    80200a14:	00060593          	mv	a1,a2
    80200a18:	00058613          	mv	a2,a1
    80200a1c:	00050693          	mv	a3,a0
    80200a20:	00080713          	mv	a4,a6
    80200a24:	00088793          	mv	a5,a7
    80200a28:	00000073          	ecall
    80200a2c:	00050713          	mv	a4,a0
    80200a30:	00058793          	mv	a5,a1
    80200a34:	fee43023          	sd	a4,-32(s0)
    80200a38:	fef43423          	sd	a5,-24(s0)
          [arg4] "r" (arg4), 
          [arg5] "r" (arg5)
        : "memory"
    );
  
}
    80200a3c:	00000013          	nop
    80200a40:	00070513          	mv	a0,a4
    80200a44:	00078593          	mv	a1,a5
    80200a48:	05813403          	ld	s0,88(sp)
    80200a4c:	06010113          	addi	sp,sp,96
    80200a50:	00008067          	ret

0000000080200a54 <trap_handler>:

// trap.c 

void trap_handler(unsigned long scause, unsigned long sepc) {
    80200a54:	fd010113          	addi	sp,sp,-48
    80200a58:	02113423          	sd	ra,40(sp)
    80200a5c:	02813023          	sd	s0,32(sp)
    80200a60:	03010413          	addi	s0,sp,48
    80200a64:	fca43c23          	sd	a0,-40(s0)
    80200a68:	fcb43823          	sd	a1,-48(s0)
    int x;
    x=scause>>63&&(int_mod(scause,16)==5);
    80200a6c:	fd843783          	ld	a5,-40(s0)
    80200a70:	0207d463          	bgez	a5,80200a98 <trap_handler+0x44>
    80200a74:	01000593          	li	a1,16
    80200a78:	fd843503          	ld	a0,-40(s0)
    80200a7c:	08c000ef          	jal	ra,80200b08 <int_mod>
    80200a80:	00050793          	mv	a5,a0
    80200a84:	00078713          	mv	a4,a5
    80200a88:	00500793          	li	a5,5
    80200a8c:	00f71663          	bne	a4,a5,80200a98 <trap_handler+0x44>
    80200a90:	00100793          	li	a5,1
    80200a94:	0080006f          	j	80200a9c <trap_handler+0x48>
    80200a98:	00000793          	li	a5,0
    80200a9c:	fef42623          	sw	a5,-20(s0)
    if(x==1){
    80200aa0:	fec42783          	lw	a5,-20(s0)
    80200aa4:	0007871b          	sext.w	a4,a5
    80200aa8:	00100793          	li	a5,1
    80200aac:	00f71663          	bne	a4,a5,80200ab8 <trap_handler+0x64>
        //printk("[S] Supervisor Mode Timer Interrupt\n");
        clock_set_next_event();
    80200ab0:	f84ff0ef          	jal	ra,80200234 <clock_set_next_event>
        do_timer();
    80200ab4:	bc1ff0ef          	jal	ra,80200674 <do_timer>
    }
    80200ab8:	00000013          	nop
    80200abc:	02813083          	ld	ra,40(sp)
    80200ac0:	02013403          	ld	s0,32(sp)
    80200ac4:	03010113          	addi	sp,sp,48
    80200ac8:	00008067          	ret

0000000080200acc <start_kernel>:
#include "printk.h"
#include "sbi.h"

extern void test();

int start_kernel() {
    80200acc:	ff010113          	addi	sp,sp,-16
    80200ad0:	00113423          	sd	ra,8(sp)
    80200ad4:	00813023          	sd	s0,0(sp)
    80200ad8:	01010413          	addi	s0,sp,16
    //printk("2022 ZJU Computer System II\n");

    test(); // DO NOT DELETE !!!
    80200adc:	01c000ef          	jal	ra,80200af8 <test>

	return 0;
    80200ae0:	00000793          	li	a5,0
}
    80200ae4:	00078513          	mv	a0,a5
    80200ae8:	00813083          	ld	ra,8(sp)
    80200aec:	00013403          	ld	s0,0(sp)
    80200af0:	01010113          	addi	sp,sp,16
    80200af4:	00008067          	ret

0000000080200af8 <test>:
#include "printk.h"
#include "defs.h"

// Please do not modify

void test() {
    80200af8:	ff010113          	addi	sp,sp,-16
    80200afc:	00813423          	sd	s0,8(sp)
    80200b00:	01010413          	addi	s0,sp,16
    while (1) {;}
    80200b04:	0000006f          	j	80200b04 <test+0xc>

0000000080200b08 <int_mod>:
#include"math.h"
int int_mod(unsigned int v1,unsigned int v2){
    80200b08:	fd010113          	addi	sp,sp,-48
    80200b0c:	02813423          	sd	s0,40(sp)
    80200b10:	03010413          	addi	s0,sp,48
    80200b14:	00050793          	mv	a5,a0
    80200b18:	00058713          	mv	a4,a1
    80200b1c:	fcf42e23          	sw	a5,-36(s0)
    80200b20:	00070793          	mv	a5,a4
    80200b24:	fcf42c23          	sw	a5,-40(s0)
    unsigned long long m1=v1;
    80200b28:	fdc46783          	lwu	a5,-36(s0)
    80200b2c:	fef43423          	sd	a5,-24(s0)
    unsigned long long m2=v2;
    80200b30:	fd846783          	lwu	a5,-40(s0)
    80200b34:	fef43023          	sd	a5,-32(s0)
    m2<<=31;
    80200b38:	fe043783          	ld	a5,-32(s0)
    80200b3c:	01f79793          	slli	a5,a5,0x1f
    80200b40:	fef43023          	sd	a5,-32(s0)
    while(m1>=v2){
    80200b44:	02c0006f          	j	80200b70 <int_mod+0x68>
        if(m2<m1){
    80200b48:	fe043703          	ld	a4,-32(s0)
    80200b4c:	fe843783          	ld	a5,-24(s0)
    80200b50:	00f77a63          	bgeu	a4,a5,80200b64 <int_mod+0x5c>
            m1-=m2;
    80200b54:	fe843703          	ld	a4,-24(s0)
    80200b58:	fe043783          	ld	a5,-32(s0)
    80200b5c:	40f707b3          	sub	a5,a4,a5
    80200b60:	fef43423          	sd	a5,-24(s0)
        }
        m2>>=1;
    80200b64:	fe043783          	ld	a5,-32(s0)
    80200b68:	0017d793          	srli	a5,a5,0x1
    80200b6c:	fef43023          	sd	a5,-32(s0)
    while(m1>=v2){
    80200b70:	fd846783          	lwu	a5,-40(s0)
    80200b74:	fe843703          	ld	a4,-24(s0)
    80200b78:	fcf778e3          	bgeu	a4,a5,80200b48 <int_mod+0x40>
    }
    return m1;
    80200b7c:	fe843783          	ld	a5,-24(s0)
    80200b80:	0007879b          	sext.w	a5,a5
}
    80200b84:	00078513          	mv	a0,a5
    80200b88:	02813403          	ld	s0,40(sp)
    80200b8c:	03010113          	addi	sp,sp,48
    80200b90:	00008067          	ret

0000000080200b94 <int_mul>:

int int_mul(unsigned int v1,unsigned int v2){
    80200b94:	fd010113          	addi	sp,sp,-48
    80200b98:	02813423          	sd	s0,40(sp)
    80200b9c:	03010413          	addi	s0,sp,48
    80200ba0:	00050793          	mv	a5,a0
    80200ba4:	00058713          	mv	a4,a1
    80200ba8:	fcf42e23          	sw	a5,-36(s0)
    80200bac:	00070793          	mv	a5,a4
    80200bb0:	fcf42c23          	sw	a5,-40(s0)
    unsigned long long res=0;
    80200bb4:	fe043423          	sd	zero,-24(s0)
    while(v2&&v1){
    80200bb8:	03c0006f          	j	80200bf4 <int_mul+0x60>
        if(v2&1){
    80200bbc:	fd842783          	lw	a5,-40(s0)
    80200bc0:	0017f793          	andi	a5,a5,1
    80200bc4:	0007879b          	sext.w	a5,a5
    80200bc8:	00078a63          	beqz	a5,80200bdc <int_mul+0x48>
            res+=v1;
    80200bcc:	fdc46783          	lwu	a5,-36(s0)
    80200bd0:	fe843703          	ld	a4,-24(s0)
    80200bd4:	00f707b3          	add	a5,a4,a5
    80200bd8:	fef43423          	sd	a5,-24(s0)
        }
        v2>>=1;
    80200bdc:	fd842783          	lw	a5,-40(s0)
    80200be0:	0017d79b          	srliw	a5,a5,0x1
    80200be4:	fcf42c23          	sw	a5,-40(s0)
        v1<<=1;
    80200be8:	fdc42783          	lw	a5,-36(s0)
    80200bec:	0017979b          	slliw	a5,a5,0x1
    80200bf0:	fcf42e23          	sw	a5,-36(s0)
    while(v2&&v1){
    80200bf4:	fd842783          	lw	a5,-40(s0)
    80200bf8:	0007879b          	sext.w	a5,a5
    80200bfc:	00078863          	beqz	a5,80200c0c <int_mul+0x78>
    80200c00:	fdc42783          	lw	a5,-36(s0)
    80200c04:	0007879b          	sext.w	a5,a5
    80200c08:	fa079ae3          	bnez	a5,80200bbc <int_mul+0x28>
    }
    return res;
    80200c0c:	fe843783          	ld	a5,-24(s0)
    80200c10:	0007879b          	sext.w	a5,a5
}
    80200c14:	00078513          	mv	a0,a5
    80200c18:	02813403          	ld	s0,40(sp)
    80200c1c:	03010113          	addi	sp,sp,48
    80200c20:	00008067          	ret

0000000080200c24 <int_div>:

int int_div(unsigned int v1,unsigned int v2){
    80200c24:	fc010113          	addi	sp,sp,-64
    80200c28:	02813c23          	sd	s0,56(sp)
    80200c2c:	04010413          	addi	s0,sp,64
    80200c30:	00050793          	mv	a5,a0
    80200c34:	00058713          	mv	a4,a1
    80200c38:	fcf42623          	sw	a5,-52(s0)
    80200c3c:	00070793          	mv	a5,a4
    80200c40:	fcf42423          	sw	a5,-56(s0)
    unsigned long long m1=v1;
    80200c44:	fcc46783          	lwu	a5,-52(s0)
    80200c48:	fef43423          	sd	a5,-24(s0)
    unsigned long long m2=v2;
    80200c4c:	fc846783          	lwu	a5,-56(s0)
    80200c50:	fef43023          	sd	a5,-32(s0)
    unsigned long long mask=(unsigned int)1<<31;
    80200c54:	00100793          	li	a5,1
    80200c58:	01f79793          	slli	a5,a5,0x1f
    80200c5c:	fcf43c23          	sd	a5,-40(s0)
    m2<<=31;
    80200c60:	fe043783          	ld	a5,-32(s0)
    80200c64:	01f79793          	slli	a5,a5,0x1f
    80200c68:	fef43023          	sd	a5,-32(s0)
    unsigned long long res=0;
    80200c6c:	fc043823          	sd	zero,-48(s0)
    while(m1>=v2){
    80200c70:	0480006f          	j	80200cb8 <int_div+0x94>
        if(m2<m1){
    80200c74:	fe043703          	ld	a4,-32(s0)
    80200c78:	fe843783          	ld	a5,-24(s0)
    80200c7c:	02f77263          	bgeu	a4,a5,80200ca0 <int_div+0x7c>
            m1-=m2;
    80200c80:	fe843703          	ld	a4,-24(s0)
    80200c84:	fe043783          	ld	a5,-32(s0)
    80200c88:	40f707b3          	sub	a5,a4,a5
    80200c8c:	fef43423          	sd	a5,-24(s0)
            res|=mask;
    80200c90:	fd043703          	ld	a4,-48(s0)
    80200c94:	fd843783          	ld	a5,-40(s0)
    80200c98:	00f767b3          	or	a5,a4,a5
    80200c9c:	fcf43823          	sd	a5,-48(s0)
        }
        m2>>=1;
    80200ca0:	fe043783          	ld	a5,-32(s0)
    80200ca4:	0017d793          	srli	a5,a5,0x1
    80200ca8:	fef43023          	sd	a5,-32(s0)
        mask>>=1;
    80200cac:	fd843783          	ld	a5,-40(s0)
    80200cb0:	0017d793          	srli	a5,a5,0x1
    80200cb4:	fcf43c23          	sd	a5,-40(s0)
    while(m1>=v2){
    80200cb8:	fc846783          	lwu	a5,-56(s0)
    80200cbc:	fe843703          	ld	a4,-24(s0)
    80200cc0:	faf77ae3          	bgeu	a4,a5,80200c74 <int_div+0x50>
    }
    return res;
    80200cc4:	fd043783          	ld	a5,-48(s0)
    80200cc8:	0007879b          	sext.w	a5,a5
    80200ccc:	00078513          	mv	a0,a5
    80200cd0:	03813403          	ld	s0,56(sp)
    80200cd4:	04010113          	addi	sp,sp,64
    80200cd8:	00008067          	ret

0000000080200cdc <putc>:
#include "printk.h"
#include "sbi.h"
#include "math.h"
void putc(char c) {
    80200cdc:	fe010113          	addi	sp,sp,-32
    80200ce0:	00113c23          	sd	ra,24(sp)
    80200ce4:	00813823          	sd	s0,16(sp)
    80200ce8:	02010413          	addi	s0,sp,32
    80200cec:	00050793          	mv	a5,a0
    80200cf0:	fef407a3          	sb	a5,-17(s0)
  sbi_ecall(SBI_PUTCHAR, 0, c, 0, 0, 0, 0, 0);
    80200cf4:	fef44603          	lbu	a2,-17(s0)
    80200cf8:	00000893          	li	a7,0
    80200cfc:	00000813          	li	a6,0
    80200d00:	00000793          	li	a5,0
    80200d04:	00000713          	li	a4,0
    80200d08:	00000693          	li	a3,0
    80200d0c:	00000593          	li	a1,0
    80200d10:	00100513          	li	a0,1
    80200d14:	ca1ff0ef          	jal	ra,802009b4 <sbi_ecall>
}
    80200d18:	00000013          	nop
    80200d1c:	01813083          	ld	ra,24(sp)
    80200d20:	01013403          	ld	s0,16(sp)
    80200d24:	02010113          	addi	sp,sp,32
    80200d28:	00008067          	ret

0000000080200d2c <vprintfmt>:

static int vprintfmt(void(*putch)(char), const char *fmt, va_list vl) {
    80200d2c:	f2010113          	addi	sp,sp,-224
    80200d30:	0c113c23          	sd	ra,216(sp)
    80200d34:	0c813823          	sd	s0,208(sp)
    80200d38:	0e010413          	addi	s0,sp,224
    80200d3c:	f2a43c23          	sd	a0,-200(s0)
    80200d40:	f2b43823          	sd	a1,-208(s0)
    80200d44:	f2c43423          	sd	a2,-216(s0)
    int in_format = 0, longarg = 0;
    80200d48:	fe042623          	sw	zero,-20(s0)
    80200d4c:	fe042423          	sw	zero,-24(s0)
    size_t pos = 0;
    80200d50:	fe043023          	sd	zero,-32(s0)
    for( ; *fmt; fmt++) {
    80200d54:	4bc0006f          	j	80201210 <vprintfmt+0x4e4>
        if (in_format) {
    80200d58:	fec42783          	lw	a5,-20(s0)
    80200d5c:	0007879b          	sext.w	a5,a5
    80200d60:	44078e63          	beqz	a5,802011bc <vprintfmt+0x490>
            switch(*fmt) {
    80200d64:	f3043783          	ld	a5,-208(s0)
    80200d68:	0007c783          	lbu	a5,0(a5)
    80200d6c:	0007879b          	sext.w	a5,a5
    80200d70:	f9d7869b          	addiw	a3,a5,-99
    80200d74:	0006871b          	sext.w	a4,a3
    80200d78:	01500793          	li	a5,21
    80200d7c:	48e7e263          	bltu	a5,a4,80201200 <vprintfmt+0x4d4>
    80200d80:	02069793          	slli	a5,a3,0x20
    80200d84:	0207d793          	srli	a5,a5,0x20
    80200d88:	00279713          	slli	a4,a5,0x2
    80200d8c:	00001797          	auipc	a5,0x1
    80200d90:	2d078793          	addi	a5,a5,720 # 8020205c <_srodata+0x5c>
    80200d94:	00f707b3          	add	a5,a4,a5
    80200d98:	0007a783          	lw	a5,0(a5)
    80200d9c:	0007871b          	sext.w	a4,a5
    80200da0:	00001797          	auipc	a5,0x1
    80200da4:	2bc78793          	addi	a5,a5,700 # 8020205c <_srodata+0x5c>
    80200da8:	00f707b3          	add	a5,a4,a5
    80200dac:	00078067          	jr	a5
                case 'l': { 
                    longarg = 1; 
    80200db0:	00100793          	li	a5,1
    80200db4:	fef42423          	sw	a5,-24(s0)
                    break; 
    80200db8:	44c0006f          	j	80201204 <vprintfmt+0x4d8>
                }
                
                case 'x': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
    80200dbc:	fe842783          	lw	a5,-24(s0)
    80200dc0:	0007879b          	sext.w	a5,a5
    80200dc4:	00078c63          	beqz	a5,80200ddc <vprintfmt+0xb0>
    80200dc8:	f2843783          	ld	a5,-216(s0)
    80200dcc:	00878713          	addi	a4,a5,8
    80200dd0:	f2e43423          	sd	a4,-216(s0)
    80200dd4:	0007b783          	ld	a5,0(a5)
    80200dd8:	0140006f          	j	80200dec <vprintfmt+0xc0>
    80200ddc:	f2843783          	ld	a5,-216(s0)
    80200de0:	00878713          	addi	a4,a5,8
    80200de4:	f2e43423          	sd	a4,-216(s0)
    80200de8:	0007a783          	lw	a5,0(a5)
    80200dec:	f8f43c23          	sd	a5,-104(s0)

                    int hexdigits = 2 * (longarg ? sizeof(long) : sizeof(int)) - 1;
    80200df0:	fe842783          	lw	a5,-24(s0)
    80200df4:	0007879b          	sext.w	a5,a5
    80200df8:	00078663          	beqz	a5,80200e04 <vprintfmt+0xd8>
    80200dfc:	00f00793          	li	a5,15
    80200e00:	0080006f          	j	80200e08 <vprintfmt+0xdc>
    80200e04:	00700793          	li	a5,7
    80200e08:	f8f42a23          	sw	a5,-108(s0)
                    for(int halfbyte = hexdigits; halfbyte >= 0; halfbyte--) {
    80200e0c:	f9442783          	lw	a5,-108(s0)
    80200e10:	fcf42e23          	sw	a5,-36(s0)
    80200e14:	0840006f          	j	80200e98 <vprintfmt+0x16c>
                        int hex = (num >> (4*halfbyte)) & 0xF;
    80200e18:	fdc42783          	lw	a5,-36(s0)
    80200e1c:	0027979b          	slliw	a5,a5,0x2
    80200e20:	0007879b          	sext.w	a5,a5
    80200e24:	f9843703          	ld	a4,-104(s0)
    80200e28:	40f757b3          	sra	a5,a4,a5
    80200e2c:	0007879b          	sext.w	a5,a5
    80200e30:	00f7f793          	andi	a5,a5,15
    80200e34:	f8f42823          	sw	a5,-112(s0)
                        char hexchar = (hex < 10 ? '0' + hex : 'a' + hex - 10);
    80200e38:	f9042783          	lw	a5,-112(s0)
    80200e3c:	0007871b          	sext.w	a4,a5
    80200e40:	00900793          	li	a5,9
    80200e44:	00e7cc63          	blt	a5,a4,80200e5c <vprintfmt+0x130>
    80200e48:	f9042783          	lw	a5,-112(s0)
    80200e4c:	0ff7f793          	zext.b	a5,a5
    80200e50:	0307879b          	addiw	a5,a5,48
    80200e54:	0ff7f793          	zext.b	a5,a5
    80200e58:	0140006f          	j	80200e6c <vprintfmt+0x140>
    80200e5c:	f9042783          	lw	a5,-112(s0)
    80200e60:	0ff7f793          	zext.b	a5,a5
    80200e64:	0577879b          	addiw	a5,a5,87
    80200e68:	0ff7f793          	zext.b	a5,a5
    80200e6c:	f8f407a3          	sb	a5,-113(s0)
                        putch(hexchar);
    80200e70:	f8f44783          	lbu	a5,-113(s0)
    80200e74:	f3843703          	ld	a4,-200(s0)
    80200e78:	00078513          	mv	a0,a5
    80200e7c:	000700e7          	jalr	a4
                        pos++;
    80200e80:	fe043783          	ld	a5,-32(s0)
    80200e84:	00178793          	addi	a5,a5,1
    80200e88:	fef43023          	sd	a5,-32(s0)
                    for(int halfbyte = hexdigits; halfbyte >= 0; halfbyte--) {
    80200e8c:	fdc42783          	lw	a5,-36(s0)
    80200e90:	fff7879b          	addiw	a5,a5,-1
    80200e94:	fcf42e23          	sw	a5,-36(s0)
    80200e98:	fdc42783          	lw	a5,-36(s0)
    80200e9c:	0007879b          	sext.w	a5,a5
    80200ea0:	f607dce3          	bgez	a5,80200e18 <vprintfmt+0xec>
                    }
                    longarg = 0; in_format = 0; 
    80200ea4:	fe042423          	sw	zero,-24(s0)
    80200ea8:	fe042623          	sw	zero,-20(s0)
                    break;
    80200eac:	3580006f          	j	80201204 <vprintfmt+0x4d8>
                }
            
                case 'd': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
    80200eb0:	fe842783          	lw	a5,-24(s0)
    80200eb4:	0007879b          	sext.w	a5,a5
    80200eb8:	00078c63          	beqz	a5,80200ed0 <vprintfmt+0x1a4>
    80200ebc:	f2843783          	ld	a5,-216(s0)
    80200ec0:	00878713          	addi	a4,a5,8
    80200ec4:	f2e43423          	sd	a4,-216(s0)
    80200ec8:	0007b783          	ld	a5,0(a5)
    80200ecc:	0140006f          	j	80200ee0 <vprintfmt+0x1b4>
    80200ed0:	f2843783          	ld	a5,-216(s0)
    80200ed4:	00878713          	addi	a4,a5,8
    80200ed8:	f2e43423          	sd	a4,-216(s0)
    80200edc:	0007a783          	lw	a5,0(a5)
    80200ee0:	fcf43823          	sd	a5,-48(s0)
                    if (num < 0) {
    80200ee4:	fd043783          	ld	a5,-48(s0)
    80200ee8:	0207d463          	bgez	a5,80200f10 <vprintfmt+0x1e4>
                        num = -num; putch('-');
    80200eec:	fd043783          	ld	a5,-48(s0)
    80200ef0:	40f007b3          	neg	a5,a5
    80200ef4:	fcf43823          	sd	a5,-48(s0)
    80200ef8:	f3843783          	ld	a5,-200(s0)
    80200efc:	02d00513          	li	a0,45
    80200f00:	000780e7          	jalr	a5
                        pos++;
    80200f04:	fe043783          	ld	a5,-32(s0)
    80200f08:	00178793          	addi	a5,a5,1
    80200f0c:	fef43023          	sd	a5,-32(s0)
                    }
                    int bits = 0;
    80200f10:	fc042623          	sw	zero,-52(s0)
                    char decchar[25] = {'0', 0};
    80200f14:	03000793          	li	a5,48
    80200f18:	f6f43023          	sd	a5,-160(s0)
    80200f1c:	f6043423          	sd	zero,-152(s0)
    80200f20:	f6043823          	sd	zero,-144(s0)
    80200f24:	f6040c23          	sb	zero,-136(s0)
                    for (long tmp = num; tmp; bits++) {
    80200f28:	fd043783          	ld	a5,-48(s0)
    80200f2c:	fcf43023          	sd	a5,-64(s0)
    80200f30:	0600006f          	j	80200f90 <vprintfmt+0x264>
                        decchar[bits] = (int_mod(tmp,10)) + '0';
    80200f34:	fc043783          	ld	a5,-64(s0)
    80200f38:	0007879b          	sext.w	a5,a5
    80200f3c:	00a00593          	li	a1,10
    80200f40:	00078513          	mv	a0,a5
    80200f44:	bc5ff0ef          	jal	ra,80200b08 <int_mod>
    80200f48:	00050793          	mv	a5,a0
    80200f4c:	0ff7f793          	zext.b	a5,a5
    80200f50:	0307879b          	addiw	a5,a5,48
    80200f54:	0ff7f713          	zext.b	a4,a5
    80200f58:	fcc42783          	lw	a5,-52(s0)
    80200f5c:	ff040693          	addi	a3,s0,-16
    80200f60:	00f687b3          	add	a5,a3,a5
    80200f64:	f6e78823          	sb	a4,-144(a5)
                        tmp=int_div(tmp,10);
    80200f68:	fc043783          	ld	a5,-64(s0)
    80200f6c:	0007879b          	sext.w	a5,a5
    80200f70:	00a00593          	li	a1,10
    80200f74:	00078513          	mv	a0,a5
    80200f78:	cadff0ef          	jal	ra,80200c24 <int_div>
    80200f7c:	00050793          	mv	a5,a0
    80200f80:	fcf43023          	sd	a5,-64(s0)
                    for (long tmp = num; tmp; bits++) {
    80200f84:	fcc42783          	lw	a5,-52(s0)
    80200f88:	0017879b          	addiw	a5,a5,1
    80200f8c:	fcf42623          	sw	a5,-52(s0)
    80200f90:	fc043783          	ld	a5,-64(s0)
    80200f94:	fa0790e3          	bnez	a5,80200f34 <vprintfmt+0x208>
                    }

                    for (int i = bits; i >= 0; i--) {
    80200f98:	fcc42783          	lw	a5,-52(s0)
    80200f9c:	faf42e23          	sw	a5,-68(s0)
    80200fa0:	02c0006f          	j	80200fcc <vprintfmt+0x2a0>
                        putch(decchar[i]);
    80200fa4:	fbc42783          	lw	a5,-68(s0)
    80200fa8:	ff040713          	addi	a4,s0,-16
    80200fac:	00f707b3          	add	a5,a4,a5
    80200fb0:	f707c783          	lbu	a5,-144(a5)
    80200fb4:	f3843703          	ld	a4,-200(s0)
    80200fb8:	00078513          	mv	a0,a5
    80200fbc:	000700e7          	jalr	a4
                    for (int i = bits; i >= 0; i--) {
    80200fc0:	fbc42783          	lw	a5,-68(s0)
    80200fc4:	fff7879b          	addiw	a5,a5,-1
    80200fc8:	faf42e23          	sw	a5,-68(s0)
    80200fcc:	fbc42783          	lw	a5,-68(s0)
    80200fd0:	0007879b          	sext.w	a5,a5
    80200fd4:	fc07d8e3          	bgez	a5,80200fa4 <vprintfmt+0x278>
                    }
                    pos += bits + 1;
    80200fd8:	fcc42783          	lw	a5,-52(s0)
    80200fdc:	0017879b          	addiw	a5,a5,1
    80200fe0:	0007879b          	sext.w	a5,a5
    80200fe4:	00078713          	mv	a4,a5
    80200fe8:	fe043783          	ld	a5,-32(s0)
    80200fec:	00e787b3          	add	a5,a5,a4
    80200ff0:	fef43023          	sd	a5,-32(s0)
                    longarg = 0; in_format = 0; 
    80200ff4:	fe042423          	sw	zero,-24(s0)
    80200ff8:	fe042623          	sw	zero,-20(s0)
                    break;
    80200ffc:	2080006f          	j	80201204 <vprintfmt+0x4d8>
                }

                case 'u': {
                    unsigned long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
    80201000:	fe842783          	lw	a5,-24(s0)
    80201004:	0007879b          	sext.w	a5,a5
    80201008:	00078c63          	beqz	a5,80201020 <vprintfmt+0x2f4>
    8020100c:	f2843783          	ld	a5,-216(s0)
    80201010:	00878713          	addi	a4,a5,8
    80201014:	f2e43423          	sd	a4,-216(s0)
    80201018:	0007b783          	ld	a5,0(a5)
    8020101c:	0140006f          	j	80201030 <vprintfmt+0x304>
    80201020:	f2843783          	ld	a5,-216(s0)
    80201024:	00878713          	addi	a4,a5,8
    80201028:	f2e43423          	sd	a4,-216(s0)
    8020102c:	0007a783          	lw	a5,0(a5)
    80201030:	f8f43023          	sd	a5,-128(s0)
                    int bits = 0;
    80201034:	fa042c23          	sw	zero,-72(s0)
                    char decchar[25] = {'0', 0};
    80201038:	03000793          	li	a5,48
    8020103c:	f4f43023          	sd	a5,-192(s0)
    80201040:	f4043423          	sd	zero,-184(s0)
    80201044:	f4043823          	sd	zero,-176(s0)
    80201048:	f4040c23          	sb	zero,-168(s0)
                    for (long tmp = num; tmp; bits++) {
    8020104c:	f8043783          	ld	a5,-128(s0)
    80201050:	faf43823          	sd	a5,-80(s0)
    80201054:	0600006f          	j	802010b4 <vprintfmt+0x388>
                        decchar[bits] = (int_mod(tmp,10)) + '0';
    80201058:	fb043783          	ld	a5,-80(s0)
    8020105c:	0007879b          	sext.w	a5,a5
    80201060:	00a00593          	li	a1,10
    80201064:	00078513          	mv	a0,a5
    80201068:	aa1ff0ef          	jal	ra,80200b08 <int_mod>
    8020106c:	00050793          	mv	a5,a0
    80201070:	0ff7f793          	zext.b	a5,a5
    80201074:	0307879b          	addiw	a5,a5,48
    80201078:	0ff7f713          	zext.b	a4,a5
    8020107c:	fb842783          	lw	a5,-72(s0)
    80201080:	ff040693          	addi	a3,s0,-16
    80201084:	00f687b3          	add	a5,a3,a5
    80201088:	f4e78823          	sb	a4,-176(a5)
                        tmp=int_div(tmp,10);
    8020108c:	fb043783          	ld	a5,-80(s0)
    80201090:	0007879b          	sext.w	a5,a5
    80201094:	00a00593          	li	a1,10
    80201098:	00078513          	mv	a0,a5
    8020109c:	b89ff0ef          	jal	ra,80200c24 <int_div>
    802010a0:	00050793          	mv	a5,a0
    802010a4:	faf43823          	sd	a5,-80(s0)
                    for (long tmp = num; tmp; bits++) {
    802010a8:	fb842783          	lw	a5,-72(s0)
    802010ac:	0017879b          	addiw	a5,a5,1
    802010b0:	faf42c23          	sw	a5,-72(s0)
    802010b4:	fb043783          	ld	a5,-80(s0)
    802010b8:	fa0790e3          	bnez	a5,80201058 <vprintfmt+0x32c>
                    }

                    for (int i = bits; i >= 0; i--) {
    802010bc:	fb842783          	lw	a5,-72(s0)
    802010c0:	faf42623          	sw	a5,-84(s0)
    802010c4:	02c0006f          	j	802010f0 <vprintfmt+0x3c4>
                        putch(decchar[i]);
    802010c8:	fac42783          	lw	a5,-84(s0)
    802010cc:	ff040713          	addi	a4,s0,-16
    802010d0:	00f707b3          	add	a5,a4,a5
    802010d4:	f507c783          	lbu	a5,-176(a5)
    802010d8:	f3843703          	ld	a4,-200(s0)
    802010dc:	00078513          	mv	a0,a5
    802010e0:	000700e7          	jalr	a4
                    for (int i = bits; i >= 0; i--) {
    802010e4:	fac42783          	lw	a5,-84(s0)
    802010e8:	fff7879b          	addiw	a5,a5,-1
    802010ec:	faf42623          	sw	a5,-84(s0)
    802010f0:	fac42783          	lw	a5,-84(s0)
    802010f4:	0007879b          	sext.w	a5,a5
    802010f8:	fc07d8e3          	bgez	a5,802010c8 <vprintfmt+0x39c>
                    }
                    pos += bits + 1;
    802010fc:	fb842783          	lw	a5,-72(s0)
    80201100:	0017879b          	addiw	a5,a5,1
    80201104:	0007879b          	sext.w	a5,a5
    80201108:	00078713          	mv	a4,a5
    8020110c:	fe043783          	ld	a5,-32(s0)
    80201110:	00e787b3          	add	a5,a5,a4
    80201114:	fef43023          	sd	a5,-32(s0)
                    longarg = 0; in_format = 0; 
    80201118:	fe042423          	sw	zero,-24(s0)
    8020111c:	fe042623          	sw	zero,-20(s0)
                    break;
    80201120:	0e40006f          	j	80201204 <vprintfmt+0x4d8>
                }

                case 's': {
                    const char* str = va_arg(vl, const char*);
    80201124:	f2843783          	ld	a5,-216(s0)
    80201128:	00878713          	addi	a4,a5,8
    8020112c:	f2e43423          	sd	a4,-216(s0)
    80201130:	0007b783          	ld	a5,0(a5)
    80201134:	faf43023          	sd	a5,-96(s0)
                    while (*str) {
    80201138:	0300006f          	j	80201168 <vprintfmt+0x43c>
                        putch(*str);
    8020113c:	fa043783          	ld	a5,-96(s0)
    80201140:	0007c783          	lbu	a5,0(a5)
    80201144:	f3843703          	ld	a4,-200(s0)
    80201148:	00078513          	mv	a0,a5
    8020114c:	000700e7          	jalr	a4
                        pos++; 
    80201150:	fe043783          	ld	a5,-32(s0)
    80201154:	00178793          	addi	a5,a5,1
    80201158:	fef43023          	sd	a5,-32(s0)
                        str++;
    8020115c:	fa043783          	ld	a5,-96(s0)
    80201160:	00178793          	addi	a5,a5,1
    80201164:	faf43023          	sd	a5,-96(s0)
                    while (*str) {
    80201168:	fa043783          	ld	a5,-96(s0)
    8020116c:	0007c783          	lbu	a5,0(a5)
    80201170:	fc0796e3          	bnez	a5,8020113c <vprintfmt+0x410>
                    }
                    longarg = 0; in_format = 0; 
    80201174:	fe042423          	sw	zero,-24(s0)
    80201178:	fe042623          	sw	zero,-20(s0)
                    break;
    8020117c:	0880006f          	j	80201204 <vprintfmt+0x4d8>
                }

                case 'c': {
                    char ch = (char)va_arg(vl,int);
    80201180:	f2843783          	ld	a5,-216(s0)
    80201184:	00878713          	addi	a4,a5,8
    80201188:	f2e43423          	sd	a4,-216(s0)
    8020118c:	0007a783          	lw	a5,0(a5)
    80201190:	f6f40fa3          	sb	a5,-129(s0)
                    putch(ch);
    80201194:	f7f44783          	lbu	a5,-129(s0)
    80201198:	f3843703          	ld	a4,-200(s0)
    8020119c:	00078513          	mv	a0,a5
    802011a0:	000700e7          	jalr	a4
                    pos++;
    802011a4:	fe043783          	ld	a5,-32(s0)
    802011a8:	00178793          	addi	a5,a5,1
    802011ac:	fef43023          	sd	a5,-32(s0)
                    longarg = 0; in_format = 0; 
    802011b0:	fe042423          	sw	zero,-24(s0)
    802011b4:	fe042623          	sw	zero,-20(s0)
                    break;
    802011b8:	04c0006f          	j	80201204 <vprintfmt+0x4d8>
                }
                default:
                    break;
            }
        }
        else if(*fmt == '%') {
    802011bc:	f3043783          	ld	a5,-208(s0)
    802011c0:	0007c783          	lbu	a5,0(a5)
    802011c4:	00078713          	mv	a4,a5
    802011c8:	02500793          	li	a5,37
    802011cc:	00f71863          	bne	a4,a5,802011dc <vprintfmt+0x4b0>
          in_format = 1;
    802011d0:	00100793          	li	a5,1
    802011d4:	fef42623          	sw	a5,-20(s0)
    802011d8:	02c0006f          	j	80201204 <vprintfmt+0x4d8>
        }
        else {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            putch(*fmt);
    802011dc:	f3043783          	ld	a5,-208(s0)
    802011e0:	0007c783          	lbu	a5,0(a5)
    802011e4:	f3843703          	ld	a4,-200(s0)
    802011e8:	00078513          	mv	a0,a5
    802011ec:	000700e7          	jalr	a4
            pos++;
    802011f0:	fe043783          	ld	a5,-32(s0)
    802011f4:	00178793          	addi	a5,a5,1
    802011f8:	fef43023          	sd	a5,-32(s0)
    802011fc:	0080006f          	j	80201204 <vprintfmt+0x4d8>
                    break;
    80201200:	00000013          	nop
    for( ; *fmt; fmt++) {
    80201204:	f3043783          	ld	a5,-208(s0)
    80201208:	00178793          	addi	a5,a5,1
    8020120c:	f2f43823          	sd	a5,-208(s0)
    80201210:	f3043783          	ld	a5,-208(s0)
    80201214:	0007c783          	lbu	a5,0(a5)
    80201218:	b40790e3          	bnez	a5,80200d58 <vprintfmt+0x2c>
        }
    }
    return pos;
    8020121c:	fe043783          	ld	a5,-32(s0)
    80201220:	0007879b          	sext.w	a5,a5
}
    80201224:	00078513          	mv	a0,a5
    80201228:	0d813083          	ld	ra,216(sp)
    8020122c:	0d013403          	ld	s0,208(sp)
    80201230:	0e010113          	addi	sp,sp,224
    80201234:	00008067          	ret

0000000080201238 <printk>:



int printk(const char* s, ...) {
    80201238:	f9010113          	addi	sp,sp,-112
    8020123c:	02113423          	sd	ra,40(sp)
    80201240:	02813023          	sd	s0,32(sp)
    80201244:	03010413          	addi	s0,sp,48
    80201248:	fca43c23          	sd	a0,-40(s0)
    8020124c:	00b43423          	sd	a1,8(s0)
    80201250:	00c43823          	sd	a2,16(s0)
    80201254:	00d43c23          	sd	a3,24(s0)
    80201258:	02e43023          	sd	a4,32(s0)
    8020125c:	02f43423          	sd	a5,40(s0)
    80201260:	03043823          	sd	a6,48(s0)
    80201264:	03143c23          	sd	a7,56(s0)
    int res = 0;
    80201268:	fe042623          	sw	zero,-20(s0)
    va_list vl;
    va_start(vl, s);
    8020126c:	04040793          	addi	a5,s0,64
    80201270:	fcf43823          	sd	a5,-48(s0)
    80201274:	fd043783          	ld	a5,-48(s0)
    80201278:	fc878793          	addi	a5,a5,-56
    8020127c:	fef43023          	sd	a5,-32(s0)
    res = vprintfmt(putc, s, vl);
    80201280:	fe043783          	ld	a5,-32(s0)
    80201284:	00078613          	mv	a2,a5
    80201288:	fd843583          	ld	a1,-40(s0)
    8020128c:	00000517          	auipc	a0,0x0
    80201290:	a5050513          	addi	a0,a0,-1456 # 80200cdc <putc>
    80201294:	a99ff0ef          	jal	ra,80200d2c <vprintfmt>
    80201298:	00050793          	mv	a5,a0
    8020129c:	fef42623          	sw	a5,-20(s0)
    va_end(vl);
    return res;
    802012a0:	fec42783          	lw	a5,-20(s0)
}
    802012a4:	00078513          	mv	a0,a5
    802012a8:	02813083          	ld	ra,40(sp)
    802012ac:	02013403          	ld	s0,32(sp)
    802012b0:	07010113          	addi	sp,sp,112
    802012b4:	00008067          	ret

00000000802012b8 <rand>:
int lby=1;
int initialize = 1;
int r[1000];
int t=3;

uint64 rand() {
    802012b8:	ff010113          	addi	sp,sp,-16
    802012bc:	00813423          	sd	s0,8(sp)
    802012c0:	01010413          	addi	s0,sp,16
    return t;
    802012c4:	00002797          	auipc	a5,0x2
    802012c8:	d4c78793          	addi	a5,a5,-692 # 80203010 <t>
    802012cc:	0007a783          	lw	a5,0(a5)
    // r[t + 344] = r[t + 344 - 31] + r[t + 344 - 3];
    
	// t++;

    // return (uint64)int_mod(r[t - 1 + 344] , 10) + 1;
}
    802012d0:	00078513          	mv	a0,a5
    802012d4:	00813403          	ld	s0,8(sp)
    802012d8:	01010113          	addi	sp,sp,16
    802012dc:	00008067          	ret

00000000802012e0 <memset>:
#include "string.h"

void *memset(void *dst, int c, uint64 n) {
    802012e0:	fc010113          	addi	sp,sp,-64
    802012e4:	02813c23          	sd	s0,56(sp)
    802012e8:	04010413          	addi	s0,sp,64
    802012ec:	fca43c23          	sd	a0,-40(s0)
    802012f0:	00058793          	mv	a5,a1
    802012f4:	fcc43423          	sd	a2,-56(s0)
    802012f8:	fcf42a23          	sw	a5,-44(s0)
    char *cdst = (char *)dst;
    802012fc:	fd843783          	ld	a5,-40(s0)
    80201300:	fef43023          	sd	a5,-32(s0)
    for (uint64 i = 0; i < n; ++i)
    80201304:	fe043423          	sd	zero,-24(s0)
    80201308:	0280006f          	j	80201330 <memset+0x50>
        cdst[i] = c;
    8020130c:	fe043703          	ld	a4,-32(s0)
    80201310:	fe843783          	ld	a5,-24(s0)
    80201314:	00f707b3          	add	a5,a4,a5
    80201318:	fd442703          	lw	a4,-44(s0)
    8020131c:	0ff77713          	zext.b	a4,a4
    80201320:	00e78023          	sb	a4,0(a5)
    for (uint64 i = 0; i < n; ++i)
    80201324:	fe843783          	ld	a5,-24(s0)
    80201328:	00178793          	addi	a5,a5,1
    8020132c:	fef43423          	sd	a5,-24(s0)
    80201330:	fe843703          	ld	a4,-24(s0)
    80201334:	fc843783          	ld	a5,-56(s0)
    80201338:	fcf76ae3          	bltu	a4,a5,8020130c <memset+0x2c>

    return dst;
    8020133c:	fd843783          	ld	a5,-40(s0)
}
    80201340:	00078513          	mv	a0,a5
    80201344:	03813403          	ld	s0,56(sp)
    80201348:	04010113          	addi	sp,sp,64
    8020134c:	00008067          	ret
