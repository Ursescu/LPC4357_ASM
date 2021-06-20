.extern __data_section_table;
.extern __data_section_table_end;
.extern __bss_section_table;
.extern __bss_section_table_end;

.include "lpc4357.inc"

.global ResetISR
.extern main
.type ResetISR, %function
@ Entry point, reset vector
ResetISR:
    cpsid i             // disable interrupts

    ldr r1, =__data_section_table
    ldr r2, =__data_section_table_end
.LResetISR_copy:

    ldr r3, [r1]
    ldr r4, [r1, #4]
    ldr r5, [r1, #8]

    bl __copy_data

    add r1, #12

    cmp r1, r2 @ Done copying data
    beq .LResetISR_copy_exit
    b .LResetISR_copy

.LResetISR_copy_exit:
    cpsie i             // enable interrupts

    bl main             // call main
.LResetISR_loop:
    nop
    b .LResetISR_loop

.size ResetISR, .-ResetISR

.section .text
__copy_data: @ r3 = flash addr, r4 = data addr, r5 = size
    push {r1, r2, r6}

    mov r1, #0

.L__copy_data_loop:

    cmp r1, r5
    beq .L__copy_data_exit

    ldrb r6, [r3, r1]

    strb r6, [r4, r1]

    add r1, #1
    b .L__copy_data_loop

.L__copy_data_exit:

    pop {r1, r2, r6}
    bx lr


.size __copy_data, .-__copy_data
