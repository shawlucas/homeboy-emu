# audio.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel audioEvent
/* 0934B0 80098A50 7C0802A6 */  mflr    r0
/* 0934B4 80098A54 2C040003 */  cmpwi   r4, 3
/* 0934B8 80098A58 90010004 */  stw     r0, 4(r1)
/* 0934BC 80098A5C 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0934C0 80098A60 93E1001C */  stw     r31, 0x1c(r1)
/* 0934C4 80098A64 3BE50000 */  addi    r31, r5, 0
/* 0934C8 80098A68 93C10018 */  stw     r30, 0x18(r1)
/* 0934CC 80098A6C 3BC30000 */  addi    r30, r3, 0
/* 0934D0 80098A70 418200E4 */  beq     lbl_80098B54
/* 0934D4 80098A74 40800018 */  bge     lbl_80098A8C
/* 0934D8 80098A78 2C040002 */  cmpwi   r4, 2
/* 0934DC 80098A7C 40800028 */  bge     lbl_80098AA4
/* 0934E0 80098A80 2C040000 */  cmpwi   r4, 0
/* 0934E4 80098A84 408000D0 */  bge     lbl_80098B54
/* 0934E8 80098A88 480000C4 */  b       lbl_80098B4C
lbl_80098A8C:
/* 0934EC 80098A8C 2C041003 */  cmpwi   r4, 0x1003
/* 0934F0 80098A90 418200C4 */  beq     lbl_80098B54
/* 0934F4 80098A94 408000B8 */  bge     lbl_80098B4C
/* 0934F8 80098A98 2C041002 */  cmpwi   r4, 0x1002
/* 0934FC 80098A9C 40800030 */  bge     lbl_80098ACC
/* 093500 80098AA0 480000AC */  b       lbl_80098B4C
lbl_80098AA4:
/* 093504 80098AA4 38600000 */  li      r3, 0
/* 093508 80098AA8 907E0000 */  stw     r3, 0(r30)
/* 09350C 80098AAC 38000001 */  li      r0, 1
/* 093510 80098AB0 901E000C */  stw     r0, 0xc(r30)
/* 093514 80098AB4 907E0010 */  stw     r3, 0x10(r30)
/* 093518 80098AB8 907E0014 */  stw     r3, 0x14(r30)
/* 09351C 80098ABC 907E0018 */  stw     r3, 0x18(r30)
/* 093520 80098AC0 93FE0008 */  stw     r31, 8(r30)
/* 093524 80098AC4 901E0004 */  stw     r0, 4(r30)
/* 093528 80098AC8 4800008C */  b       lbl_80098B54
lbl_80098ACC:
/* 09352C 80098ACC 807E0008 */  lwz     r3, 8(r30)
/* 093530 80098AD0 3CA0800A */  lis     r5, audioPut8@ha
/* 093534 80098AD4 3CC0800A */  lis     r6, audioPut16@ha
/* 093538 80098AD8 3CE0800A */  lis     r7, audioPut32@ha
/* 09353C 80098ADC 80630024 */  lwz     r3, 0x24(r3)
/* 093540 80098AE0 3C80800A */  lis     r4, audioPut64@ha
/* 093544 80098AE4 39048CE8 */  addi    r8, r4, audioPut64@l
/* 093548 80098AE8 38A58E40 */  addi    r5, r5, audioPut8@l
/* 09354C 80098AEC 38C68E38 */  addi    r6, r6, audioPut16@l
/* 093550 80098AF0 38E78CF0 */  addi    r7, r7, audioPut32@l
/* 093554 80098AF4 389F0000 */  addi    r4, r31, 0
/* 093558 80098AF8 4BF9C429 */  bl      cpuSetDevicePut
/* 09355C 80098AFC 2C030000 */  cmpwi   r3, 0
/* 093560 80098B00 4082000C */  bne     lbl_80098B0C
/* 093564 80098B04 38600000 */  li      r3, 0
/* 093568 80098B08 48000050 */  b       lbl_80098B58
lbl_80098B0C:
/* 09356C 80098B0C 807E0008 */  lwz     r3, 8(r30)
/* 093570 80098B10 3CA0800A */  lis     r5, audioGet8@ha
/* 093574 80098B14 3CC0800A */  lis     r6, audioGet16@ha
/* 093578 80098B18 3CE0800A */  lis     r7, audioGet32@ha
/* 09357C 80098B1C 80630024 */  lwz     r3, 0x24(r3)
/* 093580 80098B20 3C80800A */  lis     r4, audioGet64@ha
/* 093584 80098B24 39048BC8 */  addi    r8, r4, audioGet64@l
/* 093588 80098B28 38A58CE0 */  addi    r5, r5, audioGet8@l
/* 09358C 80098B2C 38C68CD8 */  addi    r6, r6, audioGet16@l
/* 093590 80098B30 38E78BD0 */  addi    r7, r7, audioGet32@l
/* 093594 80098B34 389F0000 */  addi    r4, r31, 0
/* 093598 80098B38 4BF9C401 */  bl      cpuSetDeviceGet
/* 09359C 80098B3C 2C030000 */  cmpwi   r3, 0
/* 0935A0 80098B40 40820014 */  bne     lbl_80098B54
/* 0935A4 80098B44 38600000 */  li      r3, 0
/* 0935A8 80098B48 48000010 */  b       lbl_80098B58
lbl_80098B4C:
/* 0935AC 80098B4C 38600000 */  li      r3, 0
/* 0935B0 80098B50 48000008 */  b       lbl_80098B58
lbl_80098B54:
/* 0935B4 80098B54 38600001 */  li      r3, 1
lbl_80098B58:
/* 0935B8 80098B58 80010024 */  lwz     r0, 0x24(r1)
/* 0935BC 80098B5C 83E1001C */  lwz     r31, 0x1c(r1)
/* 0935C0 80098B60 83C10018 */  lwz     r30, 0x18(r1)
/* 0935C4 80098B64 7C0803A6 */  mtlr    r0
/* 0935C8 80098B68 38210020 */  addi    r1, r1, 0x20
/* 0935CC 80098B6C 4E800020 */  blr     

glabel audioEnable
/* 0935D0 80098B70 7C0802A6 */  mflr    r0
/* 0935D4 80098B74 2C040000 */  cmpwi   r4, 0
/* 0935D8 80098B78 90010004 */  stw     r0, 4(r1)
/* 0935DC 80098B7C 9421FFF8 */  stwu    r1, -8(r1)
/* 0935E0 80098B80 4182000C */  beq     lbl_80098B8C
/* 0935E4 80098B84 38000001 */  li      r0, 1
/* 0935E8 80098B88 48000008 */  b       lbl_80098B90
lbl_80098B8C:
/* 0935EC 80098B8C 38000000 */  li      r0, 0
lbl_80098B90:
/* 0935F0 80098B90 90030004 */  stw     r0, 4(r3)
/* 0935F4 80098B94 80A30008 */  lwz     r5, 8(r3)
/* 0935F8 80098B98 80830004 */  lwz     r4, 4(r3)
/* 0935FC 80098B9C 80650034 */  lwz     r3, 0x34(r5)
/* 093600 80098BA0 4BFE37F5 */  bl      rspEnableABI
/* 093604 80098BA4 2C030000 */  cmpwi   r3, 0
/* 093608 80098BA8 4082000C */  bne     lbl_80098BB4
/* 09360C 80098BAC 38600000 */  li      r3, 0
/* 093610 80098BB0 48000008 */  b       lbl_80098BB8
lbl_80098BB4:
/* 093614 80098BB4 38600001 */  li      r3, 1
lbl_80098BB8:
/* 093618 80098BB8 8001000C */  lwz     r0, 0xc(r1)
/* 09361C 80098BBC 38210008 */  addi    r1, r1, 8
/* 093620 80098BC0 7C0803A6 */  mtlr    r0
/* 093624 80098BC4 4E800020 */  blr     

glabel audioGet64
/* 093628 80098BC8 38600000 */  li      r3, 0
/* 09362C 80098BCC 4E800020 */  blr     

glabel audioGet32
/* 093630 80098BD0 7C0802A6 */  mflr    r0
/* 093634 80098BD4 90010004 */  stw     r0, 4(r1)
/* 093638 80098BD8 548006FE */  clrlwi  r0, r4, 0x1b
/* 09363C 80098BDC 28000014 */  cmplwi  r0, 0x14
/* 093640 80098BE0 9421FFE0 */  stwu    r1, -0x20(r1)
/* 093644 80098BE4 93E1001C */  stw     r31, 0x1c(r1)
/* 093648 80098BE8 3BE50000 */  addi    r31, r5, 0
/* 09364C 80098BEC 93C10018 */  stw     r30, 0x18(r1)
/* 093650 80098BF0 3BC30000 */  addi    r30, r3, 0
/* 093654 80098BF4 418100C0 */  bgt     lbl_80098CB4
/* 093658 80098BF8 3C608010 */  lis     r3, jtbl_800FC0BC@ha
/* 09365C 80098BFC 3863C0BC */  addi    r3, r3, jtbl_800FC0BC@l
/* 093660 80098C00 5400103A */  slwi    r0, r0, 2
/* 093664 80098C04 7C03002E */  lwzx    r0, r3, r0
/* 093668 80098C08 7C0903A6 */  mtctr   r0
/* 09366C 80098C0C 4E800420 */  bctr    
glabel lbl_80098C10
/* 093670 80098C10 801E0010 */  lwz     r0, 0x10(r30)
/* 093674 80098C14 3C608010 */  lis     r3, D_800FC080@ha
/* 093678 80098C18 3863C080 */  addi    r3, r3, D_800FC080@l
/* 09367C 80098C1C 4CC63182 */  crclr   6
/* 093680 80098C20 901F0000 */  stw     r0, 0(r31)
/* 093684 80098C24 388D8BE0 */  addi    r4, r13, D_801455C0-_SDA_BASE_
/* 093688 80098C28 38A000DA */  li      r5, 0xda
/* 09368C 80098C2C 4BF6D101 */  bl      xlPostText
/* 093690 80098C30 4800008C */  b       lbl_80098CBC
glabel lbl_80098C34
/* 093694 80098C34 807E0008 */  lwz     r3, 8(r30)
/* 093698 80098C38 7FE4FB78 */  mr      r4, r31
/* 09369C 80098C3C 80630004 */  lwz     r3, 4(r3)
/* 0936A0 80098C40 4BF84751 */  bl      soundGetDMABuffer
/* 0936A4 80098C44 2C030000 */  cmpwi   r3, 0
/* 0936A8 80098C48 40820074 */  bne     lbl_80098CBC
/* 0936AC 80098C4C 801E0000 */  lwz     r0, 0(r30)
/* 0936B0 80098C50 901F0000 */  stw     r0, 0(r31)
/* 0936B4 80098C54 48000068 */  b       lbl_80098CBC
glabel lbl_80098C58
/* 0936B8 80098C58 801E000C */  lwz     r0, 0xc(r30)
/* 0936BC 80098C5C 3C608010 */  lis     r3, D_800FC0A0@ha
/* 0936C0 80098C60 3863C0A0 */  addi    r3, r3, D_800FC0A0@l
/* 0936C4 80098C64 4CC63182 */  crclr   6
/* 0936C8 80098C68 901F0000 */  stw     r0, 0(r31)
/* 0936CC 80098C6C 388D8BE0 */  addi    r4, r13, D_801455C0-_SDA_BASE_
/* 0936D0 80098C70 38A000E4 */  li      r5, 0xe4
/* 0936D4 80098C74 4BF6D0B9 */  bl      xlPostText
/* 0936D8 80098C78 48000044 */  b       lbl_80098CBC
glabel lbl_80098C7C
/* 0936DC 80098C7C 4802B5A1 */  bl      AIGetDMABytesLeft
/* 0936E0 80098C80 28030000 */  cmplwi  r3, 0
/* 0936E4 80098C84 4182000C */  beq     lbl_80098C90
/* 0936E8 80098C88 3C004000 */  lis     r0, 0x4000
/* 0936EC 80098C8C 48000008 */  b       lbl_80098C94
lbl_80098C90:
/* 0936F0 80098C90 38000000 */  li      r0, 0
lbl_80098C94:
/* 0936F4 80098C94 901F0000 */  stw     r0, 0(r31)
/* 0936F8 80098C98 48000024 */  b       lbl_80098CBC
glabel lbl_80098C9C
/* 0936FC 80098C9C 801E0018 */  lwz     r0, 0x18(r30)
/* 093700 80098CA0 901F0000 */  stw     r0, 0(r31)
/* 093704 80098CA4 48000018 */  b       lbl_80098CBC
glabel lbl_80098CA8
/* 093708 80098CA8 801E0014 */  lwz     r0, 0x14(r30)
/* 09370C 80098CAC 901F0000 */  stw     r0, 0(r31)
/* 093710 80098CB0 4800000C */  b       lbl_80098CBC
glabel lbl_80098CB4
/* 093714 80098CB4 38600000 */  li      r3, 0
/* 093718 80098CB8 48000008 */  b       lbl_80098CC0
lbl_80098CBC:
/* 09371C 80098CBC 38600001 */  li      r3, 1
lbl_80098CC0:
/* 093720 80098CC0 80010024 */  lwz     r0, 0x24(r1)
/* 093724 80098CC4 83E1001C */  lwz     r31, 0x1c(r1)
/* 093728 80098CC8 83C10018 */  lwz     r30, 0x18(r1)
/* 09372C 80098CCC 7C0803A6 */  mtlr    r0
/* 093730 80098CD0 38210020 */  addi    r1, r1, 0x20
/* 093734 80098CD4 4E800020 */  blr     

glabel audioGet16
/* 093738 80098CD8 38600000 */  li      r3, 0
/* 09373C 80098CDC 4E800020 */  blr     

glabel audioGet8
/* 093740 80098CE0 38600000 */  li      r3, 0
/* 093744 80098CE4 4E800020 */  blr     

glabel audioPut64
/* 093748 80098CE8 38600000 */  li      r3, 0
/* 09374C 80098CEC 4E800020 */  blr     

glabel audioPut32
/* 093750 80098CF0 7C0802A6 */  mflr    r0
/* 093754 80098CF4 90010004 */  stw     r0, 4(r1)
/* 093758 80098CF8 548006FE */  clrlwi  r0, r4, 0x1b
/* 09375C 80098CFC 28000014 */  cmplwi  r0, 0x14
/* 093760 80098D00 9421FFE0 */  stwu    r1, -0x20(r1)
/* 093764 80098D04 93E1001C */  stw     r31, 0x1c(r1)
/* 093768 80098D08 3BE30000 */  addi    r31, r3, 0
/* 09376C 80098D0C 4181010C */  bgt     lbl_80098E18
/* 093770 80098D10 3C608010 */  lis     r3, jtbl_800FC110@ha
/* 093774 80098D14 3863C110 */  addi    r3, r3, jtbl_800FC110@l
/* 093778 80098D18 5400103A */  slwi    r0, r0, 2
/* 09377C 80098D1C 7C03002E */  lwzx    r0, r3, r0
/* 093780 80098D20 7C0903A6 */  mtctr   r0
/* 093784 80098D24 4E800420 */  bctr    
glabel lbl_80098D28
/* 093788 80098D28 80050000 */  lwz     r0, 0(r5)
/* 09378C 80098D2C 5400023F */  clrlwi. r0, r0, 8
/* 093790 80098D30 901F0010 */  stw     r0, 0x10(r31)
/* 093794 80098D34 418200EC */  beq     lbl_80098E20
/* 093798 80098D38 807F0008 */  lwz     r3, 8(r31)
/* 09379C 80098D3C 38810014 */  addi    r4, r1, 0x14
/* 0937A0 80098D40 80BF0010 */  lwz     r5, 0x10(r31)
/* 0937A4 80098D44 38C00000 */  li      r6, 0
/* 0937A8 80098D48 8063002C */  lwz     r3, 0x2c(r3)
/* 0937AC 80098D4C 4BFD9589 */  bl      ramGetBuffer
/* 0937B0 80098D50 2C030000 */  cmpwi   r3, 0
/* 0937B4 80098D54 4082000C */  bne     lbl_80098D60
/* 0937B8 80098D58 38600000 */  li      r3, 0
/* 0937BC 80098D5C 480000C8 */  b       lbl_80098E24
lbl_80098D60:
/* 0937C0 80098D60 801F0004 */  lwz     r0, 4(r31)
/* 0937C4 80098D64 2C000000 */  cmpwi   r0, 0
/* 0937C8 80098D68 418200B8 */  beq     lbl_80098E20
/* 0937CC 80098D6C 807F0008 */  lwz     r3, 8(r31)
/* 0937D0 80098D70 80810014 */  lwz     r4, 0x14(r1)
/* 0937D4 80098D74 80630004 */  lwz     r3, 4(r3)
/* 0937D8 80098D78 4BF8464D */  bl      soundSetAddress
/* 0937DC 80098D7C 480000A4 */  b       lbl_80098E20
glabel lbl_80098D80
/* 0937E0 80098D80 80050000 */  lwz     r0, 0(r5)
/* 0937E4 80098D84 540003B8 */  rlwinm  r0, r0, 0, 0xe, 0x1c
/* 0937E8 80098D88 901F0000 */  stw     r0, 0(r31)
/* 0937EC 80098D8C 801F000C */  lwz     r0, 0xc(r31)
/* 0937F0 80098D90 2C000000 */  cmpwi   r0, 0
/* 0937F4 80098D94 4182008C */  beq     lbl_80098E20
/* 0937F8 80098D98 801F0004 */  lwz     r0, 4(r31)
/* 0937FC 80098D9C 2C000000 */  cmpwi   r0, 0
/* 093800 80098DA0 41820080 */  beq     lbl_80098E20
/* 093804 80098DA4 807F0008 */  lwz     r3, 8(r31)
/* 093808 80098DA8 809F0000 */  lwz     r4, 0(r31)
/* 09380C 80098DAC 80630004 */  lwz     r3, 4(r3)
/* 093810 80098DB0 4BF84641 */  bl      soundSetLength
/* 093814 80098DB4 4800006C */  b       lbl_80098E20
glabel lbl_80098DB8
/* 093818 80098DB8 80050000 */  lwz     r0, 0(r5)
/* 09381C 80098DBC 540007FE */  clrlwi  r0, r0, 0x1f
/* 093820 80098DC0 901F000C */  stw     r0, 0xc(r31)
/* 093824 80098DC4 4800005C */  b       lbl_80098E20
glabel lbl_80098DC8
/* 093828 80098DC8 807F0008 */  lwz     r3, 8(r31)
/* 09382C 80098DCC 38801001 */  li      r4, 0x1001
/* 093830 80098DD0 38A00007 */  li      r5, 7
/* 093834 80098DD4 4BF6F481 */  bl      xlObjectEvent
/* 093838 80098DD8 48000048 */  b       lbl_80098E20
glabel lbl_80098DDC
/* 09383C 80098DDC 80050000 */  lwz     r0, 0(r5)
/* 093840 80098DE0 540004BE */  clrlwi  r0, r0, 0x12
/* 093844 80098DE4 901F0018 */  stw     r0, 0x18(r31)
/* 093848 80098DE8 801F0004 */  lwz     r0, 4(r31)
/* 09384C 80098DEC 2C000000 */  cmpwi   r0, 0
/* 093850 80098DF0 41820030 */  beq     lbl_80098E20
/* 093854 80098DF4 807F0008 */  lwz     r3, 8(r31)
/* 093858 80098DF8 809F0018 */  lwz     r4, 0x18(r31)
/* 09385C 80098DFC 80630004 */  lwz     r3, 4(r3)
/* 093860 80098E00 4BF845D1 */  bl      soundSetDACRate
/* 093864 80098E04 4800001C */  b       lbl_80098E20
glabel lbl_80098E08
/* 093868 80098E08 80050000 */  lwz     r0, 0(r5)
/* 09386C 80098E0C 5400073E */  clrlwi  r0, r0, 0x1c
/* 093870 80098E10 901F0014 */  stw     r0, 0x14(r31)
/* 093874 80098E14 4800000C */  b       lbl_80098E20
glabel lbl_80098E18
/* 093878 80098E18 38600000 */  li      r3, 0
/* 09387C 80098E1C 48000008 */  b       lbl_80098E24
lbl_80098E20:
/* 093880 80098E20 38600001 */  li      r3, 1
lbl_80098E24:
/* 093884 80098E24 80010024 */  lwz     r0, 0x24(r1)
/* 093888 80098E28 83E1001C */  lwz     r31, 0x1c(r1)
/* 09388C 80098E2C 38210020 */  addi    r1, r1, 0x20
/* 093890 80098E30 7C0803A6 */  mtlr    r0
/* 093894 80098E34 4E800020 */  blr     

glabel audioPut16
/* 093898 80098E38 38600000 */  li      r3, 0
/* 09389C 80098E3C 4E800020 */  blr     

glabel audioPut8
/* 0938A0 80098E40 38600000 */  li      r3, 0
/* 0938A4 80098E44 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000F90F0 800FC070 0010 */
glabel gClassAudio
    .long D_801455B8, 0x00000020, 0x00000000, audioEvent

.balign 4

/* 000F9100 800FC080 001F */
D_800FC080:
    .asciz "Get: DRAM Address: WRITE-ONLY?"

.balign 4

/* 000F9120 800FC0A0 001A */
D_800FC0A0:
    .asciz "Get: CONTROL: WRITE-ONLY?"

.balign 4

/* 000F913C 800FC0BC 0054 */
jtbl_800FC0BC:
    .long lbl_80098C10
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098C34
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098C58
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098C7C
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098C9C
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098CB4
    .long lbl_80098CA8

.balign 4

/* 000F9190 800FC110 0054 */
jtbl_800FC110:
    .long lbl_80098D28
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098D80
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098DB8
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098DC8
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098DDC
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098E18
    .long lbl_80098E08


.section .sdata, "wa"

.balign 8

/* 000FFE18 801455B8 0006 */
D_801455B8:
    .asciz "AUDIO"

.balign 8

/* 000FFE20 801455C0 0008 */
D_801455C0:
    .asciz "audio.c"


