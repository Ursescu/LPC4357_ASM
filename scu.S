.include "lpc4357.inc"

.equ PINS, 32
.equ PORTS, 16
.equ REG_SIZE, 4

.global _scu_sfsp
.type _scu_sfsp, %function
_scu_sfsp: @ r1 = port, r2 = pin, r3 = modefunc
    push {r4, r6}
    ldr r4, =LPC_SCU_BASE @ Load SCU base

    mov r6, #PINS @ Calculate the offset
    mul r1, r6

    add r1, r2

    mov r6, #REG_SIZE
    mul r1, r6

    add r4, r1 @ Add offset to base

    str r3, [r4] @ Write SCU pin modfunc

    pop {r4, r6}
    bx lr

.size _scu_sfsp, .-_scu_sfsp