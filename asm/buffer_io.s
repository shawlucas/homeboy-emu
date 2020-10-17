# buffer_io.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __flush_buffer
/* 0D5090 800DA630 7C0802A6 */  mflr    r0
/* 0D5094 800DA634 90010004 */  stw     r0, 4(r1)
/* 0D5098 800DA638 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D509C 800DA63C 93E10014 */  stw     r31, 0x14(r1)
/* 0D50A0 800DA640 7C7F1B78 */  mr      r31, r3
/* 0D50A4 800DA644 93C10010 */  stw     r30, 0x10(r1)
/* 0D50A8 800DA648 7C9E2378 */  mr      r30, r4
/* 0D50AC 800DA64C 80630018 */  lwz     r3, 0x18(r3)
/* 0D50B0 800DA650 801F0020 */  lwz     r0, 0x20(r31)
/* 0D50B4 800DA654 7C030051 */  subf.   r0, r3, r0
/* 0D50B8 800DA658 41820058 */  beq     lbl_800DA6B0
/* 0D50BC 800DA65C 901F0024 */  stw     r0, 0x24(r31)
/* 0D50C0 800DA660 881F0005 */  lbz     r0, 5(r31)
/* 0D50C4 800DA664 5400EFFF */  rlwinm. r0, r0, 0x1d, 0x1f, 0x1f
/* 0D50C8 800DA668 819F003C */  lwz     r12, 0x3c(r31)
/* 0D50CC 800DA66C 38BF0024 */  addi    r5, r31, 0x24
/* 0D50D0 800DA670 807F0000 */  lwz     r3, 0(r31)
/* 0D50D4 800DA674 7D8803A6 */  mtlr    r12
/* 0D50D8 800DA678 809F0018 */  lwz     r4, 0x18(r31)
/* 0D50DC 800DA67C 80DF0044 */  lwz     r6, 0x44(r31)
/* 0D50E0 800DA680 4E800021 */  blrl    
/* 0D50E4 800DA684 281E0000 */  cmplwi  r30, 0
/* 0D50E8 800DA688 4182000C */  beq     lbl_800DA694
/* 0D50EC 800DA68C 801F0024 */  lwz     r0, 0x24(r31)
/* 0D50F0 800DA690 901E0000 */  stw     r0, 0(r30)
lbl_800DA694:
/* 0D50F4 800DA694 2C030000 */  cmpwi   r3, 0
/* 0D50F8 800DA698 41820008 */  beq     lbl_800DA6A0
/* 0D50FC 800DA69C 48000048 */  b       lbl_800DA6E4
lbl_800DA6A0:
/* 0D5100 800DA6A0 807F0014 */  lwz     r3, 0x14(r31)
/* 0D5104 800DA6A4 801F0024 */  lwz     r0, 0x24(r31)
/* 0D5108 800DA6A8 7C030214 */  add     r0, r3, r0
/* 0D510C 800DA6AC 901F0014 */  stw     r0, 0x14(r31)
lbl_800DA6B0:
/* 0D5110 800DA6B0 801F0018 */  lwz     r0, 0x18(r31)
/* 0D5114 800DA6B4 38600000 */  li      r3, 0
/* 0D5118 800DA6B8 901F0020 */  stw     r0, 0x20(r31)
/* 0D511C 800DA6BC 801F001C */  lwz     r0, 0x1c(r31)
/* 0D5120 800DA6C0 901F0024 */  stw     r0, 0x24(r31)
/* 0D5124 800DA6C4 80BF0014 */  lwz     r5, 0x14(r31)
/* 0D5128 800DA6C8 809F0028 */  lwz     r4, 0x28(r31)
/* 0D512C 800DA6CC 801F0024 */  lwz     r0, 0x24(r31)
/* 0D5130 800DA6D0 7CA42038 */  and     r4, r5, r4
/* 0D5134 800DA6D4 7C040050 */  subf    r0, r4, r0
/* 0D5138 800DA6D8 901F0024 */  stw     r0, 0x24(r31)
/* 0D513C 800DA6DC 801F0014 */  lwz     r0, 0x14(r31)
/* 0D5140 800DA6E0 901F0030 */  stw     r0, 0x30(r31)
lbl_800DA6E4:
/* 0D5144 800DA6E4 8001001C */  lwz     r0, 0x1c(r1)
/* 0D5148 800DA6E8 83E10014 */  lwz     r31, 0x14(r1)
/* 0D514C 800DA6EC 83C10010 */  lwz     r30, 0x10(r1)
/* 0D5150 800DA6F0 7C0803A6 */  mtlr    r0
/* 0D5154 800DA6F4 38210018 */  addi    r1, r1, 0x18
/* 0D5158 800DA6F8 4E800020 */  blr     

glabel __prep_buffer
/* 0D515C 800DA6FC 80030018 */  lwz     r0, 0x18(r3)
/* 0D5160 800DA700 90030020 */  stw     r0, 0x20(r3)
/* 0D5164 800DA704 8003001C */  lwz     r0, 0x1c(r3)
/* 0D5168 800DA708 90030024 */  stw     r0, 0x24(r3)
/* 0D516C 800DA70C 80A30014 */  lwz     r5, 0x14(r3)
/* 0D5170 800DA710 80830028 */  lwz     r4, 0x28(r3)
/* 0D5174 800DA714 80030024 */  lwz     r0, 0x24(r3)
/* 0D5178 800DA718 7CA42038 */  and     r4, r5, r4
/* 0D517C 800DA71C 7C040050 */  subf    r0, r4, r0
/* 0D5180 800DA720 90030024 */  stw     r0, 0x24(r3)
/* 0D5184 800DA724 80030014 */  lwz     r0, 0x14(r3)
/* 0D5188 800DA728 90030030 */  stw     r0, 0x30(r3)
/* 0D518C 800DA72C 4E800020 */  blr     


