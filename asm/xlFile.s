# xlFile.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel xlFileGetLineSave
/* 002550 80007AF0 7C0802A6 */  mflr    r0
/* 002554 80007AF4 28040000 */  cmplwi  r4, 0
/* 002558 80007AF8 90010004 */  stw     r0, 4(r1)
/* 00255C 80007AFC 9421FFF8 */  stwu    r1, -8(r1)
/* 002560 80007B00 41820028 */  beq     lbl_80007B28
/* 002564 80007B04 80030020 */  lwz     r0, 0x20(r3)
/* 002568 80007B08 90040004 */  stw     r0, 4(r4)
/* 00256C 80007B0C 4BFFE34D */  bl      xlFileGetPosition
/* 002570 80007B10 2C030000 */  cmpwi   r3, 0
/* 002574 80007B14 4082000C */  bne     lbl_80007B20
/* 002578 80007B18 38600000 */  li      r3, 0
/* 00257C 80007B1C 48000010 */  b       lbl_80007B2C
lbl_80007B20:
/* 002580 80007B20 38600001 */  li      r3, 1
/* 002584 80007B24 48000008 */  b       lbl_80007B2C
lbl_80007B28:
/* 002588 80007B28 38600000 */  li      r3, 0
lbl_80007B2C:
/* 00258C 80007B2C 8001000C */  lwz     r0, 0xc(r1)
/* 002590 80007B30 38210008 */  addi    r1, r1, 8
/* 002594 80007B34 7C0803A6 */  mtlr    r0
/* 002598 80007B38 4E800020 */  blr     

glabel xlFileMatchToken
/* 00259C 80007B3C 7C0802A6 */  mflr    r0
/* 0025A0 80007B40 90010004 */  stw     r0, 4(r1)
/* 0025A4 80007B44 9421FF88 */  stwu    r1, -0x78(r1)
/* 0025A8 80007B48 93E10074 */  stw     r31, 0x74(r1)
/* 0025AC 80007B4C 3BE70000 */  addi    r31, r7, 0
/* 0025B0 80007B50 93C10070 */  stw     r30, 0x70(r1)
/* 0025B4 80007B54 3BC60000 */  addi    r30, r6, 0
/* 0025B8 80007B58 38C00040 */  li      r6, 0x40
/* 0025BC 80007B5C 93A1006C */  stw     r29, 0x6c(r1)
/* 0025C0 80007B60 3BA50000 */  addi    r29, r5, 0
/* 0025C4 80007B64 38A1001C */  addi    r5, r1, 0x1c
/* 0025C8 80007B68 93810068 */  stw     r28, 0x68(r1)
/* 0025CC 80007B6C 3B840000 */  addi    r28, r4, 0
/* 0025D0 80007B70 38810060 */  addi    r4, r1, 0x60
/* 0025D4 80007B74 48000099 */  bl      xlFileGetToken
/* 0025D8 80007B78 2C030000 */  cmpwi   r3, 0
/* 0025DC 80007B7C 4182006C */  beq     lbl_80007BE8
/* 0025E0 80007B80 80010060 */  lwz     r0, 0x60(r1)
/* 0025E4 80007B84 7C1C0000 */  cmpw    r28, r0
/* 0025E8 80007B88 40820060 */  bne     lbl_80007BE8
/* 0025EC 80007B8C 281F0000 */  cmplwi  r31, 0
/* 0025F0 80007B90 41820018 */  beq     lbl_80007BA8
/* 0025F4 80007B94 3861001C */  addi    r3, r1, 0x1c
/* 0025F8 80007B98 389F0000 */  addi    r4, r31, 0
/* 0025FC 80007B9C 4BFFE521 */  bl      xlTextMatch
/* 002600 80007BA0 2C030000 */  cmpwi   r3, 0
/* 002604 80007BA4 41820044 */  beq     lbl_80007BE8
lbl_80007BA8:
/* 002608 80007BA8 281D0000 */  cmplwi  r29, 0
/* 00260C 80007BAC 41820034 */  beq     lbl_80007BE0
/* 002610 80007BB0 2C1E0040 */  cmpwi   r30, 0x40
/* 002614 80007BB4 40800010 */  bge     lbl_80007BC4
/* 002618 80007BB8 3861001C */  addi    r3, r1, 0x1c
/* 00261C 80007BBC 38000000 */  li      r0, 0
/* 002620 80007BC0 7C03F1AE */  stbx    r0, r3, r30
lbl_80007BC4:
/* 002624 80007BC4 387D0000 */  addi    r3, r29, 0
/* 002628 80007BC8 3881001C */  addi    r4, r1, 0x1c
/* 00262C 80007BCC 4BFFE5AD */  bl      xlTextCopy
/* 002630 80007BD0 2C030000 */  cmpwi   r3, 0
/* 002634 80007BD4 4082000C */  bne     lbl_80007BE0
/* 002638 80007BD8 38600000 */  li      r3, 0
/* 00263C 80007BDC 48000010 */  b       lbl_80007BEC
lbl_80007BE0:
/* 002640 80007BE0 38600001 */  li      r3, 1
/* 002644 80007BE4 48000008 */  b       lbl_80007BEC
lbl_80007BE8:
/* 002648 80007BE8 38600000 */  li      r3, 0
lbl_80007BEC:
/* 00264C 80007BEC 8001007C */  lwz     r0, 0x7c(r1)
/* 002650 80007BF0 83E10074 */  lwz     r31, 0x74(r1)
/* 002654 80007BF4 83C10070 */  lwz     r30, 0x70(r1)
/* 002658 80007BF8 7C0803A6 */  mtlr    r0
/* 00265C 80007BFC 83A1006C */  lwz     r29, 0x6c(r1)
/* 002660 80007C00 83810068 */  lwz     r28, 0x68(r1)
/* 002664 80007C04 38210078 */  addi    r1, r1, 0x78
/* 002668 80007C08 4E800020 */  blr     

glabel xlFileGetToken
/* 00266C 80007C0C 7C0802A6 */  mflr    r0
/* 002670 80007C10 90010004 */  stw     r0, 4(r1)
/* 002674 80007C14 9421FFC0 */  stwu    r1, -0x40(r1)
/* 002678 80007C18 BEE1001C */  stmw    r23, 0x1c(r1)
/* 00267C 80007C1C 7C781B78 */  mr      r24, r3
/* 002680 80007C20 3B240000 */  addi    r25, r4, 0
/* 002684 80007C24 3B450000 */  addi    r26, r5, 0
/* 002688 80007C28 3B660000 */  addi    r27, r6, 0
/* 00268C 80007C2C 3BA00000 */  li      r29, 0
/* 002690 80007C30 3B80FFFF */  li      r28, -1
/* 002694 80007C34 80030004 */  lwz     r0, 4(r3)
/* 002698 80007C38 28000000 */  cmplwi  r0, 0
/* 00269C 80007C3C 40820030 */  bne     lbl_80007C6C
/* 0026A0 80007C40 3800FFFF */  li      r0, -1
/* 0026A4 80007C44 9018001C */  stw     r0, 0x1c(r24)
/* 0026A8 80007C48 38000000 */  li      r0, 0
/* 0026AC 80007C4C 38780004 */  addi    r3, r24, 4
/* 0026B0 80007C50 90180020 */  stw     r0, 0x20(r24)
/* 0026B4 80007C54 38800101 */  li      r4, 0x101
/* 0026B8 80007C58 4BFFF48D */  bl      xlHeapTake
/* 0026BC 80007C5C 2C030000 */  cmpwi   r3, 0
/* 0026C0 80007C60 4082000C */  bne     lbl_80007C6C
/* 0026C4 80007C64 38600000 */  li      r3, 0
/* 0026C8 80007C68 48000250 */  b       lbl_80007EB8
lbl_80007C6C:
/* 0026CC 80007C6C 83D8001C */  lwz     r30, 0x1c(r24)
/* 0026D0 80007C70 83F80004 */  lwz     r31, 4(r24)
/* 0026D4 80007C74 48000220 */  b       lbl_80007E94
lbl_80007C78:
/* 0026D8 80007C78 2C1E0000 */  cmpwi   r30, 0
/* 0026DC 80007C7C 41800018 */  blt     lbl_80007C94
/* 0026E0 80007C80 2C1E0100 */  cmpwi   r30, 0x100
/* 0026E4 80007C84 40800010 */  bge     lbl_80007C94
/* 0026E8 80007C88 7C1FF0AE */  lbzx    r0, r31, r30
/* 0026EC 80007C8C 7C000775 */  extsb.  r0, r0
/* 0026F0 80007C90 4082003C */  bne     lbl_80007CCC
lbl_80007C94:
/* 0026F4 80007C94 38780000 */  addi    r3, r24, 0
/* 0026F8 80007C98 389F0000 */  addi    r4, r31, 0
/* 0026FC 80007C9C 38A00100 */  li      r5, 0x100
/* 002700 80007CA0 48000361 */  bl      xlFileGetLine
/* 002704 80007CA4 2C030000 */  cmpwi   r3, 0
/* 002708 80007CA8 4182000C */  beq     lbl_80007CB4
/* 00270C 80007CAC 3BC00000 */  li      r30, 0
/* 002710 80007CB0 4800001C */  b       lbl_80007CCC
lbl_80007CB4:
/* 002714 80007CB4 3800FFFF */  li      r0, -1
/* 002718 80007CB8 9018001C */  stw     r0, 0x1c(r24)
/* 00271C 80007CBC 38600000 */  li      r3, 0
/* 002720 80007CC0 480001F8 */  b       lbl_80007EB8
/* 002724 80007CC4 48000008 */  b       lbl_80007CCC
lbl_80007CC8:
/* 002728 80007CC8 3BDE0001 */  addi    r30, r30, 1
lbl_80007CCC:
/* 00272C 80007CCC 7C9FF214 */  add     r4, r31, r30
/* 002730 80007CD0 88640000 */  lbz     r3, 0(r4)
/* 002734 80007CD4 7C600774 */  extsb   r0, r3
/* 002738 80007CD8 2C000020 */  cmpwi   r0, 0x20
/* 00273C 80007CDC 4181000C */  bgt     lbl_80007CE8
/* 002740 80007CE0 7C600775 */  extsb.  r0, r3
/* 002744 80007CE4 4082FFE4 */  bne     lbl_80007CC8
lbl_80007CE8:
/* 002748 80007CE8 7C600775 */  extsb.  r0, r3
/* 00274C 80007CEC 418201A8 */  beq     lbl_80007E94
/* 002750 80007CF0 7C600774 */  extsb   r0, r3
/* 002754 80007CF4 2C000030 */  cmpwi   r0, 0x30
/* 002758 80007CF8 4180000C */  blt     lbl_80007D04
/* 00275C 80007CFC 2C000039 */  cmpwi   r0, 0x39
/* 002760 80007D00 40810030 */  ble     lbl_80007D30
lbl_80007D04:
/* 002764 80007D04 7C600774 */  extsb   r0, r3
/* 002768 80007D08 2C00002B */  cmpwi   r0, 0x2b
/* 00276C 80007D0C 4182000C */  beq     lbl_80007D18
/* 002770 80007D10 2C00002D */  cmpwi   r0, 0x2d
/* 002774 80007D14 40820068 */  bne     lbl_80007D7C
lbl_80007D18:
/* 002778 80007D18 88040001 */  lbz     r0, 1(r4)
/* 00277C 80007D1C 7C000774 */  extsb   r0, r0
/* 002780 80007D20 2C000030 */  cmpwi   r0, 0x30
/* 002784 80007D24 41800058 */  blt     lbl_80007D7C
/* 002788 80007D28 2C000039 */  cmpwi   r0, 0x39
/* 00278C 80007D2C 41810050 */  bgt     lbl_80007D7C
lbl_80007D30:
/* 002790 80007D30 7EFFF214 */  add     r23, r31, r30
/* 002794 80007D34 3B800001 */  li      r28, 1
/* 002798 80007D38 48000034 */  b       lbl_80007D6C
lbl_80007D3C:
/* 00279C 80007D3C 7C1DD800 */  cmpw    r29, r27
/* 0027A0 80007D40 40800010 */  bge     lbl_80007D50
/* 0027A4 80007D44 7FA0EB78 */  mr      r0, r29
/* 0027A8 80007D48 7C7A01AE */  stbx    r3, r26, r0
/* 0027AC 80007D4C 3BBD0001 */  addi    r29, r29, 1
lbl_80007D50:
/* 0027B0 80007D50 8C970001 */  lbzu    r4, 1(r23)
/* 0027B4 80007D54 3BDE0001 */  addi    r30, r30, 1
/* 0027B8 80007D58 806D8008 */  lwz     r3, gacValidNumber-_SDA_BASE_(r13)
/* 0027BC 80007D5C 7C840774 */  extsb   r4, r4
/* 0027C0 80007D60 480D4BFD */  bl      strchr
/* 0027C4 80007D64 28030000 */  cmplwi  r3, 0
/* 0027C8 80007D68 4182012C */  beq     lbl_80007E94
lbl_80007D6C:
/* 0027CC 80007D6C 88770000 */  lbz     r3, 0(r23)
/* 0027D0 80007D70 7C600775 */  extsb.  r0, r3
/* 0027D4 80007D74 4082FFC8 */  bne     lbl_80007D3C
/* 0027D8 80007D78 4800011C */  b       lbl_80007E94
lbl_80007D7C:
/* 0027DC 80007D7C 7C600774 */  extsb   r0, r3
/* 0027E0 80007D80 2C000041 */  cmpwi   r0, 0x41
/* 0027E4 80007D84 4180000C */  blt     lbl_80007D90
/* 0027E8 80007D88 2C00005A */  cmpwi   r0, 0x5a
/* 0027EC 80007D8C 40810024 */  ble     lbl_80007DB0
lbl_80007D90:
/* 0027F0 80007D90 7C600774 */  extsb   r0, r3
/* 0027F4 80007D94 2C000061 */  cmpwi   r0, 0x61
/* 0027F8 80007D98 4180000C */  blt     lbl_80007DA4
/* 0027FC 80007D9C 2C00007A */  cmpwi   r0, 0x7a
/* 002800 80007DA0 40810010 */  ble     lbl_80007DB0
lbl_80007DA4:
/* 002804 80007DA4 7C640774 */  extsb   r4, r3
/* 002808 80007DA8 2C04005F */  cmpwi   r4, 0x5f
/* 00280C 80007DAC 40820050 */  bne     lbl_80007DFC
lbl_80007DB0:
/* 002810 80007DB0 7EFFF214 */  add     r23, r31, r30
/* 002814 80007DB4 3B800000 */  li      r28, 0
/* 002818 80007DB8 48000034 */  b       lbl_80007DEC
lbl_80007DBC:
/* 00281C 80007DBC 7C1DD800 */  cmpw    r29, r27
/* 002820 80007DC0 40800010 */  bge     lbl_80007DD0
/* 002824 80007DC4 7FA0EB78 */  mr      r0, r29
/* 002828 80007DC8 7C7A01AE */  stbx    r3, r26, r0
/* 00282C 80007DCC 3BBD0001 */  addi    r29, r29, 1
lbl_80007DD0:
/* 002830 80007DD0 8C970001 */  lbzu    r4, 1(r23)
/* 002834 80007DD4 3BDE0001 */  addi    r30, r30, 1
/* 002838 80007DD8 806D8010 */  lwz     r3, gacValidLabel-_SDA_BASE_(r13)
/* 00283C 80007DDC 7C840774 */  extsb   r4, r4
/* 002840 80007DE0 480D4B7D */  bl      strchr
/* 002844 80007DE4 28030000 */  cmplwi  r3, 0
/* 002848 80007DE8 418200AC */  beq     lbl_80007E94
lbl_80007DEC:
/* 00284C 80007DEC 88770000 */  lbz     r3, 0(r23)
/* 002850 80007DF0 7C600775 */  extsb.  r0, r3
/* 002854 80007DF4 4082FFC8 */  bne     lbl_80007DBC
/* 002858 80007DF8 4800009C */  b       lbl_80007E94
lbl_80007DFC:
/* 00285C 80007DFC 2C040022 */  cmpwi   r4, 0x22
/* 002860 80007E00 4082005C */  bne     lbl_80007E5C
/* 002864 80007E04 3BDE0001 */  addi    r30, r30, 1
/* 002868 80007E08 7C7FF214 */  add     r3, r31, r30
/* 00286C 80007E0C 3B800002 */  li      r28, 2
/* 002870 80007E10 48000020 */  b       lbl_80007E30
lbl_80007E14:
/* 002874 80007E14 7C1DD800 */  cmpw    r29, r27
/* 002878 80007E18 40800010 */  bge     lbl_80007E28
/* 00287C 80007E1C 7FA0EB78 */  mr      r0, r29
/* 002880 80007E20 7C9A01AE */  stbx    r4, r26, r0
/* 002884 80007E24 3BBD0001 */  addi    r29, r29, 1
lbl_80007E28:
/* 002888 80007E28 3BDE0001 */  addi    r30, r30, 1
/* 00288C 80007E2C 38630001 */  addi    r3, r3, 1
lbl_80007E30:
/* 002890 80007E30 88830000 */  lbz     r4, 0(r3)
/* 002894 80007E34 7C800775 */  extsb.  r0, r4
/* 002898 80007E38 41820010 */  beq     lbl_80007E48
/* 00289C 80007E3C 7C800774 */  extsb   r0, r4
/* 0028A0 80007E40 2C000022 */  cmpwi   r0, 0x22
/* 0028A4 80007E44 4082FFD0 */  bne     lbl_80007E14
lbl_80007E48:
/* 0028A8 80007E48 7C800774 */  extsb   r0, r4
/* 0028AC 80007E4C 2C000022 */  cmpwi   r0, 0x22
/* 0028B0 80007E50 40820044 */  bne     lbl_80007E94
/* 0028B4 80007E54 3BDE0001 */  addi    r30, r30, 1
/* 0028B8 80007E58 4800003C */  b       lbl_80007E94
lbl_80007E5C:
/* 0028BC 80007E5C 806D800C */  lwz     r3, gacValidSymbol-_SDA_BASE_(r13)
/* 0028C0 80007E60 480D4AFD */  bl      strchr
/* 0028C4 80007E64 28030000 */  cmplwi  r3, 0
/* 0028C8 80007E68 40820010 */  bne     lbl_80007E78
/* 0028CC 80007E6C 93D8001C */  stw     r30, 0x1c(r24)
/* 0028D0 80007E70 38600000 */  li      r3, 0
/* 0028D4 80007E74 48000044 */  b       lbl_80007EB8
lbl_80007E78:
/* 0028D8 80007E78 7FC0F378 */  mr      r0, r30
/* 0028DC 80007E7C 7C7F00AE */  lbzx    r3, r31, r0
/* 0028E0 80007E80 7FA0EB78 */  mr      r0, r29
/* 0028E4 80007E84 3B800003 */  li      r28, 3
/* 0028E8 80007E88 7C7A01AE */  stbx    r3, r26, r0
/* 0028EC 80007E8C 3BDE0001 */  addi    r30, r30, 1
/* 0028F0 80007E90 3BBD0001 */  addi    r29, r29, 1
lbl_80007E94:
/* 0028F4 80007E94 2C1CFFFF */  cmpwi   r28, -1
/* 0028F8 80007E98 4182FDE0 */  beq     lbl_80007C78
/* 0028FC 80007E9C 93D8001C */  stw     r30, 0x1c(r24)
/* 002900 80007EA0 38000000 */  li      r0, 0
/* 002904 80007EA4 28190000 */  cmplwi  r25, 0
/* 002908 80007EA8 7C1AE9AE */  stbx    r0, r26, r29
/* 00290C 80007EAC 41820008 */  beq     lbl_80007EB4
/* 002910 80007EB0 93990000 */  stw     r28, 0(r25)
lbl_80007EB4:
/* 002914 80007EB4 38600001 */  li      r3, 1
lbl_80007EB8:
/* 002918 80007EB8 BAE1001C */  lmw     r23, 0x1c(r1)
/* 00291C 80007EBC 80010044 */  lwz     r0, 0x44(r1)
/* 002920 80007EC0 38210040 */  addi    r1, r1, 0x40
/* 002924 80007EC4 7C0803A6 */  mtlr    r0
/* 002928 80007EC8 4E800020 */  blr     

glabel xlFileSkipLine
/* 00292C 80007ECC 3800FFFF */  li      r0, -1
/* 002930 80007ED0 9003001C */  stw     r0, 0x1c(r3)
/* 002934 80007ED4 38600001 */  li      r3, 1
/* 002938 80007ED8 4E800020 */  blr     

glabel xlTokenGetInteger
/* 00293C 80007EDC 88030000 */  lbz     r0, 0(r3)
/* 002940 80007EE0 38C00000 */  li      r6, 0
/* 002944 80007EE4 39000000 */  li      r8, 0
/* 002948 80007EE8 7C000774 */  extsb   r0, r0
/* 00294C 80007EEC 2C00002B */  cmpwi   r0, 0x2b
/* 002950 80007EF0 39200000 */  li      r9, 0
/* 002954 80007EF4 4182000C */  beq     lbl_80007F00
/* 002958 80007EF8 2C00002D */  cmpwi   r0, 0x2d
/* 00295C 80007EFC 40820024 */  bne     lbl_80007F20
lbl_80007F00:
/* 002960 80007F00 88030000 */  lbz     r0, 0(r3)
/* 002964 80007F04 39000001 */  li      r8, 1
/* 002968 80007F08 2C00002D */  cmpwi   r0, 0x2d
/* 00296C 80007F0C 4082000C */  bne     lbl_80007F18
/* 002970 80007F10 38000001 */  li      r0, 1
/* 002974 80007F14 48000008 */  b       lbl_80007F1C
lbl_80007F18:
/* 002978 80007F18 38000000 */  li      r0, 0
lbl_80007F1C:
/* 00297C 80007F1C 7C090378 */  mr      r9, r0
lbl_80007F20:
/* 002980 80007F20 7C0340AE */  lbzx    r0, r3, r8
/* 002984 80007F24 7C000774 */  extsb   r0, r0
/* 002988 80007F28 2C000030 */  cmpwi   r0, 0x30
/* 00298C 80007F2C 4082002C */  bne     lbl_80007F58
/* 002990 80007F30 7CA34214 */  add     r5, r3, r8
/* 002994 80007F34 88050001 */  lbz     r0, 1(r5)
/* 002998 80007F38 7C000774 */  extsb   r0, r0
/* 00299C 80007F3C 2C000058 */  cmpwi   r0, 0x58
/* 0029A0 80007F40 4182000C */  beq     lbl_80007F4C
/* 0029A4 80007F44 2C000078 */  cmpwi   r0, 0x78
/* 0029A8 80007F48 40820010 */  bne     lbl_80007F58
lbl_80007F4C:
/* 0029AC 80007F4C 38E00010 */  li      r7, 0x10
/* 0029B0 80007F50 39080002 */  addi    r8, r8, 2
/* 0029B4 80007F54 48000008 */  b       lbl_80007F5C
lbl_80007F58:
/* 0029B8 80007F58 38E0000A */  li      r7, 0xa
lbl_80007F5C:
/* 0029BC 80007F5C 7C634214 */  add     r3, r3, r8
/* 0029C0 80007F60 48000074 */  b       lbl_80007FD4
lbl_80007F64:
/* 0029C4 80007F64 7CC639D6 */  mullw   r6, r6, r7
/* 0029C8 80007F68 7CA00774 */  extsb   r0, r5
/* 0029CC 80007F6C 2C000041 */  cmpwi   r0, 0x41
/* 0029D0 80007F70 41800018 */  blt     lbl_80007F88
/* 0029D4 80007F74 2C000046 */  cmpwi   r0, 0x46
/* 0029D8 80007F78 41810010 */  bgt     lbl_80007F88
/* 0029DC 80007F7C 7CC03214 */  add     r6, r0, r6
/* 0029E0 80007F80 38C6FFC9 */  addi    r6, r6, -55
/* 0029E4 80007F84 4800004C */  b       lbl_80007FD0
lbl_80007F88:
/* 0029E8 80007F88 7CA00774 */  extsb   r0, r5
/* 0029EC 80007F8C 2C000061 */  cmpwi   r0, 0x61
/* 0029F0 80007F90 41800018 */  blt     lbl_80007FA8
/* 0029F4 80007F94 2C000066 */  cmpwi   r0, 0x66
/* 0029F8 80007F98 41810010 */  bgt     lbl_80007FA8
/* 0029FC 80007F9C 7CC03214 */  add     r6, r0, r6
/* 002A00 80007FA0 38C6FFA9 */  addi    r6, r6, -87
/* 002A04 80007FA4 4800002C */  b       lbl_80007FD0
lbl_80007FA8:
/* 002A08 80007FA8 7CA00774 */  extsb   r0, r5
/* 002A0C 80007FAC 2C000030 */  cmpwi   r0, 0x30
/* 002A10 80007FB0 41800018 */  blt     lbl_80007FC8
/* 002A14 80007FB4 2C000039 */  cmpwi   r0, 0x39
/* 002A18 80007FB8 41810010 */  bgt     lbl_80007FC8
/* 002A1C 80007FBC 7CC03214 */  add     r6, r0, r6
/* 002A20 80007FC0 38C6FFD0 */  addi    r6, r6, -48
/* 002A24 80007FC4 4800000C */  b       lbl_80007FD0
lbl_80007FC8:
/* 002A28 80007FC8 38600000 */  li      r3, 0
/* 002A2C 80007FCC 4E800020 */  blr     
lbl_80007FD0:
/* 002A30 80007FD0 38630001 */  addi    r3, r3, 1
lbl_80007FD4:
/* 002A34 80007FD4 88A30000 */  lbz     r5, 0(r3)
/* 002A38 80007FD8 7CA00775 */  extsb.  r0, r5
/* 002A3C 80007FDC 4082FF88 */  bne     lbl_80007F64
/* 002A40 80007FE0 2C090000 */  cmpwi   r9, 0
/* 002A44 80007FE4 41820008 */  beq     lbl_80007FEC
/* 002A48 80007FE8 7CC600D0 */  neg     r6, r6
lbl_80007FEC:
/* 002A4C 80007FEC 28040000 */  cmplwi  r4, 0
/* 002A50 80007FF0 41820008 */  beq     lbl_80007FF8
/* 002A54 80007FF4 90C40000 */  stw     r6, 0(r4)
lbl_80007FF8:
/* 002A58 80007FF8 38600001 */  li      r3, 1
/* 002A5C 80007FFC 4E800020 */  blr     

glabel xlFileGetLine
/* 002A60 80008000 7C0802A6 */  mflr    r0
/* 002A64 80008004 90010004 */  stw     r0, 4(r1)
/* 002A68 80008008 9421FFD8 */  stwu    r1, -0x28(r1)
/* 002A6C 8000800C 93E10024 */  stw     r31, 0x24(r1)
/* 002A70 80008010 93C10020 */  stw     r30, 0x20(r1)
/* 002A74 80008014 3BC50000 */  addi    r30, r5, 0
/* 002A78 80008018 93A1001C */  stw     r29, 0x1c(r1)
/* 002A7C 8000801C 3BA40000 */  addi    r29, r4, 0
/* 002A80 80008020 93810018 */  stw     r28, 0x18(r1)
/* 002A84 80008024 3B830000 */  addi    r28, r3, 0
lbl_80008028:
/* 002A88 80008028 3BE00000 */  li      r31, 0
/* 002A8C 8000802C 48000064 */  b       lbl_80008090
lbl_80008030:
/* 002A90 80008030 88610014 */  lbz     r3, 0x14(r1)
/* 002A94 80008034 7C600774 */  extsb   r0, r3
/* 002A98 80008038 2C00000A */  cmpwi   r0, 0xa
/* 002A9C 8000803C 41820074 */  beq     lbl_800080B0
/* 002AA0 80008040 2C00000D */  cmpwi   r0, 0xd
/* 002AA4 80008044 40820040 */  bne     lbl_80008084
/* 002AA8 80008048 387C0000 */  addi    r3, r28, 0
/* 002AAC 8000804C 38810014 */  addi    r4, r1, 0x14
/* 002AB0 80008050 38A00001 */  li      r5, 1
/* 002AB4 80008054 4BFFDE45 */  bl      xlFileGet
/* 002AB8 80008058 88010014 */  lbz     r0, 0x14(r1)
/* 002ABC 8000805C 2C00000A */  cmpwi   r0, 0xa
/* 002AC0 80008060 41820050 */  beq     lbl_800080B0
/* 002AC4 80008064 809C0014 */  lwz     r4, 0x14(r28)
/* 002AC8 80008068 387C0000 */  addi    r3, r28, 0
/* 002ACC 8000806C 3884FFFF */  addi    r4, r4, -1
/* 002AD0 80008070 4BFFDE01 */  bl      xlFileSetPosition
/* 002AD4 80008074 2C030000 */  cmpwi   r3, 0
/* 002AD8 80008078 40820038 */  bne     lbl_800080B0
/* 002ADC 8000807C 38600000 */  li      r3, 0
/* 002AE0 80008080 48000090 */  b       lbl_80008110
lbl_80008084:
/* 002AE4 80008084 7FE0FB78 */  mr      r0, r31
/* 002AE8 80008088 7C7D01AE */  stbx    r3, r29, r0
/* 002AEC 8000808C 3BFF0001 */  addi    r31, r31, 1
lbl_80008090:
/* 002AF0 80008090 7C1FF000 */  cmpw    r31, r30
/* 002AF4 80008094 4080001C */  bge     lbl_800080B0
/* 002AF8 80008098 387C0000 */  addi    r3, r28, 0
/* 002AFC 8000809C 38810014 */  addi    r4, r1, 0x14
/* 002B00 800080A0 38A00001 */  li      r5, 1
/* 002B04 800080A4 4BFFDDF5 */  bl      xlFileGet
/* 002B08 800080A8 2C030000 */  cmpwi   r3, 0
/* 002B0C 800080AC 4082FF84 */  bne     lbl_80008030
lbl_800080B0:
/* 002B10 800080B0 38000000 */  li      r0, 0
/* 002B14 800080B4 7C1DF9AE */  stbx    r0, r29, r31
/* 002B18 800080B8 2C1F0000 */  cmpwi   r31, 0
/* 002B1C 800080BC 807C0020 */  lwz     r3, 0x20(r28)
/* 002B20 800080C0 38030001 */  addi    r0, r3, 1
/* 002B24 800080C4 901C0020 */  stw     r0, 0x20(r28)
/* 002B28 800080C8 40820014 */  bne     lbl_800080DC
/* 002B2C 800080CC 88010014 */  lbz     r0, 0x14(r1)
/* 002B30 800080D0 7C000774 */  extsb   r0, r0
/* 002B34 800080D4 2C00FFFF */  cmpwi   r0, -1
/* 002B38 800080D8 4082FF50 */  bne     lbl_80008028
lbl_800080DC:
/* 002B3C 800080DC 2C1F0000 */  cmpwi   r31, 0
/* 002B40 800080E0 38600000 */  li      r3, 0
/* 002B44 800080E4 40820018 */  bne     lbl_800080FC
/* 002B48 800080E8 88010014 */  lbz     r0, 0x14(r1)
/* 002B4C 800080EC 7C000774 */  extsb   r0, r0
/* 002B50 800080F0 2C00FFFF */  cmpwi   r0, -1
/* 002B54 800080F4 40820008 */  bne     lbl_800080FC
/* 002B58 800080F8 38600001 */  li      r3, 1
lbl_800080FC:
/* 002B5C 800080FC 2C030000 */  cmpwi   r3, 0
/* 002B60 80008100 4182000C */  beq     lbl_8000810C
/* 002B64 80008104 38600000 */  li      r3, 0
/* 002B68 80008108 48000008 */  b       lbl_80008110
lbl_8000810C:
/* 002B6C 8000810C 38600001 */  li      r3, 1
lbl_80008110:
/* 002B70 80008110 8001002C */  lwz     r0, 0x2c(r1)
/* 002B74 80008114 83E10024 */  lwz     r31, 0x24(r1)
/* 002B78 80008118 83C10020 */  lwz     r30, 0x20(r1)
/* 002B7C 8000811C 7C0803A6 */  mtlr    r0
/* 002B80 80008120 83A1001C */  lwz     r29, 0x1c(r1)
/* 002B84 80008124 83810018 */  lwz     r28, 0x18(r1)
/* 002B88 80008128 38210028 */  addi    r1, r1, 0x28
/* 002B8C 8000812C 4E800020 */  blr     

glabel xlFileGetSize
/* 002B90 80008130 7C0802A6 */  mflr    r0
/* 002B94 80008134 38A40000 */  addi    r5, r4, 0
/* 002B98 80008138 90010004 */  stw     r0, 4(r1)
/* 002B9C 8000813C 38800001 */  li      r4, 1
/* 002BA0 80008140 9421FFE0 */  stwu    r1, -0x20(r1)
/* 002BA4 80008144 93E1001C */  stw     r31, 0x1c(r1)
/* 002BA8 80008148 3BE30000 */  addi    r31, r3, 0
/* 002BAC 8000814C 38610010 */  addi    r3, r1, 0x10
/* 002BB0 80008150 4BFFDE81 */  bl      xlFileOpen
/* 002BB4 80008154 2C030000 */  cmpwi   r3, 0
/* 002BB8 80008158 41820038 */  beq     lbl_80008190
/* 002BBC 8000815C 281F0000 */  cmplwi  r31, 0
/* 002BC0 80008160 41820010 */  beq     lbl_80008170
/* 002BC4 80008164 80610010 */  lwz     r3, 0x10(r1)
/* 002BC8 80008168 80030010 */  lwz     r0, 0x10(r3)
/* 002BCC 8000816C 901F0000 */  stw     r0, 0(r31)
lbl_80008170:
/* 002BD0 80008170 38610010 */  addi    r3, r1, 0x10
/* 002BD4 80008174 4BFFDE29 */  bl      xlFileClose
/* 002BD8 80008178 2C030000 */  cmpwi   r3, 0
/* 002BDC 8000817C 4082000C */  bne     lbl_80008188
/* 002BE0 80008180 38600000 */  li      r3, 0
/* 002BE4 80008184 48000010 */  b       lbl_80008194
lbl_80008188:
/* 002BE8 80008188 38600001 */  li      r3, 1
/* 002BEC 8000818C 48000008 */  b       lbl_80008194
lbl_80008190:
/* 002BF0 80008190 38600000 */  li      r3, 0
lbl_80008194:
/* 002BF4 80008194 80010024 */  lwz     r0, 0x24(r1)
/* 002BF8 80008198 83E1001C */  lwz     r31, 0x1c(r1)
/* 002BFC 8000819C 38210020 */  addi    r1, r1, 0x20
/* 002C00 800081A0 7C0803A6 */  mtlr    r0
/* 002C04 800081A4 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000E49D0 800E7950 001A */
D_800E7950:
    .asciz "0123456789.xXABCDEFabcdef"

.balign 4

/* 000E49EC 800E796C 001F */
D_800E796C:
    .asciz "~!@#$%^&*()-=_+{}[]|\\:;'<>?,./"

.balign 4

/* 000E4A0C 800E798C 0040 */
D_800E798C:
    .asciz "ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz0123456789"


.section .sdata, "wa"

.balign 8

/* 000FF248 801449E8 0004 */
gacValidNumber:
    .long D_800E7950

.balign 4

/* 000FF24C 801449EC 0004 */
gacValidSymbol:
    .long D_800E7950 + 0x1C

.balign 4

/* 000FF250 801449F0 0004 */
gacValidLabel:
    .long D_800E7950 + 0x3C


