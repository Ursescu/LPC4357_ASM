.include "lpc4357.inc"

.equ DIR_0, 0x2000
.equ DIR_1, 0x2004
.equ DIR_2, 0x2008
.equ DIR_3, 0x200C
.equ DIR_4, 0x2010
.equ DIR_5, 0x2014
.equ DIR_6, 0x2018
.equ DIR_7, 0x201C
.equ DIR_SIZE, 0x4


.global _gpio_set_dir_out
.type _gpio_set_dir_out, %function

_gpio_set_dir_out: @ r1 = port, r2 = pin
    push {r4, r5, r6}
    ldr r4, =LPC_GPIO_PORT_BASE
    mov r6, #DIR_SIZE
    mul r1, r6
    ldr r6, =DIR_0
    add r1, r6

    add r4, r1

    ldr r5, [r4]

    mov r6, #1
    lsl r6, r6, r2

    orr r5, r6 @ port |= 1 << pin

    str r5, [r4]
    pop {r4, r5, r6}

    bx lr


.size _gpio_set_dir_out, .-_gpio_set_dir_out

.global _gpio_set_dir_in
.type _gpio_set_dir_in, %function

_gpio_set_dir_in: @ r1 = port, r2 = pin
    push {r4, r5, r6}
    ldr r4, =LPC_GPIO_PORT_BASE
    mov r6, #DIR_SIZE
    mul r1, r6
    ldr r6, =DIR_0
    add r1, r6

    add r4, r1

    ldr r5, [r4]

    mov r6, #1
    lsl r6, r6, r2

    bic r5, r6 @ port &= ~(1 << pin)

    str r5, [r4]

    pop {r4, r5, r6}
    bx lr

.size _gpio_set_dir_in, .-_gpio_set_dir_in


.equ B_0, 0x0000
.equ B_1, 0x0020
.equ B_SIZE, 0x20

.global _gpio_set
.type _gpio_set, %function

_gpio_set: @ r1 = port, r2 = pin, r3 = val
    push {r4, r6}
    ldr r4, =LPC_GPIO_PORT_BASE

    mov r6, #B_SIZE
    mul r1, r6
    ldr r6, =B_0
    add r1, r6

    add r1, r2

    add r4, r1

    strb r3, [r4]

    pop {r4, r6}
    bx lr

.size _gpio_set, .-_gpio_set