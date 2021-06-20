.section .after_vectors
.weak NMI_Handler
.weak HardFault_Handler
.weak MemManage_Handler
.weak BusFault_Handler
.weak UsageFault_Handler
.weak SVC_Handler
.weak DebugMon_Handler
.weak PendSV_Handler
.weak SysTick_Handler
.weak DefaultInt_Handler

.weak DAC_IRQHandler
.weak M0APP_IRQHandler
.weak DMA_IRQHandler
.weak FLASH_EEPROM_IRQHandler
.weak ETH_IRQHandler
.weak SDIO_IRQHandler
.weak LCD_IRQHandler
.weak USB0_IRQHandler
.weak USB1_IRQHandler
.weak SCT_IRQHandler
.weak RIT_IRQHandler
.weak TIMER0_IRQHandler
.weak TIMER1_IRQHandler
.weak TIMER2_IRQHandler
.weak TIMER3_IRQHandler
.weak MCPWM_IRQHandler
.weak ADC0_IRQHandler
.weak I2C0_IRQHandler
.weak I2C1_IRQHandler
.weak SPI_IRQHandler
.weak ADC1_IRQHandler
.weak SSP0_IRQHandler
.weak SSP1_IRQHandler
.weak UART0_IRQHandler
.weak UART1_IRQHandler
.weak UART2_IRQHandler
.weak UART3_IRQHandler
.weak I2S0_IRQHandler
.weak I2S1_IRQHandler
.weak SPIFI_IRQHandler
.weak SGPIO_IRQHandler
.weak GPIO0_IRQHandler
.weak GPIO1_IRQHandler
.weak GPIO2_IRQHandler
.weak GPIO3_IRQHandler
.weak GPIO4_IRQHandler
.weak GPIO5_IRQHandler
.weak GPIO6_IRQHandler
.weak GPIO7_IRQHandler
.weak GINT0_IRQHandler
.weak GINT1_IRQHandler
.weak EVRT_IRQHandler
.weak CAN1_IRQHandler
.weak ADCHS_IRQHandler
.weak ATIMER_IRQHandler
.weak RTC_IRQHandler
.weak WDT_IRQHandler
.weak M0SUB_IRQHandler
.weak CAN0_IRQHandler
.weak QEI_IRQHandler

NMI_Handler:
    ldr r3,=0x20000000

HardFault_Handler:
    ldr r3,=0x20000000

MemManage_Handler:
    ldr r3,=0x20000000

BusFault_Handler:
    ldr r3,=0x20000000

UsageFault_Handler:
    ldr r3,=0x20000000

SVC_Handler:
    ldr r3,=0x20000000

DebugMon_Handler:
    ldr r3,=0x20000000

PendSV_Handler:
    ldr r3,=0x20000000

SysTick_Handler:
    ldr r3,=0x20000000

DefaultInt_Handler:
    ldr r3,=0x20000000

// Default handlers to DefaultInt_Handler
DAC_IRQHandler = DefaultInt_Handler
M0APP_IRQHandler = DefaultInt_Handler
DMA_IRQHandler = DefaultInt_Handler
FLASH_EEPROM_IRQHandler = DefaultInt_Handler
ETH_IRQHandler = DefaultInt_Handler
SDIO_IRQHandler = DefaultInt_Handler
LCD_IRQHandler = DefaultInt_Handler
USB0_IRQHandler = DefaultInt_Handler
USB1_IRQHandler = DefaultInt_Handler
SCT_IRQHandler = DefaultInt_Handler
RIT_IRQHandler = DefaultInt_Handler
TIMER0_IRQHandler = DefaultInt_Handler
TIMER1_IRQHandler = DefaultInt_Handler
TIMER2_IRQHandler = DefaultInt_Handler
TIMER3_IRQHandler = DefaultInt_Handler
MCPWM_IRQHandler = DefaultInt_Handler
ADC0_IRQHandler = DefaultInt_Handler
I2C0_IRQHandler = DefaultInt_Handler
I2C1_IRQHandler = DefaultInt_Handler
SPI_IRQHandler = DefaultInt_Handler
ADC1_IRQHandler = DefaultInt_Handler
SSP0_IRQHandler = DefaultInt_Handler
SSP1_IRQHandler = DefaultInt_Handler
UART0_IRQHandler = DefaultInt_Handler
UART1_IRQHandler = DefaultInt_Handler
UART2_IRQHandler = DefaultInt_Handler
UART3_IRQHandler = DefaultInt_Handler
I2S0_IRQHandler = DefaultInt_Handler
I2S1_IRQHandler = DefaultInt_Handler
SPIFI_IRQHandler = DefaultInt_Handler
SGPIO_IRQHandler = DefaultInt_Handler
GPIO0_IRQHandler = DefaultInt_Handler
GPIO1_IRQHandler = DefaultInt_Handler
GPIO2_IRQHandler = DefaultInt_Handler
GPIO3_IRQHandler = DefaultInt_Handler
GPIO4_IRQHandler = DefaultInt_Handler
GPIO5_IRQHandler = DefaultInt_Handler
GPIO6_IRQHandler = DefaultInt_Handler
GPIO7_IRQHandler = DefaultInt_Handler
GINT0_IRQHandler = DefaultInt_Handler
GINT1_IRQHandler = DefaultInt_Handler
EVRT_IRQHandler = DefaultInt_Handler
CAN1_IRQHandler = DefaultInt_Handler
ADCHS_IRQHandler = DefaultInt_Handler
ATIMER_IRQHandler = DefaultInt_Handler
RTC_IRQHandler = DefaultInt_Handler
WDT_IRQHandler = DefaultInt_Handler
M0SUB_IRQHandler = DefaultInt_Handler
CAN0_IRQHandler = DefaultInt_Handler
QEI_IRQHandler = DefaultInt_Handler

@ Isr vectors
.section .isr_vector

.global isrVector
.extern _vStackTop
.extern ResetISR
.type isrVector, %object

isrVector:

@ Cortex M4 default irqs
.word _vStackTop            // 0
.word ResetISR              // 1
.word NMI_Handler           // 2
.word HardFault_Handler     // 3
.word MemManage_Handler     // 4
.word BusFault_Handler      // 5
.word UsageFault_Handler    // 6
.word 0                     // 7    @ Reserved
.word 0                     // 8    @ Reserved
.word 0                     // 9    @ Reserved
.word 0                     // 10   @ Reserved
.word SVC_Handler           // 11
.word DebugMon_Handler      // 12
.word 0                     // 13   @ Reserved
.word PendSV_Handler        // 14
.word SysTick_Handler       // 15

@ Chip Level Cortex M4
.word DAC_IRQHandler           // 16
.word M0APP_IRQHandler         // 17
.word DMA_IRQHandler           // 18
.word 0                        // 19
.word FLASH_EEPROM_IRQHandler  // 20 ORed flash Bank A flash Bank B EEPROM interrupts
.word ETH_IRQHandler           // 21
.word SDIO_IRQHandler          // 22
.word LCD_IRQHandler           // 23
.word USB0_IRQHandler          // 24
.word USB1_IRQHandler          // 25
.word SCT_IRQHandler           // 26
.word RIT_IRQHandler           // 27
.word TIMER0_IRQHandler        // 28
.word TIMER1_IRQHandler        // 29
.word TIMER2_IRQHandler        // 30
.word TIMER3_IRQHandler        // 31
.word MCPWM_IRQHandler         // 32
.word ADC0_IRQHandler          // 33
.word I2C0_IRQHandler          // 34
.word I2C1_IRQHandler          // 35
.word SPI_IRQHandler           // 36
.word ADC1_IRQHandler          // 37
.word SSP0_IRQHandler          // 38
.word SSP1_IRQHandler          // 39
.word UART0_IRQHandler         // 40
.word UART1_IRQHandler         // 41
.word UART2_IRQHandler         // 42
.word UART3_IRQHandler         // 43
.word I2S0_IRQHandler          // 44
.word I2S1_IRQHandler          // 45
.word SPIFI_IRQHandler         // 46
.word SGPIO_IRQHandler         // 47
.word GPIO0_IRQHandler         // 48
.word GPIO1_IRQHandler         // 49
.word GPIO2_IRQHandler         // 50
.word GPIO3_IRQHandler         // 51
.word GPIO4_IRQHandler         // 52
.word GPIO5_IRQHandler         // 53
.word GPIO6_IRQHandler         // 54
.word GPIO7_IRQHandler         // 55
.word GINT0_IRQHandler         // 56
.word GINT1_IRQHandler         // 57
.word EVRT_IRQHandler          // 58
.word CAN1_IRQHandler          // 59
.word 0                        // 60
.word ADCHS_IRQHandler         // 61 ADCHS combined interrupt
.word ATIMER_IRQHandler        // 62
.word RTC_IRQHandler           // 63
.word 0                        // 64
.word WDT_IRQHandler           // 65
.word M0SUB_IRQHandler         // 66
.word CAN0_IRQHandler          // 67
.word QEI_IRQHandler           // 68

.size isrVector, .-isrVector
