# movie.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel MovieDraw
/* 00AB14 800100B4 7C0802A6 */  mflr    r0
/* 00AB18 800100B8 38800000 */  li      r4, 0
/* 00AB1C 800100BC 90010004 */  stw     r0, 4(r1)
/* 00AB20 800100C0 38A0FFF8 */  li      r5, -8
/* 00AB24 800100C4 38C00280 */  li      r6, 0x280
/* 00AB28 800100C8 9421FFF8 */  stwu    r1, -8(r1)
/* 00AB2C 800100CC 38E001B8 */  li      r7, 0x1b8
/* 00AB30 800100D0 806D8E7C */  lwz     r3, rmode-_SDA_BASE_(r13)
/* 00AB34 800100D4 48000F7D */  bl      THPPlayerDrawCurrentFrame
/* 00AB38 800100D8 48001075 */  bl      THPPlayerDrawDone
/* 00AB3C 800100DC 8001000C */  lwz     r0, 0xc(r1)
/* 00AB40 800100E0 38210008 */  addi    r1, r1, 8
/* 00AB44 800100E4 7C0803A6 */  mtlr    r0
/* 00AB48 800100E8 4E800020 */  blr     

glabel MovieInit
/* 00AB4C 800100EC 7C0802A6 */  mflr    r0
/* 00AB50 800100F0 3C60800F */  lis     r3, D_800F62C0@ha
/* 00AB54 800100F4 90010004 */  stw     r0, 4(r1)
/* 00AB58 800100F8 9421FFE8 */  stwu    r1, -0x18(r1)
/* 00AB5C 800100FC 93E10014 */  stw     r31, 0x14(r1)
/* 00AB60 80010100 3BE362C0 */  addi    r31, r3, D_800F62C0@l
/* 00AB64 80010104 38600000 */  li      r3, 0
/* 00AB68 80010108 480000BD */  bl      THPPlayerInit
/* 00AB6C 8001010C 38600006 */  li      r3, 6
/* 00AB70 80010110 38810008 */  addi    r4, r1, 8
/* 00AB74 80010114 4BFF8A49 */  bl      simulatorGetArgument
/* 00AB78 80010118 2C030000 */  cmpwi   r3, 0
/* 00AB7C 8001011C 40820054 */  bne     lbl_80010170
/* 00AB80 80010120 806D8EE0 */  lwz     r3, gpSystem-_SDA_BASE_(r13)
/* 00AB84 80010124 80030020 */  lwz     r0, 0x20(r3)
/* 00AB88 80010128 2C000005 */  cmpwi   r0, 5
/* 00AB8C 8001012C 41820024 */  beq     lbl_80010150
/* 00AB90 80010130 40800030 */  bge     lbl_80010160
/* 00AB94 80010134 2C000004 */  cmpwi   r0, 4
/* 00AB98 80010138 40800008 */  bge     lbl_80010140
/* 00AB9C 8001013C 48000024 */  b       lbl_80010160
lbl_80010140:
/* 00ABA0 80010140 387F0000 */  addi    r3, r31, 0
/* 00ABA4 80010144 38800000 */  li      r4, 0
/* 00ABA8 80010148 480001B5 */  bl      THPPlayerOpen
/* 00ABAC 8001014C 48000030 */  b       lbl_8001017C
lbl_80010150:
/* 00ABB0 80010150 387F0020 */  addi    r3, r31, 0x20
/* 00ABB4 80010154 38800000 */  li      r4, 0
/* 00ABB8 80010158 480001A5 */  bl      THPPlayerOpen
/* 00ABBC 8001015C 48000020 */  b       lbl_8001017C
lbl_80010160:
/* 00ABC0 80010160 387F0038 */  addi    r3, r31, 0x38
/* 00ABC4 80010164 38800000 */  li      r4, 0
/* 00ABC8 80010168 48000195 */  bl      THPPlayerOpen
/* 00ABCC 8001016C 48000010 */  b       lbl_8001017C
lbl_80010170:
/* 00ABD0 80010170 80610008 */  lwz     r3, 8(r1)
/* 00ABD4 80010174 38800000 */  li      r4, 0
/* 00ABD8 80010178 48000185 */  bl      THPPlayerOpen
lbl_8001017C:
/* 00ABDC 8001017C 480003F9 */  bl      THPPlayerCalcNeedMemory
/* 00ABE0 80010180 7C601B78 */  mr      r0, r3
/* 00ABE4 80010184 806D8D00 */  lwz     r3, __OSCurrHeap-_SDA_BASE_(r13)
/* 00ABE8 80010188 7C040378 */  mr      r4, r0
/* 00ABEC 8001018C 480987AD */  bl      OSAllocFromHeap
/* 00ABF0 80010190 906D8EF0 */  stw     r3, gBufferP-_SDA_BASE_(r13)
/* 00ABF4 80010194 806D8EF0 */  lwz     r3, gBufferP-_SDA_BASE_(r13)
/* 00ABF8 80010198 48000485 */  bl      THPPlayerSetBuffer
/* 00ABFC 8001019C 38600000 */  li      r3, 0
/* 00AC00 800101A0 38800000 */  li      r4, 0
/* 00AC04 800101A4 38A00000 */  li      r5, 0
/* 00AC08 800101A8 480007AD */  bl      THPPlayerPrepare
/* 00AC0C 800101AC 48000A1D */  bl      THPPlayerPlay
/* 00AC10 800101B0 8001001C */  lwz     r0, 0x1c(r1)
/* 00AC14 800101B4 83E10014 */  lwz     r31, 0x14(r1)
/* 00AC18 800101B8 38210018 */  addi    r1, r1, 0x18
/* 00AC1C 800101BC 7C0803A6 */  mtlr    r0
/* 00AC20 800101C0 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000F3340 800F62C0 001E */
D_800F62C0:
    .asciz "final_zelda_credits_sound.thp"

.balign 4

/* 000F3360 800F62E0 0017 */
D_800F62E0:
    .asciz "final_cred_w_audio.thp"

.balign 4

/* 000F3378 800F62F8 0009 */
D_800F62F8:
    .asciz "fish.thp"


.section .sbss, "wa"

.balign 8

/* 00100130 801458D0 0004 */
glabel gBufferP
    .skip 4


