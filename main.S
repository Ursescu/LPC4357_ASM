.include "lpc4357.inc"

.section .data
.global flag
.type flag, %object
flag: .word 1234
.size flag, .-flag

@ Board led struct
.set board_led_port, 0
.set board_led_pin, 1
.set board_led_entry_size, 2

.global board_leds_table
.type board_leds_table, %object
board_leds_table:
    @ PD_10
    .byte 0x06
    .byte 0x18

    @ PD_11
    .byte 0x06
    .byte 0x19

    @ PD_12
    .byte 0x06
    .byte 0x1a

    @ PD_13
    .byte 0x06
    .byte 0x1b

    @ PD_14
    .byte 0x06
    .byte 0x1c

    @ P9_0
    .byte 0x04
    .byte 0x0c

    @ P9_1
    .byte 0x04
    .byte 0x0d

    @ P9_2
    .byte 0x04
    .byte 0x0e

.size board_leds_table, .-board_leds_table
.set board_leds_table_size, (.-board_leds_table) / board_led_entry_size

@ Pin mux structs
.set pinmux_port, 0
.set pinmux_pin, 1
.set pinmux_modefunc, 2
.set pinmux_entry_size, 6

.global pinmux_table
.type pinmux_table, %object
pinmux_table:
    @ PD_10
    .byte 0xd
    .byte 0xa
    .word ( SCU_EZI | SCU_EPUN | SCU_MODFUNC_4)

    @ PD_11
    .byte 0xd
    .byte 0xb
    .word ( SCU_EZI | SCU_EPUN | SCU_MODFUNC_4)

    @ PD_12
    .byte 0xd
    .byte 0xc
    .word ( SCU_EZI | SCU_EPUN | SCU_MODFUNC_4)

    @ PD_13
    .byte 0xd
    .byte 0xd
    .word ( SCU_EZI | SCU_EPUN | SCU_MODFUNC_4)

    @ PD_14
    .byte 0xd
    .byte 0xe
    .word ( SCU_EZI | SCU_EPUN | SCU_MODFUNC_4)

    @ P9_0
    .byte 0x9
    .byte 0x0
    .word ( SCU_EZI | SCU_EPUN | SCU_MODFUNC_0)

    @ P9_1
    .byte 0x9
    .byte 0x1
    .word ( SCU_EZI | SCU_EPUN | SCU_MODFUNC_0)

    @ P9_2
    .byte 0x9
    .byte 0x2
    .word ( SCU_EZI | SCU_EPUN | SCU_MODFUNC_0)

.size pinmux_table, .-pinmux_table
.set pinmux_table_size, (.-pinmux_table) / pinmux_entry_size

.section .text
.global main
.extern _scu_sfsp
.extern _gpio_set
.extern _gpio_set_dir_out
.type main, %function

main:

    ldr r4, =pinmux_table
    mov r5, #0
    mov r6, #0

.Lmain_for_pinmux:
    cmp r5, #pinmux_table_size
    beq .Lmain_exit_pinmux

    ldrb r1, [r4, #pinmux_port]
    ldrb r2, [r4, #pinmux_pin]

    ldr r7,=pinmux_modefunc
    ldr r3, [r4, r7]

    bl _scu_sfsp
    
    ldr r7, =pinmux_entry_size

    add r4, r7
    add r5, #1
    b .Lmain_for_pinmux

.Lmain_exit_pinmux:

    ldr r4, =board_leds_table
    mov r5, #0

.Lmain_for_gpio:
    cmp r5, #board_leds_table_size
    beq .Lmain_exit_gpio

    ldrb r1, [r4, #board_led_port]
    ldrb r2, [r4, #board_led_pin]
    bl _gpio_set_dir_out

    ldr r7, =board_led_entry_size
    add r4, r7
    add r5, #1
    b .Lmain_for_gpio

.Lmain_exit_gpio:

    mov r5, #0
    push {r5}

.Lmain_loop:
    pop {r5}
    mov r6, #0
    orn r5, r6, r5
    push {r5}
    bl looping
    b .Lmain_loop

.size main, .-main

.section .text
looping: @ wait some time here
    push {lr}
    ldr r1, =0x100000

.Llooping_loop:
    sub r1, #1
    cbz r1, .Lnext

    b .Llooping_loop
.Lnext:

    cbnz r5, .Llooping_non_set

    mov r1, #1
    bl set_led

    b .Llooping_exit

.Llooping_non_set:

    mov r1, #0
    bl set_led

.Llooping_exit:
    pop {pc}


set_led: @ r1 = on/off
    push {r2, r4, r5, r6, lr}
    ldr r4, =board_leds_table
    mov r6, r1
    mov r5, #0

.Lset_led_for_gpio:
    cmp r5, #board_leds_table_size
    beq .Lset_led_exit_gpio

    ldrb r1, [r4, #board_led_port]
    ldrb r2, [r4, #board_led_pin]
    mov r3, r6
    bl _gpio_set

    ldr r7, =board_led_entry_size
    add r4, r7
    add r5, #1
    b .Lset_led_for_gpio

.Lset_led_exit_gpio:

    pop {r2, r4, r5, r6, pc}

