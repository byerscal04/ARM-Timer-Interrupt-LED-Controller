.thumb
.text
.global Timer2A_Handler

GPIO_PORTF_DATA_R .field 0x400253FC
TIMER2_ICR_R      .field 0x40032024
ColorIndex        .field 0x20000000

Timer2A_Handler:
    push {r4-r7, lr}

    ldr r0, TIMER2_ICR_R
    mov r1, #1
    str r1, [r0]

    ldr r0, ColorIndex
    ldr r1, [r0]
    add r1, r1, #1
    cmp r1, #8
    blt SkipReset
    mov r1, #0

SkipReset:
    str r1, [r0]

    ldr r2, GPIO_PORTF_DATA_R

    mov r3, #0
    str r3, [r2]

    cmp r1, #1
    bne Check2
    mov r3, #0x02
    str r3, [r2]
    b End

Check2:
    cmp r1, #2
    bne Check3
    mov r3, #0x04
    str r3, [r2]
    b End

Check3:
    cmp r1, #3
    bne Check4
    mov r3, #0x06
    str r3, [r2]
    b End

Check4:
    cmp r1, #4
    bne Check5
    mov r3, #0x08
    str r3, [r2]
    b End

Check5:
    cmp r1, #5
    bne Check6
    mov r3, #0x0A
    str r3, [r2]
    b End

Check6:
    cmp r1, #6
    bne Check7
    mov r3, #0x0C
    str r3, [r2]
    b End

Check7:
    cmp r1, #7
    bne End
    mov r3, #0x0E
    str r3, [r2]

End:
    pop {r4-r7, lr}
    bx lr
