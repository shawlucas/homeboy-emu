# Pad.c
.include "macros.inc"

.section .text, "ax"

.balign 4

UpdateOrigin:
/* 0B644C 800BB9EC 7C0802A6 */  mflr    r0
/* 0B6450 800BB9F0 3CA08014 */  lis     r5, Origin@ha
/* 0B6454 800BB9F4 90010004 */  stw     r0, 4(r1)
/* 0B6458 800BB9F8 1CC3000C */  mulli   r6, r3, 0xc
/* 0B645C 800BB9FC 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B6460 800BBA00 38A52178 */  addi    r5, r5, Origin@l
/* 0B6464 800BBA04 93E10014 */  stw     r31, 0x14(r1)
/* 0B6468 800BBA08 7FE53214 */  add     r31, r5, r6
/* 0B646C 800BBA0C 800D8DB4 */  lwz     r0, AnalogMode-_SDA_BASE_(r13)
/* 0B6470 800BBA10 5404056E */  rlwinm  r4, r0, 0, 0x15, 0x17
/* 0B6474 800BBA14 2C040400 */  cmpwi   r4, 0x400
/* 0B6478 800BBA18 3C008000 */  lis     r0, 0x8000
/* 0B647C 800BBA1C 7C001C30 */  srw     r0, r0, r3
/* 0B6480 800BBA20 418200F4 */  beq     lbl_800BBB14
/* 0B6484 800BBA24 40800034 */  bge     lbl_800BBA58
/* 0B6488 800BBA28 2C040200 */  cmpwi   r4, 0x200
/* 0B648C 800BBA2C 418200B8 */  beq     lbl_800BBAE4
/* 0B6490 800BBA30 4080001C */  bge     lbl_800BBA4C
/* 0B6494 800BBA34 2C040100 */  cmpwi   r4, 0x100
/* 0B6498 800BBA38 41820078 */  beq     lbl_800BBAB0
/* 0B649C 800BBA3C 408000D8 */  bge     lbl_800BBB14
/* 0B64A0 800BBA40 2C040000 */  cmpwi   r4, 0
/* 0B64A4 800BBA44 41820038 */  beq     lbl_800BBA7C
/* 0B64A8 800BBA48 480000CC */  b       lbl_800BBB14
lbl_800BBA4C:
/* 0B64AC 800BBA4C 2C040300 */  cmpwi   r4, 0x300
/* 0B64B0 800BBA50 418200C4 */  beq     lbl_800BBB14
/* 0B64B4 800BBA54 480000C0 */  b       lbl_800BBB14
lbl_800BBA58:
/* 0B64B8 800BBA58 2C040600 */  cmpwi   r4, 0x600
/* 0B64BC 800BBA5C 41820020 */  beq     lbl_800BBA7C
/* 0B64C0 800BBA60 40800010 */  bge     lbl_800BBA70
/* 0B64C4 800BBA64 2C040500 */  cmpwi   r4, 0x500
/* 0B64C8 800BBA68 41820014 */  beq     lbl_800BBA7C
/* 0B64CC 800BBA6C 480000A8 */  b       lbl_800BBB14
lbl_800BBA70:
/* 0B64D0 800BBA70 2C040700 */  cmpwi   r4, 0x700
/* 0B64D4 800BBA74 41820008 */  beq     lbl_800BBA7C
/* 0B64D8 800BBA78 4800009C */  b       lbl_800BBB14
lbl_800BBA7C:
/* 0B64DC 800BBA7C 889F0006 */  lbz     r4, 6(r31)
/* 0B64E0 800BBA80 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B64E4 800BBA84 989F0006 */  stb     r4, 6(r31)
/* 0B64E8 800BBA88 889F0007 */  lbz     r4, 7(r31)
/* 0B64EC 800BBA8C 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B64F0 800BBA90 989F0007 */  stb     r4, 7(r31)
/* 0B64F4 800BBA94 889F0008 */  lbz     r4, 8(r31)
/* 0B64F8 800BBA98 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B64FC 800BBA9C 989F0008 */  stb     r4, 8(r31)
/* 0B6500 800BBAA0 889F0009 */  lbz     r4, 9(r31)
/* 0B6504 800BBAA4 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B6508 800BBAA8 989F0009 */  stb     r4, 9(r31)
/* 0B650C 800BBAAC 48000068 */  b       lbl_800BBB14
lbl_800BBAB0:
/* 0B6510 800BBAB0 889F0004 */  lbz     r4, 4(r31)
/* 0B6514 800BBAB4 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B6518 800BBAB8 989F0004 */  stb     r4, 4(r31)
/* 0B651C 800BBABC 889F0005 */  lbz     r4, 5(r31)
/* 0B6520 800BBAC0 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B6524 800BBAC4 989F0005 */  stb     r4, 5(r31)
/* 0B6528 800BBAC8 889F0008 */  lbz     r4, 8(r31)
/* 0B652C 800BBACC 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B6530 800BBAD0 989F0008 */  stb     r4, 8(r31)
/* 0B6534 800BBAD4 889F0009 */  lbz     r4, 9(r31)
/* 0B6538 800BBAD8 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B653C 800BBADC 989F0009 */  stb     r4, 9(r31)
/* 0B6540 800BBAE0 48000034 */  b       lbl_800BBB14
lbl_800BBAE4:
/* 0B6544 800BBAE4 889F0004 */  lbz     r4, 4(r31)
/* 0B6548 800BBAE8 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B654C 800BBAEC 989F0004 */  stb     r4, 4(r31)
/* 0B6550 800BBAF0 889F0005 */  lbz     r4, 5(r31)
/* 0B6554 800BBAF4 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B6558 800BBAF8 989F0005 */  stb     r4, 5(r31)
/* 0B655C 800BBAFC 889F0006 */  lbz     r4, 6(r31)
/* 0B6560 800BBB00 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B6564 800BBB04 989F0006 */  stb     r4, 6(r31)
/* 0B6568 800BBB08 889F0007 */  lbz     r4, 7(r31)
/* 0B656C 800BBB0C 54840036 */  rlwinm  r4, r4, 0, 0, 0x1b
/* 0B6570 800BBB10 989F0007 */  stb     r4, 7(r31)
lbl_800BBB14:
/* 0B6574 800BBB14 889F0002 */  lbz     r4, 2(r31)
/* 0B6578 800BBB18 3884FF80 */  addi    r4, r4, -128
/* 0B657C 800BBB1C 989F0002 */  stb     r4, 2(r31)
/* 0B6580 800BBB20 889F0003 */  lbz     r4, 3(r31)
/* 0B6584 800BBB24 3884FF80 */  addi    r4, r4, -128
/* 0B6588 800BBB28 989F0003 */  stb     r4, 3(r31)
/* 0B658C 800BBB2C 889F0004 */  lbz     r4, 4(r31)
/* 0B6590 800BBB30 3884FF80 */  addi    r4, r4, -128
/* 0B6594 800BBB34 989F0004 */  stb     r4, 4(r31)
/* 0B6598 800BBB38 889F0005 */  lbz     r4, 5(r31)
/* 0B659C 800BBB3C 3884FF80 */  addi    r4, r4, -128
/* 0B65A0 800BBB40 989F0005 */  stb     r4, 5(r31)
/* 0B65A4 800BBB44 808D8DB0 */  lwz     r4, XPatchBits-_SDA_BASE_(r13)
/* 0B65A8 800BBB48 7C800039 */  and.    r0, r4, r0
/* 0B65AC 800BBB4C 41820030 */  beq     lbl_800BBB7C
/* 0B65B0 800BBB50 881F0002 */  lbz     r0, 2(r31)
/* 0B65B4 800BBB54 7C000774 */  extsb   r0, r0
/* 0B65B8 800BBB58 2C000040 */  cmpwi   r0, 0x40
/* 0B65BC 800BBB5C 40810020 */  ble     lbl_800BBB7C
/* 0B65C0 800BBB60 4BFF5A21 */  bl      SIGetType
/* 0B65C4 800BBB64 5463001E */  rlwinm  r3, r3, 0, 0, 0xf
/* 0B65C8 800BBB68 3C03F700 */  addis   r0, r3, 0xf700
/* 0B65CC 800BBB6C 28000000 */  cmplwi  r0, 0
/* 0B65D0 800BBB70 4082000C */  bne     lbl_800BBB7C
/* 0B65D4 800BBB74 38000000 */  li      r0, 0
/* 0B65D8 800BBB78 981F0002 */  stb     r0, 2(r31)
lbl_800BBB7C:
/* 0B65DC 800BBB7C 8001001C */  lwz     r0, 0x1c(r1)
/* 0B65E0 800BBB80 83E10014 */  lwz     r31, 0x14(r1)
/* 0B65E4 800BBB84 38210018 */  addi    r1, r1, 0x18
/* 0B65E8 800BBB88 7C0803A6 */  mtlr    r0
/* 0B65EC 800BBB8C 4E800020 */  blr     

PADOriginCallback:
/* 0B65F0 800BBB90 7C0802A6 */  mflr    r0
/* 0B65F4 800BBB94 90010004 */  stw     r0, 4(r1)
/* 0B65F8 800BBB98 5480073F */  clrlwi. r0, r4, 0x1c
/* 0B65FC 800BBB9C 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0B6600 800BBBA0 93E1002C */  stw     r31, 0x2c(r1)
/* 0B6604 800BBBA4 40820048 */  bne     lbl_800BBBEC
/* 0B6608 800BBBA8 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B660C 800BBBAC 4BFFFE41 */  bl      UpdateOrigin
/* 0B6610 800BBBB0 83ED8DAC */  lwz     r31, ResettingChan-_SDA_BASE_(r13)
/* 0B6614 800BBBB4 3C008000 */  lis     r0, 0x8000
/* 0B6618 800BBBB8 806D9284 */  lwz     r3, EnabledBits-_SDA_BASE_(r13)
/* 0B661C 800BBBBC 3881001C */  addi    r4, r1, 0x1c
/* 0B6620 800BBBC0 7C00FC30 */  srw     r0, r0, r31
/* 0B6624 800BBBC4 7C600378 */  or      r0, r3, r0
/* 0B6628 800BBBC8 900D9284 */  stw     r0, EnabledBits-_SDA_BASE_(r13)
/* 0B662C 800BBBCC 7FE3FB78 */  mr      r3, r31
/* 0B6630 800BBBD0 4BFF545D */  bl      SIGetResponse
/* 0B6634 800BBBD4 800D8DB4 */  lwz     r0, AnalogMode-_SDA_BASE_(r13)
/* 0B6638 800BBBD8 387F0000 */  addi    r3, r31, 0
/* 0B663C 800BBBDC 64040040 */  oris    r4, r0, 0x40
/* 0B6640 800BBBE0 4BFF51E1 */  bl      SISetCommand
/* 0B6644 800BBBE4 806D9284 */  lwz     r3, EnabledBits-_SDA_BASE_(r13)
/* 0B6648 800BBBE8 4BFF5269 */  bl      SIEnablePolling
lbl_800BBBEC:
/* 0B664C 800BBBEC 80AD9288 */  lwz     r5, ResettingBits-_SDA_BASE_(r13)
/* 0B6650 800BBBF0 7CA00034 */  cntlzw  r0, r5
/* 0B6654 800BBBF4 900D8DAC */  stw     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B6658 800BBBF8 808D8DAC */  lwz     r4, ResettingChan-_SDA_BASE_(r13)
/* 0B665C 800BBBFC 2C040020 */  cmpwi   r4, 0x20
/* 0B6660 800BBC00 41820040 */  beq     lbl_800BBC40
/* 0B6664 800BBC04 3C008000 */  lis     r0, 0x8000
/* 0B6668 800BBC08 7C002430 */  srw     r0, r0, r4
/* 0B666C 800BBC0C 7CA00078 */  andc    r0, r5, r0
/* 0B6670 800BBC10 1C84000C */  mulli   r4, r4, 0xc
/* 0B6674 800BBC14 900D9288 */  stw     r0, ResettingBits-_SDA_BASE_(r13)
/* 0B6678 800BBC18 3C608014 */  lis     r3, Origin@ha
/* 0B667C 800BBC1C 38032178 */  addi    r0, r3, Origin@l
/* 0B6680 800BBC20 7C602214 */  add     r3, r0, r4
/* 0B6684 800BBC24 38800000 */  li      r4, 0
/* 0B6688 800BBC28 38A0000C */  li      r5, 0xc
/* 0B668C 800BBC2C 4BF497A5 */  bl      memset
/* 0B6690 800BBC30 3C80800C */  lis     r4, PADTypeAndStatusCallback@ha
/* 0B6694 800BBC34 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B6698 800BBC38 3884BDF8 */  addi    r4, r4, PADTypeAndStatusCallback@l
/* 0B669C 800BBC3C 4BFF5B09 */  bl      SIGetTypeAsync
lbl_800BBC40:
/* 0B66A0 800BBC40 80010034 */  lwz     r0, 0x34(r1)
/* 0B66A4 800BBC44 83E1002C */  lwz     r31, 0x2c(r1)
/* 0B66A8 800BBC48 38210030 */  addi    r1, r1, 0x30
/* 0B66AC 800BBC4C 7C0803A6 */  mtlr    r0
/* 0B66B0 800BBC50 4E800020 */  blr     

PADOriginUpdateCallback:
/* 0B66B4 800BBC54 7C0802A6 */  mflr    r0
/* 0B66B8 800BBC58 90010004 */  stw     r0, 4(r1)
/* 0B66BC 800BBC5C 3C008000 */  lis     r0, 0x8000
/* 0B66C0 800BBC60 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0B66C4 800BBC64 93E10024 */  stw     r31, 0x24(r1)
/* 0B66C8 800BBC68 3BE40000 */  addi    r31, r4, 0
/* 0B66CC 800BBC6C 93C10020 */  stw     r30, 0x20(r1)
/* 0B66D0 800BBC70 93A1001C */  stw     r29, 0x1c(r1)
/* 0B66D4 800BBC74 7C7D1B78 */  mr      r29, r3
/* 0B66D8 800BBC78 7C1EEC30 */  srw     r30, r0, r29
/* 0B66DC 800BBC7C 806D9284 */  lwz     r3, EnabledBits-_SDA_BASE_(r13)
/* 0B66E0 800BBC80 7C60F039 */  and.    r0, r3, r30
/* 0B66E4 800BBC84 41820080 */  beq     lbl_800BBD04
/* 0B66E8 800BBC88 57E0073F */  clrlwi. r0, r31, 0x1c
/* 0B66EC 800BBC8C 4082000C */  bne     lbl_800BBC98
/* 0B66F0 800BBC90 7FA3EB78 */  mr      r3, r29
/* 0B66F4 800BBC94 4BFFFD59 */  bl      UpdateOrigin
lbl_800BBC98:
/* 0B66F8 800BBC98 57E00739 */  rlwinm. r0, r31, 0, 0x1c, 0x1c
/* 0B66FC 800BBC9C 41820068 */  beq     lbl_800BBD04
/* 0B6700 800BBCA0 4BFEEAD1 */  bl      OSDisableInterrupts
/* 0B6704 800BBCA4 3BE30000 */  addi    r31, r3, 0
/* 0B6708 800BBCA8 387E0000 */  addi    r3, r30, 0
/* 0B670C 800BBCAC 4BFF5241 */  bl      SIDisablePolling
/* 0B6710 800BBCB0 800D9284 */  lwz     r0, EnabledBits-_SDA_BASE_(r13)
/* 0B6714 800BBCB4 7FC9F0F8 */  nor     r9, r30, r30
/* 0B6718 800BBCB8 80CD9290 */  lwz     r6, WaitingBits-_SDA_BASE_(r13)
/* 0B671C 800BBCBC 7FA3EB78 */  mr      r3, r29
/* 0B6720 800BBCC0 80AD9294 */  lwz     r5, CheckingBits-_SDA_BASE_(r13)
/* 0B6724 800BBCC4 808D9298 */  lwz     r4, PendingBits-_SDA_BASE_(r13)
/* 0B6728 800BBCC8 7C084838 */  and     r8, r0, r9
/* 0B672C 800BBCCC 800D929C */  lwz     r0, BarrelBits-_SDA_BASE_(r13)
/* 0B6730 800BBCD0 7CC74838 */  and     r7, r6, r9
/* 0B6734 800BBCD4 7CA64838 */  and     r6, r5, r9
/* 0B6738 800BBCD8 7C854838 */  and     r5, r4, r9
/* 0B673C 800BBCDC 910D9284 */  stw     r8, EnabledBits-_SDA_BASE_(r13)
/* 0B6740 800BBCE0 7C004838 */  and     r0, r0, r9
/* 0B6744 800BBCE4 90ED9290 */  stw     r7, WaitingBits-_SDA_BASE_(r13)
/* 0B6748 800BBCE8 38800000 */  li      r4, 0
/* 0B674C 800BBCEC 90CD9294 */  stw     r6, CheckingBits-_SDA_BASE_(r13)
/* 0B6750 800BBCF0 90AD9298 */  stw     r5, PendingBits-_SDA_BASE_(r13)
/* 0B6754 800BBCF4 900D929C */  stw     r0, BarrelBits-_SDA_BASE_(r13)
/* 0B6758 800BBCF8 4BFF0BFD */  bl      OSSetWirelessID
/* 0B675C 800BBCFC 7FE3FB78 */  mr      r3, r31
/* 0B6760 800BBD00 4BFEEA99 */  bl      OSRestoreInterrupts
lbl_800BBD04:
/* 0B6764 800BBD04 8001002C */  lwz     r0, 0x2c(r1)
/* 0B6768 800BBD08 83E10024 */  lwz     r31, 0x24(r1)
/* 0B676C 800BBD0C 83C10020 */  lwz     r30, 0x20(r1)
/* 0B6770 800BBD10 83A1001C */  lwz     r29, 0x1c(r1)
/* 0B6774 800BBD14 38210028 */  addi    r1, r1, 0x28
/* 0B6778 800BBD18 7C0803A6 */  mtlr    r0
/* 0B677C 800BBD1C 4E800020 */  blr     

PADProbeCallback:
/* 0B6780 800BBD20 7C0802A6 */  mflr    r0
/* 0B6784 800BBD24 90010004 */  stw     r0, 4(r1)
/* 0B6788 800BBD28 5480073F */  clrlwi. r0, r4, 0x1c
/* 0B678C 800BBD2C 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0B6790 800BBD30 93E1002C */  stw     r31, 0x2c(r1)
/* 0B6794 800BBD34 93C10028 */  stw     r30, 0x28(r1)
/* 0B6798 800BBD38 40820054 */  bne     lbl_800BBD8C
/* 0B679C 800BBD3C 83CD8DAC */  lwz     r30, ResettingChan-_SDA_BASE_(r13)
/* 0B67A0 800BBD40 3FE08000 */  lis     r31, 0x8000
/* 0B67A4 800BBD44 806D9284 */  lwz     r3, EnabledBits-_SDA_BASE_(r13)
/* 0B67A8 800BBD48 3881001C */  addi    r4, r1, 0x1c
/* 0B67AC 800BBD4C 7FE0F430 */  srw     r0, r31, r30
/* 0B67B0 800BBD50 7C600378 */  or      r0, r3, r0
/* 0B67B4 800BBD54 900D9284 */  stw     r0, EnabledBits-_SDA_BASE_(r13)
/* 0B67B8 800BBD58 7FC3F378 */  mr      r3, r30
/* 0B67BC 800BBD5C 4BFF52D1 */  bl      SIGetResponse
/* 0B67C0 800BBD60 800D8DB4 */  lwz     r0, AnalogMode-_SDA_BASE_(r13)
/* 0B67C4 800BBD64 387E0000 */  addi    r3, r30, 0
/* 0B67C8 800BBD68 64040040 */  oris    r4, r0, 0x40
/* 0B67CC 800BBD6C 4BFF5055 */  bl      SISetCommand
/* 0B67D0 800BBD70 806D9284 */  lwz     r3, EnabledBits-_SDA_BASE_(r13)
/* 0B67D4 800BBD74 4BFF50DD */  bl      SIEnablePolling
/* 0B67D8 800BBD78 800D8DAC */  lwz     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B67DC 800BBD7C 806D9290 */  lwz     r3, WaitingBits-_SDA_BASE_(r13)
/* 0B67E0 800BBD80 7FE00430 */  srw     r0, r31, r0
/* 0B67E4 800BBD84 7C600378 */  or      r0, r3, r0
/* 0B67E8 800BBD88 900D9290 */  stw     r0, WaitingBits-_SDA_BASE_(r13)
lbl_800BBD8C:
/* 0B67EC 800BBD8C 80AD9288 */  lwz     r5, ResettingBits-_SDA_BASE_(r13)
/* 0B67F0 800BBD90 7CA00034 */  cntlzw  r0, r5
/* 0B67F4 800BBD94 900D8DAC */  stw     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B67F8 800BBD98 808D8DAC */  lwz     r4, ResettingChan-_SDA_BASE_(r13)
/* 0B67FC 800BBD9C 2C040020 */  cmpwi   r4, 0x20
/* 0B6800 800BBDA0 41820040 */  beq     lbl_800BBDE0
/* 0B6804 800BBDA4 3C008000 */  lis     r0, 0x8000
/* 0B6808 800BBDA8 7C002430 */  srw     r0, r0, r4
/* 0B680C 800BBDAC 7CA00078 */  andc    r0, r5, r0
/* 0B6810 800BBDB0 1C84000C */  mulli   r4, r4, 0xc
/* 0B6814 800BBDB4 900D9288 */  stw     r0, ResettingBits-_SDA_BASE_(r13)
/* 0B6818 800BBDB8 3C608014 */  lis     r3, Origin@ha
/* 0B681C 800BBDBC 38032178 */  addi    r0, r3, Origin@l
/* 0B6820 800BBDC0 7C602214 */  add     r3, r0, r4
/* 0B6824 800BBDC4 38800000 */  li      r4, 0
/* 0B6828 800BBDC8 38A0000C */  li      r5, 0xc
/* 0B682C 800BBDCC 4BF49605 */  bl      memset
/* 0B6830 800BBDD0 3C80800C */  lis     r4, PADTypeAndStatusCallback@ha
/* 0B6834 800BBDD4 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B6838 800BBDD8 3884BDF8 */  addi    r4, r4, PADTypeAndStatusCallback@l
/* 0B683C 800BBDDC 4BFF5969 */  bl      SIGetTypeAsync
lbl_800BBDE0:
/* 0B6840 800BBDE0 80010034 */  lwz     r0, 0x34(r1)
/* 0B6844 800BBDE4 83E1002C */  lwz     r31, 0x2c(r1)
/* 0B6848 800BBDE8 83C10028 */  lwz     r30, 0x28(r1)
/* 0B684C 800BBDEC 38210030 */  addi    r1, r1, 0x30
/* 0B6850 800BBDF0 7C0803A6 */  mtlr    r0
/* 0B6854 800BBDF4 4E800020 */  blr     

PADTypeAndStatusCallback:
/* 0B6858 800BBDF8 7C0802A6 */  mflr    r0
/* 0B685C 800BBDFC 3CC08014 */  lis     r6, Type@ha
/* 0B6860 800BBE00 90010004 */  stw     r0, 4(r1)
/* 0B6864 800BBE04 5480073F */  clrlwi. r0, r4, 0x1c
/* 0B6868 800BBE08 9421FFC0 */  stwu    r1, -0x40(r1)
/* 0B686C 800BBE0C 93E1003C */  stw     r31, 0x3c(r1)
/* 0B6870 800BBE10 3FE08000 */  lis     r31, 0x8000
/* 0B6874 800BBE14 93C10038 */  stw     r30, 0x38(r1)
/* 0B6878 800BBE18 3BC62168 */  addi    r30, r6, Type@l
/* 0B687C 800BBE1C 93A10034 */  stw     r29, 0x34(r1)
/* 0B6880 800BBE20 93810030 */  stw     r28, 0x30(r1)
/* 0B6884 800BBE24 83AD8DAC */  lwz     r29, ResettingChan-_SDA_BASE_(r13)
/* 0B6888 800BBE28 80AD928C */  lwz     r5, RecalibrateBits-_SDA_BASE_(r13)
/* 0B688C 800BBE2C 7FFCEC30 */  srw     r28, r31, r29
/* 0B6890 800BBE30 7CA3E078 */  andc    r3, r5, r28
/* 0B6894 800BBE34 906D928C */  stw     r3, RecalibrateBits-_SDA_BASE_(r13)
/* 0B6898 800BBE38 7CA5E038 */  and     r5, r5, r28
/* 0B689C 800BBE3C 38600001 */  li      r3, 1
/* 0B68A0 800BBE40 41820054 */  beq     lbl_800BBE94
/* 0B68A4 800BBE44 808D9288 */  lwz     r4, ResettingBits-_SDA_BASE_(r13)
/* 0B68A8 800BBE48 7C800034 */  cntlzw  r0, r4
/* 0B68AC 800BBE4C 900D8DAC */  stw     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B68B0 800BBE50 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B68B4 800BBE54 2C030020 */  cmpwi   r3, 0x20
/* 0B68B8 800BBE58 418202AC */  beq     lbl_800BC104
/* 0B68BC 800BBE5C 1C03000C */  mulli   r0, r3, 0xc
/* 0B68C0 800BBE60 7FE31C30 */  srw     r3, r31, r3
/* 0B68C4 800BBE64 7C841878 */  andc    r4, r4, r3
/* 0B68C8 800BBE68 7C7E0214 */  add     r3, r30, r0
/* 0B68CC 800BBE6C 908D9288 */  stw     r4, ResettingBits-_SDA_BASE_(r13)
/* 0B68D0 800BBE70 38800000 */  li      r4, 0
/* 0B68D4 800BBE74 38A0000C */  li      r5, 0xc
/* 0B68D8 800BBE78 38630010 */  addi    r3, r3, 0x10
/* 0B68DC 800BBE7C 4BF49555 */  bl      memset
/* 0B68E0 800BBE80 3C80800C */  lis     r4, PADTypeAndStatusCallback@ha
/* 0B68E4 800BBE84 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B68E8 800BBE88 3884BDF8 */  addi    r4, r4, PADTypeAndStatusCallback@l
/* 0B68EC 800BBE8C 4BFF58B9 */  bl      SIGetTypeAsync
/* 0B68F0 800BBE90 48000274 */  b       lbl_800BC104
lbl_800BBE94:
/* 0B68F4 800BBE94 5486002E */  rlwinm  r6, r4, 0, 0, 0x17
/* 0B68F8 800BBE98 548400C8 */  rlwinm  r4, r4, 0, 3, 4
/* 0B68FC 800BBE9C 3C04F800 */  addis   r0, r4, 0xf800
/* 0B6900 800BBEA0 57A4103A */  slwi    r4, r29, 2
/* 0B6904 800BBEA4 28000000 */  cmplwi  r0, 0
/* 0B6908 800BBEA8 7CDE212E */  stwx    r6, r30, r4
/* 0B690C 800BBEAC 4082000C */  bne     lbl_800BBEB8
/* 0B6910 800BBEB0 54C001CF */  rlwinm. r0, r6, 0, 7, 7
/* 0B6914 800BBEB4 40820058 */  bne     lbl_800BBF0C
lbl_800BBEB8:
/* 0B6918 800BBEB8 80AD9288 */  lwz     r5, ResettingBits-_SDA_BASE_(r13)
/* 0B691C 800BBEBC 7CA00034 */  cntlzw  r0, r5
/* 0B6920 800BBEC0 900D8DAC */  stw     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B6924 800BBEC4 808D8DAC */  lwz     r4, ResettingChan-_SDA_BASE_(r13)
/* 0B6928 800BBEC8 2C040020 */  cmpwi   r4, 0x20
/* 0B692C 800BBECC 41820238 */  beq     lbl_800BC104
/* 0B6930 800BBED0 3C608000 */  lis     r3, 0x8000
/* 0B6934 800BBED4 1C04000C */  mulli   r0, r4, 0xc
/* 0B6938 800BBED8 7C632430 */  srw     r3, r3, r4
/* 0B693C 800BBEDC 7CA41878 */  andc    r4, r5, r3
/* 0B6940 800BBEE0 7C7E0214 */  add     r3, r30, r0
/* 0B6944 800BBEE4 908D9288 */  stw     r4, ResettingBits-_SDA_BASE_(r13)
/* 0B6948 800BBEE8 38800000 */  li      r4, 0
/* 0B694C 800BBEEC 38A0000C */  li      r5, 0xc
/* 0B6950 800BBEF0 38630010 */  addi    r3, r3, 0x10
/* 0B6954 800BBEF4 4BF494DD */  bl      memset
/* 0B6958 800BBEF8 3C80800C */  lis     r4, PADTypeAndStatusCallback@ha
/* 0B695C 800BBEFC 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B6960 800BBF00 3884BDF8 */  addi    r4, r4, PADTypeAndStatusCallback@l
/* 0B6964 800BBF04 4BFF5841 */  bl      SIGetTypeAsync
/* 0B6968 800BBF08 480001FC */  b       lbl_800BC104
lbl_800BBF0C:
/* 0B696C 800BBF0C 800D8DB8 */  lwz     r0, Spec-_SDA_BASE_(r13)
/* 0B6970 800BBF10 28000002 */  cmplwi  r0, 2
/* 0B6974 800BBF14 40800084 */  bge     lbl_800BBF98
/* 0B6978 800BBF18 800D9284 */  lwz     r0, EnabledBits-_SDA_BASE_(r13)
/* 0B697C 800BBF1C 387D0000 */  addi    r3, r29, 0
/* 0B6980 800BBF20 3881001C */  addi    r4, r1, 0x1c
/* 0B6984 800BBF24 7C00E378 */  or      r0, r0, r28
/* 0B6988 800BBF28 900D9284 */  stw     r0, EnabledBits-_SDA_BASE_(r13)
/* 0B698C 800BBF2C 4BFF5101 */  bl      SIGetResponse
/* 0B6990 800BBF30 800D8DB4 */  lwz     r0, AnalogMode-_SDA_BASE_(r13)
/* 0B6994 800BBF34 387D0000 */  addi    r3, r29, 0
/* 0B6998 800BBF38 64040040 */  oris    r4, r0, 0x40
/* 0B699C 800BBF3C 4BFF4E85 */  bl      SISetCommand
/* 0B69A0 800BBF40 806D9284 */  lwz     r3, EnabledBits-_SDA_BASE_(r13)
/* 0B69A4 800BBF44 4BFF4F0D */  bl      SIEnablePolling
/* 0B69A8 800BBF48 808D9288 */  lwz     r4, ResettingBits-_SDA_BASE_(r13)
/* 0B69AC 800BBF4C 7C800034 */  cntlzw  r0, r4
/* 0B69B0 800BBF50 900D8DAC */  stw     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B69B4 800BBF54 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B69B8 800BBF58 2C030020 */  cmpwi   r3, 0x20
/* 0B69BC 800BBF5C 418201A8 */  beq     lbl_800BC104
/* 0B69C0 800BBF60 1C03000C */  mulli   r0, r3, 0xc
/* 0B69C4 800BBF64 7FE31C30 */  srw     r3, r31, r3
/* 0B69C8 800BBF68 7C841878 */  andc    r4, r4, r3
/* 0B69CC 800BBF6C 7C7E0214 */  add     r3, r30, r0
/* 0B69D0 800BBF70 908D9288 */  stw     r4, ResettingBits-_SDA_BASE_(r13)
/* 0B69D4 800BBF74 38800000 */  li      r4, 0
/* 0B69D8 800BBF78 38A0000C */  li      r5, 0xc
/* 0B69DC 800BBF7C 38630010 */  addi    r3, r3, 0x10
/* 0B69E0 800BBF80 4BF49451 */  bl      memset
/* 0B69E4 800BBF84 3C80800C */  lis     r4, PADTypeAndStatusCallback@ha
/* 0B69E8 800BBF88 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B69EC 800BBF8C 3884BDF8 */  addi    r4, r4, PADTypeAndStatusCallback@l
/* 0B69F0 800BBF90 4BFF57B5 */  bl      SIGetTypeAsync
/* 0B69F4 800BBF94 48000170 */  b       lbl_800BC104
lbl_800BBF98:
/* 0B69F8 800BBF98 54C00001 */  rlwinm. r0, r6, 0, 0, 0
/* 0B69FC 800BBF9C 4182000C */  beq     lbl_800BBFA8
/* 0B6A00 800BBFA0 54C0014B */  rlwinm. r0, r6, 0, 5, 5
/* 0B6A04 800BBFA4 41820074 */  beq     lbl_800BC018
lbl_800BBFA8:
/* 0B6A08 800BBFA8 28050000 */  cmplwi  r5, 0
/* 0B6A0C 800BBFAC 41820038 */  beq     lbl_800BBFE4
/* 0B6A10 800BBFB0 1C1D000C */  mulli   r0, r29, 0xc
/* 0B6A14 800BBFB4 3C60800C */  lis     r3, PADOriginCallback@ha
/* 0B6A18 800BBFB8 7CDE0214 */  add     r6, r30, r0
/* 0B6A1C 800BBFBC 3903BB90 */  addi    r8, r3, PADOriginCallback@l
/* 0B6A20 800BBFC0 387D0000 */  addi    r3, r29, 0
/* 0B6A24 800BBFC4 388D8DC4 */  addi    r4, r13, CmdCalibrate-_SDA_BASE_
/* 0B6A28 800BBFC8 38A00003 */  li      r5, 3
/* 0B6A2C 800BBFCC 38E0000A */  li      r7, 0xa
/* 0B6A30 800BBFD0 39400000 */  li      r10, 0
/* 0B6A34 800BBFD4 39200000 */  li      r9, 0
/* 0B6A38 800BBFD8 38C60010 */  addi    r6, r6, 0x10
/* 0B6A3C 800BBFDC 4BFF51A1 */  bl      SITransfer
/* 0B6A40 800BBFE0 480000C0 */  b       lbl_800BC0A0
lbl_800BBFE4:
/* 0B6A44 800BBFE4 1C1D000C */  mulli   r0, r29, 0xc
/* 0B6A48 800BBFE8 3C60800C */  lis     r3, PADOriginCallback@ha
/* 0B6A4C 800BBFEC 7CDE0214 */  add     r6, r30, r0
/* 0B6A50 800BBFF0 3903BB90 */  addi    r8, r3, PADOriginCallback@l
/* 0B6A54 800BBFF4 387D0000 */  addi    r3, r29, 0
/* 0B6A58 800BBFF8 388D8DC0 */  addi    r4, r13, CmdReadOrigin-_SDA_BASE_
/* 0B6A5C 800BBFFC 38A00001 */  li      r5, 1
/* 0B6A60 800BC000 38E0000A */  li      r7, 0xa
/* 0B6A64 800BC004 39400000 */  li      r10, 0
/* 0B6A68 800BC008 39200000 */  li      r9, 0
/* 0B6A6C 800BC00C 38C60010 */  addi    r6, r6, 0x10
/* 0B6A70 800BC010 4BFF516D */  bl      SITransfer
/* 0B6A74 800BC014 4800008C */  b       lbl_800BC0A0
lbl_800BC018:
/* 0B6A78 800BC018 54C002D7 */  rlwinm. r0, r6, 0, 0xb, 0xb
/* 0B6A7C 800BC01C 41820084 */  beq     lbl_800BC0A0
/* 0B6A80 800BC020 54C00319 */  rlwinm. r0, r6, 0, 0xc, 0xc
/* 0B6A84 800BC024 4082007C */  bne     lbl_800BC0A0
/* 0B6A88 800BC028 54C0035B */  rlwinm. r0, r6, 0, 0xd, 0xd
/* 0B6A8C 800BC02C 40820074 */  bne     lbl_800BC0A0
/* 0B6A90 800BC030 54C00043 */  rlwinm. r0, r6, 0, 1, 1
/* 0B6A94 800BC034 41820038 */  beq     lbl_800BC06C
/* 0B6A98 800BC038 1C1D000C */  mulli   r0, r29, 0xc
/* 0B6A9C 800BC03C 3C60800C */  lis     r3, PADOriginCallback@ha
/* 0B6AA0 800BC040 7CDE0214 */  add     r6, r30, r0
/* 0B6AA4 800BC044 3903BB90 */  addi    r8, r3, PADOriginCallback@l
/* 0B6AA8 800BC048 387D0000 */  addi    r3, r29, 0
/* 0B6AAC 800BC04C 388D8DC0 */  addi    r4, r13, CmdReadOrigin-_SDA_BASE_
/* 0B6AB0 800BC050 38A00001 */  li      r5, 1
/* 0B6AB4 800BC054 38E0000A */  li      r7, 0xa
/* 0B6AB8 800BC058 39400000 */  li      r10, 0
/* 0B6ABC 800BC05C 39200000 */  li      r9, 0
/* 0B6AC0 800BC060 38C60010 */  addi    r6, r6, 0x10
/* 0B6AC4 800BC064 4BFF5119 */  bl      SITransfer
/* 0B6AC8 800BC068 48000038 */  b       lbl_800BC0A0
lbl_800BC06C:
/* 0B6ACC 800BC06C 1C1D000C */  mulli   r0, r29, 0xc
/* 0B6AD0 800BC070 3C60800C */  lis     r3, PADProbeCallback@ha
/* 0B6AD4 800BC074 7C9E2214 */  add     r4, r30, r4
/* 0B6AD8 800BC078 7CDE0214 */  add     r6, r30, r0
/* 0B6ADC 800BC07C 3903BD20 */  addi    r8, r3, PADProbeCallback@l
/* 0B6AE0 800BC080 387D0000 */  addi    r3, r29, 0
/* 0B6AE4 800BC084 38A00003 */  li      r5, 3
/* 0B6AE8 800BC088 38E00008 */  li      r7, 8
/* 0B6AEC 800BC08C 39400000 */  li      r10, 0
/* 0B6AF0 800BC090 39200000 */  li      r9, 0
/* 0B6AF4 800BC094 38840040 */  addi    r4, r4, 0x40
/* 0B6AF8 800BC098 38C60010 */  addi    r6, r6, 0x10
/* 0B6AFC 800BC09C 4BFF50E1 */  bl      SITransfer
lbl_800BC0A0:
/* 0B6B00 800BC0A0 2C030000 */  cmpwi   r3, 0
/* 0B6B04 800BC0A4 40820060 */  bne     lbl_800BC104
/* 0B6B08 800BC0A8 80AD9288 */  lwz     r5, ResettingBits-_SDA_BASE_(r13)
/* 0B6B0C 800BC0AC 806D9298 */  lwz     r3, PendingBits-_SDA_BASE_(r13)
/* 0B6B10 800BC0B0 7CA00034 */  cntlzw  r0, r5
/* 0B6B14 800BC0B4 900D8DAC */  stw     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B6B18 800BC0B8 7C60E378 */  or      r0, r3, r28
/* 0B6B1C 800BC0BC 808D8DAC */  lwz     r4, ResettingChan-_SDA_BASE_(r13)
/* 0B6B20 800BC0C0 900D9298 */  stw     r0, PendingBits-_SDA_BASE_(r13)
/* 0B6B24 800BC0C4 2C040020 */  cmpwi   r4, 0x20
/* 0B6B28 800BC0C8 4182003C */  beq     lbl_800BC104
/* 0B6B2C 800BC0CC 3C608000 */  lis     r3, 0x8000
/* 0B6B30 800BC0D0 1C04000C */  mulli   r0, r4, 0xc
/* 0B6B34 800BC0D4 7C632430 */  srw     r3, r3, r4
/* 0B6B38 800BC0D8 7CA41878 */  andc    r4, r5, r3
/* 0B6B3C 800BC0DC 7C7E0214 */  add     r3, r30, r0
/* 0B6B40 800BC0E0 908D9288 */  stw     r4, ResettingBits-_SDA_BASE_(r13)
/* 0B6B44 800BC0E4 38800000 */  li      r4, 0
/* 0B6B48 800BC0E8 38A0000C */  li      r5, 0xc
/* 0B6B4C 800BC0EC 38630010 */  addi    r3, r3, 0x10
/* 0B6B50 800BC0F0 4BF492E1 */  bl      memset
/* 0B6B54 800BC0F4 3C80800C */  lis     r4, PADTypeAndStatusCallback@ha
/* 0B6B58 800BC0F8 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B6B5C 800BC0FC 3884BDF8 */  addi    r4, r4, PADTypeAndStatusCallback@l
/* 0B6B60 800BC100 4BFF5645 */  bl      SIGetTypeAsync
lbl_800BC104:
/* 0B6B64 800BC104 80010044 */  lwz     r0, 0x44(r1)
/* 0B6B68 800BC108 83E1003C */  lwz     r31, 0x3c(r1)
/* 0B6B6C 800BC10C 83C10038 */  lwz     r30, 0x38(r1)
/* 0B6B70 800BC110 83A10034 */  lwz     r29, 0x34(r1)
/* 0B6B74 800BC114 83810030 */  lwz     r28, 0x30(r1)
/* 0B6B78 800BC118 38210040 */  addi    r1, r1, 0x40
/* 0B6B7C 800BC11C 7C0803A6 */  mtlr    r0
/* 0B6B80 800BC120 4E800020 */  blr     

PADReceiveCheckCallback:
/* 0B6B84 800BC124 7C0802A6 */  mflr    r0
/* 0B6B88 800BC128 90010004 */  stw     r0, 4(r1)
/* 0B6B8C 800BC12C 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0B6B90 800BC130 93E1001C */  stw     r31, 0x1c(r1)
/* 0B6B94 800BC134 7C7F1B78 */  mr      r31, r3
/* 0B6B98 800BC138 3C608000 */  lis     r3, 0x8000
/* 0B6B9C 800BC13C 93C10018 */  stw     r30, 0x18(r1)
/* 0B6BA0 800BC140 93A10014 */  stw     r29, 0x14(r1)
/* 0B6BA4 800BC144 7C7DFC30 */  srw     r29, r3, r31
/* 0B6BA8 800BC148 800D9284 */  lwz     r0, EnabledBits-_SDA_BASE_(r13)
/* 0B6BAC 800BC14C 7C00E839 */  and.    r0, r0, r29
/* 0B6BB0 800BC150 418200F8 */  beq     lbl_800BC248
/* 0B6BB4 800BC154 80AD9290 */  lwz     r5, WaitingBits-_SDA_BASE_(r13)
/* 0B6BB8 800BC158 7FA6E8F8 */  nor     r6, r29, r29
/* 0B6BBC 800BC15C 806D9294 */  lwz     r3, CheckingBits-_SDA_BASE_(r13)
/* 0B6BC0 800BC160 5480073F */  clrlwi. r0, r4, 0x1c
/* 0B6BC4 800BC164 7CA53038 */  and     r5, r5, r6
/* 0B6BC8 800BC168 7C633038 */  and     r3, r3, r6
/* 0B6BCC 800BC16C 90AD9290 */  stw     r5, WaitingBits-_SDA_BASE_(r13)
/* 0B6BD0 800BC170 906D9294 */  stw     r3, CheckingBits-_SDA_BASE_(r13)
/* 0B6BD4 800BC174 5483002E */  rlwinm  r3, r4, 0, 0, 0x17
/* 0B6BD8 800BC178 4082006C */  bne     lbl_800BC1E4
/* 0B6BDC 800BC17C 54600001 */  rlwinm. r0, r3, 0, 0, 0
/* 0B6BE0 800BC180 41820064 */  beq     lbl_800BC1E4
/* 0B6BE4 800BC184 546002D7 */  rlwinm. r0, r3, 0, 0xb, 0xb
/* 0B6BE8 800BC188 4182005C */  beq     lbl_800BC1E4
/* 0B6BEC 800BC18C 54600043 */  rlwinm. r0, r3, 0, 1, 1
/* 0B6BF0 800BC190 41820054 */  beq     lbl_800BC1E4
/* 0B6BF4 800BC194 5460014B */  rlwinm. r0, r3, 0, 5, 5
/* 0B6BF8 800BC198 4082004C */  bne     lbl_800BC1E4
/* 0B6BFC 800BC19C 54600319 */  rlwinm. r0, r3, 0, 0xc, 0xc
/* 0B6C00 800BC1A0 40820044 */  bne     lbl_800BC1E4
/* 0B6C04 800BC1A4 5460035B */  rlwinm. r0, r3, 0, 0xd, 0xd
/* 0B6C08 800BC1A8 4082003C */  bne     lbl_800BC1E4
/* 0B6C0C 800BC1AC 1C9F000C */  mulli   r4, r31, 0xc
/* 0B6C10 800BC1B0 3C608014 */  lis     r3, Origin@ha
/* 0B6C14 800BC1B4 38032178 */  addi    r0, r3, Origin@l
/* 0B6C18 800BC1B8 3C60800C */  lis     r3, PADOriginUpdateCallback@ha
/* 0B6C1C 800BC1BC 7CC02214 */  add     r6, r0, r4
/* 0B6C20 800BC1C0 3903BC54 */  addi    r8, r3, PADOriginUpdateCallback@l
/* 0B6C24 800BC1C4 387F0000 */  addi    r3, r31, 0
/* 0B6C28 800BC1C8 388D8DC0 */  addi    r4, r13, CmdReadOrigin-_SDA_BASE_
/* 0B6C2C 800BC1CC 38A00001 */  li      r5, 1
/* 0B6C30 800BC1D0 38E0000A */  li      r7, 0xa
/* 0B6C34 800BC1D4 39400000 */  li      r10, 0
/* 0B6C38 800BC1D8 39200000 */  li      r9, 0
/* 0B6C3C 800BC1DC 4BFF4FA1 */  bl      SITransfer
/* 0B6C40 800BC1E0 48000068 */  b       lbl_800BC248
lbl_800BC1E4:
/* 0B6C44 800BC1E4 4BFEE58D */  bl      OSDisableInterrupts
/* 0B6C48 800BC1E8 3BC30000 */  addi    r30, r3, 0
/* 0B6C4C 800BC1EC 387D0000 */  addi    r3, r29, 0
/* 0B6C50 800BC1F0 4BFF4CFD */  bl      SIDisablePolling
/* 0B6C54 800BC1F4 800D9284 */  lwz     r0, EnabledBits-_SDA_BASE_(r13)
/* 0B6C58 800BC1F8 7FA9E8F8 */  nor     r9, r29, r29
/* 0B6C5C 800BC1FC 80CD9290 */  lwz     r6, WaitingBits-_SDA_BASE_(r13)
/* 0B6C60 800BC200 7FE3FB78 */  mr      r3, r31
/* 0B6C64 800BC204 80AD9294 */  lwz     r5, CheckingBits-_SDA_BASE_(r13)
/* 0B6C68 800BC208 808D9298 */  lwz     r4, PendingBits-_SDA_BASE_(r13)
/* 0B6C6C 800BC20C 7C084838 */  and     r8, r0, r9
/* 0B6C70 800BC210 800D929C */  lwz     r0, BarrelBits-_SDA_BASE_(r13)
/* 0B6C74 800BC214 7CC74838 */  and     r7, r6, r9
/* 0B6C78 800BC218 7CA64838 */  and     r6, r5, r9
/* 0B6C7C 800BC21C 7C854838 */  and     r5, r4, r9
/* 0B6C80 800BC220 910D9284 */  stw     r8, EnabledBits-_SDA_BASE_(r13)
/* 0B6C84 800BC224 7C004838 */  and     r0, r0, r9
/* 0B6C88 800BC228 90ED9290 */  stw     r7, WaitingBits-_SDA_BASE_(r13)
/* 0B6C8C 800BC22C 38800000 */  li      r4, 0
/* 0B6C90 800BC230 90CD9294 */  stw     r6, CheckingBits-_SDA_BASE_(r13)
/* 0B6C94 800BC234 90AD9298 */  stw     r5, PendingBits-_SDA_BASE_(r13)
/* 0B6C98 800BC238 900D929C */  stw     r0, BarrelBits-_SDA_BASE_(r13)
/* 0B6C9C 800BC23C 4BFF06B9 */  bl      OSSetWirelessID
/* 0B6CA0 800BC240 7FC3F378 */  mr      r3, r30
/* 0B6CA4 800BC244 4BFEE555 */  bl      OSRestoreInterrupts
lbl_800BC248:
/* 0B6CA8 800BC248 80010024 */  lwz     r0, 0x24(r1)
/* 0B6CAC 800BC24C 83E1001C */  lwz     r31, 0x1c(r1)
/* 0B6CB0 800BC250 83C10018 */  lwz     r30, 0x18(r1)
/* 0B6CB4 800BC254 83A10014 */  lwz     r29, 0x14(r1)
/* 0B6CB8 800BC258 38210020 */  addi    r1, r1, 0x20
/* 0B6CBC 800BC25C 7C0803A6 */  mtlr    r0
/* 0B6CC0 800BC260 4E800020 */  blr     

glabel PADReset
/* 0B6CC4 800BC264 7C0802A6 */  mflr    r0
/* 0B6CC8 800BC268 90010004 */  stw     r0, 4(r1)
/* 0B6CCC 800BC26C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B6CD0 800BC270 93E10014 */  stw     r31, 0x14(r1)
/* 0B6CD4 800BC274 93C10010 */  stw     r30, 0x10(r1)
/* 0B6CD8 800BC278 7C7E1B78 */  mr      r30, r3
/* 0B6CDC 800BC27C 4BFEE4F5 */  bl      OSDisableInterrupts
/* 0B6CE0 800BC280 808D9298 */  lwz     r4, PendingBits-_SDA_BASE_(r13)
/* 0B6CE4 800BC284 39000000 */  li      r8, 0
/* 0B6CE8 800BC288 80AD9290 */  lwz     r5, WaitingBits-_SDA_BASE_(r13)
/* 0B6CEC 800BC28C 7C7F1B78 */  mr      r31, r3
/* 0B6CF0 800BC290 800D9294 */  lwz     r0, CheckingBits-_SDA_BASE_(r13)
/* 0B6CF4 800BC294 7FDE2378 */  or      r30, r30, r4
/* 0B6CF8 800BC298 808D9288 */  lwz     r4, ResettingBits-_SDA_BASE_(r13)
/* 0B6CFC 800BC29C 7CA50378 */  or      r5, r5, r0
/* 0B6D00 800BC2A0 800D8DB8 */  lwz     r0, Spec-_SDA_BASE_(r13)
/* 0B6D04 800BC2A4 7FDE2878 */  andc    r30, r30, r5
/* 0B6D08 800BC2A8 80CD9284 */  lwz     r6, EnabledBits-_SDA_BASE_(r13)
/* 0B6D0C 800BC2AC 7C85F378 */  or      r5, r4, r30
/* 0B6D10 800BC2B0 808D929C */  lwz     r4, BarrelBits-_SDA_BASE_(r13)
/* 0B6D14 800BC2B4 7FC7F0F8 */  nor     r7, r30, r30
/* 0B6D18 800BC2B8 90AD9288 */  stw     r5, ResettingBits-_SDA_BASE_(r13)
/* 0B6D1C 800BC2BC 7CC53838 */  and     r5, r6, r7
/* 0B6D20 800BC2C0 7C843838 */  and     r4, r4, r7
/* 0B6D24 800BC2C4 80ED9288 */  lwz     r7, ResettingBits-_SDA_BASE_(r13)
/* 0B6D28 800BC2C8 28000004 */  cmplwi  r0, 4
/* 0B6D2C 800BC2CC 910D9298 */  stw     r8, PendingBits-_SDA_BASE_(r13)
/* 0B6D30 800BC2D0 7CE33038 */  and     r3, r7, r6
/* 0B6D34 800BC2D4 90AD9284 */  stw     r5, EnabledBits-_SDA_BASE_(r13)
/* 0B6D38 800BC2D8 908D929C */  stw     r4, BarrelBits-_SDA_BASE_(r13)
/* 0B6D3C 800BC2DC 40820010 */  bne     lbl_800BC2EC
/* 0B6D40 800BC2E0 800D928C */  lwz     r0, RecalibrateBits-_SDA_BASE_(r13)
/* 0B6D44 800BC2E4 7C00F378 */  or      r0, r0, r30
/* 0B6D48 800BC2E8 900D928C */  stw     r0, RecalibrateBits-_SDA_BASE_(r13)
lbl_800BC2EC:
/* 0B6D4C 800BC2EC 4BFF4C01 */  bl      SIDisablePolling
/* 0B6D50 800BC2F0 800D8DAC */  lwz     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B6D54 800BC2F4 2C000020 */  cmpwi   r0, 0x20
/* 0B6D58 800BC2F8 40820058 */  bne     lbl_800BC350
/* 0B6D5C 800BC2FC 80AD9288 */  lwz     r5, ResettingBits-_SDA_BASE_(r13)
/* 0B6D60 800BC300 7CA00034 */  cntlzw  r0, r5
/* 0B6D64 800BC304 900D8DAC */  stw     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B6D68 800BC308 808D8DAC */  lwz     r4, ResettingChan-_SDA_BASE_(r13)
/* 0B6D6C 800BC30C 2C040020 */  cmpwi   r4, 0x20
/* 0B6D70 800BC310 41820040 */  beq     lbl_800BC350
/* 0B6D74 800BC314 3C008000 */  lis     r0, 0x8000
/* 0B6D78 800BC318 7C002430 */  srw     r0, r0, r4
/* 0B6D7C 800BC31C 7CA00078 */  andc    r0, r5, r0
/* 0B6D80 800BC320 1C84000C */  mulli   r4, r4, 0xc
/* 0B6D84 800BC324 900D9288 */  stw     r0, ResettingBits-_SDA_BASE_(r13)
/* 0B6D88 800BC328 3C608014 */  lis     r3, Origin@ha
/* 0B6D8C 800BC32C 38032178 */  addi    r0, r3, Origin@l
/* 0B6D90 800BC330 7C602214 */  add     r3, r0, r4
/* 0B6D94 800BC334 38800000 */  li      r4, 0
/* 0B6D98 800BC338 38A0000C */  li      r5, 0xc
/* 0B6D9C 800BC33C 4BF49095 */  bl      memset
/* 0B6DA0 800BC340 3C80800C */  lis     r4, PADTypeAndStatusCallback@ha
/* 0B6DA4 800BC344 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B6DA8 800BC348 3884BDF8 */  addi    r4, r4, PADTypeAndStatusCallback@l
/* 0B6DAC 800BC34C 4BFF53F9 */  bl      SIGetTypeAsync
lbl_800BC350:
/* 0B6DB0 800BC350 7FE3FB78 */  mr      r3, r31
/* 0B6DB4 800BC354 4BFEE445 */  bl      OSRestoreInterrupts
/* 0B6DB8 800BC358 8001001C */  lwz     r0, 0x1c(r1)
/* 0B6DBC 800BC35C 38600001 */  li      r3, 1
/* 0B6DC0 800BC360 83E10014 */  lwz     r31, 0x14(r1)
/* 0B6DC4 800BC364 83C10010 */  lwz     r30, 0x10(r1)
/* 0B6DC8 800BC368 38210018 */  addi    r1, r1, 0x18
/* 0B6DCC 800BC36C 7C0803A6 */  mtlr    r0
/* 0B6DD0 800BC370 4E800020 */  blr     

glabel PADRecalibrate
/* 0B6DD4 800BC374 7C0802A6 */  mflr    r0
/* 0B6DD8 800BC378 90010004 */  stw     r0, 4(r1)
/* 0B6DDC 800BC37C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B6DE0 800BC380 93E10014 */  stw     r31, 0x14(r1)
/* 0B6DE4 800BC384 93C10010 */  stw     r30, 0x10(r1)
/* 0B6DE8 800BC388 7C7E1B78 */  mr      r30, r3
/* 0B6DEC 800BC38C 4BFEE3E5 */  bl      OSDisableInterrupts
/* 0B6DF0 800BC390 80AD9298 */  lwz     r5, PendingBits-_SDA_BASE_(r13)
/* 0B6DF4 800BC394 39000000 */  li      r8, 0
/* 0B6DF8 800BC398 80CD9290 */  lwz     r6, WaitingBits-_SDA_BASE_(r13)
/* 0B6DFC 800BC39C 3C808000 */  lis     r4, 0x8000
/* 0B6E00 800BC3A0 800D9294 */  lwz     r0, CheckingBits-_SDA_BASE_(r13)
/* 0B6E04 800BC3A4 7FDE2B78 */  or      r30, r30, r5
/* 0B6E08 800BC3A8 80AD9288 */  lwz     r5, ResettingBits-_SDA_BASE_(r13)
/* 0B6E0C 800BC3AC 7CC60378 */  or      r6, r6, r0
/* 0B6E10 800BC3B0 880430E3 */  lbz     r0, 0x30e3(r4)
/* 0B6E14 800BC3B4 7FDE3078 */  andc    r30, r30, r6
/* 0B6E18 800BC3B8 80CD9284 */  lwz     r6, EnabledBits-_SDA_BASE_(r13)
/* 0B6E1C 800BC3BC 7CA5F378 */  or      r5, r5, r30
/* 0B6E20 800BC3C0 808D929C */  lwz     r4, BarrelBits-_SDA_BASE_(r13)
/* 0B6E24 800BC3C4 90AD9288 */  stw     r5, ResettingBits-_SDA_BASE_(r13)
/* 0B6E28 800BC3C8 7FC9F0F8 */  nor     r9, r30, r30
/* 0B6E2C 800BC3CC 7CC54838 */  and     r5, r6, r9
/* 0B6E30 800BC3D0 7C844838 */  and     r4, r4, r9
/* 0B6E34 800BC3D4 80ED9288 */  lwz     r7, ResettingBits-_SDA_BASE_(r13)
/* 0B6E38 800BC3D8 7C7F1B78 */  mr      r31, r3
/* 0B6E3C 800BC3DC 910D9298 */  stw     r8, PendingBits-_SDA_BASE_(r13)
/* 0B6E40 800BC3E0 54000673 */  rlwinm. r0, r0, 0, 0x19, 0x19
/* 0B6E44 800BC3E4 90AD9284 */  stw     r5, EnabledBits-_SDA_BASE_(r13)
/* 0B6E48 800BC3E8 7CE33038 */  and     r3, r7, r6
/* 0B6E4C 800BC3EC 908D929C */  stw     r4, BarrelBits-_SDA_BASE_(r13)
/* 0B6E50 800BC3F0 40820010 */  bne     lbl_800BC400
/* 0B6E54 800BC3F4 800D928C */  lwz     r0, RecalibrateBits-_SDA_BASE_(r13)
/* 0B6E58 800BC3F8 7C00F378 */  or      r0, r0, r30
/* 0B6E5C 800BC3FC 900D928C */  stw     r0, RecalibrateBits-_SDA_BASE_(r13)
lbl_800BC400:
/* 0B6E60 800BC400 4BFF4AED */  bl      SIDisablePolling
/* 0B6E64 800BC404 800D8DAC */  lwz     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B6E68 800BC408 2C000020 */  cmpwi   r0, 0x20
/* 0B6E6C 800BC40C 40820058 */  bne     lbl_800BC464
/* 0B6E70 800BC410 80AD9288 */  lwz     r5, ResettingBits-_SDA_BASE_(r13)
/* 0B6E74 800BC414 7CA00034 */  cntlzw  r0, r5
/* 0B6E78 800BC418 900D8DAC */  stw     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B6E7C 800BC41C 808D8DAC */  lwz     r4, ResettingChan-_SDA_BASE_(r13)
/* 0B6E80 800BC420 2C040020 */  cmpwi   r4, 0x20
/* 0B6E84 800BC424 41820040 */  beq     lbl_800BC464
/* 0B6E88 800BC428 3C008000 */  lis     r0, 0x8000
/* 0B6E8C 800BC42C 7C002430 */  srw     r0, r0, r4
/* 0B6E90 800BC430 7CA00078 */  andc    r0, r5, r0
/* 0B6E94 800BC434 1C84000C */  mulli   r4, r4, 0xc
/* 0B6E98 800BC438 900D9288 */  stw     r0, ResettingBits-_SDA_BASE_(r13)
/* 0B6E9C 800BC43C 3C608014 */  lis     r3, Origin@ha
/* 0B6EA0 800BC440 38032178 */  addi    r0, r3, Origin@l
/* 0B6EA4 800BC444 7C602214 */  add     r3, r0, r4
/* 0B6EA8 800BC448 38800000 */  li      r4, 0
/* 0B6EAC 800BC44C 38A0000C */  li      r5, 0xc
/* 0B6EB0 800BC450 4BF48F81 */  bl      memset
/* 0B6EB4 800BC454 3C80800C */  lis     r4, PADTypeAndStatusCallback@ha
/* 0B6EB8 800BC458 806D8DAC */  lwz     r3, ResettingChan-_SDA_BASE_(r13)
/* 0B6EBC 800BC45C 3884BDF8 */  addi    r4, r4, PADTypeAndStatusCallback@l
/* 0B6EC0 800BC460 4BFF52E5 */  bl      SIGetTypeAsync
lbl_800BC464:
/* 0B6EC4 800BC464 7FE3FB78 */  mr      r3, r31
/* 0B6EC8 800BC468 4BFEE331 */  bl      OSRestoreInterrupts
/* 0B6ECC 800BC46C 8001001C */  lwz     r0, 0x1c(r1)
/* 0B6ED0 800BC470 38600001 */  li      r3, 1
/* 0B6ED4 800BC474 83E10014 */  lwz     r31, 0x14(r1)
/* 0B6ED8 800BC478 83C10010 */  lwz     r30, 0x10(r1)
/* 0B6EDC 800BC47C 38210018 */  addi    r1, r1, 0x18
/* 0B6EE0 800BC480 7C0803A6 */  mtlr    r0
/* 0B6EE4 800BC484 4E800020 */  blr     

glabel PADInit
/* 0B6EE8 800BC488 7C0802A6 */  mflr    r0
/* 0B6EEC 800BC48C 3C608014 */  lis     r3, Type@ha
/* 0B6EF0 800BC490 90010004 */  stw     r0, 4(r1)
/* 0B6EF4 800BC494 9421FFC8 */  stwu    r1, -0x38(r1)
/* 0B6EF8 800BC498 BF21001C */  stmw    r25, 0x1c(r1)
/* 0B6EFC 800BC49C 3BE32168 */  addi    r31, r3, Type@l
/* 0B6F00 800BC4A0 800D9280 */  lwz     r0, Initialized-_SDA_BASE_(r13)
/* 0B6F04 800BC4A4 2C000000 */  cmpwi   r0, 0
/* 0B6F08 800BC4A8 4182000C */  beq     lbl_800BC4B4
/* 0B6F0C 800BC4AC 38600001 */  li      r3, 1
/* 0B6F10 800BC4B0 48000114 */  b       lbl_800BC5C4
lbl_800BC4B4:
/* 0B6F14 800BC4B4 806D8DA8 */  lwz     r3, __PADVersion-_SDA_BASE_(r13)
/* 0B6F18 800BC4B8 4BFEBC4D */  bl      OSRegisterVersion
/* 0B6F1C 800BC4BC 806D92A8 */  lwz     r3, __PADSpec-_SDA_BASE_(r13)
/* 0B6F20 800BC4C0 28030000 */  cmplwi  r3, 0
/* 0B6F24 800BC4C4 41820008 */  beq     lbl_800BC4CC
/* 0B6F28 800BC4C8 480004C9 */  bl      PADSetSpec
lbl_800BC4CC:
/* 0B6F2C 800BC4CC 800D91A8 */  lwz     r0, __PADFixBits-_SDA_BASE_(r13)
/* 0B6F30 800BC4D0 38600001 */  li      r3, 1
/* 0B6F34 800BC4D4 906D9280 */  stw     r3, Initialized-_SDA_BASE_(r13)
/* 0B6F38 800BC4D8 28000000 */  cmplwi  r0, 0
/* 0B6F3C 800BC4DC 4182008C */  beq     lbl_800BC568
/* 0B6F40 800BC4E0 4BFF183D */  bl      OSGetTime
/* 0B6F44 800BC4E4 3B240000 */  addi    r25, r4, 0
/* 0B6F48 800BC4E8 3B430000 */  addi    r26, r3, 0
/* 0B6F4C 800BC4EC 38A00010 */  li      r5, 0x10
/* 0B6F50 800BC4F0 4801DA29 */  bl      __shr2i
/* 0B6F54 800BC4F4 3CA00001 */  lis     r5, 1
/* 0B6F58 800BC4F8 3B65FFFF */  addi    r27, r5, -1
/* 0B6F5C 800BC4FC 3B800000 */  li      r28, 0
/* 0B6F60 800BC500 7C86D838 */  and     r6, r4, r27
/* 0B6F64 800BC504 7F24D838 */  and     r4, r25, r27
/* 0B6F68 800BC508 7C65E038 */  and     r5, r3, r28
/* 0B6F6C 800BC50C 7F40E038 */  and     r0, r26, r28
/* 0B6F70 800BC510 7FA43014 */  addc    r29, r4, r6
/* 0B6F74 800BC514 387A0000 */  addi    r3, r26, 0
/* 0B6F78 800BC518 38990000 */  addi    r4, r25, 0
/* 0B6F7C 800BC51C 7FC02914 */  adde    r30, r0, r5
/* 0B6F80 800BC520 38A00020 */  li      r5, 0x20
/* 0B6F84 800BC524 4801D9F5 */  bl      __shr2i
/* 0B6F88 800BC528 7C84D838 */  and     r4, r4, r27
/* 0B6F8C 800BC52C 7C60E038 */  and     r0, r3, r28
/* 0B6F90 800BC530 7FA4E814 */  addc    r29, r4, r29
/* 0B6F94 800BC534 387A0000 */  addi    r3, r26, 0
/* 0B6F98 800BC538 38990000 */  addi    r4, r25, 0
/* 0B6F9C 800BC53C 7FC0F114 */  adde    r30, r0, r30
/* 0B6FA0 800BC540 38A00030 */  li      r5, 0x30
/* 0B6FA4 800BC544 4801D9D5 */  bl      __shr2i
/* 0B6FA8 800BC548 7C80D838 */  and     r0, r4, r27
/* 0B6FAC 800BC54C 7CA0E814 */  addc    r5, r0, r29
/* 0B6FB0 800BC550 3C00F000 */  lis     r0, 0xf000
/* 0B6FB4 800BC554 38803FFF */  li      r4, 0x3fff
/* 0B6FB8 800BC558 900D928C */  stw     r0, RecalibrateBits-_SDA_BASE_(r13)
/* 0B6FBC 800BC55C 7CA02038 */  and     r0, r5, r4
/* 0B6FC0 800BC560 3C608000 */  lis     r3, 0x8000
/* 0B6FC4 800BC564 B00330E0 */  sth     r0, 0x30e0(r3)
lbl_800BC568:
/* 0B6FC8 800BC568 3C608000 */  lis     r3, 0x8000
/* 0B6FCC 800BC56C A00330E0 */  lhz     r0, 0x30e0(r3)
/* 0B6FD0 800BC570 540042AE */  rlwinm  r0, r0, 8, 0xa, 0x17
/* 0B6FD4 800BC574 64004D00 */  oris    r0, r0, 0x4d00
/* 0B6FD8 800BC578 901F0040 */  stw     r0, 0x40(r31)
/* 0B6FDC 800BC57C A00330E0 */  lhz     r0, 0x30e0(r3)
/* 0B6FE0 800BC580 540042AE */  rlwinm  r0, r0, 8, 0xa, 0x17
/* 0B6FE4 800BC584 64004D40 */  oris    r0, r0, 0x4d40
/* 0B6FE8 800BC588 901F0044 */  stw     r0, 0x44(r31)
/* 0B6FEC 800BC58C A00330E0 */  lhz     r0, 0x30e0(r3)
/* 0B6FF0 800BC590 540042AE */  rlwinm  r0, r0, 8, 0xa, 0x17
/* 0B6FF4 800BC594 64004D80 */  oris    r0, r0, 0x4d80
/* 0B6FF8 800BC598 901F0048 */  stw     r0, 0x48(r31)
/* 0B6FFC 800BC59C A00330E0 */  lhz     r0, 0x30e0(r3)
/* 0B7000 800BC5A0 540042AE */  rlwinm  r0, r0, 8, 0xa, 0x17
/* 0B7004 800BC5A4 64004DC0 */  oris    r0, r0, 0x4dc0
/* 0B7008 800BC5A8 901F004C */  stw     r0, 0x4c(r31)
/* 0B700C 800BC5AC 4BFF53B9 */  bl      SIRefreshSamplingRate
/* 0B7010 800BC5B0 3C608010 */  lis     r3, ResetFunctionInfo@ha
/* 0B7014 800BC5B4 38630348 */  addi    r3, r3, ResetFunctionInfo@l
/* 0B7018 800BC5B8 4BFEF2E5 */  bl      OSRegisterResetFunction
/* 0B701C 800BC5BC 3C60F000 */  lis     r3, 0xf000
/* 0B7020 800BC5C0 4BFFFCA5 */  bl      PADReset
lbl_800BC5C4:
/* 0B7024 800BC5C4 BB21001C */  lmw     r25, 0x1c(r1)
/* 0B7028 800BC5C8 8001003C */  lwz     r0, 0x3c(r1)
/* 0B702C 800BC5CC 38210038 */  addi    r1, r1, 0x38
/* 0B7030 800BC5D0 7C0803A6 */  mtlr    r0
/* 0B7034 800BC5D4 4E800020 */  blr     

glabel PADRead
/* 0B7038 800BC5D8 7C0802A6 */  mflr    r0
/* 0B703C 800BC5DC 90010004 */  stw     r0, 4(r1)
/* 0B7040 800BC5E0 9421FFC0 */  stwu    r1, -0x40(r1)
/* 0B7044 800BC5E4 BEC10018 */  stmw    r22, 0x18(r1)
/* 0B7048 800BC5E8 7C771B78 */  mr      r23, r3
/* 0B704C 800BC5EC 4BFEE185 */  bl      OSDisableInterrupts
/* 0B7050 800BC5F0 3B200000 */  li      r25, 0
/* 0B7054 800BC5F4 1CB9000C */  mulli   r5, r25, 0xc
/* 0B7058 800BC5F8 3C808014 */  lis     r4, Origin@ha
/* 0B705C 800BC5FC 38042178 */  addi    r0, r4, Origin@l
/* 0B7060 800BC600 7F802A14 */  add     r28, r0, r5
/* 0B7064 800BC604 3C80800C */  lis     r4, PADOriginUpdateCallback@ha
/* 0B7068 800BC608 3CA0800C */  lis     r5, PADReceiveCheckCallback@ha
/* 0B706C 800BC60C 3B430000 */  addi    r26, r3, 0
/* 0B7070 800BC610 3AC4BC54 */  addi    r22, r4, PADOriginUpdateCallback@l
/* 0B7074 800BC614 3BE5C124 */  addi    r31, r5, PADReceiveCheckCallback@l
/* 0B7078 800BC618 3B000000 */  li      r24, 0
/* 0B707C 800BC61C 3FC08000 */  lis     r30, 0x8000
lbl_800BC620:
/* 0B7080 800BC620 800D9298 */  lwz     r0, PendingBits-_SDA_BASE_(r13)
/* 0B7084 800BC624 7FDBCC30 */  srw     r27, r30, r25
/* 0B7088 800BC628 7C00D839 */  and.    r0, r0, r27
/* 0B708C 800BC62C 41820028 */  beq     lbl_800BC654
/* 0B7090 800BC630 38600000 */  li      r3, 0
/* 0B7094 800BC634 4BFFFC31 */  bl      PADReset
/* 0B7098 800BC638 3800FFFE */  li      r0, -2
/* 0B709C 800BC63C 9817000A */  stb     r0, 0xa(r23)
/* 0B70A0 800BC640 38770000 */  addi    r3, r23, 0
/* 0B70A4 800BC644 38800000 */  li      r4, 0
/* 0B70A8 800BC648 38A0000A */  li      r5, 0xa
/* 0B70AC 800BC64C 4BF48D85 */  bl      memset
/* 0B70B0 800BC650 48000254 */  b       lbl_800BC8A4
lbl_800BC654:
/* 0B70B4 800BC654 800D9288 */  lwz     r0, ResettingBits-_SDA_BASE_(r13)
/* 0B70B8 800BC658 7C00D839 */  and.    r0, r0, r27
/* 0B70BC 800BC65C 40820010 */  bne     lbl_800BC66C
/* 0B70C0 800BC660 800D8DAC */  lwz     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B70C4 800BC664 7C00C800 */  cmpw    r0, r25
/* 0B70C8 800BC668 40820020 */  bne     lbl_800BC688
lbl_800BC66C:
/* 0B70CC 800BC66C 3800FFFE */  li      r0, -2
/* 0B70D0 800BC670 9817000A */  stb     r0, 0xa(r23)
/* 0B70D4 800BC674 38770000 */  addi    r3, r23, 0
/* 0B70D8 800BC678 38800000 */  li      r4, 0
/* 0B70DC 800BC67C 38A0000A */  li      r5, 0xa
/* 0B70E0 800BC680 4BF48D51 */  bl      memset
/* 0B70E4 800BC684 48000220 */  b       lbl_800BC8A4
lbl_800BC688:
/* 0B70E8 800BC688 800D9284 */  lwz     r0, EnabledBits-_SDA_BASE_(r13)
/* 0B70EC 800BC68C 7C00D839 */  and.    r0, r0, r27
/* 0B70F0 800BC690 40820020 */  bne     lbl_800BC6B0
/* 0B70F4 800BC694 3800FFFF */  li      r0, -1
/* 0B70F8 800BC698 9817000A */  stb     r0, 0xa(r23)
/* 0B70FC 800BC69C 38770000 */  addi    r3, r23, 0
/* 0B7100 800BC6A0 38800000 */  li      r4, 0
/* 0B7104 800BC6A4 38A0000A */  li      r5, 0xa
/* 0B7108 800BC6A8 4BF48D29 */  bl      memset
/* 0B710C 800BC6AC 480001F8 */  b       lbl_800BC8A4
lbl_800BC6B0:
/* 0B7110 800BC6B0 7F23CB78 */  mr      r3, r25
/* 0B7114 800BC6B4 4BFF3AFD */  bl      SIIsChanBusy
/* 0B7118 800BC6B8 2C030000 */  cmpwi   r3, 0
/* 0B711C 800BC6BC 41820020 */  beq     lbl_800BC6DC
/* 0B7120 800BC6C0 3800FFFD */  li      r0, -3
/* 0B7124 800BC6C4 9817000A */  stb     r0, 0xa(r23)
/* 0B7128 800BC6C8 38770000 */  addi    r3, r23, 0
/* 0B712C 800BC6CC 38800000 */  li      r4, 0
/* 0B7130 800BC6D0 38A0000A */  li      r5, 0xa
/* 0B7134 800BC6D4 4BF48CFD */  bl      memset
/* 0B7138 800BC6D8 480001CC */  b       lbl_800BC8A4
lbl_800BC6DC:
/* 0B713C 800BC6DC 7F23CB78 */  mr      r3, r25
/* 0B7140 800BC6E0 4BFF4665 */  bl      SIGetStatus
/* 0B7144 800BC6E4 54600739 */  rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 0B7148 800BC6E8 418200D8 */  beq     lbl_800BC7C0
/* 0B714C 800BC6EC 38790000 */  addi    r3, r25, 0
/* 0B7150 800BC6F0 38810010 */  addi    r4, r1, 0x10
/* 0B7154 800BC6F4 4BFF4939 */  bl      SIGetResponse
/* 0B7158 800BC6F8 800D9290 */  lwz     r0, WaitingBits-_SDA_BASE_(r13)
/* 0B715C 800BC6FC 7C00D839 */  and.    r0, r0, r27
/* 0B7160 800BC700 41820040 */  beq     lbl_800BC740
/* 0B7164 800BC704 38000000 */  li      r0, 0
/* 0B7168 800BC708 9817000A */  stb     r0, 0xa(r23)
/* 0B716C 800BC70C 38770000 */  addi    r3, r23, 0
/* 0B7170 800BC710 38800000 */  li      r4, 0
/* 0B7174 800BC714 38A0000A */  li      r5, 0xa
/* 0B7178 800BC718 4BF48CB9 */  bl      memset
/* 0B717C 800BC71C 806D9294 */  lwz     r3, CheckingBits-_SDA_BASE_(r13)
/* 0B7180 800BC720 7C60D839 */  and.    r0, r3, r27
/* 0B7184 800BC724 40820180 */  bne     lbl_800BC8A4
/* 0B7188 800BC728 7C60DB78 */  or      r0, r3, r27
/* 0B718C 800BC72C 900D9294 */  stw     r0, CheckingBits-_SDA_BASE_(r13)
/* 0B7190 800BC730 38790000 */  addi    r3, r25, 0
/* 0B7194 800BC734 389F0000 */  addi    r4, r31, 0
/* 0B7198 800BC738 4BFF500D */  bl      SIGetTypeAsync
/* 0B719C 800BC73C 48000168 */  b       lbl_800BC8A4
lbl_800BC740:
/* 0B71A0 800BC740 4BFEE031 */  bl      OSDisableInterrupts
/* 0B71A4 800BC744 3BA30000 */  addi    r29, r3, 0
/* 0B71A8 800BC748 387B0000 */  addi    r3, r27, 0
/* 0B71AC 800BC74C 4BFF47A1 */  bl      SIDisablePolling
/* 0B71B0 800BC750 800D9284 */  lwz     r0, EnabledBits-_SDA_BASE_(r13)
/* 0B71B4 800BC754 7F69D8F8 */  nor     r9, r27, r27
/* 0B71B8 800BC758 80CD9290 */  lwz     r6, WaitingBits-_SDA_BASE_(r13)
/* 0B71BC 800BC75C 7F23CB78 */  mr      r3, r25
/* 0B71C0 800BC760 80AD9294 */  lwz     r5, CheckingBits-_SDA_BASE_(r13)
/* 0B71C4 800BC764 808D9298 */  lwz     r4, PendingBits-_SDA_BASE_(r13)
/* 0B71C8 800BC768 7C084838 */  and     r8, r0, r9
/* 0B71CC 800BC76C 800D929C */  lwz     r0, BarrelBits-_SDA_BASE_(r13)
/* 0B71D0 800BC770 7CC74838 */  and     r7, r6, r9
/* 0B71D4 800BC774 7CA64838 */  and     r6, r5, r9
/* 0B71D8 800BC778 7C854838 */  and     r5, r4, r9
/* 0B71DC 800BC77C 910D9284 */  stw     r8, EnabledBits-_SDA_BASE_(r13)
/* 0B71E0 800BC780 7C004838 */  and     r0, r0, r9
/* 0B71E4 800BC784 90ED9290 */  stw     r7, WaitingBits-_SDA_BASE_(r13)
/* 0B71E8 800BC788 38800000 */  li      r4, 0
/* 0B71EC 800BC78C 90CD9294 */  stw     r6, CheckingBits-_SDA_BASE_(r13)
/* 0B71F0 800BC790 90AD9298 */  stw     r5, PendingBits-_SDA_BASE_(r13)
/* 0B71F4 800BC794 900D929C */  stw     r0, BarrelBits-_SDA_BASE_(r13)
/* 0B71F8 800BC798 4BFF015D */  bl      OSSetWirelessID
/* 0B71FC 800BC79C 7FA3EB78 */  mr      r3, r29
/* 0B7200 800BC7A0 4BFEDFF9 */  bl      OSRestoreInterrupts
/* 0B7204 800BC7A4 3800FFFF */  li      r0, -1
/* 0B7208 800BC7A8 9817000A */  stb     r0, 0xa(r23)
/* 0B720C 800BC7AC 38770000 */  addi    r3, r23, 0
/* 0B7210 800BC7B0 38800000 */  li      r4, 0
/* 0B7214 800BC7B4 38A0000A */  li      r5, 0xa
/* 0B7218 800BC7B8 4BF48C19 */  bl      memset
/* 0B721C 800BC7BC 480000E8 */  b       lbl_800BC8A4
lbl_800BC7C0:
/* 0B7220 800BC7C0 7F23CB78 */  mr      r3, r25
/* 0B7224 800BC7C4 4BFF4DBD */  bl      SIGetType
/* 0B7228 800BC7C8 54600085 */  rlwinm. r0, r3, 0, 2, 2
/* 0B722C 800BC7CC 40820008 */  bne     lbl_800BC7D4
/* 0B7230 800BC7D0 7F18DB78 */  or      r24, r24, r27
lbl_800BC7D4:
/* 0B7234 800BC7D4 38790000 */  addi    r3, r25, 0
/* 0B7238 800BC7D8 38810010 */  addi    r4, r1, 0x10
/* 0B723C 800BC7DC 4BFF4851 */  bl      SIGetResponse
/* 0B7240 800BC7E0 2C030000 */  cmpwi   r3, 0
/* 0B7244 800BC7E4 40820020 */  bne     lbl_800BC804
/* 0B7248 800BC7E8 3800FFFD */  li      r0, -3
/* 0B724C 800BC7EC 9817000A */  stb     r0, 0xa(r23)
/* 0B7250 800BC7F0 38770000 */  addi    r3, r23, 0
/* 0B7254 800BC7F4 38800000 */  li      r4, 0
/* 0B7258 800BC7F8 38A0000A */  li      r5, 0xa
/* 0B725C 800BC7FC 4BF48BD5 */  bl      memset
/* 0B7260 800BC800 480000A4 */  b       lbl_800BC8A4
lbl_800BC804:
/* 0B7264 800BC804 80010010 */  lwz     r0, 0x10(r1)
/* 0B7268 800BC808 54000001 */  rlwinm. r0, r0, 0, 0, 0
/* 0B726C 800BC80C 41820020 */  beq     lbl_800BC82C
/* 0B7270 800BC810 3800FFFD */  li      r0, -3
/* 0B7274 800BC814 9817000A */  stb     r0, 0xa(r23)
/* 0B7278 800BC818 38770000 */  addi    r3, r23, 0
/* 0B727C 800BC81C 38800000 */  li      r4, 0
/* 0B7280 800BC820 38A0000A */  li      r5, 0xa
/* 0B7284 800BC824 4BF48BAD */  bl      memset
/* 0B7288 800BC828 4800007C */  b       lbl_800BC8A4
lbl_800BC82C:
/* 0B728C 800BC82C 818D8DBC */  lwz     r12, MakeStatus-_SDA_BASE_(r13)
/* 0B7290 800BC830 38790000 */  addi    r3, r25, 0
/* 0B7294 800BC834 38970000 */  addi    r4, r23, 0
/* 0B7298 800BC838 7D8803A6 */  mtlr    r12
/* 0B729C 800BC83C 38A10010 */  addi    r5, r1, 0x10
/* 0B72A0 800BC840 4E800021 */  blrl    
/* 0B72A4 800BC844 A0170000 */  lhz     r0, 0(r23)
/* 0B72A8 800BC848 540004A5 */  rlwinm. r0, r0, 0, 0x12, 0x12
/* 0B72AC 800BC84C 41820044 */  beq     lbl_800BC890
/* 0B72B0 800BC850 3800FFFD */  li      r0, -3
/* 0B72B4 800BC854 9817000A */  stb     r0, 0xa(r23)
/* 0B72B8 800BC858 38770000 */  addi    r3, r23, 0
/* 0B72BC 800BC85C 38800000 */  li      r4, 0
/* 0B72C0 800BC860 38A0000A */  li      r5, 0xa
/* 0B72C4 800BC864 4BF48B6D */  bl      memset
/* 0B72C8 800BC868 38790000 */  addi    r3, r25, 0
/* 0B72CC 800BC86C 38DC0000 */  addi    r6, r28, 0
/* 0B72D0 800BC870 39160000 */  addi    r8, r22, 0
/* 0B72D4 800BC874 388D8DC0 */  addi    r4, r13, CmdReadOrigin-_SDA_BASE_
/* 0B72D8 800BC878 38A00001 */  li      r5, 1
/* 0B72DC 800BC87C 38E0000A */  li      r7, 0xa
/* 0B72E0 800BC880 39400000 */  li      r10, 0
/* 0B72E4 800BC884 39200000 */  li      r9, 0
/* 0B72E8 800BC888 4BFF48F5 */  bl      SITransfer
/* 0B72EC 800BC88C 48000018 */  b       lbl_800BC8A4
lbl_800BC890:
/* 0B72F0 800BC890 38000000 */  li      r0, 0
/* 0B72F4 800BC894 9817000A */  stb     r0, 0xa(r23)
/* 0B72F8 800BC898 A0170000 */  lhz     r0, 0(r23)
/* 0B72FC 800BC89C 5400066E */  rlwinm  r0, r0, 0, 0x19, 0x17
/* 0B7300 800BC8A0 B0170000 */  sth     r0, 0(r23)
lbl_800BC8A4:
/* 0B7304 800BC8A4 3B390001 */  addi    r25, r25, 1
/* 0B7308 800BC8A8 2C190004 */  cmpwi   r25, 4
/* 0B730C 800BC8AC 3B9C000C */  addi    r28, r28, 0xc
/* 0B7310 800BC8B0 3AF7000C */  addi    r23, r23, 0xc
/* 0B7314 800BC8B4 4180FD6C */  blt     lbl_800BC620
/* 0B7318 800BC8B8 7F43D378 */  mr      r3, r26
/* 0B731C 800BC8BC 4BFEDEDD */  bl      OSRestoreInterrupts
/* 0B7320 800BC8C0 7F03C378 */  mr      r3, r24
/* 0B7324 800BC8C4 BAC10018 */  lmw     r22, 0x18(r1)
/* 0B7328 800BC8C8 80010044 */  lwz     r0, 0x44(r1)
/* 0B732C 800BC8CC 38210040 */  addi    r1, r1, 0x40
/* 0B7330 800BC8D0 7C0803A6 */  mtlr    r0
/* 0B7334 800BC8D4 4E800020 */  blr     

glabel PADControlMotor
/* 0B7338 800BC8D8 7C0802A6 */  mflr    r0
/* 0B733C 800BC8DC 90010004 */  stw     r0, 4(r1)
/* 0B7340 800BC8E0 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0B7344 800BC8E4 93E10024 */  stw     r31, 0x24(r1)
/* 0B7348 800BC8E8 93C10020 */  stw     r30, 0x20(r1)
/* 0B734C 800BC8EC 3BC40000 */  addi    r30, r4, 0
/* 0B7350 800BC8F0 93A1001C */  stw     r29, 0x1c(r1)
/* 0B7354 800BC8F4 3BA30000 */  addi    r29, r3, 0
/* 0B7358 800BC8F8 4BFEDE79 */  bl      OSDisableInterrupts
/* 0B735C 800BC8FC 3C008000 */  lis     r0, 0x8000
/* 0B7360 800BC900 808D9284 */  lwz     r4, EnabledBits-_SDA_BASE_(r13)
/* 0B7364 800BC904 7C00EC30 */  srw     r0, r0, r29
/* 0B7368 800BC908 7C800039 */  and.    r0, r4, r0
/* 0B736C 800BC90C 3BE30000 */  addi    r31, r3, 0
/* 0B7370 800BC910 4182005C */  beq     lbl_800BC96C
/* 0B7374 800BC914 7FA3EB78 */  mr      r3, r29
/* 0B7378 800BC918 4BFF4C69 */  bl      SIGetType
/* 0B737C 800BC91C 54600085 */  rlwinm. r0, r3, 0, 2, 2
/* 0B7380 800BC920 4082004C */  bne     lbl_800BC96C
/* 0B7384 800BC924 800D8DB8 */  lwz     r0, Spec-_SDA_BASE_(r13)
/* 0B7388 800BC928 28000002 */  cmplwi  r0, 2
/* 0B738C 800BC92C 40800010 */  bge     lbl_800BC93C
/* 0B7390 800BC930 281E0002 */  cmplwi  r30, 2
/* 0B7394 800BC934 40820008 */  bne     lbl_800BC93C
/* 0B7398 800BC938 3BC00000 */  li      r30, 0
lbl_800BC93C:
/* 0B739C 800BC93C 3C608000 */  lis     r3, 0x8000
/* 0B73A0 800BC940 880330E3 */  lbz     r0, 0x30e3(r3)
/* 0B73A4 800BC944 540006B5 */  rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0B73A8 800BC948 41820008 */  beq     lbl_800BC950
/* 0B73AC 800BC94C 3BC00000 */  li      r30, 0
lbl_800BC950:
/* 0B73B0 800BC950 808D8DB4 */  lwz     r4, AnalogMode-_SDA_BASE_(r13)
/* 0B73B4 800BC954 57C007BE */  clrlwi  r0, r30, 0x1e
/* 0B73B8 800BC958 387D0000 */  addi    r3, r29, 0
/* 0B73BC 800BC95C 64840040 */  oris    r4, r4, 0x40
/* 0B73C0 800BC960 7C840378 */  or      r4, r4, r0
/* 0B73C4 800BC964 4BFF445D */  bl      SISetCommand
/* 0B73C8 800BC968 4BFF446D */  bl      SITransferCommands
lbl_800BC96C:
/* 0B73CC 800BC96C 7FE3FB78 */  mr      r3, r31
/* 0B73D0 800BC970 4BFEDE29 */  bl      OSRestoreInterrupts
/* 0B73D4 800BC974 8001002C */  lwz     r0, 0x2c(r1)
/* 0B73D8 800BC978 83E10024 */  lwz     r31, 0x24(r1)
/* 0B73DC 800BC97C 83C10020 */  lwz     r30, 0x20(r1)
/* 0B73E0 800BC980 83A1001C */  lwz     r29, 0x1c(r1)
/* 0B73E4 800BC984 38210028 */  addi    r1, r1, 0x28
/* 0B73E8 800BC988 7C0803A6 */  mtlr    r0
/* 0B73EC 800BC98C 4E800020 */  blr     

glabel PADSetSpec
/* 0B73F0 800BC990 38000000 */  li      r0, 0
/* 0B73F4 800BC994 2C030001 */  cmpwi   r3, 1
/* 0B73F8 800BC998 900D92A8 */  stw     r0, __PADSpec-_SDA_BASE_(r13)
/* 0B73FC 800BC99C 41820030 */  beq     lbl_800BC9CC
/* 0B7400 800BC9A0 40800010 */  bge     lbl_800BC9B0
/* 0B7404 800BC9A4 2C030000 */  cmpwi   r3, 0
/* 0B7408 800BC9A8 40800014 */  bge     lbl_800BC9BC
/* 0B740C 800BC9AC 4800003C */  b       lbl_800BC9E8
lbl_800BC9B0:
/* 0B7410 800BC9B0 2C030006 */  cmpwi   r3, 6
/* 0B7414 800BC9B4 40800034 */  bge     lbl_800BC9E8
/* 0B7418 800BC9B8 48000024 */  b       lbl_800BC9DC
lbl_800BC9BC:
/* 0B741C 800BC9BC 3C80800C */  lis     r4, SPEC0_MakeStatus@ha
/* 0B7420 800BC9C0 3804C9F0 */  addi    r0, r4, SPEC0_MakeStatus@l
/* 0B7424 800BC9C4 900D8DBC */  stw     r0, MakeStatus-_SDA_BASE_(r13)
/* 0B7428 800BC9C8 48000020 */  b       lbl_800BC9E8
lbl_800BC9CC:
/* 0B742C 800BC9CC 3C80800C */  lis     r4, SPEC1_MakeStatus@ha
/* 0B7430 800BC9D0 3804CB64 */  addi    r0, r4, SPEC1_MakeStatus@l
/* 0B7434 800BC9D4 900D8DBC */  stw     r0, MakeStatus-_SDA_BASE_(r13)
/* 0B7438 800BC9D8 48000010 */  b       lbl_800BC9E8
lbl_800BC9DC:
/* 0B743C 800BC9DC 3C80800C */  lis     r4, SPEC2_MakeStatus@ha
/* 0B7440 800BC9E0 3804CCD8 */  addi    r0, r4, SPEC2_MakeStatus@l
/* 0B7444 800BC9E4 900D8DBC */  stw     r0, MakeStatus-_SDA_BASE_(r13)
lbl_800BC9E8:
/* 0B7448 800BC9E8 906D8DB8 */  stw     r3, Spec-_SDA_BASE_(r13)
/* 0B744C 800BC9EC 4E800020 */  blr     

SPEC0_MakeStatus:
/* 0B7450 800BC9F0 38600000 */  li      r3, 0
/* 0B7454 800BC9F4 B0640000 */  sth     r3, 0(r4)
/* 0B7458 800BC9F8 80050000 */  lwz     r0, 0(r5)
/* 0B745C 800BC9FC 54008739 */  rlwinm. r0, r0, 0x10, 0x1c, 0x1c
/* 0B7460 800BCA00 41820008 */  beq     lbl_800BCA08
/* 0B7464 800BCA04 38600100 */  li      r3, 0x100
lbl_800BCA08:
/* 0B7468 800BCA08 A0040000 */  lhz     r0, 0(r4)
/* 0B746C 800BCA0C 7C001B78 */  or      r0, r0, r3
/* 0B7470 800BCA10 B0040000 */  sth     r0, 0(r4)
/* 0B7474 800BCA14 80050000 */  lwz     r0, 0(r5)
/* 0B7478 800BCA18 540086B5 */  rlwinm. r0, r0, 0x10, 0x1a, 0x1a
/* 0B747C 800BCA1C 4182000C */  beq     lbl_800BCA28
/* 0B7480 800BCA20 38600200 */  li      r3, 0x200
/* 0B7484 800BCA24 48000008 */  b       lbl_800BCA2C
lbl_800BCA28:
/* 0B7488 800BCA28 38600000 */  li      r3, 0
lbl_800BCA2C:
/* 0B748C 800BCA2C A0040000 */  lhz     r0, 0(r4)
/* 0B7490 800BCA30 7C001B78 */  or      r0, r0, r3
/* 0B7494 800BCA34 B0040000 */  sth     r0, 0(r4)
/* 0B7498 800BCA38 80050000 */  lwz     r0, 0(r5)
/* 0B749C 800BCA3C 540085EF */  rlwinm. r0, r0, 0x10, 0x17, 0x17
/* 0B74A0 800BCA40 4182000C */  beq     lbl_800BCA4C
/* 0B74A4 800BCA44 38600400 */  li      r3, 0x400
/* 0B74A8 800BCA48 48000008 */  b       lbl_800BCA50
lbl_800BCA4C:
/* 0B74AC 800BCA4C 38600000 */  li      r3, 0
lbl_800BCA50:
/* 0B74B0 800BCA50 A0040000 */  lhz     r0, 0(r4)
/* 0B74B4 800BCA54 7C001B78 */  or      r0, r0, r3
/* 0B74B8 800BCA58 B0040000 */  sth     r0, 0(r4)
/* 0B74BC 800BCA5C 80050000 */  lwz     r0, 0(r5)
/* 0B74C0 800BCA60 540087FF */  rlwinm. r0, r0, 0x10, 0x1f, 0x1f
/* 0B74C4 800BCA64 4182000C */  beq     lbl_800BCA70
/* 0B74C8 800BCA68 38600800 */  li      r3, 0x800
/* 0B74CC 800BCA6C 48000008 */  b       lbl_800BCA74
lbl_800BCA70:
/* 0B74D0 800BCA70 38600000 */  li      r3, 0
lbl_800BCA74:
/* 0B74D4 800BCA74 A0040000 */  lhz     r0, 0(r4)
/* 0B74D8 800BCA78 7C001B78 */  or      r0, r0, r3
/* 0B74DC 800BCA7C B0040000 */  sth     r0, 0(r4)
/* 0B74E0 800BCA80 80050000 */  lwz     r0, 0(r5)
/* 0B74E4 800BCA84 540086F7 */  rlwinm. r0, r0, 0x10, 0x1b, 0x1b
/* 0B74E8 800BCA88 4182000C */  beq     lbl_800BCA94
/* 0B74EC 800BCA8C 38C01000 */  li      r6, 0x1000
/* 0B74F0 800BCA90 48000008 */  b       lbl_800BCA98
lbl_800BCA94:
/* 0B74F4 800BCA94 38C00000 */  li      r6, 0
lbl_800BCA98:
/* 0B74F8 800BCA98 A0640000 */  lhz     r3, 0(r4)
/* 0B74FC 800BCA9C 38000000 */  li      r0, 0
/* 0B7500 800BCAA0 7C633378 */  or      r3, r3, r6
/* 0B7504 800BCAA4 B0640000 */  sth     r3, 0(r4)
/* 0B7508 800BCAA8 80650004 */  lwz     r3, 4(r5)
/* 0B750C 800BCAAC 5463843E */  srwi    r3, r3, 0x10
/* 0B7510 800BCAB0 7C630774 */  extsb   r3, r3
/* 0B7514 800BCAB4 98640002 */  stb     r3, 2(r4)
/* 0B7518 800BCAB8 80650004 */  lwz     r3, 4(r5)
/* 0B751C 800BCABC 5463463E */  srwi    r3, r3, 0x18
/* 0B7520 800BCAC0 7C630774 */  extsb   r3, r3
/* 0B7524 800BCAC4 98640003 */  stb     r3, 3(r4)
/* 0B7528 800BCAC8 80650004 */  lwz     r3, 4(r5)
/* 0B752C 800BCACC 7C630774 */  extsb   r3, r3
/* 0B7530 800BCAD0 98640004 */  stb     r3, 4(r4)
/* 0B7534 800BCAD4 80650004 */  lwz     r3, 4(r5)
/* 0B7538 800BCAD8 5463C23E */  srwi    r3, r3, 8
/* 0B753C 800BCADC 7C630774 */  extsb   r3, r3
/* 0B7540 800BCAE0 98640005 */  stb     r3, 5(r4)
/* 0B7544 800BCAE4 80650000 */  lwz     r3, 0(r5)
/* 0B7548 800BCAE8 5463C63E */  rlwinm  r3, r3, 0x18, 0x18, 0x1f
/* 0B754C 800BCAEC 98640006 */  stb     r3, 6(r4)
/* 0B7550 800BCAF0 80650000 */  lwz     r3, 0(r5)
/* 0B7554 800BCAF4 98640007 */  stb     r3, 7(r4)
/* 0B7558 800BCAF8 98040008 */  stb     r0, 8(r4)
/* 0B755C 800BCAFC 98040009 */  stb     r0, 9(r4)
/* 0B7560 800BCB00 88040006 */  lbz     r0, 6(r4)
/* 0B7564 800BCB04 280000AA */  cmplwi  r0, 0xaa
/* 0B7568 800BCB08 41800010 */  blt     lbl_800BCB18
/* 0B756C 800BCB0C A0040000 */  lhz     r0, 0(r4)
/* 0B7570 800BCB10 60000040 */  ori     r0, r0, 0x40
/* 0B7574 800BCB14 B0040000 */  sth     r0, 0(r4)
lbl_800BCB18:
/* 0B7578 800BCB18 88040007 */  lbz     r0, 7(r4)
/* 0B757C 800BCB1C 280000AA */  cmplwi  r0, 0xaa
/* 0B7580 800BCB20 41800010 */  blt     lbl_800BCB30
/* 0B7584 800BCB24 A0040000 */  lhz     r0, 0(r4)
/* 0B7588 800BCB28 60000020 */  ori     r0, r0, 0x20
/* 0B758C 800BCB2C B0040000 */  sth     r0, 0(r4)
lbl_800BCB30:
/* 0B7590 800BCB30 88640002 */  lbz     r3, 2(r4)
/* 0B7594 800BCB34 3803FF80 */  addi    r0, r3, -128
/* 0B7598 800BCB38 98040002 */  stb     r0, 2(r4)
/* 0B759C 800BCB3C 88640003 */  lbz     r3, 3(r4)
/* 0B75A0 800BCB40 3803FF80 */  addi    r0, r3, -128
/* 0B75A4 800BCB44 98040003 */  stb     r0, 3(r4)
/* 0B75A8 800BCB48 88640004 */  lbz     r3, 4(r4)
/* 0B75AC 800BCB4C 3803FF80 */  addi    r0, r3, -128
/* 0B75B0 800BCB50 98040004 */  stb     r0, 4(r4)
/* 0B75B4 800BCB54 88640005 */  lbz     r3, 5(r4)
/* 0B75B8 800BCB58 3803FF80 */  addi    r0, r3, -128
/* 0B75BC 800BCB5C 98040005 */  stb     r0, 5(r4)
/* 0B75C0 800BCB60 4E800020 */  blr     

SPEC1_MakeStatus:
/* 0B75C4 800BCB64 38600000 */  li      r3, 0
/* 0B75C8 800BCB68 B0640000 */  sth     r3, 0(r4)
/* 0B75CC 800BCB6C 80050000 */  lwz     r0, 0(r5)
/* 0B75D0 800BCB70 54008631 */  rlwinm. r0, r0, 0x10, 0x18, 0x18
/* 0B75D4 800BCB74 41820008 */  beq     lbl_800BCB7C
/* 0B75D8 800BCB78 38600100 */  li      r3, 0x100
lbl_800BCB7C:
/* 0B75DC 800BCB7C A0040000 */  lhz     r0, 0(r4)
/* 0B75E0 800BCB80 7C001B78 */  or      r0, r0, r3
/* 0B75E4 800BCB84 B0040000 */  sth     r0, 0(r4)
/* 0B75E8 800BCB88 80050000 */  lwz     r0, 0(r5)
/* 0B75EC 800BCB8C 540085EF */  rlwinm. r0, r0, 0x10, 0x17, 0x17
/* 0B75F0 800BCB90 4182000C */  beq     lbl_800BCB9C
/* 0B75F4 800BCB94 38600200 */  li      r3, 0x200
/* 0B75F8 800BCB98 48000008 */  b       lbl_800BCBA0
lbl_800BCB9C:
/* 0B75FC 800BCB9C 38600000 */  li      r3, 0
lbl_800BCBA0:
/* 0B7600 800BCBA0 A0040000 */  lhz     r0, 0(r4)
/* 0B7604 800BCBA4 7C001B78 */  or      r0, r0, r3
/* 0B7608 800BCBA8 B0040000 */  sth     r0, 0(r4)
/* 0B760C 800BCBAC 80050000 */  lwz     r0, 0(r5)
/* 0B7610 800BCBB0 540086B5 */  rlwinm. r0, r0, 0x10, 0x1a, 0x1a
/* 0B7614 800BCBB4 4182000C */  beq     lbl_800BCBC0
/* 0B7618 800BCBB8 38600400 */  li      r3, 0x400
/* 0B761C 800BCBBC 48000008 */  b       lbl_800BCBC4
lbl_800BCBC0:
/* 0B7620 800BCBC0 38600000 */  li      r3, 0
lbl_800BCBC4:
/* 0B7624 800BCBC4 A0040000 */  lhz     r0, 0(r4)
/* 0B7628 800BCBC8 7C001B78 */  or      r0, r0, r3
/* 0B762C 800BCBCC B0040000 */  sth     r0, 0(r4)
/* 0B7630 800BCBD0 80050000 */  lwz     r0, 0(r5)
/* 0B7634 800BCBD4 540086F7 */  rlwinm. r0, r0, 0x10, 0x1b, 0x1b
/* 0B7638 800BCBD8 4182000C */  beq     lbl_800BCBE4
/* 0B763C 800BCBDC 38600800 */  li      r3, 0x800
/* 0B7640 800BCBE0 48000008 */  b       lbl_800BCBE8
lbl_800BCBE4:
/* 0B7644 800BCBE4 38600000 */  li      r3, 0
lbl_800BCBE8:
/* 0B7648 800BCBE8 A0040000 */  lhz     r0, 0(r4)
/* 0B764C 800BCBEC 7C001B78 */  or      r0, r0, r3
/* 0B7650 800BCBF0 B0040000 */  sth     r0, 0(r4)
/* 0B7654 800BCBF4 80050000 */  lwz     r0, 0(r5)
/* 0B7658 800BCBF8 540085AD */  rlwinm. r0, r0, 0x10, 0x16, 0x16
/* 0B765C 800BCBFC 4182000C */  beq     lbl_800BCC08
/* 0B7660 800BCC00 38C01000 */  li      r6, 0x1000
/* 0B7664 800BCC04 48000008 */  b       lbl_800BCC0C
lbl_800BCC08:
/* 0B7668 800BCC08 38C00000 */  li      r6, 0
lbl_800BCC0C:
/* 0B766C 800BCC0C A0640000 */  lhz     r3, 0(r4)
/* 0B7670 800BCC10 38000000 */  li      r0, 0
/* 0B7674 800BCC14 7C633378 */  or      r3, r3, r6
/* 0B7678 800BCC18 B0640000 */  sth     r3, 0(r4)
/* 0B767C 800BCC1C 80650004 */  lwz     r3, 4(r5)
/* 0B7680 800BCC20 5463843E */  srwi    r3, r3, 0x10
/* 0B7684 800BCC24 7C630774 */  extsb   r3, r3
/* 0B7688 800BCC28 98640002 */  stb     r3, 2(r4)
/* 0B768C 800BCC2C 80650004 */  lwz     r3, 4(r5)
/* 0B7690 800BCC30 5463463E */  srwi    r3, r3, 0x18
/* 0B7694 800BCC34 7C630774 */  extsb   r3, r3
/* 0B7698 800BCC38 98640003 */  stb     r3, 3(r4)
/* 0B769C 800BCC3C 80650004 */  lwz     r3, 4(r5)
/* 0B76A0 800BCC40 7C630774 */  extsb   r3, r3
/* 0B76A4 800BCC44 98640004 */  stb     r3, 4(r4)
/* 0B76A8 800BCC48 80650004 */  lwz     r3, 4(r5)
/* 0B76AC 800BCC4C 5463C23E */  srwi    r3, r3, 8
/* 0B76B0 800BCC50 7C630774 */  extsb   r3, r3
/* 0B76B4 800BCC54 98640005 */  stb     r3, 5(r4)
/* 0B76B8 800BCC58 80650000 */  lwz     r3, 0(r5)
/* 0B76BC 800BCC5C 5463C63E */  rlwinm  r3, r3, 0x18, 0x18, 0x1f
/* 0B76C0 800BCC60 98640006 */  stb     r3, 6(r4)
/* 0B76C4 800BCC64 80650000 */  lwz     r3, 0(r5)
/* 0B76C8 800BCC68 98640007 */  stb     r3, 7(r4)
/* 0B76CC 800BCC6C 98040008 */  stb     r0, 8(r4)
/* 0B76D0 800BCC70 98040009 */  stb     r0, 9(r4)
/* 0B76D4 800BCC74 88040006 */  lbz     r0, 6(r4)
/* 0B76D8 800BCC78 280000AA */  cmplwi  r0, 0xaa
/* 0B76DC 800BCC7C 41800010 */  blt     lbl_800BCC8C
/* 0B76E0 800BCC80 A0040000 */  lhz     r0, 0(r4)
/* 0B76E4 800BCC84 60000040 */  ori     r0, r0, 0x40
/* 0B76E8 800BCC88 B0040000 */  sth     r0, 0(r4)
lbl_800BCC8C:
/* 0B76EC 800BCC8C 88040007 */  lbz     r0, 7(r4)
/* 0B76F0 800BCC90 280000AA */  cmplwi  r0, 0xaa
/* 0B76F4 800BCC94 41800010 */  blt     lbl_800BCCA4
/* 0B76F8 800BCC98 A0040000 */  lhz     r0, 0(r4)
/* 0B76FC 800BCC9C 60000020 */  ori     r0, r0, 0x20
/* 0B7700 800BCCA0 B0040000 */  sth     r0, 0(r4)
lbl_800BCCA4:
/* 0B7704 800BCCA4 88640002 */  lbz     r3, 2(r4)
/* 0B7708 800BCCA8 3803FF80 */  addi    r0, r3, -128
/* 0B770C 800BCCAC 98040002 */  stb     r0, 2(r4)
/* 0B7710 800BCCB0 88640003 */  lbz     r3, 3(r4)
/* 0B7714 800BCCB4 3803FF80 */  addi    r0, r3, -128
/* 0B7718 800BCCB8 98040003 */  stb     r0, 3(r4)
/* 0B771C 800BCCBC 88640004 */  lbz     r3, 4(r4)
/* 0B7720 800BCCC0 3803FF80 */  addi    r0, r3, -128
/* 0B7724 800BCCC4 98040004 */  stb     r0, 4(r4)
/* 0B7728 800BCCC8 88640005 */  lbz     r3, 5(r4)
/* 0B772C 800BCCCC 3803FF80 */  addi    r0, r3, -128
/* 0B7730 800BCCD0 98040005 */  stb     r0, 5(r4)
/* 0B7734 800BCCD4 4E800020 */  blr     

SPEC2_MakeStatus:
/* 0B7738 800BCCD8 80050000 */  lwz     r0, 0(r5)
/* 0B773C 800BCCDC 540084BE */  rlwinm  r0, r0, 0x10, 0x12, 0x1f
/* 0B7740 800BCCE0 B0040000 */  sth     r0, 0(r4)
/* 0B7744 800BCCE4 80050000 */  lwz     r0, 0(r5)
/* 0B7748 800BCCE8 5400C23E */  srwi    r0, r0, 8
/* 0B774C 800BCCEC 7C000774 */  extsb   r0, r0
/* 0B7750 800BCCF0 98040002 */  stb     r0, 2(r4)
/* 0B7754 800BCCF4 80050000 */  lwz     r0, 0(r5)
/* 0B7758 800BCCF8 7C000774 */  extsb   r0, r0
/* 0B775C 800BCCFC 98040003 */  stb     r0, 3(r4)
/* 0B7760 800BCD00 800D8DB4 */  lwz     r0, AnalogMode-_SDA_BASE_(r13)
/* 0B7764 800BCD04 5400056E */  rlwinm  r0, r0, 0, 0x15, 0x17
/* 0B7768 800BCD08 2C000400 */  cmpwi   r0, 0x400
/* 0B776C 800BCD0C 41820198 */  beq     lbl_800BCEA4
/* 0B7770 800BCD10 40800034 */  bge     lbl_800BCD44
/* 0B7774 800BCD14 2C000200 */  cmpwi   r0, 0x200
/* 0B7778 800BCD18 418200F8 */  beq     lbl_800BCE10
/* 0B777C 800BCD1C 4080001C */  bge     lbl_800BCD38
/* 0B7780 800BCD20 2C000100 */  cmpwi   r0, 0x100
/* 0B7784 800BCD24 41820098 */  beq     lbl_800BCDBC
/* 0B7788 800BCD28 408001BC */  bge     lbl_800BCEE4
/* 0B778C 800BCD2C 2C000000 */  cmpwi   r0, 0
/* 0B7790 800BCD30 41820038 */  beq     lbl_800BCD68
/* 0B7794 800BCD34 480001B0 */  b       lbl_800BCEE4
lbl_800BCD38:
/* 0B7798 800BCD38 2C000300 */  cmpwi   r0, 0x300
/* 0B779C 800BCD3C 41820124 */  beq     lbl_800BCE60
/* 0B77A0 800BCD40 480001A4 */  b       lbl_800BCEE4
lbl_800BCD44:
/* 0B77A4 800BCD44 2C000600 */  cmpwi   r0, 0x600
/* 0B77A8 800BCD48 41820020 */  beq     lbl_800BCD68
/* 0B77AC 800BCD4C 40800010 */  bge     lbl_800BCD5C
/* 0B77B0 800BCD50 2C000500 */  cmpwi   r0, 0x500
/* 0B77B4 800BCD54 41820014 */  beq     lbl_800BCD68
/* 0B77B8 800BCD58 4800018C */  b       lbl_800BCEE4
lbl_800BCD5C:
/* 0B77BC 800BCD5C 2C000700 */  cmpwi   r0, 0x700
/* 0B77C0 800BCD60 41820008 */  beq     lbl_800BCD68
/* 0B77C4 800BCD64 48000180 */  b       lbl_800BCEE4
lbl_800BCD68:
/* 0B77C8 800BCD68 80050004 */  lwz     r0, 4(r5)
/* 0B77CC 800BCD6C 5400463E */  srwi    r0, r0, 0x18
/* 0B77D0 800BCD70 7C000774 */  extsb   r0, r0
/* 0B77D4 800BCD74 98040004 */  stb     r0, 4(r4)
/* 0B77D8 800BCD78 80050004 */  lwz     r0, 4(r5)
/* 0B77DC 800BCD7C 5400843E */  srwi    r0, r0, 0x10
/* 0B77E0 800BCD80 7C000774 */  extsb   r0, r0
/* 0B77E4 800BCD84 98040005 */  stb     r0, 5(r4)
/* 0B77E8 800BCD88 80050004 */  lwz     r0, 4(r5)
/* 0B77EC 800BCD8C 5400C636 */  rlwinm  r0, r0, 0x18, 0x18, 0x1b
/* 0B77F0 800BCD90 98040006 */  stb     r0, 6(r4)
/* 0B77F4 800BCD94 80050004 */  lwz     r0, 4(r5)
/* 0B77F8 800BCD98 5400E636 */  rlwinm  r0, r0, 0x1c, 0x18, 0x1b
/* 0B77FC 800BCD9C 98040007 */  stb     r0, 7(r4)
/* 0B7800 800BCDA0 80050004 */  lwz     r0, 4(r5)
/* 0B7804 800BCDA4 54000636 */  rlwinm  r0, r0, 0, 0x18, 0x1b
/* 0B7808 800BCDA8 98040008 */  stb     r0, 8(r4)
/* 0B780C 800BCDAC 80050004 */  lwz     r0, 4(r5)
/* 0B7810 800BCDB0 54002636 */  rlwinm  r0, r0, 4, 0x18, 0x1b
/* 0B7814 800BCDB4 98040009 */  stb     r0, 9(r4)
/* 0B7818 800BCDB8 4800012C */  b       lbl_800BCEE4
lbl_800BCDBC:
/* 0B781C 800BCDBC 80050004 */  lwz     r0, 4(r5)
/* 0B7820 800BCDC0 54004636 */  rlwinm  r0, r0, 8, 0x18, 0x1b
/* 0B7824 800BCDC4 7C000774 */  extsb   r0, r0
/* 0B7828 800BCDC8 98040004 */  stb     r0, 4(r4)
/* 0B782C 800BCDCC 80050004 */  lwz     r0, 4(r5)
/* 0B7830 800BCDD0 54006636 */  rlwinm  r0, r0, 0xc, 0x18, 0x1b
/* 0B7834 800BCDD4 7C000774 */  extsb   r0, r0
/* 0B7838 800BCDD8 98040005 */  stb     r0, 5(r4)
/* 0B783C 800BCDDC 80050004 */  lwz     r0, 4(r5)
/* 0B7840 800BCDE0 5400863E */  rlwinm  r0, r0, 0x10, 0x18, 0x1f
/* 0B7844 800BCDE4 98040006 */  stb     r0, 6(r4)
/* 0B7848 800BCDE8 80050004 */  lwz     r0, 4(r5)
/* 0B784C 800BCDEC 5400C63E */  rlwinm  r0, r0, 0x18, 0x18, 0x1f
/* 0B7850 800BCDF0 98040007 */  stb     r0, 7(r4)
/* 0B7854 800BCDF4 80050004 */  lwz     r0, 4(r5)
/* 0B7858 800BCDF8 54000636 */  rlwinm  r0, r0, 0, 0x18, 0x1b
/* 0B785C 800BCDFC 98040008 */  stb     r0, 8(r4)
/* 0B7860 800BCE00 80050004 */  lwz     r0, 4(r5)
/* 0B7864 800BCE04 54002636 */  rlwinm  r0, r0, 4, 0x18, 0x1b
/* 0B7868 800BCE08 98040009 */  stb     r0, 9(r4)
/* 0B786C 800BCE0C 480000D8 */  b       lbl_800BCEE4
lbl_800BCE10:
/* 0B7870 800BCE10 80050004 */  lwz     r0, 4(r5)
/* 0B7874 800BCE14 54004636 */  rlwinm  r0, r0, 8, 0x18, 0x1b
/* 0B7878 800BCE18 7C000774 */  extsb   r0, r0
/* 0B787C 800BCE1C 98040004 */  stb     r0, 4(r4)
/* 0B7880 800BCE20 80050004 */  lwz     r0, 4(r5)
/* 0B7884 800BCE24 54006636 */  rlwinm  r0, r0, 0xc, 0x18, 0x1b
/* 0B7888 800BCE28 7C000774 */  extsb   r0, r0
/* 0B788C 800BCE2C 98040005 */  stb     r0, 5(r4)
/* 0B7890 800BCE30 80050004 */  lwz     r0, 4(r5)
/* 0B7894 800BCE34 54008636 */  rlwinm  r0, r0, 0x10, 0x18, 0x1b
/* 0B7898 800BCE38 98040006 */  stb     r0, 6(r4)
/* 0B789C 800BCE3C 80050004 */  lwz     r0, 4(r5)
/* 0B78A0 800BCE40 5400A636 */  rlwinm  r0, r0, 0x14, 0x18, 0x1b
/* 0B78A4 800BCE44 98040007 */  stb     r0, 7(r4)
/* 0B78A8 800BCE48 80050004 */  lwz     r0, 4(r5)
/* 0B78AC 800BCE4C 5400C63E */  rlwinm  r0, r0, 0x18, 0x18, 0x1f
/* 0B78B0 800BCE50 98040008 */  stb     r0, 8(r4)
/* 0B78B4 800BCE54 80050004 */  lwz     r0, 4(r5)
/* 0B78B8 800BCE58 98040009 */  stb     r0, 9(r4)
/* 0B78BC 800BCE5C 48000088 */  b       lbl_800BCEE4
lbl_800BCE60:
/* 0B78C0 800BCE60 80C50004 */  lwz     r6, 4(r5)
/* 0B78C4 800BCE64 38000000 */  li      r0, 0
/* 0B78C8 800BCE68 54C6463E */  srwi    r6, r6, 0x18
/* 0B78CC 800BCE6C 7CC60774 */  extsb   r6, r6
/* 0B78D0 800BCE70 98C40004 */  stb     r6, 4(r4)
/* 0B78D4 800BCE74 80C50004 */  lwz     r6, 4(r5)
/* 0B78D8 800BCE78 54C6843E */  srwi    r6, r6, 0x10
/* 0B78DC 800BCE7C 7CC60774 */  extsb   r6, r6
/* 0B78E0 800BCE80 98C40005 */  stb     r6, 5(r4)
/* 0B78E4 800BCE84 80C50004 */  lwz     r6, 4(r5)
/* 0B78E8 800BCE88 54C6C63E */  rlwinm  r6, r6, 0x18, 0x18, 0x1f
/* 0B78EC 800BCE8C 98C40006 */  stb     r6, 6(r4)
/* 0B78F0 800BCE90 80A50004 */  lwz     r5, 4(r5)
/* 0B78F4 800BCE94 98A40007 */  stb     r5, 7(r4)
/* 0B78F8 800BCE98 98040008 */  stb     r0, 8(r4)
/* 0B78FC 800BCE9C 98040009 */  stb     r0, 9(r4)
/* 0B7900 800BCEA0 48000044 */  b       lbl_800BCEE4
lbl_800BCEA4:
/* 0B7904 800BCEA4 80C50004 */  lwz     r6, 4(r5)
/* 0B7908 800BCEA8 38000000 */  li      r0, 0
/* 0B790C 800BCEAC 54C6463E */  srwi    r6, r6, 0x18
/* 0B7910 800BCEB0 7CC60774 */  extsb   r6, r6
/* 0B7914 800BCEB4 98C40004 */  stb     r6, 4(r4)
/* 0B7918 800BCEB8 80C50004 */  lwz     r6, 4(r5)
/* 0B791C 800BCEBC 54C6843E */  srwi    r6, r6, 0x10
/* 0B7920 800BCEC0 7CC60774 */  extsb   r6, r6
/* 0B7924 800BCEC4 98C40005 */  stb     r6, 5(r4)
/* 0B7928 800BCEC8 98040006 */  stb     r0, 6(r4)
/* 0B792C 800BCECC 98040007 */  stb     r0, 7(r4)
/* 0B7930 800BCED0 80050004 */  lwz     r0, 4(r5)
/* 0B7934 800BCED4 5400C63E */  rlwinm  r0, r0, 0x18, 0x18, 0x1f
/* 0B7938 800BCED8 98040008 */  stb     r0, 8(r4)
/* 0B793C 800BCEDC 80050004 */  lwz     r0, 4(r5)
/* 0B7940 800BCEE0 98040009 */  stb     r0, 9(r4)
lbl_800BCEE4:
/* 0B7944 800BCEE4 88E40002 */  lbz     r7, 2(r4)
/* 0B7948 800BCEE8 3CA08014 */  lis     r5, Type@ha
/* 0B794C 800BCEEC 5466103A */  slwi    r6, r3, 2
/* 0B7950 800BCEF0 3807FF80 */  addi    r0, r7, -128
/* 0B7954 800BCEF4 98040002 */  stb     r0, 2(r4)
/* 0B7958 800BCEF8 38052168 */  addi    r0, r5, Type@l
/* 0B795C 800BCEFC 7CA03214 */  add     r5, r0, r6
/* 0B7960 800BCF00 88C40003 */  lbz     r6, 3(r4)
/* 0B7964 800BCF04 3806FF80 */  addi    r0, r6, -128
/* 0B7968 800BCF08 98040003 */  stb     r0, 3(r4)
/* 0B796C 800BCF0C 88C40004 */  lbz     r6, 4(r4)
/* 0B7970 800BCF10 3806FF80 */  addi    r0, r6, -128
/* 0B7974 800BCF14 98040004 */  stb     r0, 4(r4)
/* 0B7978 800BCF18 88C40005 */  lbz     r6, 5(r4)
/* 0B797C 800BCF1C 3806FF80 */  addi    r0, r6, -128
/* 0B7980 800BCF20 98040005 */  stb     r0, 5(r4)
/* 0B7984 800BCF24 80050000 */  lwz     r0, 0(r5)
/* 0B7988 800BCF28 5405001E */  rlwinm  r5, r0, 0, 0, 0xf
/* 0B798C 800BCF2C 3C05F700 */  addis   r0, r5, 0xf700
/* 0B7990 800BCF30 28000000 */  cmplwi  r0, 0
/* 0B7994 800BCF34 40820044 */  bne     lbl_800BCF78
/* 0B7998 800BCF38 A0040000 */  lhz     r0, 0(r4)
/* 0B799C 800BCF3C 54000630 */  rlwinm  r0, r0, 0, 0x18, 0x18
/* 0B79A0 800BCF40 68000080 */  xori    r0, r0, 0x80
/* 0B79A4 800BCF44 2C000000 */  cmpwi   r0, 0
/* 0B79A8 800BCF48 41820030 */  beq     lbl_800BCF78
/* 0B79AC 800BCF4C 3C008000 */  lis     r0, 0x8000
/* 0B79B0 800BCF50 80AD929C */  lwz     r5, BarrelBits-_SDA_BASE_(r13)
/* 0B79B4 800BCF54 7C001C30 */  srw     r0, r0, r3
/* 0B79B8 800BCF58 7CA00378 */  or      r0, r5, r0
/* 0B79BC 800BCF5C 900D929C */  stw     r0, BarrelBits-_SDA_BASE_(r13)
/* 0B79C0 800BCF60 38000000 */  li      r0, 0
/* 0B79C4 800BCF64 98040002 */  stb     r0, 2(r4)
/* 0B79C8 800BCF68 98040003 */  stb     r0, 3(r4)
/* 0B79CC 800BCF6C 98040004 */  stb     r0, 4(r4)
/* 0B79D0 800BCF70 98040005 */  stb     r0, 5(r4)
/* 0B79D4 800BCF74 4E800020 */  blr     
lbl_800BCF78:
/* 0B79D8 800BCF78 3C008000 */  lis     r0, 0x8000
/* 0B79DC 800BCF7C 80AD929C */  lwz     r5, BarrelBits-_SDA_BASE_(r13)
/* 0B79E0 800BCF80 7C001C30 */  srw     r0, r0, r3
/* 0B79E4 800BCF84 7CA00078 */  andc    r0, r5, r0
/* 0B79E8 800BCF88 900D929C */  stw     r0, BarrelBits-_SDA_BASE_(r13)
/* 0B79EC 800BCF8C 3CA08014 */  lis     r5, Origin@ha
/* 0B79F0 800BCF90 1C63000C */  mulli   r3, r3, 0xc
/* 0B79F4 800BCF94 88C40002 */  lbz     r6, 2(r4)
/* 0B79F8 800BCF98 38052178 */  addi    r0, r5, Origin@l
/* 0B79FC 800BCF9C 7C601A14 */  add     r3, r0, r3
/* 0B7A00 800BCFA0 88E30002 */  lbz     r7, 2(r3)
/* 0B7A04 800BCFA4 7CE00775 */  extsb.  r0, r7
/* 0B7A08 800BCFA8 40810024 */  ble     lbl_800BCFCC
/* 0B7A0C 800BCFAC 7CE50774 */  extsb   r5, r7
/* 0B7A10 800BCFB0 3805FF80 */  addi    r0, r5, -128
/* 0B7A14 800BCFB4 7C050774 */  extsb   r5, r0
/* 0B7A18 800BCFB8 7CC00774 */  extsb   r0, r6
/* 0B7A1C 800BCFBC 7C002800 */  cmpw    r0, r5
/* 0B7A20 800BCFC0 40800030 */  bge     lbl_800BCFF0
/* 0B7A24 800BCFC4 7CA62B78 */  mr      r6, r5
/* 0B7A28 800BCFC8 48000028 */  b       lbl_800BCFF0
lbl_800BCFCC:
/* 0B7A2C 800BCFCC 7CE00775 */  extsb.  r0, r7
/* 0B7A30 800BCFD0 40800020 */  bge     lbl_800BCFF0
/* 0B7A34 800BCFD4 7CE50774 */  extsb   r5, r7
/* 0B7A38 800BCFD8 3805007F */  addi    r0, r5, 0x7f
/* 0B7A3C 800BCFDC 7C050774 */  extsb   r5, r0
/* 0B7A40 800BCFE0 7CC00774 */  extsb   r0, r6
/* 0B7A44 800BCFE4 7C050000 */  cmpw    r5, r0
/* 0B7A48 800BCFE8 40800008 */  bge     lbl_800BCFF0
/* 0B7A4C 800BCFEC 7CA62B78 */  mr      r6, r5
lbl_800BCFF0:
/* 0B7A50 800BCFF0 7CC73050 */  subf    r6, r7, r6
/* 0B7A54 800BCFF4 98C40002 */  stb     r6, 2(r4)
/* 0B7A58 800BCFF8 88E30003 */  lbz     r7, 3(r3)
/* 0B7A5C 800BCFFC 88C40003 */  lbz     r6, 3(r4)
/* 0B7A60 800BD000 7CE00775 */  extsb.  r0, r7
/* 0B7A64 800BD004 40810024 */  ble     lbl_800BD028
/* 0B7A68 800BD008 7CE50774 */  extsb   r5, r7
/* 0B7A6C 800BD00C 3805FF80 */  addi    r0, r5, -128
/* 0B7A70 800BD010 7C050774 */  extsb   r5, r0
/* 0B7A74 800BD014 7CC00774 */  extsb   r0, r6
/* 0B7A78 800BD018 7C002800 */  cmpw    r0, r5
/* 0B7A7C 800BD01C 40800030 */  bge     lbl_800BD04C
/* 0B7A80 800BD020 7CA62B78 */  mr      r6, r5
/* 0B7A84 800BD024 48000028 */  b       lbl_800BD04C
lbl_800BD028:
/* 0B7A88 800BD028 7CE00775 */  extsb.  r0, r7
/* 0B7A8C 800BD02C 40800020 */  bge     lbl_800BD04C
/* 0B7A90 800BD030 7CE50774 */  extsb   r5, r7
/* 0B7A94 800BD034 3805007F */  addi    r0, r5, 0x7f
/* 0B7A98 800BD038 7C050774 */  extsb   r5, r0
/* 0B7A9C 800BD03C 7CC00774 */  extsb   r0, r6
/* 0B7AA0 800BD040 7C050000 */  cmpw    r5, r0
/* 0B7AA4 800BD044 40800008 */  bge     lbl_800BD04C
/* 0B7AA8 800BD048 7CA62B78 */  mr      r6, r5
lbl_800BD04C:
/* 0B7AAC 800BD04C 7CC73050 */  subf    r6, r7, r6
/* 0B7AB0 800BD050 98C40003 */  stb     r6, 3(r4)
/* 0B7AB4 800BD054 88E30004 */  lbz     r7, 4(r3)
/* 0B7AB8 800BD058 88C40004 */  lbz     r6, 4(r4)
/* 0B7ABC 800BD05C 7CE00775 */  extsb.  r0, r7
/* 0B7AC0 800BD060 40810024 */  ble     lbl_800BD084
/* 0B7AC4 800BD064 7CE50774 */  extsb   r5, r7
/* 0B7AC8 800BD068 3805FF80 */  addi    r0, r5, -128
/* 0B7ACC 800BD06C 7C050774 */  extsb   r5, r0
/* 0B7AD0 800BD070 7CC00774 */  extsb   r0, r6
/* 0B7AD4 800BD074 7C002800 */  cmpw    r0, r5
/* 0B7AD8 800BD078 40800030 */  bge     lbl_800BD0A8
/* 0B7ADC 800BD07C 7CA62B78 */  mr      r6, r5
/* 0B7AE0 800BD080 48000028 */  b       lbl_800BD0A8
lbl_800BD084:
/* 0B7AE4 800BD084 7CE00775 */  extsb.  r0, r7
/* 0B7AE8 800BD088 40800020 */  bge     lbl_800BD0A8
/* 0B7AEC 800BD08C 7CE50774 */  extsb   r5, r7
/* 0B7AF0 800BD090 3805007F */  addi    r0, r5, 0x7f
/* 0B7AF4 800BD094 7C050774 */  extsb   r5, r0
/* 0B7AF8 800BD098 7CC00774 */  extsb   r0, r6
/* 0B7AFC 800BD09C 7C050000 */  cmpw    r5, r0
/* 0B7B00 800BD0A0 40800008 */  bge     lbl_800BD0A8
/* 0B7B04 800BD0A4 7CA62B78 */  mr      r6, r5
lbl_800BD0A8:
/* 0B7B08 800BD0A8 7CC73050 */  subf    r6, r7, r6
/* 0B7B0C 800BD0AC 98C40004 */  stb     r6, 4(r4)
/* 0B7B10 800BD0B0 88E30005 */  lbz     r7, 5(r3)
/* 0B7B14 800BD0B4 88C40005 */  lbz     r6, 5(r4)
/* 0B7B18 800BD0B8 7CE00775 */  extsb.  r0, r7
/* 0B7B1C 800BD0BC 40810024 */  ble     lbl_800BD0E0
/* 0B7B20 800BD0C0 7CE50774 */  extsb   r5, r7
/* 0B7B24 800BD0C4 3805FF80 */  addi    r0, r5, -128
/* 0B7B28 800BD0C8 7C050774 */  extsb   r5, r0
/* 0B7B2C 800BD0CC 7CC00774 */  extsb   r0, r6
/* 0B7B30 800BD0D0 7C002800 */  cmpw    r0, r5
/* 0B7B34 800BD0D4 40800030 */  bge     lbl_800BD104
/* 0B7B38 800BD0D8 7CA62B78 */  mr      r6, r5
/* 0B7B3C 800BD0DC 48000028 */  b       lbl_800BD104
lbl_800BD0E0:
/* 0B7B40 800BD0E0 7CE00775 */  extsb.  r0, r7
/* 0B7B44 800BD0E4 40800020 */  bge     lbl_800BD104
/* 0B7B48 800BD0E8 7CE50774 */  extsb   r5, r7
/* 0B7B4C 800BD0EC 3805007F */  addi    r0, r5, 0x7f
/* 0B7B50 800BD0F0 7C050774 */  extsb   r5, r0
/* 0B7B54 800BD0F4 7CC00774 */  extsb   r0, r6
/* 0B7B58 800BD0F8 7C050000 */  cmpw    r5, r0
/* 0B7B5C 800BD0FC 40800008 */  bge     lbl_800BD104
/* 0B7B60 800BD100 7CA62B78 */  mr      r6, r5
lbl_800BD104:
/* 0B7B64 800BD104 7CC73050 */  subf    r6, r7, r6
/* 0B7B68 800BD108 98C40005 */  stb     r6, 5(r4)
/* 0B7B6C 800BD10C 88030006 */  lbz     r0, 6(r3)
/* 0B7B70 800BD110 88A40006 */  lbz     r5, 6(r4)
/* 0B7B74 800BD114 7C050040 */  cmplw   r5, r0
/* 0B7B78 800BD118 40800008 */  bge     lbl_800BD120
/* 0B7B7C 800BD11C 7C050378 */  mr      r5, r0
lbl_800BD120:
/* 0B7B80 800BD120 7CA02850 */  subf    r5, r0, r5
/* 0B7B84 800BD124 98A40006 */  stb     r5, 6(r4)
/* 0B7B88 800BD128 88030007 */  lbz     r0, 7(r3)
/* 0B7B8C 800BD12C 88640007 */  lbz     r3, 7(r4)
/* 0B7B90 800BD130 7C030040 */  cmplw   r3, r0
/* 0B7B94 800BD134 40800008 */  bge     lbl_800BD13C
/* 0B7B98 800BD138 7C030378 */  mr      r3, r0
lbl_800BD13C:
/* 0B7B9C 800BD13C 7C601850 */  subf    r3, r0, r3
/* 0B7BA0 800BD140 98640007 */  stb     r3, 7(r4)
/* 0B7BA4 800BD144 4E800020 */  blr     

OnReset:
/* 0B7BA8 800BD148 7C0802A6 */  mflr    r0
/* 0B7BAC 800BD14C 90010004 */  stw     r0, 4(r1)
/* 0B7BB0 800BD150 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0B7BB4 800BD154 93E1001C */  stw     r31, 0x1c(r1)
/* 0B7BB8 800BD158 3BE30000 */  addi    r31, r3, 0
/* 0B7BBC 800BD15C 800D92A0 */  lwz     r0, SamplingCallback-_SDA_BASE_(r13)
/* 0B7BC0 800BD160 28000000 */  cmplwi  r0, 0
/* 0B7BC4 800BD164 4182000C */  beq     lbl_800BD170
/* 0B7BC8 800BD168 38600000 */  li      r3, 0
/* 0B7BCC 800BD16C 480000F9 */  bl      PADSetSamplingCallback
lbl_800BD170:
/* 0B7BD0 800BD170 2C1F0000 */  cmpwi   r31, 0
/* 0B7BD4 800BD174 40820070 */  bne     lbl_800BD1E4
/* 0B7BD8 800BD178 800D9288 */  lwz     r0, ResettingBits-_SDA_BASE_(r13)
/* 0B7BDC 800BD17C 3BE00000 */  li      r31, 0
/* 0B7BE0 800BD180 387F0000 */  addi    r3, r31, 0
/* 0B7BE4 800BD184 28000000 */  cmplwi  r0, 0
/* 0B7BE8 800BD188 40820014 */  bne     lbl_800BD19C
/* 0B7BEC 800BD18C 800D8DAC */  lwz     r0, ResettingChan-_SDA_BASE_(r13)
/* 0B7BF0 800BD190 2C000020 */  cmpwi   r0, 0x20
/* 0B7BF4 800BD194 40820008 */  bne     lbl_800BD19C
/* 0B7BF8 800BD198 38600001 */  li      r3, 1
lbl_800BD19C:
/* 0B7BFC 800BD19C 2C030000 */  cmpwi   r3, 0
/* 0B7C00 800BD1A0 41820014 */  beq     lbl_800BD1B4
/* 0B7C04 800BD1A4 4BFF2FED */  bl      SIBusy
/* 0B7C08 800BD1A8 2C030000 */  cmpwi   r3, 0
/* 0B7C0C 800BD1AC 40820008 */  bne     lbl_800BD1B4
/* 0B7C10 800BD1B0 3BE00001 */  li      r31, 1
lbl_800BD1B4:
/* 0B7C14 800BD1B4 800D92A4 */  lwz     r0, recalibrated$388-_SDA_BASE_(r13)
/* 0B7C18 800BD1B8 2C000000 */  cmpwi   r0, 0
/* 0B7C1C 800BD1BC 40820020 */  bne     lbl_800BD1DC
/* 0B7C20 800BD1C0 2C1F0000 */  cmpwi   r31, 0
/* 0B7C24 800BD1C4 41820018 */  beq     lbl_800BD1DC
/* 0B7C28 800BD1C8 3C60F000 */  lis     r3, 0xf000
/* 0B7C2C 800BD1CC 4BFFF1A9 */  bl      PADRecalibrate
/* 0B7C30 800BD1D0 906D92A4 */  stw     r3, recalibrated$388-_SDA_BASE_(r13)
/* 0B7C34 800BD1D4 38600000 */  li      r3, 0
/* 0B7C38 800BD1D8 48000018 */  b       lbl_800BD1F0
lbl_800BD1DC:
/* 0B7C3C 800BD1DC 7FE3FB78 */  mr      r3, r31
/* 0B7C40 800BD1E0 48000010 */  b       lbl_800BD1F0
lbl_800BD1E4:
/* 0B7C44 800BD1E4 38000000 */  li      r0, 0
/* 0B7C48 800BD1E8 900D92A4 */  stw     r0, recalibrated$388-_SDA_BASE_(r13)
/* 0B7C4C 800BD1EC 38600001 */  li      r3, 1
lbl_800BD1F0:
/* 0B7C50 800BD1F0 80010024 */  lwz     r0, 0x24(r1)
/* 0B7C54 800BD1F4 83E1001C */  lwz     r31, 0x1c(r1)
/* 0B7C58 800BD1F8 38210020 */  addi    r1, r1, 0x20
/* 0B7C5C 800BD1FC 7C0803A6 */  mtlr    r0
/* 0B7C60 800BD200 4E800020 */  blr     

SamplingHandler:
/* 0B7C64 800BD204 7C0802A6 */  mflr    r0
/* 0B7C68 800BD208 90010004 */  stw     r0, 4(r1)
/* 0B7C6C 800BD20C 9421FD20 */  stwu    r1, -0x2e0(r1)
/* 0B7C70 800BD210 93E102DC */  stw     r31, 0x2dc(r1)
/* 0B7C74 800BD214 3BE40000 */  addi    r31, r4, 0
/* 0B7C78 800BD218 800D92A0 */  lwz     r0, SamplingCallback-_SDA_BASE_(r13)
/* 0B7C7C 800BD21C 28000000 */  cmplwi  r0, 0
/* 0B7C80 800BD220 41820030 */  beq     lbl_800BD250
/* 0B7C84 800BD224 38610010 */  addi    r3, r1, 0x10
/* 0B7C88 800BD228 4BFEC9F1 */  bl      OSClearContext
/* 0B7C8C 800BD22C 38610010 */  addi    r3, r1, 0x10
/* 0B7C90 800BD230 4BFEC821 */  bl      OSSetCurrentContext
/* 0B7C94 800BD234 818D92A0 */  lwz     r12, SamplingCallback-_SDA_BASE_(r13)
/* 0B7C98 800BD238 7D8803A6 */  mtlr    r12
/* 0B7C9C 800BD23C 4E800021 */  blrl    
/* 0B7CA0 800BD240 38610010 */  addi    r3, r1, 0x10
/* 0B7CA4 800BD244 4BFEC9D5 */  bl      OSClearContext
/* 0B7CA8 800BD248 7FE3FB78 */  mr      r3, r31
/* 0B7CAC 800BD24C 4BFEC805 */  bl      OSSetCurrentContext
lbl_800BD250:
/* 0B7CB0 800BD250 800102E4 */  lwz     r0, 0x2e4(r1)
/* 0B7CB4 800BD254 83E102DC */  lwz     r31, 0x2dc(r1)
/* 0B7CB8 800BD258 382102E0 */  addi    r1, r1, 0x2e0
/* 0B7CBC 800BD25C 7C0803A6 */  mtlr    r0
/* 0B7CC0 800BD260 4E800020 */  blr     

glabel PADSetSamplingCallback
/* 0B7CC4 800BD264 7C0802A6 */  mflr    r0
/* 0B7CC8 800BD268 28030000 */  cmplwi  r3, 0
/* 0B7CCC 800BD26C 90010004 */  stw     r0, 4(r1)
/* 0B7CD0 800BD270 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B7CD4 800BD274 93E10014 */  stw     r31, 0x14(r1)
/* 0B7CD8 800BD278 83ED92A0 */  lwz     r31, SamplingCallback-_SDA_BASE_(r13)
/* 0B7CDC 800BD27C 906D92A0 */  stw     r3, SamplingCallback-_SDA_BASE_(r13)
/* 0B7CE0 800BD280 41820014 */  beq     lbl_800BD294
/* 0B7CE4 800BD284 3C60800C */  lis     r3, SamplingHandler@ha
/* 0B7CE8 800BD288 3863D204 */  addi    r3, r3, SamplingHandler@l
/* 0B7CEC 800BD28C 4BFF3639 */  bl      SIRegisterPollingHandler
/* 0B7CF0 800BD290 48000010 */  b       lbl_800BD2A0
lbl_800BD294:
/* 0B7CF4 800BD294 3C60800C */  lis     r3, SamplingHandler@ha
/* 0B7CF8 800BD298 3863D204 */  addi    r3, r3, SamplingHandler@l
/* 0B7CFC 800BD29C 4BFF36F5 */  bl      SIUnregisterPollingHandler
lbl_800BD2A0:
/* 0B7D00 800BD2A0 7FE3FB78 */  mr      r3, r31
/* 0B7D04 800BD2A4 8001001C */  lwz     r0, 0x1c(r1)
/* 0B7D08 800BD2A8 83E10014 */  lwz     r31, 0x14(r1)
/* 0B7D0C 800BD2AC 38210018 */  addi    r1, r1, 0x18
/* 0B7D10 800BD2B0 7C0803A6 */  mtlr    r0
/* 0B7D14 800BD2B4 4E800020 */  blr     

glabel __PADDisableRecalibration
/* 0B7D18 800BD2B8 7C0802A6 */  mflr    r0
/* 0B7D1C 800BD2BC 90010004 */  stw     r0, 4(r1)
/* 0B7D20 800BD2C0 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B7D24 800BD2C4 93E10014 */  stw     r31, 0x14(r1)
/* 0B7D28 800BD2C8 93C10010 */  stw     r30, 0x10(r1)
/* 0B7D2C 800BD2CC 7C7E1B78 */  mr      r30, r3
/* 0B7D30 800BD2D0 4BFED4A1 */  bl      OSDisableInterrupts
/* 0B7D34 800BD2D4 3C808000 */  lis     r4, 0x8000
/* 0B7D38 800BD2D8 880430E3 */  lbz     r0, 0x30e3(r4)
/* 0B7D3C 800BD2DC 54000673 */  rlwinm. r0, r0, 0, 0x19, 0x19
/* 0B7D40 800BD2E0 4182000C */  beq     lbl_800BD2EC
/* 0B7D44 800BD2E4 3BE00001 */  li      r31, 1
/* 0B7D48 800BD2E8 48000008 */  b       lbl_800BD2F0
lbl_800BD2EC:
/* 0B7D4C 800BD2EC 3BE00000 */  li      r31, 0
lbl_800BD2F0:
/* 0B7D50 800BD2F0 3C808000 */  lis     r4, 0x8000
/* 0B7D54 800BD2F4 880430E3 */  lbz     r0, 0x30e3(r4)
/* 0B7D58 800BD2F8 2C1E0000 */  cmpwi   r30, 0
/* 0B7D5C 800BD2FC 540006B0 */  rlwinm  r0, r0, 0, 0x1a, 0x18
/* 0B7D60 800BD300 980430E3 */  stb     r0, 0x30e3(r4)
/* 0B7D64 800BD304 41820010 */  beq     lbl_800BD314
/* 0B7D68 800BD308 880430E3 */  lbz     r0, 0x30e3(r4)
/* 0B7D6C 800BD30C 60000040 */  ori     r0, r0, 0x40
/* 0B7D70 800BD310 980430E3 */  stb     r0, 0x30e3(r4)
lbl_800BD314:
/* 0B7D74 800BD314 4BFED485 */  bl      OSRestoreInterrupts
/* 0B7D78 800BD318 7FE3FB78 */  mr      r3, r31
/* 0B7D7C 800BD31C 8001001C */  lwz     r0, 0x1c(r1)
/* 0B7D80 800BD320 83E10014 */  lwz     r31, 0x14(r1)
/* 0B7D84 800BD324 83C10010 */  lwz     r30, 0x10(r1)
/* 0B7D88 800BD328 38210018 */  addi    r1, r1, 0x18
/* 0B7D8C 800BD32C 7C0803A6 */  mtlr    r0
/* 0B7D90 800BD330 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FD380 80100300 0045 */
D_80100300:
    .asciz "<< Dolphin SDK - PAD\trelease build: Aug  6 2003 04:30:02 (0x2301) >>"

.balign 4

/* 000FD3C8 80100348 0010 */
ResetFunctionInfo:
    .long OnReset, 0x0000007F, 0x00000000, 0x00000000


.section .bss, "wa"

.balign 4

/* 0013F1E8 80142168 0010 */
Type:
    .skip 16

.balign 4

/* 0013F1F8 80142178 0030 */
Origin:
    .skip 48

.balign 4

/* 0013F228 801421A8 0010 */
CmdProbeDevice:
    .skip 16


.section .sdata, "wa"

.balign 8

/* 000FFFE8 80145788 0004 */
glabel __PADVersion
    .long D_80100300

.balign 4

/* 000FFFEC 8014578C 0004 */
ResettingChan:
    .long 0x00000020

.balign 4

/* 000FFFF0 80145790 0004 */
XPatchBits:
    .long 0xF0000000

.balign 4

/* 000FFFF4 80145794 0004 */
AnalogMode:
    .long 0x00000300

.balign 4

/* 000FFFF8 80145798 0004 */
Spec:
    .long 0x00000005

.balign 4

/* 000FFFFC 8014579C 0004 */
MakeStatus:
    .long SPEC2_MakeStatus

.balign 4

/* 00100000 801457A0 0004 */
CmdReadOrigin:
    .long 0x41000000

.balign 4

/* 00100004 801457A4 0004 */
CmdCalibrate:
    .long 0x42000000


.section .sbss, "wa"

.balign 8

/* 001004C0 80145C60 0004 */
Initialized:
    .skip 4

.balign 4

/* 001004C4 80145C64 0004 */
EnabledBits:
    .skip 4

.balign 4

/* 001004C8 80145C68 0004 */
ResettingBits:
    .skip 4

.balign 4

/* 001004CC 80145C6C 0004 */
RecalibrateBits:
    .skip 4

.balign 4

/* 001004D0 80145C70 0004 */
WaitingBits:
    .skip 4

.balign 4

/* 001004D4 80145C74 0004 */
CheckingBits:
    .skip 4

.balign 4

/* 001004D8 80145C78 0004 */
PendingBits:
    .skip 4

.balign 4

/* 001004DC 80145C7C 0004 */
BarrelBits:
    .skip 4

.balign 4

/* 001004E0 80145C80 0004 */
SamplingCallback:
    .skip 4

.balign 4

/* 001004E4 80145C84 0004 */
recalibrated$388:
    .skip 4

.balign 4

/* 001004E8 80145C88 0004 */
glabel __PADSpec
    .skip 4


