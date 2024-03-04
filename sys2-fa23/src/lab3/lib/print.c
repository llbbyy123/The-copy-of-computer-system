#include "print.h"
#include "sbi.h"

void puts(char *s) {
  char charcter;
  while((charcter=*s)!='\0'){
    sbi_ecall(0x1,0x0,charcter,0,0,0,0,0);
    s++;
  }
}

void puti(int x) {
  char number[100];
  int n=0,i,val=x;
  while(x!=0){
    number[n]=x%10+'0';
    n++;
    x=x/10;
  }
  for(i=n-1;i>-1;i--){
    sbi_ecall(0x1,0x0,number[i],0,0,0,0,0);
  }
}
