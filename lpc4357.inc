@ Base addresses for LPC4357

.equ LPC_SCT_BASE,             0x40000000
.equ LPC_GPDMA_BASE,           0x40002000
.equ LPC_SPIFI_BASE,           0x40003000
.equ LPC_SDMMC_BASE,           0x40004000
.equ LPC_EMC_BASE,             0x40005000
.equ LPC_USB0_BASE,            0x40006000
.equ LPC_USB1_BASE,            0x40007000
.equ LPC_LCD_BASE,             0x40008000
.equ LPC_FMCA_BASE,            0x4000C000
.equ LPC_FMCB_BASE,            0x4000D000
.equ LPC_ETHERNET_BASE,        0x40010000
.equ LPC_ATIMER_BASE,          0x40040000
.equ LPC_REGFILE_BASE,         0x40041000
.equ LPC_PMC_BASE,             0x40042000
.equ LPC_CREG_BASE,            0x40043000
.equ LPC_EVRT_BASE,            0x40044000
.equ LPC_OTP_BASE,             0x40045000
.equ LPC_RTC_BASE,             0x40046000
.equ LPC_CGU_BASE,             0x40050000
.equ LPC_CCU1_BASE,            0x40051000
.equ LPC_CCU2_BASE,            0x40052000
.equ LPC_RGU_BASE,             0x40053000
.equ LPC_WWDT_BASE,            0x40080000
.equ LPC_USART0_BASE,          0x40081000
.equ LPC_USART2_BASE,          0x400C1000
.equ LPC_USART3_BASE,          0x400C2000
.equ LPC_UART1_BASE,           0x40082000
.equ LPC_SSP0_BASE,            0x40083000
.equ LPC_SSP1_BASE,            0x400C5000
.equ LPC_TIMER0_BASE,          0x40084000
.equ LPC_TIMER1_BASE,          0x40085000
.equ LPC_TIMER2_BASE,          0x400C3000
.equ LPC_TIMER3_BASE,          0x400C4000
.equ LPC_SCU_BASE,             0x40086000
.equ LPC_PIN_INT_BASE,         0x40087000
.equ LPC_GPIO_GROUP_INT0_BASE, 0x40088000
.equ LPC_GPIO_GROUP_INT1_BASE, 0x40089000
.equ LPC_MCPWM_BASE,           0x400A0000
.equ LPC_I2C0_BASE,            0x400A1000
.equ LPC_I2C1_BASE,            0x400E0000
.equ LPC_I2S0_BASE,            0x400A2000
.equ LPC_I2S1_BASE,            0x400A3000
.equ LPC_C_CAN1_BASE,          0x400A4000
.equ LPC_RITIMER_BASE,         0x400C0000
.equ LPC_QEI_BASE,             0x400C6000
.equ LPC_GIMA_BASE,            0x400C7000
.equ LPC_DAC_BASE,             0x400E1000
.equ LPC_C_CAN0_BASE,          0x400E2000
.equ LPC_ADC0_BASE,            0x400E3000
.equ LPC_ADC1_BASE,            0x400E4000
.equ LPC_ADCHS_BASE,           0x400F0000
.equ LPC_GPIO_PORT_BASE,       0x400F4000
.equ LPC_SPI_BASE,             0x40100000
.equ LPC_SGPIO_BASE,           0x40101000
.equ LPC_EEPROM_BASE,          0x4000E000
.equ LPC_ROM_API_BASE,         0x10400100



@ SCU flags

.equ SCU_MODFUNC_0, 0x00
.equ SCU_MODFUNC_1, 0x01
.equ SCU_MODFUNC_2, 0x02
.equ SCU_MODFUNC_3, 0x03
.equ SCU_MODFUNC_4, 0x04
.equ SCU_MODFUNC_5, 0x05
.equ SCU_MODFUNC_6, 0x06
.equ SCU_MODFUNC_7, 0x07

.equ SCU_EPD, (0x1 << 3)
.equ SCU_EPUN, (0x1 << 4)
.equ SCU_EHS, (0x1 << 5)
.equ SCU_EZI, (0x1 << 6)
.equ SCU_ZIF, (0x1 << 7)

