# OSFont.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel OSGetFontEncode
/* 0A5178 800AA718 A06D8D18 */  lhz     r3, fontEncode$80-_SDA_BASE_(r13)
/* 0A517C 800AA71C 28030001 */  cmplwi  r3, 1
/* 0A5180 800AA720 4C810020 */  blelr   
/* 0A5184 800AA724 3C608000 */  lis     r3, 0x8000
/* 0A5188 800AA728 800300CC */  lwz     r0, 0xcc(r3)
/* 0A518C 800AA72C 2C000000 */  cmpwi   r0, 0
/* 0A5190 800AA730 4182000C */  beq     lbl_800AA73C
/* 0A5194 800AA734 4180002C */  blt     lbl_800AA760
/* 0A5198 800AA738 48000028 */  b       lbl_800AA760
lbl_800AA73C:
/* 0A519C 800AA73C 3C60CC00 */  lis     r3, 0xcc00
/* 0A51A0 800AA740 A003206E */  lhz     r0, 0x206e(r3)
/* 0A51A4 800AA744 540007BD */  rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0A51A8 800AA748 4182000C */  beq     lbl_800AA754
/* 0A51AC 800AA74C 38000001 */  li      r0, 1
/* 0A51B0 800AA750 48000008 */  b       lbl_800AA758
lbl_800AA754:
/* 0A51B4 800AA754 38000000 */  li      r0, 0
lbl_800AA758:
/* 0A51B8 800AA758 B00D8D18 */  sth     r0, fontEncode$80-_SDA_BASE_(r13)
/* 0A51BC 800AA75C 4800000C */  b       lbl_800AA768
lbl_800AA760:
/* 0A51C0 800AA760 38000000 */  li      r0, 0
/* 0A51C4 800AA764 B00D8D18 */  sth     r0, fontEncode$80-_SDA_BASE_(r13)
lbl_800AA768:
/* 0A51C8 800AA768 A06D8D18 */  lhz     r3, fontEncode$80-_SDA_BASE_(r13)
/* 0A51CC 800AA76C 4E800020 */  blr     


.section .sdata, "wa"

.balign 8

/* 000FFF58 801456F8 0002 */
fontEncode$80:
    .short 0xFFFF


