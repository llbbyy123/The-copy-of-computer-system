.extern start_kernel
.section .text.init
.globl _start
.globl _end
_start:
  la sp, stack_top
  call mm_init
  call task_init
  la t0, _traps
  csrw stvec, t0
  csrr t0,sie
  ori t0,t0,0x20
  csrw sie,t0
  lui t1, 0x2
  addi t1, t1, 0x710
  li a7, 0x00
  li a6, 0x0
  li a5, 0x0
  li a4, 0x0
  li a3, 0x0
  li a2, 0x0
  li a1, 0x0
  mv a0, t1
  ecall
  csrr t0,sstatus
  ori t0,t0,0x2
  csrw sstatus,t0
  jal ra, start_kernel
.section .bss
  .space 0x1000
stack_top:
.align 4
_end:


