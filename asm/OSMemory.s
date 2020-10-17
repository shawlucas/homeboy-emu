# OSMemory.c
.include "macros.inc"

.section .text, "ax"

.balign 4

OnReset:
/* 0A5C58 800AB1F8 7C0802A6 */  mflr    r0
/* 0A5C5C 800AB1FC 2C030000 */  cmpwi   r3, 0
/* 0A5C60 800AB200 90010004 */  stw     r0, 4(r1)
/* 0A5C64 800AB204 9421FFF8 */  stwu    r1, -8(r1)
/* 0A5C68 800AB208 41820018 */  beq     lbl_800AB220
/* 0A5C6C 800AB20C 3C60CC00 */  lis     r3, 0xcc00
/* 0A5C70 800AB210 380000FF */  li      r0, 0xff
/* 0A5C74 800AB214 B0034010 */  sth     r0, 0x4010(r3)
/* 0A5C78 800AB218 3C60F000 */  lis     r3, 0xf000
/* 0A5C7C 800AB21C 4BFFF91D */  bl      __OSMaskInterrupts
lbl_800AB220:
/* 0A5C80 800AB220 38600001 */  li      r3, 1
/* 0A5C84 800AB224 8001000C */  lwz     r0, 0xc(r1)
/* 0A5C88 800AB228 38210008 */  addi    r1, r1, 8
/* 0A5C8C 800AB22C 7C0803A6 */  mtlr    r0
/* 0A5C90 800AB230 4E800020 */  blr     

MEMIntrruptHandler:
/* 0A5C94 800AB234 7C0802A6 */  mflr    r0
/* 0A5C98 800AB238 3C60CC00 */  lis     r3, 0xcc00
/* 0A5C9C 800AB23C 90010004 */  stw     r0, 4(r1)
/* 0A5CA0 800AB240 39034000 */  addi    r8, r3, 0x4000
/* 0A5CA4 800AB244 38000000 */  li      r0, 0
/* 0A5CA8 800AB248 9421FFF8 */  stwu    r1, -8(r1)
/* 0A5CAC 800AB24C A0E34024 */  lhz     r7, 0x4024(r3)
/* 0A5CB0 800AB250 3C608014 */  lis     r3, __OSErrorTable@ha
/* 0A5CB4 800AB254 A0C80022 */  lhz     r6, 0x22(r8)
/* 0A5CB8 800AB258 38630C70 */  addi    r3, r3, __OSErrorTable@l
/* 0A5CBC 800AB25C A0A8001E */  lhz     r5, 0x1e(r8)
/* 0A5CC0 800AB260 50E6819E */  rlwimi  r6, r7, 0x10, 6, 0xf
/* 0A5CC4 800AB264 B0080020 */  sth     r0, 0x20(r8)
/* 0A5CC8 800AB268 8183003C */  lwz     r12, 0x3c(r3)
/* 0A5CCC 800AB26C 280C0000 */  cmplwi  r12, 0
/* 0A5CD0 800AB270 41820018 */  beq     lbl_800AB288
/* 0A5CD4 800AB274 7D8803A6 */  mtlr    r12
/* 0A5CD8 800AB278 3860000F */  li      r3, 0xf
/* 0A5CDC 800AB27C 4CC63182 */  crclr   6
/* 0A5CE0 800AB280 4E800021 */  blrl    
/* 0A5CE4 800AB284 4800000C */  b       lbl_800AB290
lbl_800AB288:
/* 0A5CE8 800AB288 3860000F */  li      r3, 0xf
/* 0A5CEC 800AB28C 4BFFF1A5 */  bl      __OSUnhandledException
lbl_800AB290:
/* 0A5CF0 800AB290 8001000C */  lwz     r0, 0xc(r1)
/* 0A5CF4 800AB294 38210008 */  addi    r1, r1, 8
/* 0A5CF8 800AB298 7C0803A6 */  mtlr    r0
/* 0A5CFC 800AB29C 4E800020 */  blr     

Config24MB:
/* 0A5D00 800AB2A0 38E00000 */  li      r7, 0
/* 0A5D04 800AB2A4 3C800000 */  lis     r4, 0
/* 0A5D08 800AB2A8 38840002 */  addi    r4, r4, 2
/* 0A5D0C 800AB2AC 3C608000 */  lis     r3, 0x8000
/* 0A5D10 800AB2B0 386301FF */  addi    r3, r3, 0x1ff
/* 0A5D14 800AB2B4 3CC00100 */  lis     r6, 0x100
/* 0A5D18 800AB2B8 38C60002 */  addi    r6, r6, 2
/* 0A5D1C 800AB2BC 3CA08100 */  lis     r5, 0x8100
/* 0A5D20 800AB2C0 38A500FF */  addi    r5, r5, 0xff
/* 0A5D24 800AB2C4 4C00012C */  isync   
/* 0A5D28 800AB2C8 7CF883A6 */  mtdbatu 0, r7
/* 0A5D2C 800AB2CC 7C9983A6 */  mtdbatl 0, r4
/* 0A5D30 800AB2D0 7C7883A6 */  mtdbatu 0, r3
/* 0A5D34 800AB2D4 4C00012C */  isync   
/* 0A5D38 800AB2D8 7CF083A6 */  mtibatu 0, r7
/* 0A5D3C 800AB2DC 7C9183A6 */  mtibatl 0, r4
/* 0A5D40 800AB2E0 7C7083A6 */  mtibatu 0, r3
/* 0A5D44 800AB2E4 4C00012C */  isync   
/* 0A5D48 800AB2E8 7CFC83A6 */  mtdbatu 2, r7
/* 0A5D4C 800AB2EC 7CDD83A6 */  mtdbatl 2, r6
/* 0A5D50 800AB2F0 7CBC83A6 */  mtdbatu 2, r5
/* 0A5D54 800AB2F4 4C00012C */  isync   
/* 0A5D58 800AB2F8 7CF483A6 */  mtibatu 2, r7
/* 0A5D5C 800AB2FC 7CD583A6 */  mtibatl 2, r6
/* 0A5D60 800AB300 7CB483A6 */  mtibatu 2, r5
/* 0A5D64 800AB304 4C00012C */  isync   
/* 0A5D68 800AB308 7C6000A6 */  mfmsr   r3
/* 0A5D6C 800AB30C 60630030 */  ori     r3, r3, 0x30
/* 0A5D70 800AB310 7C7B03A6 */  mtspr   0x1b, r3
/* 0A5D74 800AB314 7C6802A6 */  mflr    r3
/* 0A5D78 800AB318 7C7A03A6 */  mtspr   0x1a, r3
/* 0A5D7C 800AB31C 4C000064 */  rfi     

Config48MB:
/* 0A5D80 800AB320 38E00000 */  li      r7, 0
/* 0A5D84 800AB324 3C800000 */  lis     r4, 0
/* 0A5D88 800AB328 38840002 */  addi    r4, r4, 2
/* 0A5D8C 800AB32C 3C608000 */  lis     r3, 0x8000
/* 0A5D90 800AB330 386303FF */  addi    r3, r3, 0x3ff
/* 0A5D94 800AB334 3CC00200 */  lis     r6, 0x200
/* 0A5D98 800AB338 38C60002 */  addi    r6, r6, 2
/* 0A5D9C 800AB33C 3CA08200 */  lis     r5, 0x8200
/* 0A5DA0 800AB340 38A501FF */  addi    r5, r5, 0x1ff
/* 0A5DA4 800AB344 4C00012C */  isync   
/* 0A5DA8 800AB348 7CF883A6 */  mtdbatu 0, r7
/* 0A5DAC 800AB34C 7C9983A6 */  mtdbatl 0, r4
/* 0A5DB0 800AB350 7C7883A6 */  mtdbatu 0, r3
/* 0A5DB4 800AB354 4C00012C */  isync   
/* 0A5DB8 800AB358 7CF083A6 */  mtibatu 0, r7
/* 0A5DBC 800AB35C 7C9183A6 */  mtibatl 0, r4
/* 0A5DC0 800AB360 7C7083A6 */  mtibatu 0, r3
/* 0A5DC4 800AB364 4C00012C */  isync   
/* 0A5DC8 800AB368 7CFC83A6 */  mtdbatu 2, r7
/* 0A5DCC 800AB36C 7CDD83A6 */  mtdbatl 2, r6
/* 0A5DD0 800AB370 7CBC83A6 */  mtdbatu 2, r5
/* 0A5DD4 800AB374 4C00012C */  isync   
/* 0A5DD8 800AB378 7CF483A6 */  mtibatu 2, r7
/* 0A5DDC 800AB37C 7CD583A6 */  mtibatl 2, r6
/* 0A5DE0 800AB380 7CB483A6 */  mtibatu 2, r5
/* 0A5DE4 800AB384 4C00012C */  isync   
/* 0A5DE8 800AB388 7C6000A6 */  mfmsr   r3
/* 0A5DEC 800AB38C 60630030 */  ori     r3, r3, 0x30
/* 0A5DF0 800AB390 7C7B03A6 */  mtspr   0x1b, r3
/* 0A5DF4 800AB394 7C6802A6 */  mflr    r3
/* 0A5DF8 800AB398 7C7A03A6 */  mtspr   0x1a, r3
/* 0A5DFC 800AB39C 4C000064 */  rfi     

RealMode:
/* 0A5E00 800AB3A0 546300BE */  clrlwi  r3, r3, 2
/* 0A5E04 800AB3A4 7C7A03A6 */  mtspr   0x1a, r3
/* 0A5E08 800AB3A8 7C6000A6 */  mfmsr   r3
/* 0A5E0C 800AB3AC 54630732 */  rlwinm  r3, r3, 0, 0x1c, 0x19
/* 0A5E10 800AB3B0 7C7B03A6 */  mtspr   0x1b, r3
/* 0A5E14 800AB3B4 4C000064 */  rfi     

glabel __OSInitMemoryProtection
/* 0A5E18 800AB3B8 7C0802A6 */  mflr    r0
/* 0A5E1C 800AB3BC 90010004 */  stw     r0, 4(r1)
/* 0A5E20 800AB3C0 9421FFB0 */  stwu    r1, -0x50(r1)
/* 0A5E24 800AB3C4 BF61003C */  stmw    r27, 0x3c(r1)
/* 0A5E28 800AB3C8 3F608000 */  lis     r27, 0x8000
/* 0A5E2C 800AB3CC 83FB00F0 */  lwz     r31, 0xf0(r27)
/* 0A5E30 800AB3D0 4BFFF3A1 */  bl      OSDisableInterrupts
/* 0A5E34 800AB3D4 3C80CC00 */  lis     r4, 0xcc00
/* 0A5E38 800AB3D8 3B844000 */  addi    r28, r4, 0x4000
/* 0A5E3C 800AB3DC 38000000 */  li      r0, 0
/* 0A5E40 800AB3E0 B01C0020 */  sth     r0, 0x20(r28)
/* 0A5E44 800AB3E4 380000FF */  li      r0, 0xff
/* 0A5E48 800AB3E8 7C7E1B78 */  mr      r30, r3
/* 0A5E4C 800AB3EC B01C0010 */  sth     r0, 0x10(r28)
/* 0A5E50 800AB3F0 3C60F000 */  lis     r3, 0xf000
/* 0A5E54 800AB3F4 4BFFF745 */  bl      __OSMaskInterrupts
/* 0A5E58 800AB3F8 3C60800B */  lis     r3, MEMIntrruptHandler@ha
/* 0A5E5C 800AB3FC 3BA3B234 */  addi    r29, r3, MEMIntrruptHandler@l
/* 0A5E60 800AB400 7FA4EB78 */  mr      r4, r29
/* 0A5E64 800AB404 38600000 */  li      r3, 0
/* 0A5E68 800AB408 4BFFF3B5 */  bl      __OSSetInterruptHandler
/* 0A5E6C 800AB40C 7FA4EB78 */  mr      r4, r29
/* 0A5E70 800AB410 38600001 */  li      r3, 1
/* 0A5E74 800AB414 4BFFF3A9 */  bl      __OSSetInterruptHandler
/* 0A5E78 800AB418 7FA4EB78 */  mr      r4, r29
/* 0A5E7C 800AB41C 38600002 */  li      r3, 2
/* 0A5E80 800AB420 4BFFF39D */  bl      __OSSetInterruptHandler
/* 0A5E84 800AB424 7FA4EB78 */  mr      r4, r29
/* 0A5E88 800AB428 38600003 */  li      r3, 3
/* 0A5E8C 800AB42C 4BFFF391 */  bl      __OSSetInterruptHandler
/* 0A5E90 800AB430 7FA4EB78 */  mr      r4, r29
/* 0A5E94 800AB434 38600004 */  li      r3, 4
/* 0A5E98 800AB438 4BFFF385 */  bl      __OSSetInterruptHandler
/* 0A5E9C 800AB43C 3C608010 */  lis     r3, ResetFunctionInfo@ha
/* 0A5EA0 800AB440 3863F3F0 */  addi    r3, r3, ResetFunctionInfo@l
/* 0A5EA4 800AB444 48000459 */  bl      OSRegisterResetFunction
/* 0A5EA8 800AB448 807B00F0 */  lwz     r3, 0xf0(r27)
/* 0A5EAC 800AB44C 801B0028 */  lwz     r0, 0x28(r27)
/* 0A5EB0 800AB450 7C030040 */  cmplw   r3, r0
/* 0A5EB4 800AB454 40800024 */  bge     lbl_800AB478
/* 0A5EB8 800AB458 3C03FE80 */  addis   r0, r3, 0xfe80
/* 0A5EBC 800AB45C 28000000 */  cmplwi  r0, 0
/* 0A5EC0 800AB460 40820018 */  bne     lbl_800AB478
/* 0A5EC4 800AB464 3C608180 */  lis     r3, 0x8180
/* 0A5EC8 800AB468 3C800180 */  lis     r4, 0x180
/* 0A5ECC 800AB46C 4BFFDD59 */  bl      DCInvalidateRange
/* 0A5ED0 800AB470 38000002 */  li      r0, 2
/* 0A5ED4 800AB474 B01C0028 */  sth     r0, 0x28(r28)
lbl_800AB478:
/* 0A5ED8 800AB478 3C000180 */  lis     r0, 0x180
/* 0A5EDC 800AB47C 7C1F0040 */  cmplw   r31, r0
/* 0A5EE0 800AB480 41810014 */  bgt     lbl_800AB494
/* 0A5EE4 800AB484 3C60800B */  lis     r3, Config24MB@ha
/* 0A5EE8 800AB488 3863B2A0 */  addi    r3, r3, Config24MB@l
/* 0A5EEC 800AB48C 4BFFFF15 */  bl      RealMode
/* 0A5EF0 800AB490 4800001C */  b       lbl_800AB4AC
lbl_800AB494:
/* 0A5EF4 800AB494 3C000300 */  lis     r0, 0x300
/* 0A5EF8 800AB498 7C1F0040 */  cmplw   r31, r0
/* 0A5EFC 800AB49C 41810010 */  bgt     lbl_800AB4AC
/* 0A5F00 800AB4A0 3C60800B */  lis     r3, Config48MB@ha
/* 0A5F04 800AB4A4 3863B320 */  addi    r3, r3, Config48MB@l
/* 0A5F08 800AB4A8 4BFFFEF9 */  bl      RealMode
lbl_800AB4AC:
/* 0A5F0C 800AB4AC 3C600800 */  lis     r3, 0x800
/* 0A5F10 800AB4B0 4BFFF711 */  bl      __OSUnmaskInterrupts
/* 0A5F14 800AB4B4 7FC3F378 */  mr      r3, r30
/* 0A5F18 800AB4B8 4BFFF2E1 */  bl      OSRestoreInterrupts
/* 0A5F1C 800AB4BC BB61003C */  lmw     r27, 0x3c(r1)
/* 0A5F20 800AB4C0 80010054 */  lwz     r0, 0x54(r1)
/* 0A5F24 800AB4C4 38210050 */  addi    r1, r1, 0x50
/* 0A5F28 800AB4C8 7C0803A6 */  mtlr    r0
/* 0A5F2C 800AB4CC 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FC470 800FF3F0 0010 */
ResetFunctionInfo:
    .long OnReset, 0x0000007F, 0x00000000, 0x00000000


