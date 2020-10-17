# CARDFormat.c
.include "macros.inc"

.section .text, "ax"

.balign 4

FormatCallback:
/* 0C61B4 800CB754 7C0802A6 */  mflr    r0
/* 0C61B8 800CB758 90010004 */  stw     r0, 4(r1)
/* 0C61BC 800CB75C 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0C61C0 800CB760 93E1001C */  stw     r31, 0x1c(r1)
/* 0C61C4 800CB764 93C10018 */  stw     r30, 0x18(r1)
/* 0C61C8 800CB768 3BC30000 */  addi    r30, r3, 0
/* 0C61CC 800CB76C 3C608014 */  lis     r3, __CARDBlock@ha
/* 0C61D0 800CB770 93A10014 */  stw     r29, 0x14(r1)
/* 0C61D4 800CB774 1CBE0110 */  mulli   r5, r30, 0x110
/* 0C61D8 800CB778 93810010 */  stw     r28, 0x10(r1)
/* 0C61DC 800CB77C 380324D0 */  addi    r0, r3, __CARDBlock@l
/* 0C61E0 800CB780 7C9C2379 */  or.     r28, r4, r4
/* 0C61E4 800CB784 7FE02A14 */  add     r31, r0, r5
/* 0C61E8 800CB788 418000C4 */  blt     lbl_800CB84C
/* 0C61EC 800CB78C 807F0028 */  lwz     r3, 0x28(r31)
/* 0C61F0 800CB790 38030001 */  addi    r0, r3, 1
/* 0C61F4 800CB794 901F0028 */  stw     r0, 0x28(r31)
/* 0C61F8 800CB798 809F0028 */  lwz     r4, 0x28(r31)
/* 0C61FC 800CB79C 2C040005 */  cmpwi   r4, 5
/* 0C6200 800CB7A0 40800028 */  bge     lbl_800CB7C8
/* 0C6204 800CB7A4 801F000C */  lwz     r0, 0xc(r31)
/* 0C6208 800CB7A8 3C60800D */  lis     r3, FormatCallback@ha
/* 0C620C 800CB7AC 38A3B754 */  addi    r5, r3, FormatCallback@l
/* 0C6210 800CB7B0 7C8021D6 */  mullw   r4, r0, r4
/* 0C6214 800CB7B4 387E0000 */  addi    r3, r30, 0
/* 0C6218 800CB7B8 4BFFC4C5 */  bl      __CARDEraseSector
/* 0C621C 800CB7BC 7C7C1B79 */  or.     r28, r3, r3
/* 0C6220 800CB7C0 4180008C */  blt     lbl_800CB84C
/* 0C6224 800CB7C4 480000B4 */  b       lbl_800CB878
lbl_800CB7C8:
/* 0C6228 800CB7C8 2C04000A */  cmpwi   r4, 0xa
/* 0C622C 800CB7CC 4080003C */  bge     lbl_800CB808
/* 0C6230 800CB7D0 801F000C */  lwz     r0, 0xc(r31)
/* 0C6234 800CB7D4 38C4FFFB */  addi    r6, r4, -5
/* 0C6238 800CB7D8 3C60800D */  lis     r3, FormatCallback@ha
/* 0C623C 800CB7DC 80BF0080 */  lwz     r5, 0x80(r31)
/* 0C6240 800CB7E0 7C8031D6 */  mullw   r4, r0, r6
/* 0C6244 800CB7E4 54C06824 */  slwi    r0, r6, 0xd
/* 0C6248 800CB7E8 38E3B754 */  addi    r7, r3, FormatCallback@l
/* 0C624C 800CB7EC 7CC50214 */  add     r6, r5, r0
/* 0C6250 800CB7F0 387E0000 */  addi    r3, r30, 0
/* 0C6254 800CB7F4 38A02000 */  li      r5, 0x2000
/* 0C6258 800CB7F8 4BFFDE51 */  bl      __CARDWrite
/* 0C625C 800CB7FC 7C7C1B79 */  or.     r28, r3, r3
/* 0C6260 800CB800 4180004C */  blt     lbl_800CB84C
/* 0C6264 800CB804 48000074 */  b       lbl_800CB878
lbl_800CB808:
/* 0C6268 800CB808 807F0080 */  lwz     r3, 0x80(r31)
/* 0C626C 800CB80C 38A02000 */  li      r5, 0x2000
/* 0C6270 800CB810 38032000 */  addi    r0, r3, 0x2000
/* 0C6274 800CB814 901F0084 */  stw     r0, 0x84(r31)
/* 0C6278 800CB818 809F0080 */  lwz     r4, 0x80(r31)
/* 0C627C 800CB81C 807F0084 */  lwz     r3, 0x84(r31)
/* 0C6280 800CB820 38844000 */  addi    r4, r4, 0x4000
/* 0C6284 800CB824 4BF39CA1 */  bl      memcpy
/* 0C6288 800CB828 807F0080 */  lwz     r3, 0x80(r31)
/* 0C628C 800CB82C 38A02000 */  li      r5, 0x2000
/* 0C6290 800CB830 38036000 */  addi    r0, r3, 0x6000
/* 0C6294 800CB834 901F0088 */  stw     r0, 0x88(r31)
/* 0C6298 800CB838 809F0080 */  lwz     r4, 0x80(r31)
/* 0C629C 800CB83C 807F0088 */  lwz     r3, 0x88(r31)
/* 0C62A0 800CB840 3C840001 */  addis   r4, r4, 1
/* 0C62A4 800CB844 38848000 */  addi    r4, r4, -32768
/* 0C62A8 800CB848 4BF39C7D */  bl      memcpy
lbl_800CB84C:
/* 0C62AC 800CB84C 83BF00D0 */  lwz     r29, 0xd0(r31)
/* 0C62B0 800CB850 38000000 */  li      r0, 0
/* 0C62B4 800CB854 387F0000 */  addi    r3, r31, 0
/* 0C62B8 800CB858 901F00D0 */  stw     r0, 0xd0(r31)
/* 0C62BC 800CB85C 7F84E378 */  mr      r4, r28
/* 0C62C0 800CB860 4BFFC6A1 */  bl      __CARDPutControlBlock
/* 0C62C4 800CB864 399D0000 */  addi    r12, r29, 0
/* 0C62C8 800CB868 7D8803A6 */  mtlr    r12
/* 0C62CC 800CB86C 387E0000 */  addi    r3, r30, 0
/* 0C62D0 800CB870 389C0000 */  addi    r4, r28, 0
/* 0C62D4 800CB874 4E800021 */  blrl    
lbl_800CB878:
/* 0C62D8 800CB878 80010024 */  lwz     r0, 0x24(r1)
/* 0C62DC 800CB87C 83E1001C */  lwz     r31, 0x1c(r1)
/* 0C62E0 800CB880 83C10018 */  lwz     r30, 0x18(r1)
/* 0C62E4 800CB884 83A10014 */  lwz     r29, 0x14(r1)
/* 0C62E8 800CB888 83810010 */  lwz     r28, 0x10(r1)
/* 0C62EC 800CB88C 38210020 */  addi    r1, r1, 0x20
/* 0C62F0 800CB890 7C0803A6 */  mtlr    r0
/* 0C62F4 800CB894 4E800020 */  blr     

glabel __CARDFormatRegionAsync
/* 0C62F8 800CB898 7C0802A6 */  mflr    r0
/* 0C62FC 800CB89C 90010004 */  stw     r0, 4(r1)
/* 0C6300 800CB8A0 9421FFA8 */  stwu    r1, -0x58(r1)
/* 0C6304 800CB8A4 BE410020 */  stmw    r18, 0x20(r1)
/* 0C6308 800CB8A8 3A840000 */  addi    r20, r4, 0
/* 0C630C 800CB8AC 3AC30000 */  addi    r22, r3, 0
/* 0C6310 800CB8B0 3A650000 */  addi    r19, r5, 0
/* 0C6314 800CB8B4 38810018 */  addi    r4, r1, 0x18
/* 0C6318 800CB8B8 4BFFC591 */  bl      __CARDGetControlBlock
/* 0C631C 800CB8BC 2C030000 */  cmpwi   r3, 0
/* 0C6320 800CB8C0 40800008 */  bge     lbl_800CB8C8
/* 0C6324 800CB8C4 48000618 */  b       lbl_800CBEDC
lbl_800CB8C8:
/* 0C6328 800CB8C8 80610018 */  lwz     r3, 0x18(r1)
/* 0C632C 800CB8CC 388000FF */  li      r4, 0xff
/* 0C6330 800CB8D0 38A02000 */  li      r5, 0x2000
/* 0C6334 800CB8D4 83630080 */  lwz     r27, 0x80(r3)
/* 0C6338 800CB8D8 7F63DB78 */  mr      r3, r27
/* 0C633C 800CB8DC 4BF39AF5 */  bl      memset
/* 0C6340 800CB8E0 3C60CC00 */  lis     r3, 0xcc00
/* 0C6344 800CB8E4 A243206E */  lhz     r18, 0x206e(r3)
/* 0C6348 800CB8E8 B29B0024 */  sth     r20, 0x24(r27)
/* 0C634C 800CB8EC 4BFE0A15 */  bl      __OSLockSram
/* 0C6350 800CB8F0 8003000C */  lwz     r0, 0xc(r3)
/* 0C6354 800CB8F4 901B0014 */  stw     r0, 0x14(r27)
/* 0C6358 800CB8F8 88030012 */  lbz     r0, 0x12(r3)
/* 0C635C 800CB8FC 38600000 */  li      r3, 0
/* 0C6360 800CB900 901B0018 */  stw     r0, 0x18(r27)
/* 0C6364 800CB904 4BFE0DF1 */  bl      __OSUnlockSram
/* 0C6368 800CB908 4BFE2415 */  bl      OSGetTime
/* 0C636C 800CB90C 3AA40000 */  addi    r21, r4, 0
/* 0C6370 800CB910 3A830000 */  addi    r20, r3, 0
/* 0C6374 800CB914 3B550000 */  addi    r26, r21, 0
/* 0C6378 800CB918 3BD40000 */  addi    r30, r20, 0
/* 0C637C 800CB91C 4BFE0A41 */  bl      __OSLockSramEx
/* 0C6380 800CB920 1C16000C */  mulli   r0, r22, 0xc
/* 0C6384 800CB924 7F230214 */  add     r25, r3, r0
/* 0C6388 800CB928 3C6041C6 */  lis     r3, 0x41c6
/* 0C638C 800CB92C 3B190000 */  addi    r24, r25, 0
/* 0C6390 800CB930 3BE34E6D */  addi    r31, r3, 0x4e6d
/* 0C6394 800CB934 3B800000 */  li      r28, 0
/* 0C6398 800CB938 3AE00004 */  li      r23, 4
/* 0C639C 800CB93C 48000374 */  b       lbl_800CBCB0
lbl_800CB940:
/* 0C63A0 800CB940 7CBEF9D6 */  mullw   r5, r30, r31
/* 0C63A4 800CB944 7C7AF816 */  mulhwu  r3, r26, r31
/* 0C63A8 800CB948 3BC00000 */  li      r30, 0
/* 0C63AC 800CB94C 7CA51A14 */  add     r5, r5, r3
/* 0C63B0 800CB950 7C7AF1D6 */  mullw   r3, r26, r30
/* 0C63B4 800CB954 7C1AF9D6 */  mullw   r0, r26, r31
/* 0C63B8 800CB958 3BA03039 */  li      r29, 0x3039
/* 0C63BC 800CB95C 7C80E814 */  addc    r4, r0, r29
/* 0C63C0 800CB960 7C051A14 */  add     r0, r5, r3
/* 0C63C4 800CB964 7C60F114 */  adde    r3, r0, r30
/* 0C63C8 800CB968 38A00010 */  li      r5, 0x10
/* 0C63CC 800CB96C 4800E5AD */  bl      __shr2i
/* 0C63D0 800CB970 7CC3F9D6 */  mullw   r6, r3, r31
/* 0C63D4 800CB974 88180000 */  lbz     r0, 0(r24)
/* 0C63D8 800CB978 7CA4F816 */  mulhwu  r5, r4, r31
/* 0C63DC 800CB97C 7CC62A14 */  add     r6, r6, r5
/* 0C63E0 800CB980 7D040014 */  addc    r8, r4, r0
/* 0C63E4 800CB984 7F870734 */  extsh   r7, r28
/* 0C63E8 800CB988 7CA4F1D6 */  mullw   r5, r4, r30
/* 0C63EC 800CB98C 7D1B39AE */  stbx    r8, r27, r7
/* 0C63F0 800CB990 7C04F9D6 */  mullw   r0, r4, r31
/* 0C63F4 800CB994 7C80E814 */  addc    r4, r0, r29
/* 0C63F8 800CB998 7C062A14 */  add     r0, r6, r5
/* 0C63FC 800CB99C 7C60F114 */  adde    r3, r0, r30
/* 0C6400 800CB9A0 38A00010 */  li      r5, 0x10
/* 0C6404 800CB9A4 4800E575 */  bl      __shr2i
/* 0C6408 800CB9A8 3B407FFF */  li      r26, 0x7fff
/* 0C640C 800CB9AC 7C60F038 */  and     r0, r3, r30
/* 0C6410 800CB9B0 7C84D038 */  and     r4, r4, r26
/* 0C6414 800CB9B4 7CA0F9D6 */  mullw   r5, r0, r31
/* 0C6418 800CB9B8 7C64F816 */  mulhwu  r3, r4, r31
/* 0C641C 800CB9BC 7CA51A14 */  add     r5, r5, r3
/* 0C6420 800CB9C0 7C64F1D6 */  mullw   r3, r4, r30
/* 0C6424 800CB9C4 7C04F9D6 */  mullw   r0, r4, r31
/* 0C6428 800CB9C8 7C80E814 */  addc    r4, r0, r29
/* 0C642C 800CB9CC 7C051A14 */  add     r0, r5, r3
/* 0C6430 800CB9D0 7C60F114 */  adde    r3, r0, r30
/* 0C6434 800CB9D4 38A00010 */  li      r5, 0x10
/* 0C6438 800CB9D8 4800E541 */  bl      __shr2i
/* 0C643C 800CB9DC 7CC3F9D6 */  mullw   r6, r3, r31
/* 0C6440 800CB9E0 7CA4F816 */  mulhwu  r5, r4, r31
/* 0C6444 800CB9E4 393C0001 */  addi    r9, r28, 1
/* 0C6448 800CB9E8 7D290734 */  extsh   r9, r9
/* 0C644C 800CB9EC 7C1948AE */  lbzx    r0, r25, r9
/* 0C6450 800CB9F0 7CC62A14 */  add     r6, r6, r5
/* 0C6454 800CB9F4 7CA4F1D6 */  mullw   r5, r4, r30
/* 0C6458 800CB9F8 7CE40014 */  addc    r7, r4, r0
/* 0C645C 800CB9FC 7C04F9D6 */  mullw   r0, r4, r31
/* 0C6460 800CBA00 7CFB49AE */  stbx    r7, r27, r9
/* 0C6464 800CBA04 7C80E814 */  addc    r4, r0, r29
/* 0C6468 800CBA08 7C062A14 */  add     r0, r6, r5
/* 0C646C 800CBA0C 7C60F114 */  adde    r3, r0, r30
/* 0C6470 800CBA10 38A00010 */  li      r5, 0x10
/* 0C6474 800CBA14 4800E505 */  bl      __shr2i
/* 0C6478 800CBA18 7C60F038 */  and     r0, r3, r30
/* 0C647C 800CBA1C 7C84D038 */  and     r4, r4, r26
/* 0C6480 800CBA20 7CA0F9D6 */  mullw   r5, r0, r31
/* 0C6484 800CBA24 7C64F816 */  mulhwu  r3, r4, r31
/* 0C6488 800CBA28 7CA51A14 */  add     r5, r5, r3
/* 0C648C 800CBA2C 7C64F1D6 */  mullw   r3, r4, r30
/* 0C6490 800CBA30 7C04F9D6 */  mullw   r0, r4, r31
/* 0C6494 800CBA34 7C80E814 */  addc    r4, r0, r29
/* 0C6498 800CBA38 7C051A14 */  add     r0, r5, r3
/* 0C649C 800CBA3C 7C60F114 */  adde    r3, r0, r30
/* 0C64A0 800CBA40 38A00010 */  li      r5, 0x10
/* 0C64A4 800CBA44 4800E4D5 */  bl      __shr2i
/* 0C64A8 800CBA48 7CC3F9D6 */  mullw   r6, r3, r31
/* 0C64AC 800CBA4C 7CA4F816 */  mulhwu  r5, r4, r31
/* 0C64B0 800CBA50 393C0002 */  addi    r9, r28, 2
/* 0C64B4 800CBA54 7D290734 */  extsh   r9, r9
/* 0C64B8 800CBA58 7C1948AE */  lbzx    r0, r25, r9
/* 0C64BC 800CBA5C 7CC62A14 */  add     r6, r6, r5
/* 0C64C0 800CBA60 7CA4F1D6 */  mullw   r5, r4, r30
/* 0C64C4 800CBA64 7CE40014 */  addc    r7, r4, r0
/* 0C64C8 800CBA68 7C04F9D6 */  mullw   r0, r4, r31
/* 0C64CC 800CBA6C 7CFB49AE */  stbx    r7, r27, r9
/* 0C64D0 800CBA70 7C80E814 */  addc    r4, r0, r29
/* 0C64D4 800CBA74 7C062A14 */  add     r0, r6, r5
/* 0C64D8 800CBA78 7C60F114 */  adde    r3, r0, r30
/* 0C64DC 800CBA7C 38A00010 */  li      r5, 0x10
/* 0C64E0 800CBA80 4800E499 */  bl      __shr2i
/* 0C64E4 800CBA84 7C60F038 */  and     r0, r3, r30
/* 0C64E8 800CBA88 7C84D038 */  and     r4, r4, r26
/* 0C64EC 800CBA8C 7CA0F9D6 */  mullw   r5, r0, r31
/* 0C64F0 800CBA90 7C64F816 */  mulhwu  r3, r4, r31
/* 0C64F4 800CBA94 7CA51A14 */  add     r5, r5, r3
/* 0C64F8 800CBA98 7C64F1D6 */  mullw   r3, r4, r30
/* 0C64FC 800CBA9C 7C04F9D6 */  mullw   r0, r4, r31
/* 0C6500 800CBAA0 7C80E814 */  addc    r4, r0, r29
/* 0C6504 800CBAA4 7C051A14 */  add     r0, r5, r3
/* 0C6508 800CBAA8 7C60F114 */  adde    r3, r0, r30
/* 0C650C 800CBAAC 38A00010 */  li      r5, 0x10
/* 0C6510 800CBAB0 4800E469 */  bl      __shr2i
/* 0C6514 800CBAB4 7CC3F9D6 */  mullw   r6, r3, r31
/* 0C6518 800CBAB8 7CA4F816 */  mulhwu  r5, r4, r31
/* 0C651C 800CBABC 393C0003 */  addi    r9, r28, 3
/* 0C6520 800CBAC0 7D290734 */  extsh   r9, r9
/* 0C6524 800CBAC4 7C1948AE */  lbzx    r0, r25, r9
/* 0C6528 800CBAC8 7CC62A14 */  add     r6, r6, r5
/* 0C652C 800CBACC 7CA4F1D6 */  mullw   r5, r4, r30
/* 0C6530 800CBAD0 7CE40014 */  addc    r7, r4, r0
/* 0C6534 800CBAD4 7C04F9D6 */  mullw   r0, r4, r31
/* 0C6538 800CBAD8 7CFB49AE */  stbx    r7, r27, r9
/* 0C653C 800CBADC 7C80E814 */  addc    r4, r0, r29
/* 0C6540 800CBAE0 7C062A14 */  add     r0, r6, r5
/* 0C6544 800CBAE4 7C60F114 */  adde    r3, r0, r30
/* 0C6548 800CBAE8 38A00010 */  li      r5, 0x10
/* 0C654C 800CBAEC 4800E42D */  bl      __shr2i
/* 0C6550 800CBAF0 7C60F038 */  and     r0, r3, r30
/* 0C6554 800CBAF4 7C84D038 */  and     r4, r4, r26
/* 0C6558 800CBAF8 7CA0F9D6 */  mullw   r5, r0, r31
/* 0C655C 800CBAFC 7C64F816 */  mulhwu  r3, r4, r31
/* 0C6560 800CBB00 7CA51A14 */  add     r5, r5, r3
/* 0C6564 800CBB04 7C64F1D6 */  mullw   r3, r4, r30
/* 0C6568 800CBB08 7C04F9D6 */  mullw   r0, r4, r31
/* 0C656C 800CBB0C 7C80E814 */  addc    r4, r0, r29
/* 0C6570 800CBB10 7C051A14 */  add     r0, r5, r3
/* 0C6574 800CBB14 7C60F114 */  adde    r3, r0, r30
/* 0C6578 800CBB18 38A00010 */  li      r5, 0x10
/* 0C657C 800CBB1C 4800E3FD */  bl      __shr2i
/* 0C6580 800CBB20 7CC3F9D6 */  mullw   r6, r3, r31
/* 0C6584 800CBB24 7CA4F816 */  mulhwu  r5, r4, r31
/* 0C6588 800CBB28 393C0004 */  addi    r9, r28, 4
/* 0C658C 800CBB2C 7D290734 */  extsh   r9, r9
/* 0C6590 800CBB30 7C1948AE */  lbzx    r0, r25, r9
/* 0C6594 800CBB34 7CC62A14 */  add     r6, r6, r5
/* 0C6598 800CBB38 7CA4F1D6 */  mullw   r5, r4, r30
/* 0C659C 800CBB3C 7CE40014 */  addc    r7, r4, r0
/* 0C65A0 800CBB40 7C04F9D6 */  mullw   r0, r4, r31
/* 0C65A4 800CBB44 7CFB49AE */  stbx    r7, r27, r9
/* 0C65A8 800CBB48 7C80E814 */  addc    r4, r0, r29
/* 0C65AC 800CBB4C 7C062A14 */  add     r0, r6, r5
/* 0C65B0 800CBB50 7C60F114 */  adde    r3, r0, r30
/* 0C65B4 800CBB54 38A00010 */  li      r5, 0x10
/* 0C65B8 800CBB58 4800E3C1 */  bl      __shr2i
/* 0C65BC 800CBB5C 7C60F038 */  and     r0, r3, r30
/* 0C65C0 800CBB60 7C84D038 */  and     r4, r4, r26
/* 0C65C4 800CBB64 7CA0F9D6 */  mullw   r5, r0, r31
/* 0C65C8 800CBB68 7C64F816 */  mulhwu  r3, r4, r31
/* 0C65CC 800CBB6C 7CA51A14 */  add     r5, r5, r3
/* 0C65D0 800CBB70 7C64F1D6 */  mullw   r3, r4, r30
/* 0C65D4 800CBB74 7C04F9D6 */  mullw   r0, r4, r31
/* 0C65D8 800CBB78 7C80E814 */  addc    r4, r0, r29
/* 0C65DC 800CBB7C 7C051A14 */  add     r0, r5, r3
/* 0C65E0 800CBB80 7C60F114 */  adde    r3, r0, r30
/* 0C65E4 800CBB84 38A00010 */  li      r5, 0x10
/* 0C65E8 800CBB88 4800E391 */  bl      __shr2i
/* 0C65EC 800CBB8C 7CC3F9D6 */  mullw   r6, r3, r31
/* 0C65F0 800CBB90 7CA4F816 */  mulhwu  r5, r4, r31
/* 0C65F4 800CBB94 393C0005 */  addi    r9, r28, 5
/* 0C65F8 800CBB98 7D290734 */  extsh   r9, r9
/* 0C65FC 800CBB9C 7C1948AE */  lbzx    r0, r25, r9
/* 0C6600 800CBBA0 7CC62A14 */  add     r6, r6, r5
/* 0C6604 800CBBA4 7CA4F1D6 */  mullw   r5, r4, r30
/* 0C6608 800CBBA8 7CE40014 */  addc    r7, r4, r0
/* 0C660C 800CBBAC 7C04F9D6 */  mullw   r0, r4, r31
/* 0C6610 800CBBB0 7CFB49AE */  stbx    r7, r27, r9
/* 0C6614 800CBBB4 7C80E814 */  addc    r4, r0, r29
/* 0C6618 800CBBB8 7C062A14 */  add     r0, r6, r5
/* 0C661C 800CBBBC 7C60F114 */  adde    r3, r0, r30
/* 0C6620 800CBBC0 38A00010 */  li      r5, 0x10
/* 0C6624 800CBBC4 4800E355 */  bl      __shr2i
/* 0C6628 800CBBC8 7C60F038 */  and     r0, r3, r30
/* 0C662C 800CBBCC 7C84D038 */  and     r4, r4, r26
/* 0C6630 800CBBD0 7CA0F9D6 */  mullw   r5, r0, r31
/* 0C6634 800CBBD4 7C64F816 */  mulhwu  r3, r4, r31
/* 0C6638 800CBBD8 7CA51A14 */  add     r5, r5, r3
/* 0C663C 800CBBDC 7C64F1D6 */  mullw   r3, r4, r30
/* 0C6640 800CBBE0 7C04F9D6 */  mullw   r0, r4, r31
/* 0C6644 800CBBE4 7C80E814 */  addc    r4, r0, r29
/* 0C6648 800CBBE8 7C051A14 */  add     r0, r5, r3
/* 0C664C 800CBBEC 7C60F114 */  adde    r3, r0, r30
/* 0C6650 800CBBF0 38A00010 */  li      r5, 0x10
/* 0C6654 800CBBF4 4800E325 */  bl      __shr2i
/* 0C6658 800CBBF8 7CC3F9D6 */  mullw   r6, r3, r31
/* 0C665C 800CBBFC 7CA4F816 */  mulhwu  r5, r4, r31
/* 0C6660 800CBC00 393C0006 */  addi    r9, r28, 6
/* 0C6664 800CBC04 7D290734 */  extsh   r9, r9
/* 0C6668 800CBC08 7C1948AE */  lbzx    r0, r25, r9
/* 0C666C 800CBC0C 7CC62A14 */  add     r6, r6, r5
/* 0C6670 800CBC10 7CA4F1D6 */  mullw   r5, r4, r30
/* 0C6674 800CBC14 7CE40014 */  addc    r7, r4, r0
/* 0C6678 800CBC18 7C04F9D6 */  mullw   r0, r4, r31
/* 0C667C 800CBC1C 7CFB49AE */  stbx    r7, r27, r9
/* 0C6680 800CBC20 7C80E814 */  addc    r4, r0, r29
/* 0C6684 800CBC24 7C062A14 */  add     r0, r6, r5
/* 0C6688 800CBC28 7C60F114 */  adde    r3, r0, r30
/* 0C668C 800CBC2C 38A00010 */  li      r5, 0x10
/* 0C6690 800CBC30 4800E2E9 */  bl      __shr2i
/* 0C6694 800CBC34 7C60F038 */  and     r0, r3, r30
/* 0C6698 800CBC38 7C84D038 */  and     r4, r4, r26
/* 0C669C 800CBC3C 7CA0F9D6 */  mullw   r5, r0, r31
/* 0C66A0 800CBC40 7C64F816 */  mulhwu  r3, r4, r31
/* 0C66A4 800CBC44 7CA51A14 */  add     r5, r5, r3
/* 0C66A8 800CBC48 7C64F1D6 */  mullw   r3, r4, r30
/* 0C66AC 800CBC4C 7C04F9D6 */  mullw   r0, r4, r31
/* 0C66B0 800CBC50 7C80E814 */  addc    r4, r0, r29
/* 0C66B4 800CBC54 7C051A14 */  add     r0, r5, r3
/* 0C66B8 800CBC58 7C60F114 */  adde    r3, r0, r30
/* 0C66BC 800CBC5C 38A00010 */  li      r5, 0x10
/* 0C66C0 800CBC60 4800E2B9 */  bl      __shr2i
/* 0C66C4 800CBC64 7CC3F9D6 */  mullw   r6, r3, r31
/* 0C66C8 800CBC68 7CA4F816 */  mulhwu  r5, r4, r31
/* 0C66CC 800CBC6C 393C0007 */  addi    r9, r28, 7
/* 0C66D0 800CBC70 7D290734 */  extsh   r9, r9
/* 0C66D4 800CBC74 7C1948AE */  lbzx    r0, r25, r9
/* 0C66D8 800CBC78 7CC62A14 */  add     r6, r6, r5
/* 0C66DC 800CBC7C 7CA4F1D6 */  mullw   r5, r4, r30
/* 0C66E0 800CBC80 7CE40014 */  addc    r7, r4, r0
/* 0C66E4 800CBC84 7C04F9D6 */  mullw   r0, r4, r31
/* 0C66E8 800CBC88 7CFB49AE */  stbx    r7, r27, r9
/* 0C66EC 800CBC8C 7C80E814 */  addc    r4, r0, r29
/* 0C66F0 800CBC90 7C062A14 */  add     r0, r6, r5
/* 0C66F4 800CBC94 7C60F114 */  adde    r3, r0, r30
/* 0C66F8 800CBC98 38A00010 */  li      r5, 0x10
/* 0C66FC 800CBC9C 4800E27D */  bl      __shr2i
/* 0C6700 800CBCA0 7C9AD038 */  and     r26, r4, r26
/* 0C6704 800CBCA4 7C7EF038 */  and     r30, r3, r30
/* 0C6708 800CBCA8 3B180008 */  addi    r24, r24, 8
/* 0C670C 800CBCAC 3B9C0008 */  addi    r28, r28, 8
lbl_800CBCB0:
/* 0C6710 800CBCB0 7F800734 */  extsh   r0, r28
/* 0C6714 800CBCB4 7C00B800 */  cmpw    r0, r23
/* 0C6718 800CBCB8 4180FC88 */  blt     lbl_800CB940
/* 0C671C 800CBCBC 48000218 */  b       lbl_800CBED4
lbl_800CBCC0:
/* 0C6720 800CBCC0 3C6041C6 */  lis     r3, 0x41c6
/* 0C6724 800CBCC4 3B234E6D */  addi    r25, r3, 0x4e6d
/* 0C6728 800CBCC8 48000080 */  b       lbl_800CBD48
lbl_800CBCCC:
/* 0C672C 800CBCCC 7CBEC9D6 */  mullw   r5, r30, r25
/* 0C6730 800CBCD0 7C7AC816 */  mulhwu  r3, r26, r25
/* 0C6734 800CBCD4 3B000000 */  li      r24, 0
/* 0C6738 800CBCD8 7CA51A14 */  add     r5, r5, r3
/* 0C673C 800CBCDC 7C7AC1D6 */  mullw   r3, r26, r24
/* 0C6740 800CBCE0 7C1AC9D6 */  mullw   r0, r26, r25
/* 0C6744 800CBCE4 3AE03039 */  li      r23, 0x3039
/* 0C6748 800CBCE8 7C80B814 */  addc    r4, r0, r23
/* 0C674C 800CBCEC 7C051A14 */  add     r0, r5, r3
/* 0C6750 800CBCF0 7C60C114 */  adde    r3, r0, r24
/* 0C6754 800CBCF4 38A00010 */  li      r5, 0x10
/* 0C6758 800CBCF8 4800E221 */  bl      __shr2i
/* 0C675C 800CBCFC 7CC3C9D6 */  mullw   r6, r3, r25
/* 0C6760 800CBD00 881D0000 */  lbz     r0, 0(r29)
/* 0C6764 800CBD04 7CA4C816 */  mulhwu  r5, r4, r25
/* 0C6768 800CBD08 7CC62A14 */  add     r6, r6, r5
/* 0C676C 800CBD0C 7D040014 */  addc    r8, r4, r0
/* 0C6770 800CBD10 7F870734 */  extsh   r7, r28
/* 0C6774 800CBD14 7CA4C1D6 */  mullw   r5, r4, r24
/* 0C6778 800CBD18 7D1B39AE */  stbx    r8, r27, r7
/* 0C677C 800CBD1C 7C04C9D6 */  mullw   r0, r4, r25
/* 0C6780 800CBD20 7C80B814 */  addc    r4, r0, r23
/* 0C6784 800CBD24 7C062A14 */  add     r0, r6, r5
/* 0C6788 800CBD28 7C60C114 */  adde    r3, r0, r24
/* 0C678C 800CBD2C 38A00010 */  li      r5, 0x10
/* 0C6790 800CBD30 4800E1E9 */  bl      __shr2i
/* 0C6794 800CBD34 38007FFF */  li      r0, 0x7fff
/* 0C6798 800CBD38 7C9A0038 */  and     r26, r4, r0
/* 0C679C 800CBD3C 7C7EC038 */  and     r30, r3, r24
/* 0C67A0 800CBD40 3BBD0001 */  addi    r29, r29, 1
/* 0C67A4 800CBD44 3B9C0001 */  addi    r28, r28, 1
lbl_800CBD48:
/* 0C67A8 800CBD48 7F800734 */  extsh   r0, r28
/* 0C67AC 800CBD4C 2C00000C */  cmpwi   r0, 0xc
/* 0C67B0 800CBD50 4180FF7C */  blt     lbl_800CBCCC
/* 0C67B4 800CBD54 38600000 */  li      r3, 0
/* 0C67B8 800CBD58 4BFE09C1 */  bl      __OSUnlockSramEx
/* 0C67BC 800CBD5C 925B001C */  stw     r18, 0x1c(r27)
/* 0C67C0 800CBD60 3A400000 */  li      r18, 0
/* 0C67C4 800CBD64 387B0000 */  addi    r3, r27, 0
/* 0C67C8 800CBD68 92BB0010 */  stw     r21, 0x10(r27)
/* 0C67CC 800CBD6C 38BB01FC */  addi    r5, r27, 0x1fc
/* 0C67D0 800CBD70 38DB01FE */  addi    r6, r27, 0x1fe
/* 0C67D4 800CBD74 929B000C */  stw     r20, 0xc(r27)
/* 0C67D8 800CBD78 388001FC */  li      r4, 0x1fc
/* 0C67DC 800CBD7C B25B0020 */  sth     r18, 0x20(r27)
/* 0C67E0 800CBD80 80E10018 */  lwz     r7, 0x18(r1)
/* 0C67E4 800CBD84 A0070008 */  lhz     r0, 8(r7)
/* 0C67E8 800CBD88 B01B0022 */  sth     r0, 0x22(r27)
/* 0C67EC 800CBD8C 4BFFDFA1 */  bl      __CARDCheckSum
/* 0C67F0 800CBD90 4800004C */  b       lbl_800CBDDC
lbl_800CBD94:
/* 0C67F4 800CBD94 80810018 */  lwz     r4, 0x18(r1)
/* 0C67F8 800CBD98 7E430734 */  extsh   r3, r18
/* 0C67FC 800CBD9C 38030001 */  addi    r0, r3, 1
/* 0C6800 800CBDA0 80640080 */  lwz     r3, 0x80(r4)
/* 0C6804 800CBDA4 54006824 */  slwi    r0, r0, 0xd
/* 0C6808 800CBDA8 388000FF */  li      r4, 0xff
/* 0C680C 800CBDAC 7E830214 */  add     r20, r3, r0
/* 0C6810 800CBDB0 38740000 */  addi    r3, r20, 0
/* 0C6814 800CBDB4 38A02000 */  li      r5, 0x2000
/* 0C6818 800CBDB8 4BF39619 */  bl      memset
/* 0C681C 800CBDBC 38941FC0 */  addi    r4, r20, 0x1fc0
/* 0C6820 800CBDC0 B2541FFA */  sth     r18, 0x1ffa(r20)
/* 0C6824 800CBDC4 38740000 */  addi    r3, r20, 0
/* 0C6828 800CBDC8 38A4003C */  addi    r5, r4, 0x3c
/* 0C682C 800CBDCC 38C4003E */  addi    r6, r4, 0x3e
/* 0C6830 800CBDD0 38801FFC */  li      r4, 0x1ffc
/* 0C6834 800CBDD4 4BFFDF59 */  bl      __CARDCheckSum
/* 0C6838 800CBDD8 3A520001 */  addi    r18, r18, 1
lbl_800CBDDC:
/* 0C683C 800CBDDC 7E400734 */  extsh   r0, r18
/* 0C6840 800CBDE0 2C000002 */  cmpwi   r0, 2
/* 0C6844 800CBDE4 4180FFB0 */  blt     lbl_800CBD94
/* 0C6848 800CBDE8 3A400000 */  li      r18, 0
/* 0C684C 800CBDEC 48000060 */  b       lbl_800CBE4C
lbl_800CBDF0:
/* 0C6850 800CBDF0 80810018 */  lwz     r4, 0x18(r1)
/* 0C6854 800CBDF4 7E430734 */  extsh   r3, r18
/* 0C6858 800CBDF8 38030003 */  addi    r0, r3, 3
/* 0C685C 800CBDFC 80640080 */  lwz     r3, 0x80(r4)
/* 0C6860 800CBE00 54006824 */  slwi    r0, r0, 0xd
/* 0C6864 800CBE04 38800000 */  li      r4, 0
/* 0C6868 800CBE08 7E830214 */  add     r20, r3, r0
/* 0C686C 800CBE0C 38740000 */  addi    r3, r20, 0
/* 0C6870 800CBE10 38A02000 */  li      r5, 0x2000
/* 0C6874 800CBE14 4BF395BD */  bl      memset
/* 0C6878 800CBE18 B2540004 */  sth     r18, 4(r20)
/* 0C687C 800CBE1C 38000004 */  li      r0, 4
/* 0C6880 800CBE20 38B40000 */  addi    r5, r20, 0
/* 0C6884 800CBE24 80810018 */  lwz     r4, 0x18(r1)
/* 0C6888 800CBE28 38740004 */  addi    r3, r20, 4
/* 0C688C 800CBE2C 38D40002 */  addi    r6, r20, 2
/* 0C6890 800CBE30 A0E40010 */  lhz     r7, 0x10(r4)
/* 0C6894 800CBE34 38801FFC */  li      r4, 0x1ffc
/* 0C6898 800CBE38 38E7FFFB */  addi    r7, r7, -5
/* 0C689C 800CBE3C B0F40006 */  sth     r7, 6(r20)
/* 0C68A0 800CBE40 B0140008 */  sth     r0, 8(r20)
/* 0C68A4 800CBE44 4BFFDEE9 */  bl      __CARDCheckSum
/* 0C68A8 800CBE48 3A520001 */  addi    r18, r18, 1
lbl_800CBE4C:
/* 0C68AC 800CBE4C 7E400734 */  extsh   r0, r18
/* 0C68B0 800CBE50 2C000002 */  cmpwi   r0, 2
/* 0C68B4 800CBE54 4180FF9C */  blt     lbl_800CBDF0
/* 0C68B8 800CBE58 28130000 */  cmplwi  r19, 0
/* 0C68BC 800CBE5C 4182000C */  beq     lbl_800CBE68
/* 0C68C0 800CBE60 7E609B78 */  mr      r0, r19
/* 0C68C4 800CBE64 4800000C */  b       lbl_800CBE70
lbl_800CBE68:
/* 0C68C8 800CBE68 3C60800C */  lis     r3, __CARDDefaultApiCallback@ha
/* 0C68CC 800CBE6C 38036EE8 */  addi    r0, r3, __CARDDefaultApiCallback@l
lbl_800CBE70:
/* 0C68D0 800CBE70 80A10018 */  lwz     r5, 0x18(r1)
/* 0C68D4 800CBE74 3C600001 */  lis     r3, 1
/* 0C68D8 800CBE78 3883A000 */  addi    r4, r3, -24576
/* 0C68DC 800CBE7C 900500D0 */  stw     r0, 0xd0(r5)
/* 0C68E0 800CBE80 80610018 */  lwz     r3, 0x18(r1)
/* 0C68E4 800CBE84 80630080 */  lwz     r3, 0x80(r3)
/* 0C68E8 800CBE88 4BFDD399 */  bl      DCStoreRange
/* 0C68EC 800CBE8C 80810018 */  lwz     r4, 0x18(r1)
/* 0C68F0 800CBE90 38000000 */  li      r0, 0
/* 0C68F4 800CBE94 3C60800D */  lis     r3, FormatCallback@ha
/* 0C68F8 800CBE98 90040028 */  stw     r0, 0x28(r4)
/* 0C68FC 800CBE9C 38A3B754 */  addi    r5, r3, FormatCallback@l
/* 0C6900 800CBEA0 38760000 */  addi    r3, r22, 0
/* 0C6904 800CBEA4 80C10018 */  lwz     r6, 0x18(r1)
/* 0C6908 800CBEA8 8086000C */  lwz     r4, 0xc(r6)
/* 0C690C 800CBEAC 80060028 */  lwz     r0, 0x28(r6)
/* 0C6910 800CBEB0 7C8401D6 */  mullw   r4, r4, r0
/* 0C6914 800CBEB4 4BFFBDC9 */  bl      __CARDEraseSector
/* 0C6918 800CBEB8 7C721B79 */  or.     r18, r3, r3
/* 0C691C 800CBEBC 40800010 */  bge     lbl_800CBECC
/* 0C6920 800CBEC0 80610018 */  lwz     r3, 0x18(r1)
/* 0C6924 800CBEC4 7E449378 */  mr      r4, r18
/* 0C6928 800CBEC8 4BFFC039 */  bl      __CARDPutControlBlock
lbl_800CBECC:
/* 0C692C 800CBECC 7E439378 */  mr      r3, r18
/* 0C6930 800CBED0 4800000C */  b       lbl_800CBEDC
lbl_800CBED4:
/* 0C6934 800CBED4 7FB90214 */  add     r29, r25, r0
/* 0C6938 800CBED8 4BFFFDE8 */  b       lbl_800CBCC0
lbl_800CBEDC:
/* 0C693C 800CBEDC BA410020 */  lmw     r18, 0x20(r1)
/* 0C6940 800CBEE0 8001005C */  lwz     r0, 0x5c(r1)
/* 0C6944 800CBEE4 38210058 */  addi    r1, r1, 0x58
/* 0C6948 800CBEE8 7C0803A6 */  mtlr    r0
/* 0C694C 800CBEEC 4E800020 */  blr     

glabel CARDFormatAsync
/* 0C6950 800CBEF0 7C0802A6 */  mflr    r0
/* 0C6954 800CBEF4 90010004 */  stw     r0, 4(r1)
/* 0C6958 800CBEF8 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0C695C 800CBEFC 93E10014 */  stw     r31, 0x14(r1)
/* 0C6960 800CBF00 3BE40000 */  addi    r31, r4, 0
/* 0C6964 800CBF04 93C10010 */  stw     r30, 0x10(r1)
/* 0C6968 800CBF08 3BC30000 */  addi    r30, r3, 0
/* 0C696C 800CBF0C 4BFFBEFD */  bl      __CARDGetFontEncode
/* 0C6970 800CBF10 38830000 */  addi    r4, r3, 0
/* 0C6974 800CBF14 387E0000 */  addi    r3, r30, 0
/* 0C6978 800CBF18 38BF0000 */  addi    r5, r31, 0
/* 0C697C 800CBF1C 4BFFF97D */  bl      __CARDFormatRegionAsync
/* 0C6980 800CBF20 8001001C */  lwz     r0, 0x1c(r1)
/* 0C6984 800CBF24 83E10014 */  lwz     r31, 0x14(r1)
/* 0C6988 800CBF28 83C10010 */  lwz     r30, 0x10(r1)
/* 0C698C 800CBF2C 38210018 */  addi    r1, r1, 0x18
/* 0C6990 800CBF30 7C0803A6 */  mtlr    r0
/* 0C6994 800CBF34 4E800020 */  blr     


