# scanf.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __StringRead
/* 0D732C 800DC8CC 2C050001 */  cmpwi	r5, 1
/* 0D7330 800DC8D0 41820050 */  beq		lbl_800DC920
/* 0D7334 800DC8D4 40800010 */  bge		lbl_800DC8E4
/* 0D7338 800DC8D8 2C050000 */  cmpwi	r5, 0
/* 0D733C 800DC8DC 40800014 */  bge		lbl_800DC8F0
/* 0D7340 800DC8E0 48000074 */  b		lbl_800DC954
lbl_800DC8E4:
/* 0D7344 800DC8E4 2C050003 */  cmpwi	r5, 3
/* 0D7348 800DC8E8 4080006C */  bge		lbl_800DC954
/* 0D734C 800DC8EC 48000060 */  b		lbl_800DC94C
lbl_800DC8F0:
/* 0D7350 800DC8F0 80830000 */  lwz		r4, 0(r3)
/* 0D7354 800DC8F4 88A40000 */  lbz		r5, 0(r4)
/* 0D7358 800DC8F8 7CA00775 */  extsb.	r0, r5
/* 0D735C 800DC8FC 40820014 */  bne		lbl_800DC910
/* 0D7360 800DC900 38000001 */  li		r0, 1
/* 0D7364 800DC904 90030004 */  stw		r0, 4(r3)
/* 0D7368 800DC908 3860FFFF */  li		r3, -1
/* 0D736C 800DC90C 4E800020 */  blr		
lbl_800DC910:
/* 0D7370 800DC910 38040001 */  addi	r0, r4, 1
/* 0D7374 800DC914 90030000 */  stw		r0, 0(r3)
/* 0D7378 800DC918 7CA30774 */  extsb	r3, r5
/* 0D737C 800DC91C 4E800020 */  blr		
lbl_800DC920:
/* 0D7380 800DC920 80030004 */  lwz		r0, 4(r3)
/* 0D7384 800DC924 2C000000 */  cmpwi	r0, 0
/* 0D7388 800DC928 40820014 */  bne		lbl_800DC93C
/* 0D738C 800DC92C 80A30000 */  lwz		r5, 0(r3)
/* 0D7390 800DC930 3805FFFF */  addi	r0, r5, -1
/* 0D7394 800DC934 90030000 */  stw		r0, 0(r3)
/* 0D7398 800DC938 4800000C */  b		lbl_800DC944
lbl_800DC93C:
/* 0D739C 800DC93C 38000000 */  li		r0, 0
/* 0D73A0 800DC940 90030004 */  stw		r0, 4(r3)
lbl_800DC944:
/* 0D73A4 800DC944 7C832378 */  mr		r3, r4
/* 0D73A8 800DC948 4E800020 */  blr		
lbl_800DC94C:
/* 0D73AC 800DC94C 80630004 */  lwz		r3, 4(r3)
/* 0D73B0 800DC950 4E800020 */  blr		
lbl_800DC954:
/* 0D73B4 800DC954 38600000 */  li		r3, 0
/* 0D73B8 800DC958 4E800020 */  blr		


