# ai.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel AIRegisterDMACallback
/* 0BEB70 800C4110 7C0802A6 */  mflr    r0
/* 0BEB74 800C4114 90010004 */  stw     r0, 4(r1)
/* 0BEB78 800C4118 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BEB7C 800C411C 93E10014 */  stw     r31, 0x14(r1)
/* 0BEB80 800C4120 93C10010 */  stw     r30, 0x10(r1)
/* 0BEB84 800C4124 7C7E1B78 */  mr      r30, r3
/* 0BEB88 800C4128 83ED941C */  lwz     r31, __AID_Callback-_SDA_BASE_(r13)
/* 0BEB8C 800C412C 4BFE6645 */  bl      OSDisableInterrupts
/* 0BEB90 800C4130 93CD941C */  stw     r30, __AID_Callback-_SDA_BASE_(r13)
/* 0BEB94 800C4134 4BFE6665 */  bl      OSRestoreInterrupts
/* 0BEB98 800C4138 7FE3FB78 */  mr      r3, r31
/* 0BEB9C 800C413C 8001001C */  lwz     r0, 0x1c(r1)
/* 0BEBA0 800C4140 83E10014 */  lwz     r31, 0x14(r1)
/* 0BEBA4 800C4144 83C10010 */  lwz     r30, 0x10(r1)
/* 0BEBA8 800C4148 38210018 */  addi    r1, r1, 0x18
/* 0BEBAC 800C414C 7C0803A6 */  mtlr    r0
/* 0BEBB0 800C4150 4E800020 */  blr     

glabel AIInitDMA
/* 0BEBB4 800C4154 7C0802A6 */  mflr    r0
/* 0BEBB8 800C4158 90010004 */  stw     r0, 4(r1)
/* 0BEBBC 800C415C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BEBC0 800C4160 93E10014 */  stw     r31, 0x14(r1)
/* 0BEBC4 800C4164 3BE40000 */  addi    r31, r4, 0
/* 0BEBC8 800C4168 93C10010 */  stw     r30, 0x10(r1)
/* 0BEBCC 800C416C 3BC30000 */  addi    r30, r3, 0
/* 0BEBD0 800C4170 4BFE6601 */  bl      OSDisableInterrupts
/* 0BEBD4 800C4174 3C80CC00 */  lis     r4, 0xcc00
/* 0BEBD8 800C4178 A0045030 */  lhz     r0, 0x5030(r4)
/* 0BEBDC 800C417C 38A45000 */  addi    r5, r4, 0x5000
/* 0BEBE0 800C4180 38C45000 */  addi    r6, r4, 0x5000
/* 0BEBE4 800C4184 38E45000 */  addi    r7, r4, 0x5000
/* 0BEBE8 800C4188 5404002A */  rlwinm  r4, r0, 0, 0, 0x15
/* 0BEBEC 800C418C 57C0843E */  srwi    r0, r30, 0x10
/* 0BEBF0 800C4190 7C800378 */  or      r0, r4, r0
/* 0BEBF4 800C4194 B0050030 */  sth     r0, 0x30(r5)
/* 0BEBF8 800C4198 57C0043E */  clrlwi  r0, r30, 0x10
/* 0BEBFC 800C419C A0860032 */  lhz     r4, 0x32(r6)
/* 0BEC00 800C41A0 548406DE */  rlwinm  r4, r4, 0, 0x1b, 0xf
/* 0BEC04 800C41A4 7C800378 */  or      r0, r4, r0
/* 0BEC08 800C41A8 B0060032 */  sth     r0, 0x32(r6)
/* 0BEC0C 800C41AC 57E0DC3E */  rlwinm  r0, r31, 0x1b, 0x10, 0x1f
/* 0BEC10 800C41B0 A0870036 */  lhz     r4, 0x36(r7)
/* 0BEC14 800C41B4 54840020 */  rlwinm  r4, r4, 0, 0, 0x10
/* 0BEC18 800C41B8 7C800378 */  or      r0, r4, r0
/* 0BEC1C 800C41BC B0070036 */  sth     r0, 0x36(r7)
/* 0BEC20 800C41C0 4BFE65D9 */  bl      OSRestoreInterrupts
/* 0BEC24 800C41C4 8001001C */  lwz     r0, 0x1c(r1)
/* 0BEC28 800C41C8 83E10014 */  lwz     r31, 0x14(r1)
/* 0BEC2C 800C41CC 83C10010 */  lwz     r30, 0x10(r1)
/* 0BEC30 800C41D0 38210018 */  addi    r1, r1, 0x18
/* 0BEC34 800C41D4 7C0803A6 */  mtlr    r0
/* 0BEC38 800C41D8 4E800020 */  blr     

glabel AIGetDMAEnableFlag
/* 0BEC3C 800C41DC 3C60CC00 */  lis     r3, 0xcc00
/* 0BEC40 800C41E0 A0035036 */  lhz     r0, 0x5036(r3)
/* 0BEC44 800C41E4 54038FFE */  rlwinm  r3, r0, 0x11, 0x1f, 0x1f
/* 0BEC48 800C41E8 4E800020 */  blr     

glabel AIStartDMA
/* 0BEC4C 800C41EC 3C60CC00 */  lis     r3, 0xcc00
/* 0BEC50 800C41F0 38635000 */  addi    r3, r3, 0x5000
/* 0BEC54 800C41F4 A0030036 */  lhz     r0, 0x36(r3)
/* 0BEC58 800C41F8 60008000 */  ori     r0, r0, 0x8000
/* 0BEC5C 800C41FC B0030036 */  sth     r0, 0x36(r3)
/* 0BEC60 800C4200 4E800020 */  blr     

glabel AIStopDMA
/* 0BEC64 800C4204 3C60CC00 */  lis     r3, 0xcc00
/* 0BEC68 800C4208 38635000 */  addi    r3, r3, 0x5000
/* 0BEC6C 800C420C A0030036 */  lhz     r0, 0x36(r3)
/* 0BEC70 800C4210 5400045E */  rlwinm  r0, r0, 0, 0x11, 0xf
/* 0BEC74 800C4214 B0030036 */  sth     r0, 0x36(r3)
/* 0BEC78 800C4218 4E800020 */  blr     

glabel AIGetDMABytesLeft
/* 0BEC7C 800C421C 3C60CC00 */  lis     r3, 0xcc00
/* 0BEC80 800C4220 A003503A */  lhz     r0, 0x503a(r3)
/* 0BEC84 800C4224 54032B34 */  rlwinm  r3, r0, 5, 0xc, 0x1a
/* 0BEC88 800C4228 4E800020 */  blr     

glabel AIGetDMAStartAddr
/* 0BEC8C 800C422C 3C60CC00 */  lis     r3, 0xcc00
/* 0BEC90 800C4230 38635000 */  addi    r3, r3, 0x5000
/* 0BEC94 800C4234 A0830030 */  lhz     r4, 0x30(r3)
/* 0BEC98 800C4238 A0030032 */  lhz     r0, 0x32(r3)
/* 0BEC9C 800C423C 54030434 */  rlwinm  r3, r0, 0, 0x10, 0x1a
/* 0BECA0 800C4240 5083819E */  rlwimi  r3, r4, 0x10, 6, 0xf
/* 0BECA4 800C4244 4E800020 */  blr     

glabel AISetStreamPlayState
/* 0BECA8 800C4248 7C0802A6 */  mflr    r0
/* 0BECAC 800C424C 90010004 */  stw     r0, 4(r1)
/* 0BECB0 800C4250 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0BECB4 800C4254 93E1001C */  stw     r31, 0x1c(r1)
/* 0BECB8 800C4258 93C10018 */  stw     r30, 0x18(r1)
/* 0BECBC 800C425C 93A10014 */  stw     r29, 0x14(r1)
/* 0BECC0 800C4260 7C7D1B78 */  mr      r29, r3
/* 0BECC4 800C4264 480000BD */  bl      AIGetStreamPlayState
/* 0BECC8 800C4268 7C1D1840 */  cmplw   r29, r3
/* 0BECCC 800C426C 41820098 */  beq     lbl_800C4304
/* 0BECD0 800C4270 48000289 */  bl      AIGetStreamSampleRate
/* 0BECD4 800C4274 28030000 */  cmplwi  r3, 0
/* 0BECD8 800C4278 40820078 */  bne     lbl_800C42F0
/* 0BECDC 800C427C 281D0001 */  cmplwi  r29, 1
/* 0BECE0 800C4280 40820070 */  bne     lbl_800C42F0
/* 0BECE4 800C4284 480002CD */  bl      AIGetStreamVolRight
/* 0BECE8 800C4288 7C7E1B78 */  mr      r30, r3
/* 0BECEC 800C428C 48000299 */  bl      AIGetStreamVolLeft
/* 0BECF0 800C4290 3BA30000 */  addi    r29, r3, 0
/* 0BECF4 800C4294 38600000 */  li      r3, 0
/* 0BECF8 800C4298 4800029D */  bl      AISetStreamVolRight
/* 0BECFC 800C429C 38600000 */  li      r3, 0
/* 0BED00 800C42A0 48000269 */  bl      AISetStreamVolLeft
/* 0BED04 800C42A4 4BFE64CD */  bl      OSDisableInterrupts
/* 0BED08 800C42A8 7C7F1B78 */  mr      r31, r3
/* 0BED0C 800C42AC 480005A1 */  bl      __AI_SRC_INIT
/* 0BED10 800C42B0 3C80CC00 */  lis     r4, 0xcc00
/* 0BED14 800C42B4 80046C00 */  lwz     r0, 0x6c00(r4)
/* 0BED18 800C42B8 387F0000 */  addi    r3, r31, 0
/* 0BED1C 800C42BC 540006F2 */  rlwinm  r0, r0, 0, 0x1b, 0x19
/* 0BED20 800C42C0 60000020 */  ori     r0, r0, 0x20
/* 0BED24 800C42C4 90046C00 */  stw     r0, 0x6c00(r4)
/* 0BED28 800C42C8 80046C00 */  lwz     r0, 0x6c00(r4)
/* 0BED2C 800C42CC 5400003C */  rlwinm  r0, r0, 0, 0, 0x1e
/* 0BED30 800C42D0 60000001 */  ori     r0, r0, 1
/* 0BED34 800C42D4 90046C00 */  stw     r0, 0x6c00(r4)
/* 0BED38 800C42D8 4BFE64C1 */  bl      OSRestoreInterrupts
/* 0BED3C 800C42DC 7FC3F378 */  mr      r3, r30
/* 0BED40 800C42E0 48000229 */  bl      AISetStreamVolLeft
/* 0BED44 800C42E4 7FA3EB78 */  mr      r3, r29
/* 0BED48 800C42E8 4800024D */  bl      AISetStreamVolRight
/* 0BED4C 800C42EC 48000018 */  b       lbl_800C4304
lbl_800C42F0:
/* 0BED50 800C42F0 3C60CC00 */  lis     r3, 0xcc00
/* 0BED54 800C42F4 80036C00 */  lwz     r0, 0x6c00(r3)
/* 0BED58 800C42F8 5400003C */  rlwinm  r0, r0, 0, 0, 0x1e
/* 0BED5C 800C42FC 7C00EB78 */  or      r0, r0, r29
/* 0BED60 800C4300 90036C00 */  stw     r0, 0x6c00(r3)
lbl_800C4304:
/* 0BED64 800C4304 80010024 */  lwz     r0, 0x24(r1)
/* 0BED68 800C4308 83E1001C */  lwz     r31, 0x1c(r1)
/* 0BED6C 800C430C 83C10018 */  lwz     r30, 0x18(r1)
/* 0BED70 800C4310 83A10014 */  lwz     r29, 0x14(r1)
/* 0BED74 800C4314 38210020 */  addi    r1, r1, 0x20
/* 0BED78 800C4318 7C0803A6 */  mtlr    r0
/* 0BED7C 800C431C 4E800020 */  blr     

glabel AIGetStreamPlayState
/* 0BED80 800C4320 3C60CC00 */  lis     r3, 0xcc00
/* 0BED84 800C4324 80036C00 */  lwz     r0, 0x6c00(r3)
/* 0BED88 800C4328 540307FE */  clrlwi  r3, r0, 0x1f
/* 0BED8C 800C432C 4E800020 */  blr     

glabel AISetDSPSampleRate
/* 0BED90 800C4330 7C0802A6 */  mflr    r0
/* 0BED94 800C4334 90010004 */  stw     r0, 4(r1)
/* 0BED98 800C4338 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0BED9C 800C433C BF410010 */  stmw    r26, 0x10(r1)
/* 0BEDA0 800C4340 7C7A1B78 */  mr      r26, r3
/* 0BEDA4 800C4344 480000CD */  bl      AIGetDSPSampleRate
/* 0BEDA8 800C4348 7C1A1840 */  cmplw   r26, r3
/* 0BEDAC 800C434C 418200B0 */  beq     lbl_800C43FC
/* 0BEDB0 800C4350 3FE0CC00 */  lis     r31, 0xcc00
/* 0BEDB4 800C4354 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BEDB8 800C4358 281A0000 */  cmplwi  r26, 0
/* 0BEDBC 800C435C 540006B0 */  rlwinm  r0, r0, 0, 0x1a, 0x18
/* 0BEDC0 800C4360 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BEDC4 800C4364 40820098 */  bne     lbl_800C43FC
/* 0BEDC8 800C4368 480001BD */  bl      AIGetStreamVolLeft
/* 0BEDCC 800C436C 7C7E1B78 */  mr      r30, r3
/* 0BEDD0 800C4370 480001E1 */  bl      AIGetStreamVolRight
/* 0BEDD4 800C4374 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BEDD8 800C4378 3BA30000 */  addi    r29, r3, 0
/* 0BEDDC 800C437C 541B07FE */  clrlwi  r27, r0, 0x1f
/* 0BEDE0 800C4380 48000179 */  bl      AIGetStreamSampleRate
/* 0BEDE4 800C4384 3B830000 */  addi    r28, r3, 0
/* 0BEDE8 800C4388 38600000 */  li      r3, 0
/* 0BEDEC 800C438C 4800017D */  bl      AISetStreamVolLeft
/* 0BEDF0 800C4390 38600000 */  li      r3, 0
/* 0BEDF4 800C4394 480001A1 */  bl      AISetStreamVolRight
/* 0BEDF8 800C4398 4BFE63D9 */  bl      OSDisableInterrupts
/* 0BEDFC 800C439C 7C7A1B78 */  mr      r26, r3
/* 0BEE00 800C43A0 480004AD */  bl      __AI_SRC_INIT
/* 0BEE04 800C43A4 809F6C00 */  lwz     r4, 0x6c00(r31)
/* 0BEE08 800C43A8 5780083C */  slwi    r0, r28, 1
/* 0BEE0C 800C43AC 387A0000 */  addi    r3, r26, 0
/* 0BEE10 800C43B0 548406F2 */  rlwinm  r4, r4, 0, 0x1b, 0x19
/* 0BEE14 800C43B4 60840020 */  ori     r4, r4, 0x20
/* 0BEE18 800C43B8 909F6C00 */  stw     r4, 0x6c00(r31)
/* 0BEE1C 800C43BC 809F6C00 */  lwz     r4, 0x6c00(r31)
/* 0BEE20 800C43C0 548407FA */  rlwinm  r4, r4, 0, 0x1f, 0x1d
/* 0BEE24 800C43C4 7C800378 */  or      r0, r4, r0
/* 0BEE28 800C43C8 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BEE2C 800C43CC 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BEE30 800C43D0 5400003C */  rlwinm  r0, r0, 0, 0, 0x1e
/* 0BEE34 800C43D4 7C00DB78 */  or      r0, r0, r27
/* 0BEE38 800C43D8 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BEE3C 800C43DC 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BEE40 800C43E0 60000040 */  ori     r0, r0, 0x40
/* 0BEE44 800C43E4 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BEE48 800C43E8 4BFE63B1 */  bl      OSRestoreInterrupts
/* 0BEE4C 800C43EC 7FC3F378 */  mr      r3, r30
/* 0BEE50 800C43F0 48000119 */  bl      AISetStreamVolLeft
/* 0BEE54 800C43F4 7FA3EB78 */  mr      r3, r29
/* 0BEE58 800C43F8 4800013D */  bl      AISetStreamVolRight
lbl_800C43FC:
/* 0BEE5C 800C43FC BB410010 */  lmw     r26, 0x10(r1)
/* 0BEE60 800C4400 8001002C */  lwz     r0, 0x2c(r1)
/* 0BEE64 800C4404 38210028 */  addi    r1, r1, 0x28
/* 0BEE68 800C4408 7C0803A6 */  mtlr    r0
/* 0BEE6C 800C440C 4E800020 */  blr     

glabel AIGetDSPSampleRate
/* 0BEE70 800C4410 3C60CC00 */  lis     r3, 0xcc00
/* 0BEE74 800C4414 80036C00 */  lwz     r0, 0x6c00(r3)
/* 0BEE78 800C4418 5400D7FE */  rlwinm  r0, r0, 0x1a, 0x1f, 0x1f
/* 0BEE7C 800C441C 68030001 */  xori    r3, r0, 1
/* 0BEE80 800C4420 4E800020 */  blr     

__AI_set_stream_sample_rate:
/* 0BEE84 800C4424 7C0802A6 */  mflr    r0
/* 0BEE88 800C4428 90010004 */  stw     r0, 4(r1)
/* 0BEE8C 800C442C 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0BEE90 800C4430 BF210014 */  stmw    r25, 0x14(r1)
/* 0BEE94 800C4434 7C791B78 */  mr      r25, r3
/* 0BEE98 800C4438 480000C1 */  bl      AIGetStreamSampleRate
/* 0BEE9C 800C443C 7C191840 */  cmplw   r25, r3
/* 0BEEA0 800C4440 418200A4 */  beq     lbl_800C44E4
/* 0BEEA4 800C4444 3FE0CC00 */  lis     r31, 0xcc00
/* 0BEEA8 800C4448 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BEEAC 800C444C 540007FE */  clrlwi  r0, r0, 0x1f
/* 0BEEB0 800C4450 7C1D0378 */  mr      r29, r0
/* 0BEEB4 800C4454 480000D1 */  bl      AIGetStreamVolLeft
/* 0BEEB8 800C4458 7C7C1B78 */  mr      r28, r3
/* 0BEEBC 800C445C 480000F5 */  bl      AIGetStreamVolRight
/* 0BEEC0 800C4460 3B630000 */  addi    r27, r3, 0
/* 0BEEC4 800C4464 38600000 */  li      r3, 0
/* 0BEEC8 800C4468 480000CD */  bl      AISetStreamVolRight
/* 0BEECC 800C446C 38600000 */  li      r3, 0
/* 0BEED0 800C4470 48000099 */  bl      AISetStreamVolLeft
/* 0BEED4 800C4474 807F6C00 */  lwz     r3, 0x6c00(r31)
/* 0BEED8 800C4478 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BEEDC 800C447C 547A0672 */  rlwinm  r26, r3, 0, 0x19, 0x19
/* 0BEEE0 800C4480 540006B0 */  rlwinm  r0, r0, 0, 0x1a, 0x18
/* 0BEEE4 800C4484 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BEEE8 800C4488 4BFE62E9 */  bl      OSDisableInterrupts
/* 0BEEEC 800C448C 7C7E1B78 */  mr      r30, r3
/* 0BEEF0 800C4490 480003BD */  bl      __AI_SRC_INIT
/* 0BEEF4 800C4494 809F6C00 */  lwz     r4, 0x6c00(r31)
/* 0BEEF8 800C4498 5720083C */  slwi    r0, r25, 1
/* 0BEEFC 800C449C 387E0000 */  addi    r3, r30, 0
/* 0BEF00 800C44A0 7C84D378 */  or      r4, r4, r26
/* 0BEF04 800C44A4 909F6C00 */  stw     r4, 0x6c00(r31)
/* 0BEF08 800C44A8 809F6C00 */  lwz     r4, 0x6c00(r31)
/* 0BEF0C 800C44AC 548406F2 */  rlwinm  r4, r4, 0, 0x1b, 0x19
/* 0BEF10 800C44B0 60840020 */  ori     r4, r4, 0x20
/* 0BEF14 800C44B4 909F6C00 */  stw     r4, 0x6c00(r31)
/* 0BEF18 800C44B8 809F6C00 */  lwz     r4, 0x6c00(r31)
/* 0BEF1C 800C44BC 548407FA */  rlwinm  r4, r4, 0, 0x1f, 0x1d
/* 0BEF20 800C44C0 7C800378 */  or      r0, r4, r0
/* 0BEF24 800C44C4 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BEF28 800C44C8 4BFE62D1 */  bl      OSRestoreInterrupts
/* 0BEF2C 800C44CC 7FA3EB78 */  mr      r3, r29
/* 0BEF30 800C44D0 4BFFFD79 */  bl      AISetStreamPlayState
/* 0BEF34 800C44D4 7F83E378 */  mr      r3, r28
/* 0BEF38 800C44D8 48000031 */  bl      AISetStreamVolLeft
/* 0BEF3C 800C44DC 7F63DB78 */  mr      r3, r27
/* 0BEF40 800C44E0 48000055 */  bl      AISetStreamVolRight
lbl_800C44E4:
/* 0BEF44 800C44E4 BB210014 */  lmw     r25, 0x14(r1)
/* 0BEF48 800C44E8 80010034 */  lwz     r0, 0x34(r1)
/* 0BEF4C 800C44EC 38210030 */  addi    r1, r1, 0x30
/* 0BEF50 800C44F0 7C0803A6 */  mtlr    r0
/* 0BEF54 800C44F4 4E800020 */  blr     

glabel AIGetStreamSampleRate
/* 0BEF58 800C44F8 3C60CC00 */  lis     r3, 0xcc00
/* 0BEF5C 800C44FC 80036C00 */  lwz     r0, 0x6c00(r3)
/* 0BEF60 800C4500 5403FFFE */  rlwinm  r3, r0, 0x1f, 0x1f, 0x1f
/* 0BEF64 800C4504 4E800020 */  blr     

glabel AISetStreamVolLeft
/* 0BEF68 800C4508 3C80CC00 */  lis     r4, 0xcc00
/* 0BEF6C 800C450C 38846C00 */  addi    r4, r4, 0x6c00
/* 0BEF70 800C4510 80040004 */  lwz     r0, 4(r4)
/* 0BEF74 800C4514 5400002E */  rlwinm  r0, r0, 0, 0, 0x17
/* 0BEF78 800C4518 5060063E */  rlwimi  r0, r3, 0, 0x18, 0x1f
/* 0BEF7C 800C451C 90040004 */  stw     r0, 4(r4)
/* 0BEF80 800C4520 4E800020 */  blr     

glabel AIGetStreamVolLeft
/* 0BEF84 800C4524 3C60CC00 */  lis     r3, 0xcc00
/* 0BEF88 800C4528 80036C04 */  lwz     r0, 0x6c04(r3)
/* 0BEF8C 800C452C 5403063E */  clrlwi  r3, r0, 0x18
/* 0BEF90 800C4530 4E800020 */  blr     

glabel AISetStreamVolRight
/* 0BEF94 800C4534 3C80CC00 */  lis     r4, 0xcc00
/* 0BEF98 800C4538 38846C00 */  addi    r4, r4, 0x6c00
/* 0BEF9C 800C453C 80040004 */  lwz     r0, 4(r4)
/* 0BEFA0 800C4540 5400061E */  rlwinm  r0, r0, 0, 0x18, 0xf
/* 0BEFA4 800C4544 5060442E */  rlwimi  r0, r3, 8, 0x10, 0x17
/* 0BEFA8 800C4548 90040004 */  stw     r0, 4(r4)
/* 0BEFAC 800C454C 4E800020 */  blr     

glabel AIGetStreamVolRight
/* 0BEFB0 800C4550 3C60CC00 */  lis     r3, 0xcc00
/* 0BEFB4 800C4554 80036C04 */  lwz     r0, 0x6c04(r3)
/* 0BEFB8 800C4558 5403C63E */  rlwinm  r3, r0, 0x18, 0x18, 0x1f
/* 0BEFBC 800C455C 4E800020 */  blr     

glabel AIInit
/* 0BEFC0 800C4560 7C0802A6 */  mflr    r0
/* 0BEFC4 800C4564 90010004 */  stw     r0, 4(r1)
/* 0BEFC8 800C4568 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BEFCC 800C456C 93E10014 */  stw     r31, 0x14(r1)
/* 0BEFD0 800C4570 93C10010 */  stw     r30, 0x10(r1)
/* 0BEFD4 800C4574 3BC30000 */  addi    r30, r3, 0
/* 0BEFD8 800C4578 800D9428 */  lwz     r0, __AI_init_flag-_SDA_BASE_(r13)
/* 0BEFDC 800C457C 2C000001 */  cmpwi   r0, 1
/* 0BEFE0 800C4580 41820134 */  beq     lbl_800C46B4
/* 0BEFE4 800C4584 806D8E10 */  lwz     r3, __AIVersion-_SDA_BASE_(r13)
/* 0BEFE8 800C4588 4BFE3B7D */  bl      OSRegisterVersion
/* 0BEFEC 800C458C 3C608000 */  lis     r3, 0x8000
/* 0BEFF0 800C4590 800300F8 */  lwz     r0, 0xf8(r3)
/* 0BEFF4 800C4594 3C60431C */  lis     r3, 0x431c
/* 0BEFF8 800C4598 3C800001 */  lis     r4, 1
/* 0BEFFC 800C459C 5400F0BE */  srwi    r0, r0, 2
/* 0BF000 800C45A0 3863DE83 */  addi    r3, r3, -8573
/* 0BF004 800C45A4 7C030016 */  mulhwu  r0, r3, r0
/* 0BF008 800C45A8 54098BFE */  srwi    r9, r0, 0xf
/* 0BF00C 800C45AC 38A4A428 */  addi    r5, r4, -23512
/* 0BF010 800C45B0 3864A410 */  addi    r3, r4, -23536
/* 0BF014 800C45B4 3804F618 */  addi    r0, r4, -2536
/* 0BF018 800C45B8 3C801062 */  lis     r4, 0x1062
/* 0BF01C 800C45BC 7CE929D6 */  mullw   r7, r9, r5
/* 0BF020 800C45C0 39444DD3 */  addi    r10, r4, 0x4dd3
/* 0BF024 800C45C4 7CA919D6 */  mullw   r5, r9, r3
/* 0BF028 800C45C8 7C8901D6 */  mullw   r4, r9, r0
/* 0BF02C 800C45CC 1D097B24 */  mulli   r8, r9, 0x7b24
/* 0BF030 800C45D0 1C690BB8 */  mulli   r3, r9, 0xbb8
/* 0BF034 800C45D4 7D0A4016 */  mulhwu  r8, r10, r8
/* 0BF038 800C45D8 7CEA3816 */  mulhwu  r7, r10, r7
/* 0BF03C 800C45DC 7CAA2816 */  mulhwu  r5, r10, r5
/* 0BF040 800C45E0 7C8A2016 */  mulhwu  r4, r10, r4
/* 0BF044 800C45E4 7C6A1816 */  mulhwu  r3, r10, r3
/* 0BF048 800C45E8 5508BA7E */  srwi    r8, r8, 9
/* 0BF04C 800C45EC 54E7BA7E */  srwi    r7, r7, 9
/* 0BF050 800C45F0 910D9434 */  stw     r8, (bound_32KHz + 4)-_SDA_BASE_(r13)
/* 0BF054 800C45F4 54A5BA7E */  srwi    r5, r5, 9
/* 0BF058 800C45F8 5484BA7E */  srwi    r4, r4, 9
/* 0BF05C 800C45FC 90ED943C */  stw     r7, (bound_48KHz + 4)-_SDA_BASE_(r13)
/* 0BF060 800C4600 3BE00000 */  li      r31, 0
/* 0BF064 800C4604 5463BA7E */  srwi    r3, r3, 9
/* 0BF068 800C4608 90AD9444 */  stw     r5, (min_wait + 4)-_SDA_BASE_(r13)
/* 0BF06C 800C460C 3CC0CC00 */  lis     r6, 0xcc00
/* 0BF070 800C4610 906D9454 */  stw     r3, (buffer + 4)-_SDA_BASE_(r13)
/* 0BF074 800C4614 38600001 */  li      r3, 1
/* 0BF078 800C4618 80066C00 */  lwz     r0, 0x6c00(r6)
/* 0BF07C 800C461C 908D944C */  stw     r4, (max_wait + 4)-_SDA_BASE_(r13)
/* 0BF080 800C4620 540006F2 */  rlwinm  r0, r0, 0, 0x1b, 0x19
/* 0BF084 800C4624 60000020 */  ori     r0, r0, 0x20
/* 0BF088 800C4628 93ED9430 */  stw     r31, bound_32KHz-_SDA_BASE_(r13)
/* 0BF08C 800C462C 93ED9438 */  stw     r31, bound_48KHz-_SDA_BASE_(r13)
/* 0BF090 800C4630 93ED9440 */  stw     r31, min_wait-_SDA_BASE_(r13)
/* 0BF094 800C4634 93ED9448 */  stw     r31, max_wait-_SDA_BASE_(r13)
/* 0BF098 800C4638 93ED9450 */  stw     r31, buffer-_SDA_BASE_(r13)
/* 0BF09C 800C463C 80A66C04 */  lwz     r5, 0x6c04(r6)
/* 0BF0A0 800C4640 90066C00 */  stw     r0, 0x6c00(r6)
/* 0BF0A4 800C4644 54A0061E */  rlwinm  r0, r5, 0, 0x18, 0xf
/* 0BF0A8 800C4648 60000000 */  nop     
/* 0BF0AC 800C464C 90066C04 */  stw     r0, 0x6c04(r6)
/* 0BF0B0 800C4650 80066C04 */  lwz     r0, 0x6c04(r6)
/* 0BF0B4 800C4654 5400002E */  rlwinm  r0, r0, 0, 0, 0x17
/* 0BF0B8 800C4658 60000000 */  nop     
/* 0BF0BC 800C465C 90066C04 */  stw     r0, 0x6c04(r6)
/* 0BF0C0 800C4660 93E66C0C */  stw     r31, 0x6c0c(r6)
/* 0BF0C4 800C4664 4BFFFDC1 */  bl      __AI_set_stream_sample_rate
/* 0BF0C8 800C4668 38600000 */  li      r3, 0
/* 0BF0CC 800C466C 4BFFFCC5 */  bl      AISetDSPSampleRate
/* 0BF0D0 800C4670 3C60800C */  lis     r3, __AIDHandler@ha
/* 0BF0D4 800C4674 93ED9418 */  stw     r31, __AIS_Callback-_SDA_BASE_(r13)
/* 0BF0D8 800C4678 38834748 */  addi    r4, r3, __AIDHandler@l
/* 0BF0DC 800C467C 93ED941C */  stw     r31, __AID_Callback-_SDA_BASE_(r13)
/* 0BF0E0 800C4680 38600005 */  li      r3, 5
/* 0BF0E4 800C4684 93CD9420 */  stw     r30, __CallbackStack-_SDA_BASE_(r13)
/* 0BF0E8 800C4688 4BFE6135 */  bl      __OSSetInterruptHandler
/* 0BF0EC 800C468C 3C600400 */  lis     r3, 0x400
/* 0BF0F0 800C4690 4BFE6531 */  bl      __OSUnmaskInterrupts
/* 0BF0F4 800C4694 3C60800C */  lis     r3, __AISHandler@ha
/* 0BF0F8 800C4698 388346CC */  addi    r4, r3, __AISHandler@l
/* 0BF0FC 800C469C 38600008 */  li      r3, 8
/* 0BF100 800C46A0 4BFE611D */  bl      __OSSetInterruptHandler
/* 0BF104 800C46A4 3C600080 */  lis     r3, 0x80
/* 0BF108 800C46A8 4BFE6519 */  bl      __OSUnmaskInterrupts
/* 0BF10C 800C46AC 38000001 */  li      r0, 1
/* 0BF110 800C46B0 900D9428 */  stw     r0, __AI_init_flag-_SDA_BASE_(r13)
lbl_800C46B4:
/* 0BF114 800C46B4 8001001C */  lwz     r0, 0x1c(r1)
/* 0BF118 800C46B8 83E10014 */  lwz     r31, 0x14(r1)
/* 0BF11C 800C46BC 83C10010 */  lwz     r30, 0x10(r1)
/* 0BF120 800C46C0 38210018 */  addi    r1, r1, 0x18
/* 0BF124 800C46C4 7C0803A6 */  mtlr    r0
/* 0BF128 800C46C8 4E800020 */  blr     

__AISHandler:
/* 0BF12C 800C46CC 7C0802A6 */  mflr    r0
/* 0BF130 800C46D0 90010004 */  stw     r0, 4(r1)
/* 0BF134 800C46D4 9421FD20 */  stwu    r1, -0x2e0(r1)
/* 0BF138 800C46D8 93E102DC */  stw     r31, 0x2dc(r1)
/* 0BF13C 800C46DC 3FE0CC00 */  lis     r31, 0xcc00
/* 0BF140 800C46E0 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BF144 800C46E4 38610010 */  addi    r3, r1, 0x10
/* 0BF148 800C46E8 93C102D8 */  stw     r30, 0x2d8(r1)
/* 0BF14C 800C46EC 60000008 */  ori     r0, r0, 8
/* 0BF150 800C46F0 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BF154 800C46F4 3BC40000 */  addi    r30, r4, 0
/* 0BF158 800C46F8 4BFE5521 */  bl      OSClearContext
/* 0BF15C 800C46FC 38610010 */  addi    r3, r1, 0x10
/* 0BF160 800C4700 4BFE5351 */  bl      OSSetCurrentContext
/* 0BF164 800C4704 818D9418 */  lwz     r12, __AIS_Callback-_SDA_BASE_(r13)
/* 0BF168 800C4708 280C0000 */  cmplwi  r12, 0
/* 0BF16C 800C470C 41820014 */  beq     lbl_800C4720
/* 0BF170 800C4710 387F6C00 */  addi    r3, r31, 0x6c00
/* 0BF174 800C4714 7D8803A6 */  mtlr    r12
/* 0BF178 800C4718 80630008 */  lwz     r3, 8(r3)
/* 0BF17C 800C471C 4E800021 */  blrl    
lbl_800C4720:
/* 0BF180 800C4720 38610010 */  addi    r3, r1, 0x10
/* 0BF184 800C4724 4BFE54F5 */  bl      OSClearContext
/* 0BF188 800C4728 7FC3F378 */  mr      r3, r30
/* 0BF18C 800C472C 4BFE5325 */  bl      OSSetCurrentContext
/* 0BF190 800C4730 800102E4 */  lwz     r0, 0x2e4(r1)
/* 0BF194 800C4734 83E102DC */  lwz     r31, 0x2dc(r1)
/* 0BF198 800C4738 83C102D8 */  lwz     r30, 0x2d8(r1)
/* 0BF19C 800C473C 382102E0 */  addi    r1, r1, 0x2e0
/* 0BF1A0 800C4740 7C0803A6 */  mtlr    r0
/* 0BF1A4 800C4744 4E800020 */  blr     

__AIDHandler:
/* 0BF1A8 800C4748 7C0802A6 */  mflr    r0
/* 0BF1AC 800C474C 3C60CC00 */  lis     r3, 0xcc00
/* 0BF1B0 800C4750 90010004 */  stw     r0, 4(r1)
/* 0BF1B4 800C4754 38635000 */  addi    r3, r3, 0x5000
/* 0BF1B8 800C4758 3800FF5F */  li      r0, -161
/* 0BF1BC 800C475C 9421FD20 */  stwu    r1, -0x2e0(r1)
/* 0BF1C0 800C4760 93E102DC */  stw     r31, 0x2dc(r1)
/* 0BF1C4 800C4764 3BE40000 */  addi    r31, r4, 0
/* 0BF1C8 800C4768 A0A3000A */  lhz     r5, 0xa(r3)
/* 0BF1CC 800C476C 7CA00038 */  and     r0, r5, r0
/* 0BF1D0 800C4770 60000008 */  ori     r0, r0, 8
/* 0BF1D4 800C4774 B003000A */  sth     r0, 0xa(r3)
/* 0BF1D8 800C4778 38610010 */  addi    r3, r1, 0x10
/* 0BF1DC 800C477C 4BFE549D */  bl      OSClearContext
/* 0BF1E0 800C4780 38610010 */  addi    r3, r1, 0x10
/* 0BF1E4 800C4784 4BFE52CD */  bl      OSSetCurrentContext
/* 0BF1E8 800C4788 806D941C */  lwz     r3, __AID_Callback-_SDA_BASE_(r13)
/* 0BF1EC 800C478C 28030000 */  cmplwi  r3, 0
/* 0BF1F0 800C4790 41820040 */  beq     lbl_800C47D0
/* 0BF1F4 800C4794 800D942C */  lwz     r0, __AID_Active-_SDA_BASE_(r13)
/* 0BF1F8 800C4798 2C000000 */  cmpwi   r0, 0
/* 0BF1FC 800C479C 40820034 */  bne     lbl_800C47D0
/* 0BF200 800C47A0 800D9420 */  lwz     r0, __CallbackStack-_SDA_BASE_(r13)
/* 0BF204 800C47A4 38800001 */  li      r4, 1
/* 0BF208 800C47A8 908D942C */  stw     r4, __AID_Active-_SDA_BASE_(r13)
/* 0BF20C 800C47AC 28000000 */  cmplwi  r0, 0
/* 0BF210 800C47B0 4182000C */  beq     lbl_800C47BC
/* 0BF214 800C47B4 48000041 */  bl      __AICallbackStackSwitch
/* 0BF218 800C47B8 48000010 */  b       lbl_800C47C8
lbl_800C47BC:
/* 0BF21C 800C47BC 39830000 */  addi    r12, r3, 0
/* 0BF220 800C47C0 7D8803A6 */  mtlr    r12
/* 0BF224 800C47C4 4E800021 */  blrl    
lbl_800C47C8:
/* 0BF228 800C47C8 38000000 */  li      r0, 0
/* 0BF22C 800C47CC 900D942C */  stw     r0, __AID_Active-_SDA_BASE_(r13)
lbl_800C47D0:
/* 0BF230 800C47D0 38610010 */  addi    r3, r1, 0x10
/* 0BF234 800C47D4 4BFE5445 */  bl      OSClearContext
/* 0BF238 800C47D8 7FE3FB78 */  mr      r3, r31
/* 0BF23C 800C47DC 4BFE5275 */  bl      OSSetCurrentContext
/* 0BF240 800C47E0 800102E4 */  lwz     r0, 0x2e4(r1)
/* 0BF244 800C47E4 83E102DC */  lwz     r31, 0x2dc(r1)
/* 0BF248 800C47E8 382102E0 */  addi    r1, r1, 0x2e0
/* 0BF24C 800C47EC 7C0803A6 */  mtlr    r0
/* 0BF250 800C47F0 4E800020 */  blr     

__AICallbackStackSwitch:
/* 0BF254 800C47F4 7C0802A6 */  mflr    r0
/* 0BF258 800C47F8 90010004 */  stw     r0, 4(r1)
/* 0BF25C 800C47FC 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BF260 800C4800 93E10014 */  stw     r31, 0x14(r1)
/* 0BF264 800C4804 7C7F1B78 */  mr      r31, r3
/* 0BF268 800C4808 3CA08014 */  lis     r5, __OldStack@ha
/* 0BF26C 800C480C 38A55E04 */  addi    r5, r5, __OldStack@l
/* 0BF270 800C4810 90250000 */  stw     r1, 0(r5)
/* 0BF274 800C4814 3CA08014 */  lis     r5, __CallbackStack@ha
/* 0BF278 800C4818 38A55E00 */  addi    r5, r5, __CallbackStack@l
/* 0BF27C 800C481C 80250000 */  lwz     r1, 0(r5)
/* 0BF280 800C4820 3821FFF8 */  addi    r1, r1, -8
/* 0BF284 800C4824 7FE803A6 */  mtlr    r31
/* 0BF288 800C4828 4E800021 */  blrl    
/* 0BF28C 800C482C 3CA08014 */  lis     r5, __OldStack@ha
/* 0BF290 800C4830 38A55E04 */  addi    r5, r5, __OldStack@l
/* 0BF294 800C4834 80250000 */  lwz     r1, 0(r5)
/* 0BF298 800C4838 8001001C */  lwz     r0, 0x1c(r1)
/* 0BF29C 800C483C 83E10014 */  lwz     r31, 0x14(r1)
/* 0BF2A0 800C4840 38210018 */  addi    r1, r1, 0x18
/* 0BF2A4 800C4844 7C0803A6 */  mtlr    r0
/* 0BF2A8 800C4848 4E800020 */  blr     

__AI_SRC_INIT:
/* 0BF2AC 800C484C 7C0802A6 */  mflr    r0
/* 0BF2B0 800C4850 90010004 */  stw     r0, 4(r1)
/* 0BF2B4 800C4854 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0BF2B8 800C4858 BF410018 */  stmw    r26, 0x18(r1)
/* 0BF2BC 800C485C 38800000 */  li      r4, 0
/* 0BF2C0 800C4860 38600000 */  li      r3, 0
/* 0BF2C4 800C4864 38000000 */  li      r0, 0
/* 0BF2C8 800C4868 3B800000 */  li      r28, 0
/* 0BF2CC 800C486C 3BA00000 */  li      r29, 0
/* 0BF2D0 800C4870 48000004 */  b       lbl_800C4874
lbl_800C4874:
/* 0BF2D4 800C4874 3FE0CC00 */  lis     r31, 0xcc00
/* 0BF2D8 800C4878 48000004 */  b       lbl_800C487C
lbl_800C487C:
/* 0BF2DC 800C487C 48000164 */  b       lbl_800C49E0
lbl_800C4880:
/* 0BF2E0 800C4880 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BF2E4 800C4884 3BDF6C00 */  addi    r30, r31, 0x6c00
/* 0BF2E8 800C4888 3BDE0008 */  addi    r30, r30, 8
/* 0BF2EC 800C488C 540006F2 */  rlwinm  r0, r0, 0, 0x1b, 0x19
/* 0BF2F0 800C4890 60000020 */  ori     r0, r0, 0x20
/* 0BF2F4 800C4894 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BF2F8 800C4898 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BF2FC 800C489C 540007FA */  rlwinm  r0, r0, 0, 0x1f, 0x1d
/* 0BF300 800C48A0 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BF304 800C48A4 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BF308 800C48A8 5400003C */  rlwinm  r0, r0, 0, 0, 0x1e
/* 0BF30C 800C48AC 60000001 */  ori     r0, r0, 1
/* 0BF310 800C48B0 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BF314 800C48B4 807E0000 */  lwz     r3, 0(r30)
/* 0BF318 800C48B8 48000004 */  b       lbl_800C48BC
lbl_800C48BC:
/* 0BF31C 800C48BC 48000004 */  b       lbl_800C48C0
lbl_800C48C0:
/* 0BF320 800C48C0 801E0000 */  lwz     r0, 0(r30)
/* 0BF324 800C48C4 7C030040 */  cmplw   r3, r0
/* 0BF328 800C48C8 4182FFF8 */  beq     lbl_800C48C0
/* 0BF32C 800C48CC 4BFE9451 */  bl      OSGetTime
/* 0BF330 800C48D0 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BF334 800C48D4 7C9A2378 */  mr      r26, r4
/* 0BF338 800C48D8 7C7B1B78 */  mr      r27, r3
/* 0BF33C 800C48DC 540007FA */  rlwinm  r0, r0, 0, 0x1f, 0x1d
/* 0BF340 800C48E0 60000002 */  ori     r0, r0, 2
/* 0BF344 800C48E4 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BF348 800C48E8 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BF34C 800C48EC 5400003C */  rlwinm  r0, r0, 0, 0, 0x1e
/* 0BF350 800C48F0 60000001 */  ori     r0, r0, 1
/* 0BF354 800C48F4 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BF358 800C48F8 807E0000 */  lwz     r3, 0(r30)
/* 0BF35C 800C48FC 48000004 */  b       lbl_800C4900
lbl_800C4900:
/* 0BF360 800C4900 48000004 */  b       lbl_800C4904
lbl_800C4904:
/* 0BF364 800C4904 801E0000 */  lwz     r0, 0(r30)
/* 0BF368 800C4908 7C030040 */  cmplw   r3, r0
/* 0BF36C 800C490C 4182FFF8 */  beq     lbl_800C4904
/* 0BF370 800C4910 4BFE940D */  bl      OSGetTime
/* 0BF374 800C4914 7D1A2010 */  subfc   r8, r26, r4
/* 0BF378 800C4918 818D9434 */  lwz     r12, (bound_32KHz + 4)-_SDA_BASE_(r13)
/* 0BF37C 800C491C 80BF6C00 */  lwz     r5, 0x6c00(r31)
/* 0BF380 800C4920 7CFB1910 */  subfe   r7, r27, r3
/* 0BF384 800C4924 814D9454 */  lwz     r10, (buffer + 4)-_SDA_BASE_(r13)
/* 0BF388 800C4928 6CE78000 */  xoris   r7, r7, 0x8000
/* 0BF38C 800C492C 54A507FA */  rlwinm  r5, r5, 0, 0x1f, 0x1d
/* 0BF390 800C4930 816D9430 */  lwz     r11, bound_32KHz-_SDA_BASE_(r13)
/* 0BF394 800C4934 7CCA6010 */  subfc   r6, r10, r12
/* 0BF398 800C4938 812D9450 */  lwz     r9, buffer-_SDA_BASE_(r13)
/* 0BF39C 800C493C 90BF6C00 */  stw     r5, 0x6c00(r31)
/* 0BF3A0 800C4940 7C095910 */  subfe   r0, r9, r11
/* 0BF3A4 800C4944 6C058000 */  xoris   r5, r0, 0x8000
/* 0BF3A8 800C4948 7C064010 */  subfc   r0, r6, r8
/* 0BF3AC 800C494C 801F6C00 */  lwz     r0, 0x6c00(r31)
/* 0BF3B0 800C4950 7CA53910 */  subfe   r5, r5, r7
/* 0BF3B4 800C4954 7CA73910 */  subfe   r5, r7, r7
/* 0BF3B8 800C4958 7CA500D0 */  neg     r5, r5
/* 0BF3BC 800C495C 5400003C */  rlwinm  r0, r0, 0, 0, 0x1e
/* 0BF3C0 800C4960 2C050000 */  cmpwi   r5, 0
/* 0BF3C4 800C4964 901F6C00 */  stw     r0, 0x6c00(r31)
/* 0BF3C8 800C4968 41820014 */  beq     lbl_800C497C
/* 0BF3CC 800C496C 83AD9440 */  lwz     r29, min_wait-_SDA_BASE_(r13)
/* 0BF3D0 800C4970 38000001 */  li      r0, 1
/* 0BF3D4 800C4974 838D9444 */  lwz     r28, (min_wait + 4)-_SDA_BASE_(r13)
/* 0BF3D8 800C4978 48000068 */  b       lbl_800C49E0
lbl_800C497C:
/* 0BF3DC 800C497C 7CCC5014 */  addc    r6, r12, r10
/* 0BF3E0 800C4980 7C0B4914 */  adde    r0, r11, r9
/* 0BF3E4 800C4984 6C058000 */  xoris   r5, r0, 0x8000
/* 0BF3E8 800C4988 7C064010 */  subfc   r0, r6, r8
/* 0BF3EC 800C498C 7CA53910 */  subfe   r5, r5, r7
/* 0BF3F0 800C4990 7CA73910 */  subfe   r5, r7, r7
/* 0BF3F4 800C4994 7CA500D0 */  neg     r5, r5
/* 0BF3F8 800C4998 2C050000 */  cmpwi   r5, 0
/* 0BF3FC 800C499C 40820040 */  bne     lbl_800C49DC
/* 0BF400 800C49A0 80AD943C */  lwz     r5, (bound_48KHz + 4)-_SDA_BASE_(r13)
/* 0BF404 800C49A4 800D9438 */  lwz     r0, bound_48KHz-_SDA_BASE_(r13)
/* 0BF408 800C49A8 7CCA2810 */  subfc   r6, r10, r5
/* 0BF40C 800C49AC 7C090110 */  subfe   r0, r9, r0
/* 0BF410 800C49B0 6C058000 */  xoris   r5, r0, 0x8000
/* 0BF414 800C49B4 7C064010 */  subfc   r0, r6, r8
/* 0BF418 800C49B8 7CA53910 */  subfe   r5, r5, r7
/* 0BF41C 800C49BC 7CA73910 */  subfe   r5, r7, r7
/* 0BF420 800C49C0 7CA500D0 */  neg     r5, r5
/* 0BF424 800C49C4 2C050000 */  cmpwi   r5, 0
/* 0BF428 800C49C8 41820014 */  beq     lbl_800C49DC
/* 0BF42C 800C49CC 83AD9448 */  lwz     r29, max_wait-_SDA_BASE_(r13)
/* 0BF430 800C49D0 38000001 */  li      r0, 1
/* 0BF434 800C49D4 838D944C */  lwz     r28, (max_wait + 4)-_SDA_BASE_(r13)
/* 0BF438 800C49D8 48000008 */  b       lbl_800C49E0
lbl_800C49DC:
/* 0BF43C 800C49DC 38000000 */  li      r0, 0
lbl_800C49E0:
/* 0BF440 800C49E0 28000000 */  cmplwi  r0, 0
/* 0BF444 800C49E4 4182FE9C */  beq     lbl_800C4880
/* 0BF448 800C49E8 7F64E014 */  addc    r27, r4, r28
/* 0BF44C 800C49EC 7F43E914 */  adde    r26, r3, r29
/* 0BF450 800C49F0 48000004 */  b       lbl_800C49F4
lbl_800C49F4:
/* 0BF454 800C49F4 48000004 */  b       lbl_800C49F8
lbl_800C49F8:
/* 0BF458 800C49F8 4BFE9325 */  bl      OSGetTime
/* 0BF45C 800C49FC 6C658000 */  xoris   r5, r3, 0x8000
/* 0BF460 800C4A00 6F438000 */  xoris   r3, r26, 0x8000
/* 0BF464 800C4A04 7C1B2010 */  subfc   r0, r27, r4
/* 0BF468 800C4A08 7C632910 */  subfe   r3, r3, r5
/* 0BF46C 800C4A0C 7C652910 */  subfe   r3, r5, r5
/* 0BF470 800C4A10 7C6300D0 */  neg     r3, r3
/* 0BF474 800C4A14 2C030000 */  cmpwi   r3, 0
/* 0BF478 800C4A18 4082FFE0 */  bne     lbl_800C49F8
/* 0BF47C 800C4A1C BB410018 */  lmw     r26, 0x18(r1)
/* 0BF480 800C4A20 80010034 */  lwz     r0, 0x34(r1)
/* 0BF484 800C4A24 38210030 */  addi    r1, r1, 0x30
/* 0BF488 800C4A28 7C0803A6 */  mtlr    r0
/* 0BF48C 800C4A2C 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FE8E8 80101868 0044 */
D_80101868:
    .asciz "<< Dolphin SDK - AI\trelease build: Apr 17 2003 12:33:54 (0x2301) >>"


.section .sdata, "wa"

.balign 8

/* 00100050 801457F0 0004 */
glabel __AIVersion
    .long D_80101868


.section .sbss, "wa"

.balign 8

/* 00100658 80145DF8 0004 */
__AIS_Callback:
    .skip 4

.balign 4

/* 0010065C 80145DFC 0004 */
__AID_Callback:
    .skip 4

.balign 4

/* 00100660 80145E00 0004 */
__CallbackStack:
    .skip 4

.balign 4

/* 00100664 80145E04 0004 */
__OldStack:
    .skip 4

.balign 4

/* 00100668 80145E08 0004 */
__AI_init_flag:
    .skip 4

.balign 4

/* 0010066C 80145E0C 0004 */
__AID_Active:
    .skip 4

.balign 8

/* 00100670 80145E10 0008 */
bound_32KHz:
    .skip 8

.balign 8

/* 00100678 80145E18 0008 */
bound_48KHz:
    .skip 8

.balign 8

/* 00100680 80145E20 0008 */
min_wait:
    .skip 8

.balign 8

/* 00100688 80145E28 0008 */
max_wait:
    .skip 8

.balign 8

/* 00100690 80145E30 0008 */
buffer:
    .skip 8


