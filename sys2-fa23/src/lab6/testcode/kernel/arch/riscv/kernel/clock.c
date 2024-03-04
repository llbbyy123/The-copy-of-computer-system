// clock.c


unsigned long TIMECLOCK = 0x100000;

unsigned long get_cycles() {
    unsigned long ret;
    __asm__ volatile(
        "rdtime t0\n"
        "mv %[ret],t0\n"
        : [ret] "=r" (ret)
        :: "memory"
    );
    return ret;
}

void clock_set_next_event() {
    sbi_ecall(0,0,TIMECLOCK,0,0,0,0,0);
} 