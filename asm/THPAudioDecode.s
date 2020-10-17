# THPAudioDecode.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel CreateAudioDecodeThread
/* 00C130 800116D0 7C0802A6 */  mflr    r0
/* 00C134 800116D4 7C852379 */  or.     r5, r4, r4
/* 00C138 800116D8 90010004 */  stw     r0, 4(r1)
/* 00C13C 800116DC 3C808011 */  lis     r4, AudioDecodeThread@ha
/* 00C140 800116E0 39030000 */  addi    r8, r3, 0
/* 00C144 800116E4 9421FFE8 */  stwu    r1, -0x18(r1)
/* 00C148 800116E8 93E10014 */  stw     r31, 0x14(r1)
/* 00C14C 800116EC 3BE48230 */  addi    r31, r4, AudioDecodeThread@l
/* 00C150 800116F0 41820040 */  beq     lbl_80011730
/* 00C154 800116F4 3C608001 */  lis     r3, AudioDecoderForOnMemory@ha
/* 00C158 800116F8 3883180C */  addi    r4, r3, AudioDecoderForOnMemory@l
/* 00C15C 800116FC 387F0000 */  addi    r3, r31, 0
/* 00C160 80011700 38DF1318 */  addi    r6, r31, 0x1318
/* 00C164 80011704 38E01000 */  li      r7, 0x1000
/* 00C168 80011708 39200001 */  li      r9, 1
/* 00C16C 8001170C 4809BAF5 */  bl      OSCreateThread
/* 00C170 80011710 2C030000 */  cmpwi   r3, 0
/* 00C174 80011714 4082005C */  bne     lbl_80011770
/* 00C178 80011718 3C60800F */  lis     r3, D_800F65A8@ha
/* 00C17C 8001171C 4CC63182 */  crclr   6
/* 00C180 80011720 386365A8 */  addi    r3, r3, D_800F65A8@l
/* 00C184 80011724 48098949 */  bl      OSReport
/* 00C188 80011728 38600000 */  li      r3, 0
/* 00C18C 8001172C 48000070 */  b       lbl_8001179C
lbl_80011730:
/* 00C190 80011730 3C608001 */  lis     r3, AudioDecoder@ha
/* 00C194 80011734 388317E4 */  addi    r4, r3, AudioDecoder@l
/* 00C198 80011738 387F0000 */  addi    r3, r31, 0
/* 00C19C 8001173C 38DF1318 */  addi    r6, r31, 0x1318
/* 00C1A0 80011740 38A00000 */  li      r5, 0
/* 00C1A4 80011744 38E01000 */  li      r7, 0x1000
/* 00C1A8 80011748 39200001 */  li      r9, 1
/* 00C1AC 8001174C 4809BAB5 */  bl      OSCreateThread
/* 00C1B0 80011750 2C030000 */  cmpwi   r3, 0
/* 00C1B4 80011754 4082001C */  bne     lbl_80011770
/* 00C1B8 80011758 3C60800F */  lis     r3, D_800F65A8@ha
/* 00C1BC 8001175C 4CC63182 */  crclr   6
/* 00C1C0 80011760 386365A8 */  addi    r3, r3, D_800F65A8@l
/* 00C1C4 80011764 48098909 */  bl      OSReport
/* 00C1C8 80011768 38600000 */  li      r3, 0
/* 00C1CC 8001176C 48000030 */  b       lbl_8001179C
lbl_80011770:
/* 00C1D0 80011770 387F1318 */  addi    r3, r31, 0x1318
/* 00C1D4 80011774 389F1358 */  addi    r4, r31, 0x1358
/* 00C1D8 80011778 38A00003 */  li      r5, 3
/* 00C1DC 8001177C 48099879 */  bl      OSInitMessageQueue
/* 00C1E0 80011780 387F1338 */  addi    r3, r31, 0x1338
/* 00C1E4 80011784 389F1364 */  addi    r4, r31, 0x1364
/* 00C1E8 80011788 38A00003 */  li      r5, 3
/* 00C1EC 8001178C 48099869 */  bl      OSInitMessageQueue
/* 00C1F0 80011790 38000001 */  li      r0, 1
/* 00C1F4 80011794 900D8F18 */  stw     r0, AudioDecodeThreadCreated-_SDA_BASE_(r13)
/* 00C1F8 80011798 38600001 */  li      r3, 1
lbl_8001179C:
/* 00C1FC 8001179C 8001001C */  lwz     r0, 0x1c(r1)
/* 00C200 800117A0 83E10014 */  lwz     r31, 0x14(r1)
/* 00C204 800117A4 38210018 */  addi    r1, r1, 0x18
/* 00C208 800117A8 7C0803A6 */  mtlr    r0
/* 00C20C 800117AC 4E800020 */  blr     

glabel AudioDecodeThreadStart
/* 00C210 800117B0 7C0802A6 */  mflr    r0
/* 00C214 800117B4 90010004 */  stw     r0, 4(r1)
/* 00C218 800117B8 9421FFF8 */  stwu    r1, -8(r1)
/* 00C21C 800117BC 800D8F18 */  lwz     r0, AudioDecodeThreadCreated-_SDA_BASE_(r13)
/* 00C220 800117C0 2C000000 */  cmpwi   r0, 0
/* 00C224 800117C4 41820010 */  beq     lbl_800117D4
/* 00C228 800117C8 3C608011 */  lis     r3, AudioDecodeThread@ha
/* 00C22C 800117CC 38638230 */  addi    r3, r3, AudioDecodeThread@l
/* 00C230 800117D0 4809BEB9 */  bl      OSResumeThread
lbl_800117D4:
/* 00C234 800117D4 8001000C */  lwz     r0, 0xc(r1)
/* 00C238 800117D8 38210008 */  addi    r1, r1, 8
/* 00C23C 800117DC 7C0803A6 */  mtlr    r0
/* 00C240 800117E0 4E800020 */  blr     

AudioDecoder:
/* 00C244 800117E4 7C0802A6 */  mflr    r0
/* 00C248 800117E8 90010004 */  stw     r0, 4(r1)
/* 00C24C 800117EC 9421FFE8 */  stwu    r1, -0x18(r1)
/* 00C250 800117F0 93E10014 */  stw     r31, 0x14(r1)
lbl_800117F4:
/* 00C254 800117F4 48000B0D */  bl      PopReadedBuffer
/* 00C258 800117F8 7C7F1B78 */  mr      r31, r3
/* 00C25C 800117FC 480000C1 */  bl      AudioDecode
/* 00C260 80011800 7FE3FB78 */  mr      r3, r31
/* 00C264 80011804 48000A69 */  bl      PushReadedBuffer2
/* 00C268 80011808 4BFFFFEC */  b       lbl_800117F4

AudioDecoderForOnMemory:
/* 00C26C 8001180C 7C0802A6 */  mflr    r0
/* 00C270 80011810 3C808011 */  lis     r4, ActivePlayer@ha
/* 00C274 80011814 90010004 */  stw     r0, 4(r1)
/* 00C278 80011818 9421FFD0 */  stwu    r1, -0x30(r1)
/* 00C27C 8001181C 93E1002C */  stw     r31, 0x2c(r1)
/* 00C280 80011820 3BE00000 */  li      r31, 0
/* 00C284 80011824 93C10028 */  stw     r30, 0x28(r1)
/* 00C288 80011828 93A10024 */  stw     r29, 0x24(r1)
/* 00C28C 8001182C 3BA48060 */  addi    r29, r4, ActivePlayer@l
/* 00C290 80011830 3C808011 */  lis     r4, AudioDecodeThread@ha
/* 00C294 80011834 93810020 */  stw     r28, 0x20(r1)
/* 00C298 80011838 3BC48230 */  addi    r30, r4, AudioDecodeThread@l
/* 00C29C 8001183C 839D00BC */  lwz     r28, 0xbc(r29)
/* 00C2A0 80011840 90610010 */  stw     r3, 0x10(r1)
lbl_80011844:
/* 00C2A4 80011844 93E10014 */  stw     r31, 0x14(r1)
/* 00C2A8 80011848 38610010 */  addi    r3, r1, 0x10
/* 00C2AC 8001184C 48000071 */  bl      AudioDecode
/* 00C2B0 80011850 801D00C0 */  lwz     r0, 0xc0(r29)
/* 00C2B4 80011854 809D0050 */  lwz     r4, 0x50(r29)
/* 00C2B8 80011858 7C7F0214 */  add     r3, r31, r0
/* 00C2BC 8001185C 7C032396 */  divwu   r0, r3, r4
/* 00C2C0 80011860 7C0021D6 */  mullw   r0, r0, r4
/* 00C2C4 80011864 7C601850 */  subf    r3, r0, r3
/* 00C2C8 80011868 3804FFFF */  addi    r0, r4, -1
/* 00C2CC 8001186C 7C030040 */  cmplw   r3, r0
/* 00C2D0 80011870 40820030 */  bne     lbl_800118A0
/* 00C2D4 80011874 881D00A6 */  lbz     r0, 0xa6(r29)
/* 00C2D8 80011878 540007FF */  clrlwi. r0, r0, 0x1f
/* 00C2DC 8001187C 41820018 */  beq     lbl_80011894
/* 00C2E0 80011880 80610010 */  lwz     r3, 0x10(r1)
/* 00C2E4 80011884 801D00B4 */  lwz     r0, 0xb4(r29)
/* 00C2E8 80011888 83830000 */  lwz     r28, 0(r3)
/* 00C2EC 8001188C 90010010 */  stw     r0, 0x10(r1)
/* 00C2F0 80011890 48000024 */  b       lbl_800118B4
lbl_80011894:
/* 00C2F4 80011894 7FC3F378 */  mr      r3, r30
/* 00C2F8 80011898 4809C079 */  bl      OSSuspendThread
/* 00C2FC 8001189C 48000018 */  b       lbl_800118B4
lbl_800118A0:
/* 00C300 800118A0 80610010 */  lwz     r3, 0x10(r1)
/* 00C304 800118A4 80830000 */  lwz     r4, 0(r3)
/* 00C308 800118A8 7C03E214 */  add     r0, r3, r28
/* 00C30C 800118AC 90010010 */  stw     r0, 0x10(r1)
/* 00C310 800118B0 7C9C2378 */  mr      r28, r4
lbl_800118B4:
/* 00C314 800118B4 3BFF0001 */  addi    r31, r31, 1
/* 00C318 800118B8 4BFFFF8C */  b       lbl_80011844

AudioDecode:
/* 00C31C 800118BC 7C0802A6 */  mflr    r0
/* 00C320 800118C0 3C808011 */  lis     r4, ActivePlayer@ha
/* 00C324 800118C4 90010004 */  stw     r0, 4(r1)
/* 00C328 800118C8 9421FFE0 */  stwu    r1, -0x20(r1)
/* 00C32C 800118CC 93E1001C */  stw     r31, 0x1c(r1)
/* 00C330 800118D0 3BE48060 */  addi    r31, r4, ActivePlayer@l
/* 00C334 800118D4 93C10018 */  stw     r30, 0x18(r1)
/* 00C338 800118D8 3BDF006C */  addi    r30, r31, 0x6c
/* 00C33C 800118DC 93A10014 */  stw     r29, 0x14(r1)
/* 00C340 800118E0 93810010 */  stw     r28, 0x10(r1)
/* 00C344 800118E4 801F006C */  lwz     r0, 0x6c(r31)
/* 00C348 800118E8 80A30000 */  lwz     r5, 0(r3)
/* 00C34C 800118EC 5403103A */  slwi    r3, r0, 2
/* 00C350 800118F0 3B830008 */  addi    r28, r3, 8
/* 00C354 800118F4 3BA50008 */  addi    r29, r5, 8
/* 00C358 800118F8 7F85E214 */  add     r28, r5, r28
/* 00C35C 800118FC 48000099 */  bl      PopFreeAudioBuffer
/* 00C360 80011900 801E0000 */  lwz     r0, 0(r30)
/* 00C364 80011904 3BC30000 */  addi    r30, r3, 0
/* 00C368 80011908 28000000 */  cmplwi  r0, 0
/* 00C36C 8001190C 7C0903A6 */  mtctr   r0
/* 00C370 80011910 40810064 */  ble     lbl_80011974
lbl_80011914:
/* 00C374 80011914 881F0070 */  lbz     r0, 0x70(r31)
/* 00C378 80011918 2C000001 */  cmpwi   r0, 1
/* 00C37C 8001191C 41820008 */  beq     lbl_80011924
/* 00C380 80011920 48000040 */  b       lbl_80011960
lbl_80011924:
/* 00C384 80011924 3C608011 */  lis     r3, ActivePlayer@ha
/* 00C388 80011928 80DD0000 */  lwz     r6, 0(r29)
/* 00C38C 8001192C 38838060 */  addi    r4, r3, ActivePlayer@l
/* 00C390 80011930 807E0000 */  lwz     r3, 0(r30)
/* 00C394 80011934 800400EC */  lwz     r0, 0xec(r4)
/* 00C398 80011938 38A00000 */  li      r5, 0
/* 00C39C 8001193C 7C0601D6 */  mullw   r0, r6, r0
/* 00C3A0 80011940 7C9C0214 */  add     r4, r28, r0
/* 00C3A4 80011944 480C3275 */  bl      THPAudioDecode
/* 00C3A8 80011948 907E0008 */  stw     r3, 8(r30)
/* 00C3AC 8001194C 7FC3F378 */  mr      r3, r30
/* 00C3B0 80011950 801E0000 */  lwz     r0, 0(r30)
/* 00C3B4 80011954 901E0004 */  stw     r0, 4(r30)
/* 00C3B8 80011958 480000E5 */  bl      PushDecodedAudioBuffer
/* 00C3BC 8001195C 48000018 */  b       lbl_80011974
lbl_80011960:
/* 00C3C0 80011960 801D0000 */  lwz     r0, 0(r29)
/* 00C3C4 80011964 3BBD0004 */  addi    r29, r29, 4
/* 00C3C8 80011968 3BFF0001 */  addi    r31, r31, 1
/* 00C3CC 8001196C 7F9C0214 */  add     r28, r28, r0
/* 00C3D0 80011970 4200FFA4 */  bdnz    lbl_80011914
lbl_80011974:
/* 00C3D4 80011974 80010024 */  lwz     r0, 0x24(r1)
/* 00C3D8 80011978 83E1001C */  lwz     r31, 0x1c(r1)
/* 00C3DC 8001197C 83C10018 */  lwz     r30, 0x18(r1)
/* 00C3E0 80011980 7C0803A6 */  mtlr    r0
/* 00C3E4 80011984 83A10014 */  lwz     r29, 0x14(r1)
/* 00C3E8 80011988 83810010 */  lwz     r28, 0x10(r1)
/* 00C3EC 8001198C 38210020 */  addi    r1, r1, 0x20
/* 00C3F0 80011990 4E800020 */  blr     

glabel PopFreeAudioBuffer
/* 00C3F4 80011994 7C0802A6 */  mflr    r0
/* 00C3F8 80011998 3C608011 */  lis     r3, FreeAudioBufferQueue@ha
/* 00C3FC 8001199C 90010004 */  stw     r0, 4(r1)
/* 00C400 800119A0 38639548 */  addi    r3, r3, FreeAudioBufferQueue@l
/* 00C404 800119A4 38A00001 */  li      r5, 1
/* 00C408 800119A8 9421FFF0 */  stwu    r1, -0x10(r1)
/* 00C40C 800119AC 38810008 */  addi    r4, r1, 8
/* 00C410 800119B0 4809976D */  bl      OSReceiveMessage
/* 00C414 800119B4 80010014 */  lwz     r0, 0x14(r1)
/* 00C418 800119B8 80610008 */  lwz     r3, 8(r1)
/* 00C41C 800119BC 38210010 */  addi    r1, r1, 0x10
/* 00C420 800119C0 7C0803A6 */  mtlr    r0
/* 00C424 800119C4 4E800020 */  blr     

glabel PushFreeAudioBuffer
/* 00C428 800119C8 7C0802A6 */  mflr    r0
/* 00C42C 800119CC 3CA08011 */  lis     r5, FreeAudioBufferQueue@ha
/* 00C430 800119D0 90010004 */  stw     r0, 4(r1)
/* 00C434 800119D4 38830000 */  addi    r4, r3, 0
/* 00C438 800119D8 38659548 */  addi    r3, r5, FreeAudioBufferQueue@l
/* 00C43C 800119DC 9421FFF8 */  stwu    r1, -8(r1)
/* 00C440 800119E0 38A00000 */  li      r5, 0
/* 00C444 800119E4 48099671 */  bl      OSSendMessage
/* 00C448 800119E8 8001000C */  lwz     r0, 0xc(r1)
/* 00C44C 800119EC 38210008 */  addi    r1, r1, 8
/* 00C450 800119F0 7C0803A6 */  mtlr    r0
/* 00C454 800119F4 4E800020 */  blr     

glabel PopDecodedAudioBuffer
/* 00C458 800119F8 7C0802A6 */  mflr    r0
/* 00C45C 800119FC 3C808011 */  lis     r4, DecodedAudioBufferQueue@ha
/* 00C460 80011A00 90010004 */  stw     r0, 4(r1)
/* 00C464 80011A04 38A30000 */  addi    r5, r3, 0
/* 00C468 80011A08 38649568 */  addi    r3, r4, DecodedAudioBufferQueue@l
/* 00C46C 80011A0C 9421FFF0 */  stwu    r1, -0x10(r1)
/* 00C470 80011A10 3881000C */  addi    r4, r1, 0xc
/* 00C474 80011A14 48099709 */  bl      OSReceiveMessage
/* 00C478 80011A18 2C030001 */  cmpwi   r3, 1
/* 00C47C 80011A1C 4082000C */  bne     lbl_80011A28
/* 00C480 80011A20 8061000C */  lwz     r3, 0xc(r1)
/* 00C484 80011A24 48000008 */  b       lbl_80011A2C
lbl_80011A28:
/* 00C488 80011A28 38600000 */  li      r3, 0
lbl_80011A2C:
/* 00C48C 80011A2C 80010014 */  lwz     r0, 0x14(r1)
/* 00C490 80011A30 38210010 */  addi    r1, r1, 0x10
/* 00C494 80011A34 7C0803A6 */  mtlr    r0
/* 00C498 80011A38 4E800020 */  blr     

glabel PushDecodedAudioBuffer
/* 00C49C 80011A3C 7C0802A6 */  mflr    r0
/* 00C4A0 80011A40 3CA08011 */  lis     r5, DecodedAudioBufferQueue@ha
/* 00C4A4 80011A44 90010004 */  stw     r0, 4(r1)
/* 00C4A8 80011A48 38830000 */  addi    r4, r3, 0
/* 00C4AC 80011A4C 38659568 */  addi    r3, r5, DecodedAudioBufferQueue@l
/* 00C4B0 80011A50 9421FFF8 */  stwu    r1, -8(r1)
/* 00C4B4 80011A54 38A00001 */  li      r5, 1
/* 00C4B8 80011A58 480995FD */  bl      OSSendMessage
/* 00C4BC 80011A5C 8001000C */  lwz     r0, 0xc(r1)
/* 00C4C0 80011A60 38210008 */  addi    r1, r1, 8
/* 00C4C4 80011A64 7C0803A6 */  mtlr    r0
/* 00C4C8 80011A68 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000F3628 800F65A8 0022 */
D_800F65A8:
    .asciz "Can't create audio decode thread\n"


.section .bss, "wa"

.balign 4

/* 001052B0 80108230 0318 */
AudioDecodeThread:
    .skip 792

.balign 4

/* 001055C8 80108548 1000 */
AudioDecodeThreadStack:
    .skip 4096

.balign 4

/* 001065C8 80109548 0020 */
FreeAudioBufferQueue:
    .skip 32

.balign 4

/* 001065E8 80109568 0020 */
DecodedAudioBufferQueue:
    .skip 32

.balign 4

/* 00106608 80109588 000C */
FreeAudioBufferMessage:
    .skip 12

.balign 4

/* 00106614 80109594 000C */
DecodedAudioBufferMessage:
    .skip 12


.section .sbss, "wa"

.balign 8

/* 00100158 801458F8 0004 */
AudioDecodeThreadCreated:
    .skip 4


