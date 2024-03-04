    .section .text.entry
    .align 2
    .globl _traps 
    .global __dummy
    .global __switch_to
_traps:
    addi sp,sp,-256
    sd ra,0(sp)
    sd sp,8(sp)
    sd gp,16(sp)
    sd tp,24(sp)
    sd t0,32(sp)
    sd t1,40(sp)
    sd t2,48(sp)
    sd fp,56(sp)
    sd s1,64(sp)
    sd a0,72(sp)
    sd a1,80(sp)
    sd a2,88(sp)
    sd a3,96(sp)
    sd a4,104(sp)
    sd a5,112(sp)
    sd a6,120(sp)
    sd a7,128(sp)
    sd s2,136(sp)
    sd s3,144(sp)
    sd s4,152(sp)
    sd s5,160(sp)
    sd s6,168(sp)
    sd s7,176(sp)
    sd s8,184(sp)
    sd s9,192(sp)
    sd s10,200(sp)
    sd s11,208(sp)
    sd t3,216(sp)
    sd t4,224(sp)
    sd t5,232(sp)
    sd t6,240(sp)

    csrr t0,sepc
    sd t0,248(sp)

    mv a1, t0
    csrr a0,scause
    call trap_handler

    ld t0,248(sp)
    csrw sepc,t0
    ld ra,0(sp)
    ld gp,16(sp)
    ld tp,24(sp)
    ld t0,32(sp)
    ld t1,40(sp)
    ld t2,48(sp)
    ld fp,56(sp)
    ld s1,64(sp)
    ld a0,72(sp)
    ld a1,80(sp)
    ld a2,88(sp)
    ld a3,96(sp)
    ld a4,104(sp)
    ld a5,112(sp)
    ld a6,120(sp)
    ld a7,128(sp)
    ld s2,136(sp)
    ld s3,144(sp)
    ld s4,152(sp)
    ld s5,160(sp)
    ld s6,168(sp)
    ld s7,176(sp)
    ld s8,184(sp)
    ld s9,192(sp)
    ld s10,200(sp)
    ld s11,208(sp)
    ld t3,216(sp)
    ld t4,224(sp)
    ld t5,232(sp)
    ld t6,240(sp)
    ld sp,8(sp)

    addi sp,sp,256
    sret
__dummy:
    la t0, dummy
    csrw sepc, t0
    sret
__switch_to:
    sd ra,40(a0)
    sd sp,48(a0)
    sd s0,56(a0)
    sd s1,64(a0)
    sd s2,72(a0)
    sd s3,80(a0)
    sd s4,88(a0)
    sd s5,96(a0)
    sd s6,104(a0)
    sd s7,112(a0)
    sd s8,120(a0)
    sd s9,128(a0)
    sd s10,136(a0)
    sd s11,144(a0)

    ld ra,40(a1)
    ld sp,48(a1)
    ld s0,56(a1)
    ld s1,64(a1)
    ld s2,72(a1)
    ld s3,80(a1)
    ld s4,88(a1)
    ld s5,96(a1)
    ld s6,104(a1)
    ld s7,112(a1)
    ld s8,120(a1)
    ld s9,128(a1)
    ld s10,136(a1)
    ld s11,144(a1)

    ret
