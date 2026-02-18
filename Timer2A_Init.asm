.thumb 
.text 
.global Timer2A_Init 

SYSCTL_RCGCTIMER_R .field 0x400FE604 
TIMER2_CTL_R .field 0x4003200C 
TIMER2_CFG_R .field 0x40032000 
TIMER2_TAMR_R .field 0x40032004 
TIMER2_TAILR_R .field 0x40032028 
TIMER2_ICR_R .field 0x40032024 
TIMER2_IMR_R .field 0x40032018 

NVIC_EN0_R .field 0xE000E100 

TIMER_RELOAD_1SEC .field 16000000 

Timer2A_Init:
 push {lr} 

 ldr r0, SYSCTL_RCGCTIMER_R  ldr r1, [r0] 
 orr r1, r1, #0x04  
 str r1, [r0] 

 nop 
 nop  

 ldr r0, TIMER2_CTL_R 
 mov r1, #0 
 str r1, [r0] 

 ldr r0, TIMER2_CFG_R 
 mov r1, #0 
 str r1, [r0] 

 ldr r0, TIMER2_TAMR_R 
 mov r1, #2  
 str r1, [r0] 

 ldr r0, TIMER2_TAILR_R  ldr r1,
 TIMER_RELOAD_1SEC  str r1, [r0] 
 ldr r0, TIMER2_ICR_R 
 mov r1, #1 
 str r1, [r0] 

 ldr r0, TIMER2_IMR_R 
 mov r1, #1 
 str r1, [r0] 

 ldr r0, NVIC_EN0_R
 ldr r1, [r0] 
 orr r1, r1, #(1 << 23) 
 str r1, [r0] 

 ldr r0, TIMER2_CTL_R 
 mov r1, #1 
 str r1, [r0] 

 pop {lr} 
 bx lr
