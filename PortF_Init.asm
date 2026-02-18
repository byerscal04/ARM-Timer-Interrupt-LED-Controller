.thumb 
.text 
.global PortF_Init 

SYSCTL_RCGCGPIO_R .field 0x400FE608 GPIO_PORTF_DIR_R .field 0x40025400 
GPIO_PORTF_DEN_R .field 0x4002551C
PortF_Init: 
 
 push {lr} 
 ldr r0, SYSCTL_RCGCGPIO_R  ldr r1, [r0] 
 orr r1, r1, #0x20 
 str r1, [r0] 

 nop 
 nop 

 ldr r0, GPIO_PORTF_DIR_R 
 ldr r1, [r0] 
 orr r1, r1, #0x0E 
 str r1, [r0] 

 ldr r0, GPIO_PORTF_DEN_R 
 ldr r1, [r0] 
 orr r1, r1, #0x0E 
 str r1, [r0] 

 pop {lr} 
 bx lr
