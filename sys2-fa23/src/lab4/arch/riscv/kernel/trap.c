
// trap.c 

void trap_handler(unsigned long scause, unsigned long sepc) {
    int x;
    x=scause>>63&&(scause%16==5);
    if(x==1){
        printk("[S] Supervisor Mode Timer Interrupt\n");
        clock_set_next_event();
    }
}