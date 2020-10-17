# Padclamp.c
.include "macros.inc"

.section .text, "ax"

.balign 4

ClampStick:
/* 0B6208 800BB7A8 88030000 */  lbz     r0, 0(r3)
/* 0B620C 800BB7AC 89840000 */  lbz     r12, 0(r4)
/* 0B6210 800BB7B0 7C000775 */  extsb.  r0, r0
/* 0B6214 800BB7B4 7D8C0774 */  extsb   r12, r12
/* 0B6218 800BB7B8 7C0B0378 */  mr      r11, r0
/* 0B621C 800BB7BC 4180000C */  blt     lbl_800BB7C8
/* 0B6220 800BB7C0 38000001 */  li      r0, 1
/* 0B6224 800BB7C4 4800000C */  b       lbl_800BB7D0
lbl_800BB7C8:
/* 0B6228 800BB7C8 3800FFFF */  li      r0, -1
/* 0B622C 800BB7CC 7D6B00D0 */  neg     r11, r11
lbl_800BB7D0:
/* 0B6230 800BB7D0 2C0C0000 */  cmpwi   r12, 0
/* 0B6234 800BB7D4 4180000C */  blt     lbl_800BB7E0
/* 0B6238 800BB7D8 39000001 */  li      r8, 1
/* 0B623C 800BB7DC 4800000C */  b       lbl_800BB7E8
lbl_800BB7E0:
/* 0B6240 800BB7E0 3900FFFF */  li      r8, -1
/* 0B6244 800BB7E4 7D8C00D0 */  neg     r12, r12
lbl_800BB7E8:
/* 0B6248 800BB7E8 7CE70774 */  extsb   r7, r7
/* 0B624C 800BB7EC 7C0B3800 */  cmpw    r11, r7
/* 0B6250 800BB7F0 4181000C */  bgt     lbl_800BB7FC
/* 0B6254 800BB7F4 39600000 */  li      r11, 0
/* 0B6258 800BB7F8 48000008 */  b       lbl_800BB800
lbl_800BB7FC:
/* 0B625C 800BB7FC 7D675850 */  subf    r11, r7, r11
lbl_800BB800:
/* 0B6260 800BB800 7C0C3800 */  cmpw    r12, r7
/* 0B6264 800BB804 4181000C */  bgt     lbl_800BB810
/* 0B6268 800BB808 39800000 */  li      r12, 0
/* 0B626C 800BB80C 48000008 */  b       lbl_800BB814
lbl_800BB810:
/* 0B6270 800BB810 7D876050 */  subf    r12, r7, r12
lbl_800BB814:
/* 0B6274 800BB814 2C0B0000 */  cmpwi   r11, 0
/* 0B6278 800BB818 4082001C */  bne     lbl_800BB834
/* 0B627C 800BB81C 2C0C0000 */  cmpwi   r12, 0
/* 0B6280 800BB820 40820014 */  bne     lbl_800BB834
/* 0B6284 800BB824 38000000 */  li      r0, 0
/* 0B6288 800BB828 98040000 */  stb     r0, 0(r4)
/* 0B628C 800BB82C 98030000 */  stb     r0, 0(r3)
/* 0B6290 800BB830 4E800020 */  blr     
lbl_800BB834:
/* 0B6294 800BB834 7CC60774 */  extsb   r6, r6
/* 0B6298 800BB838 7D2661D6 */  mullw   r9, r6, r12
/* 0B629C 800BB83C 7CE659D6 */  mullw   r7, r6, r11
/* 0B62A0 800BB840 7C093800 */  cmpw    r9, r7
/* 0B62A4 800BB844 41810044 */  bgt     lbl_800BB888
/* 0B62A8 800BB848 7CA90774 */  extsb   r9, r5
/* 0B62AC 800BB84C 7CA64850 */  subf    r5, r6, r9
/* 0B62B0 800BB850 7CAC29D6 */  mullw   r5, r12, r5
/* 0B62B4 800BB854 7D2649D6 */  mullw   r9, r6, r9
/* 0B62B8 800BB858 7CE72A14 */  add     r7, r7, r5
/* 0B62BC 800BB85C 7C093800 */  cmpw    r9, r7
/* 0B62C0 800BB860 40800064 */  bge     lbl_800BB8C4
/* 0B62C4 800BB864 7CCB49D6 */  mullw   r6, r11, r9
/* 0B62C8 800BB868 7CAC49D6 */  mullw   r5, r12, r9
/* 0B62CC 800BB86C 7CC63BD6 */  divw    r6, r6, r7
/* 0B62D0 800BB870 7CA53BD6 */  divw    r5, r5, r7
/* 0B62D4 800BB874 7CC60774 */  extsb   r6, r6
/* 0B62D8 800BB878 7CA50774 */  extsb   r5, r5
/* 0B62DC 800BB87C 39660000 */  addi    r11, r6, 0
/* 0B62E0 800BB880 39850000 */  addi    r12, r5, 0
/* 0B62E4 800BB884 48000040 */  b       lbl_800BB8C4
lbl_800BB888:
/* 0B62E8 800BB888 7CA70774 */  extsb   r7, r5
/* 0B62EC 800BB88C 7CA63850 */  subf    r5, r6, r7
/* 0B62F0 800BB890 7CAB29D6 */  mullw   r5, r11, r5
/* 0B62F4 800BB894 7D4639D6 */  mullw   r10, r6, r7
/* 0B62F8 800BB898 7CE92A14 */  add     r7, r9, r5
/* 0B62FC 800BB89C 7C0A3800 */  cmpw    r10, r7
/* 0B6300 800BB8A0 40800024 */  bge     lbl_800BB8C4
/* 0B6304 800BB8A4 7CCB51D6 */  mullw   r6, r11, r10
/* 0B6308 800BB8A8 7CAC51D6 */  mullw   r5, r12, r10
/* 0B630C 800BB8AC 7CC63BD6 */  divw    r6, r6, r7
/* 0B6310 800BB8B0 7CA53BD6 */  divw    r5, r5, r7
/* 0B6314 800BB8B4 7CC60774 */  extsb   r6, r6
/* 0B6318 800BB8B8 7CA50774 */  extsb   r5, r5
/* 0B631C 800BB8BC 39660000 */  addi    r11, r6, 0
/* 0B6320 800BB8C0 39850000 */  addi    r12, r5, 0
lbl_800BB8C4:
/* 0B6324 800BB8C4 7CA059D6 */  mullw   r5, r0, r11
/* 0B6328 800BB8C8 7C0861D6 */  mullw   r0, r8, r12
/* 0B632C 800BB8CC 98A30000 */  stb     r5, 0(r3)
/* 0B6330 800BB8D0 98040000 */  stb     r0, 0(r4)
/* 0B6334 800BB8D4 4E800020 */  blr     

glabel PADClamp
/* 0B6338 800BB8D8 7C0802A6 */  mflr    r0
/* 0B633C 800BB8DC 3C80800E */  lis     r4, ClampRegion@ha
/* 0B6340 800BB8E0 90010004 */  stw     r0, 4(r1)
/* 0B6344 800BB8E4 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0B6348 800BB8E8 93E1001C */  stw     r31, 0x1c(r1)
/* 0B634C 800BB8EC 93C10018 */  stw     r30, 0x18(r1)
/* 0B6350 800BB8F0 3BC00000 */  li      r30, 0
/* 0B6354 800BB8F4 93A10014 */  stw     r29, 0x14(r1)
/* 0B6358 800BB8F8 3BA30000 */  addi    r29, r3, 0
/* 0B635C 800BB8FC 93810010 */  stw     r28, 0x10(r1)
/* 0B6360 800BB900 3B84F370 */  addi    r28, r4, ClampRegion@l
/* 0B6364 800BB904 3BFC0001 */  addi    r31, r28, 1
lbl_800BB908:
/* 0B6368 800BB908 881D000A */  lbz     r0, 0xa(r29)
/* 0B636C 800BB90C 7C000775 */  extsb.  r0, r0
/* 0B6370 800BB910 408200AC */  bne     lbl_800BB9BC
/* 0B6374 800BB914 88BC0003 */  lbz     r5, 3(r28)
/* 0B6378 800BB918 387D0002 */  addi    r3, r29, 2
/* 0B637C 800BB91C 88DC0004 */  lbz     r6, 4(r28)
/* 0B6380 800BB920 389D0003 */  addi    r4, r29, 3
/* 0B6384 800BB924 88FC0002 */  lbz     r7, 2(r28)
/* 0B6388 800BB928 4BFFFE81 */  bl      ClampStick
/* 0B638C 800BB92C 88BC0006 */  lbz     r5, 6(r28)
/* 0B6390 800BB930 387D0004 */  addi    r3, r29, 4
/* 0B6394 800BB934 88DC0007 */  lbz     r6, 7(r28)
/* 0B6398 800BB938 389D0005 */  addi    r4, r29, 5
/* 0B639C 800BB93C 88FC0005 */  lbz     r7, 5(r28)
/* 0B63A0 800BB940 4BFFFE69 */  bl      ClampStick
/* 0B63A4 800BB944 889D0006 */  lbz     r4, 6(r29)
/* 0B63A8 800BB948 881C0000 */  lbz     r0, 0(r28)
/* 0B63AC 800BB94C 887F0000 */  lbz     r3, 0(r31)
/* 0B63B0 800BB950 7C040040 */  cmplw   r4, r0
/* 0B63B4 800BB954 41810010 */  bgt     lbl_800BB964
/* 0B63B8 800BB958 38000000 */  li      r0, 0
/* 0B63BC 800BB95C 981D0006 */  stb     r0, 6(r29)
/* 0B63C0 800BB960 48000020 */  b       lbl_800BB980
lbl_800BB964:
/* 0B63C4 800BB964 7C032040 */  cmplw   r3, r4
/* 0B63C8 800BB968 40800008 */  bge     lbl_800BB970
/* 0B63CC 800BB96C 987D0006 */  stb     r3, 6(r29)
lbl_800BB970:
/* 0B63D0 800BB970 887C0000 */  lbz     r3, 0(r28)
/* 0B63D4 800BB974 881D0006 */  lbz     r0, 6(r29)
/* 0B63D8 800BB978 7C030050 */  subf    r0, r3, r0
/* 0B63DC 800BB97C 981D0006 */  stb     r0, 6(r29)
lbl_800BB980:
/* 0B63E0 800BB980 889D0007 */  lbz     r4, 7(r29)
/* 0B63E4 800BB984 881C0000 */  lbz     r0, 0(r28)
/* 0B63E8 800BB988 887F0000 */  lbz     r3, 0(r31)
/* 0B63EC 800BB98C 7C040040 */  cmplw   r4, r0
/* 0B63F0 800BB990 41810010 */  bgt     lbl_800BB9A0
/* 0B63F4 800BB994 38000000 */  li      r0, 0
/* 0B63F8 800BB998 981D0007 */  stb     r0, 7(r29)
/* 0B63FC 800BB99C 48000020 */  b       lbl_800BB9BC
lbl_800BB9A0:
/* 0B6400 800BB9A0 7C032040 */  cmplw   r3, r4
/* 0B6404 800BB9A4 40800008 */  bge     lbl_800BB9AC
/* 0B6408 800BB9A8 987D0007 */  stb     r3, 7(r29)
lbl_800BB9AC:
/* 0B640C 800BB9AC 887C0000 */  lbz     r3, 0(r28)
/* 0B6410 800BB9B0 881D0007 */  lbz     r0, 7(r29)
/* 0B6414 800BB9B4 7C030050 */  subf    r0, r3, r0
/* 0B6418 800BB9B8 981D0007 */  stb     r0, 7(r29)
lbl_800BB9BC:
/* 0B641C 800BB9BC 3BDE0001 */  addi    r30, r30, 1
/* 0B6420 800BB9C0 2C1E0004 */  cmpwi   r30, 4
/* 0B6424 800BB9C4 3BBD000C */  addi    r29, r29, 0xc
/* 0B6428 800BB9C8 4180FF40 */  blt     lbl_800BB908
/* 0B642C 800BB9CC 80010024 */  lwz     r0, 0x24(r1)
/* 0B6430 800BB9D0 83E1001C */  lwz     r31, 0x1c(r1)
/* 0B6434 800BB9D4 83C10018 */  lwz     r30, 0x18(r1)
/* 0B6438 800BB9D8 83A10014 */  lwz     r29, 0x14(r1)
/* 0B643C 800BB9DC 83810010 */  lwz     r28, 0x10(r1)
/* 0B6440 800BB9E0 38210020 */  addi    r1, r1, 0x20
/* 0B6444 800BB9E4 7C0803A6 */  mtlr    r0
/* 0B6448 800BB9E8 4E800020 */  blr     


.section .rodata, "a"

.balign 8

/* 000DC3F0 800DF370 000A */
ClampRegion:
    .short 0x1EB4, 0x0F48, 0x280F, 0x3B1F, 0x382C


