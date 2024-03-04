.extern start_kernel

.section .text.entry
.globl _start, _end
_start:
  la sp, _end
  lui t0, 1
  add sp,sp,t0
  jal ra, start_kernel
_end:

