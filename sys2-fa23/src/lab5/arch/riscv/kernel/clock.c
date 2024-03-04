// clock.c


unsigned long TIMECLOCK = 10000000;

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
    unsigned long next = get_cycles() + TIMECLOCK;
    sbi_ecall(0,0,next,0,0,0,0,0);
} 