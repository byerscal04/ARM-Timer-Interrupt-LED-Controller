    .thumb
    .text
    .global asm_main
    .ref PortF_Init
    .ref Timer2A_Init

asm_main:
    push {lr}

    bl PortF_Init
    bl Timer2A_Init

Forever:
    b   Forever
