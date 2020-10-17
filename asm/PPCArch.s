# PPCArch.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel PPCMfmsr
/* 0A1F90 800A7530 7C6000A6 */  mfmsr   r3
/* 0A1F94 800A7534 4E800020 */  blr     

glabel PPCMtmsr
/* 0A1F98 800A7538 7C600124 */  mtmsr   r3
/* 0A1F9C 800A753C 4E800020 */  blr     

glabel PPCMfhid0
/* 0A1FA0 800A7540 7C70FAA6 */  mfspr   r3, 0x3f0
/* 0A1FA4 800A7544 4E800020 */  blr     

glabel PPCMthid0
/* 0A1FA8 800A7548 7C70FBA6 */  mtspr   0x3f0, r3
/* 0A1FAC 800A754C 4E800020 */  blr     

glabel PPCMfl2cr
/* 0A1FB0 800A7550 7C79FAA6 */  mfspr   r3, 0x3f9
/* 0A1FB4 800A7554 4E800020 */  blr     

glabel PPCMtl2cr
/* 0A1FB8 800A7558 7C79FBA6 */  mtspr   0x3f9, r3
/* 0A1FBC 800A755C 4E800020 */  blr     

glabel PPCMtdec
/* 0A1FC0 800A7560 7C7603A6 */  mtspr   0x16, r3
/* 0A1FC4 800A7564 4E800020 */  blr     

glabel PPCSync
/* 0A1FC8 800A7568 44000002 */  sc      
/* 0A1FCC 800A756C 4E800020 */  blr     

glabel PPCHalt
/* 0A1FD0 800A7570 7C0004AC */  sync    0
lbl_800A7574:
/* 0A1FD4 800A7574 60000000 */  nop     
/* 0A1FD8 800A7578 38600000 */  li      r3, 0
/* 0A1FDC 800A757C 60000000 */  nop     
/* 0A1FE0 800A7580 4BFFFFF4 */  b       lbl_800A7574

glabel PPCMtmmcr0
/* 0A1FE4 800A7584 7C78EBA6 */  mtspr   0x3b8, r3
/* 0A1FE8 800A7588 4E800020 */  blr     

glabel PPCMtmmcr1
/* 0A1FEC 800A758C 7C7CEBA6 */  mtspr   0x3bc, r3
/* 0A1FF0 800A7590 4E800020 */  blr     

glabel PPCMtpmc1
/* 0A1FF4 800A7594 7C79EBA6 */  mtspr   0x3b9, r3
/* 0A1FF8 800A7598 4E800020 */  blr     

glabel PPCMtpmc2
/* 0A1FFC 800A759C 7C7AEBA6 */  mtspr   0x3ba, r3
/* 0A2000 800A75A0 4E800020 */  blr     

glabel PPCMtpmc3
/* 0A2004 800A75A4 7C7DEBA6 */  mtspr   0x3bd, r3
/* 0A2008 800A75A8 4E800020 */  blr     

glabel PPCMtpmc4
/* 0A200C 800A75AC 7C7EEBA6 */  mtspr   0x3be, r3
/* 0A2010 800A75B0 4E800020 */  blr     

glabel PPCMffpscr
/* 0A2014 800A75B4 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0A2018 800A75B8 DBE10010 */  stfd    f31, 0x10(r1)
/* 0A201C 800A75BC FFE0048E */  mffs    f31
/* 0A2020 800A75C0 DBE10008 */  stfd    f31, 8(r1)
/* 0A2024 800A75C4 8061000C */  lwz     r3, 0xc(r1)
/* 0A2028 800A75C8 CBE10010 */  lfd     f31, 0x10(r1)
/* 0A202C 800A75CC 38210018 */  addi    r1, r1, 0x18
/* 0A2030 800A75D0 4E800020 */  blr     

glabel PPCMtfpscr
/* 0A2034 800A75D4 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0A2038 800A75D8 DBE10018 */  stfd    f31, 0x18(r1)
/* 0A203C 800A75DC 38800000 */  li      r4, 0
/* 0A2040 800A75E0 90810010 */  stw     r4, 0x10(r1)
/* 0A2044 800A75E4 90610014 */  stw     r3, 0x14(r1)
/* 0A2048 800A75E8 CBE10010 */  lfd     f31, 0x10(r1)
/* 0A204C 800A75EC FDFEFD8E */  mtfsf   0xff, f31
/* 0A2050 800A75F0 CBE10018 */  lfd     f31, 0x18(r1)
/* 0A2054 800A75F4 38210020 */  addi    r1, r1, 0x20
/* 0A2058 800A75F8 4E800020 */  blr     

glabel PPCMfhid2
/* 0A205C 800A75FC 7C78E2A6 */  mfspr   r3, 0x398
/* 0A2060 800A7600 4E800020 */  blr     

glabel PPCMthid2
/* 0A2064 800A7604 7C78E3A6 */  mtspr   0x398, r3
/* 0A2068 800A7608 4E800020 */  blr     

glabel PPCMtwpar
/* 0A206C 800A760C 7C79E3A6 */  mtspr   0x399, r3
/* 0A2070 800A7610 4E800020 */  blr     

glabel PPCDisableSpeculation
/* 0A2074 800A7614 7C0802A6 */  mflr    r0
/* 0A2078 800A7618 90010004 */  stw     r0, 4(r1)
/* 0A207C 800A761C 9421FFF8 */  stwu    r1, -8(r1)
/* 0A2080 800A7620 4BFFFF21 */  bl      PPCMfhid0
/* 0A2084 800A7624 60630200 */  ori     r3, r3, 0x200
/* 0A2088 800A7628 4BFFFF21 */  bl      PPCMthid0
/* 0A208C 800A762C 8001000C */  lwz     r0, 0xc(r1)
/* 0A2090 800A7630 38210008 */  addi    r1, r1, 8
/* 0A2094 800A7634 7C0803A6 */  mtlr    r0
/* 0A2098 800A7638 4E800020 */  blr     

glabel PPCSetFpNonIEEEMode
/* 0A209C 800A763C FFA0004C */  mtfsb1  0x1d
/* 0A20A0 800A7640 4E800020 */  blr     


