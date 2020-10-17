# direct_io.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel fwrite
/* 0D51E4 800DA784 7C0802A6 */  mflr    r0
/* 0D51E8 800DA788 90010004 */  stw     r0, 4(r1)
/* 0D51EC 800DA78C 9421FFB8 */  stwu    r1, -0x48(r1)
/* 0D51F0 800DA790 BF21002C */  stmw    r25, 0x2c(r1)
/* 0D51F4 800DA794 3B440000 */  addi    r26, r4, 0
/* 0D51F8 800DA798 3B660000 */  addi    r27, r6, 0
/* 0D51FC 800DA79C 3B830000 */  addi    r28, r3, 0
/* 0D5200 800DA7A0 3B250000 */  addi    r25, r5, 0
/* 0D5204 800DA7A4 387B0000 */  addi    r3, r27, 0
/* 0D5208 800DA7A8 38800000 */  li      r4, 0
/* 0D520C 800DA7AC 48002A15 */  bl      fwide
/* 0D5210 800DA7B0 2C030000 */  cmpwi   r3, 0
/* 0D5214 800DA7B4 40820010 */  bne     lbl_800DA7C4
/* 0D5218 800DA7B8 387B0000 */  addi    r3, r27, 0
/* 0D521C 800DA7BC 3880FFFF */  li      r4, -1
/* 0D5220 800DA7C0 48002A01 */  bl      fwide
lbl_800DA7C4:
/* 0D5224 800DA7C4 7C1AC9D7 */  mullw.  r0, r26, r25
/* 0D5228 800DA7C8 7C1D0378 */  mr      r29, r0
/* 0D522C 800DA7CC 4182001C */  beq     lbl_800DA7E8
/* 0D5230 800DA7D0 881B000A */  lbz     r0, 0xa(r27)
/* 0D5234 800DA7D4 28000000 */  cmplwi  r0, 0
/* 0D5238 800DA7D8 40820010 */  bne     lbl_800DA7E8
/* 0D523C 800DA7DC A01B0004 */  lhz     r0, 4(r27)
/* 0D5240 800DA7E0 5400D77F */  rlwinm. r0, r0, 0x1a, 0x1d, 0x1f
/* 0D5244 800DA7E4 4082000C */  bne     lbl_800DA7F0
lbl_800DA7E8:
/* 0D5248 800DA7E8 38600000 */  li      r3, 0
/* 0D524C 800DA7EC 48000260 */  b       lbl_800DAA4C
lbl_800DA7F0:
/* 0D5250 800DA7F0 2C000002 */  cmpwi   r0, 2
/* 0D5254 800DA7F4 40820008 */  bne     lbl_800DA7FC
/* 0D5258 800DA7F8 480006CD */  bl      __stdio_atexit
lbl_800DA7FC:
/* 0D525C 800DA7FC 881B0005 */  lbz     r0, 5(r27)
/* 0D5260 800DA800 3BE00001 */  li      r31, 1
/* 0D5264 800DA804 387F0000 */  addi    r3, r31, 0
/* 0D5268 800DA808 5400EFFF */  rlwinm. r0, r0, 0x1d, 0x1f, 0x1f
/* 0D526C 800DA80C 389F0000 */  addi    r4, r31, 0
/* 0D5270 800DA810 41820018 */  beq     lbl_800DA828
/* 0D5274 800DA814 A01B0004 */  lhz     r0, 4(r27)
/* 0D5278 800DA818 5400D77E */  rlwinm  r0, r0, 0x1a, 0x1d, 0x1f
/* 0D527C 800DA81C 2C000003 */  cmpwi   r0, 3
/* 0D5280 800DA820 41820008 */  beq     lbl_800DA828
/* 0D5284 800DA824 38800000 */  li      r4, 0
lbl_800DA828:
/* 0D5288 800DA828 2C040000 */  cmpwi   r4, 0
/* 0D528C 800DA82C 40820018 */  bne     lbl_800DA844
/* 0D5290 800DA830 881B0004 */  lbz     r0, 4(r27)
/* 0D5294 800DA834 5400FFBE */  rlwinm  r0, r0, 0x1f, 0x1e, 0x1f
/* 0D5298 800DA838 28000002 */  cmplwi  r0, 2
/* 0D529C 800DA83C 41820008 */  beq     lbl_800DA844
/* 0D52A0 800DA840 38600000 */  li      r3, 0
lbl_800DA844:
/* 0D52A4 800DA844 2C030000 */  cmpwi   r3, 0
/* 0D52A8 800DA848 40820018 */  bne     lbl_800DA860
/* 0D52AC 800DA84C 881B0004 */  lbz     r0, 4(r27)
/* 0D52B0 800DA850 5400FFBE */  rlwinm  r0, r0, 0x1f, 0x1e, 0x1f
/* 0D52B4 800DA854 28000001 */  cmplwi  r0, 1
/* 0D52B8 800DA858 41820008 */  beq     lbl_800DA860
/* 0D52BC 800DA85C 3BE00000 */  li      r31, 0
lbl_800DA860:
/* 0D52C0 800DA860 887B0008 */  lbz     r3, 8(r27)
/* 0D52C4 800DA864 5460DF7F */  rlwinm. r0, r3, 0x1b, 0x1d, 0x1f
/* 0D52C8 800DA868 40820024 */  bne     lbl_800DA88C
/* 0D52CC 800DA86C 881B0004 */  lbz     r0, 4(r27)
/* 0D52D0 800DA870 5400EFBD */  rlwinm. r0, r0, 0x1d, 0x1e, 0x1e
/* 0D52D4 800DA874 41820018 */  beq     lbl_800DA88C
/* 0D52D8 800DA878 38000001 */  li      r0, 1
/* 0D52DC 800DA87C 50032E34 */  rlwimi  r3, r0, 5, 0x18, 0x1a
/* 0D52E0 800DA880 987B0008 */  stb     r3, 8(r27)
/* 0D52E4 800DA884 7F63DB78 */  mr      r3, r27
/* 0D52E8 800DA888 4BFFFE75 */  bl      __prep_buffer
lbl_800DA88C:
/* 0D52EC 800DA88C 881B0008 */  lbz     r0, 8(r27)
/* 0D52F0 800DA890 5400DF7E */  rlwinm  r0, r0, 0x1b, 0x1d, 0x1f
/* 0D52F4 800DA894 28000001 */  cmplwi  r0, 1
/* 0D52F8 800DA898 4182001C */  beq     lbl_800DA8B4
/* 0D52FC 800DA89C 38000001 */  li      r0, 1
/* 0D5300 800DA8A0 981B000A */  stb     r0, 0xa(r27)
/* 0D5304 800DA8A4 38000000 */  li      r0, 0
/* 0D5308 800DA8A8 38600000 */  li      r3, 0
/* 0D530C 800DA8AC 901B0024 */  stw     r0, 0x24(r27)
/* 0D5310 800DA8B0 4800019C */  b       lbl_800DAA4C
lbl_800DA8B4:
/* 0D5314 800DA8B4 281D0000 */  cmplwi  r29, 0
/* 0D5318 800DA8B8 3BDC0000 */  addi    r30, r28, 0
/* 0D531C 800DA8BC 3B800000 */  li      r28, 0
/* 0D5320 800DA8C0 418200FC */  beq     lbl_800DA9BC
/* 0D5324 800DA8C4 809B0020 */  lwz     r4, 0x20(r27)
/* 0D5328 800DA8C8 807B0018 */  lwz     r3, 0x18(r27)
/* 0D532C 800DA8CC 7C041840 */  cmplw   r4, r3
/* 0D5330 800DA8D0 4082000C */  bne     lbl_800DA8DC
/* 0D5334 800DA8D4 2C1F0000 */  cmpwi   r31, 0
/* 0D5338 800DA8D8 418200E4 */  beq     lbl_800DA9BC
lbl_800DA8DC:
/* 0D533C 800DA8DC 801B001C */  lwz     r0, 0x1c(r27)
/* 0D5340 800DA8E0 7C632050 */  subf    r3, r3, r4
/* 0D5344 800DA8E4 7C030050 */  subf    r0, r3, r0
/* 0D5348 800DA8E8 901B0024 */  stw     r0, 0x24(r27)
lbl_800DA8EC:
/* 0D534C 800DA8EC 801B0024 */  lwz     r0, 0x24(r27)
/* 0D5350 800DA8F0 90010020 */  stw     r0, 0x20(r1)
/* 0D5354 800DA8F4 80010020 */  lwz     r0, 0x20(r1)
/* 0D5358 800DA8F8 7C00E840 */  cmplw   r0, r29
/* 0D535C 800DA8FC 40810008 */  ble     lbl_800DA904
/* 0D5360 800DA900 93A10020 */  stw     r29, 0x20(r1)
lbl_800DA904:
/* 0D5364 800DA904 80A10020 */  lwz     r5, 0x20(r1)
/* 0D5368 800DA908 28050000 */  cmplwi  r5, 0
/* 0D536C 800DA90C 4182003C */  beq     lbl_800DA948
/* 0D5370 800DA910 807B0020 */  lwz     r3, 0x20(r27)
/* 0D5374 800DA914 7FC4F378 */  mr      r4, r30
/* 0D5378 800DA918 4BF2ABAD */  bl      memcpy
/* 0D537C 800DA91C 80610020 */  lwz     r3, 0x20(r1)
/* 0D5380 800DA920 801B0020 */  lwz     r0, 0x20(r27)
/* 0D5384 800DA924 7FDE1A14 */  add     r30, r30, r3
/* 0D5388 800DA928 7C001A14 */  add     r0, r0, r3
/* 0D538C 800DA92C 901B0020 */  stw     r0, 0x20(r27)
/* 0D5390 800DA930 7F9C1A14 */  add     r28, r28, r3
/* 0D5394 800DA934 7FA3E850 */  subf    r29, r3, r29
/* 0D5398 800DA938 80610020 */  lwz     r3, 0x20(r1)
/* 0D539C 800DA93C 801B0024 */  lwz     r0, 0x24(r27)
/* 0D53A0 800DA940 7C030050 */  subf    r0, r3, r0
/* 0D53A4 800DA944 901B0024 */  stw     r0, 0x24(r27)
lbl_800DA948:
/* 0D53A8 800DA948 807B0024 */  lwz     r3, 0x24(r27)
/* 0D53AC 800DA94C 28030000 */  cmplwi  r3, 0
/* 0D53B0 800DA950 4082001C */  bne     lbl_800DA96C
/* 0D53B4 800DA954 A01B0004 */  lhz     r0, 4(r27)
/* 0D53B8 800DA958 5400D77E */  rlwinm  r0, r0, 0x1a, 0x1d, 0x1f
/* 0D53BC 800DA95C 2C000003 */  cmpwi   r0, 3
/* 0D53C0 800DA960 4082000C */  bne     lbl_800DA96C
/* 0D53C4 800DA964 7F9CEA14 */  add     r28, r28, r29
/* 0D53C8 800DA968 48000054 */  b       lbl_800DA9BC
lbl_800DA96C:
/* 0D53CC 800DA96C 28030000 */  cmplwi  r3, 0
/* 0D53D0 800DA970 41820010 */  beq     lbl_800DA980
/* 0D53D4 800DA974 881B0004 */  lbz     r0, 4(r27)
/* 0D53D8 800DA978 5400FFBF */  rlwinm. r0, r0, 0x1f, 0x1e, 0x1f
/* 0D53DC 800DA97C 40820030 */  bne     lbl_800DA9AC
lbl_800DA980:
/* 0D53E0 800DA980 387B0000 */  addi    r3, r27, 0
/* 0D53E4 800DA984 38800000 */  li      r4, 0
/* 0D53E8 800DA988 4BFFFCA9 */  bl      __flush_buffer
/* 0D53EC 800DA98C 2C030000 */  cmpwi   r3, 0
/* 0D53F0 800DA990 4182001C */  beq     lbl_800DA9AC
/* 0D53F4 800DA994 38000001 */  li      r0, 1
/* 0D53F8 800DA998 981B000A */  stb     r0, 0xa(r27)
/* 0D53FC 800DA99C 38000000 */  li      r0, 0
/* 0D5400 800DA9A0 3BA00000 */  li      r29, 0
/* 0D5404 800DA9A4 901B0024 */  stw     r0, 0x24(r27)
/* 0D5408 800DA9A8 48000014 */  b       lbl_800DA9BC
lbl_800DA9AC:
/* 0D540C 800DA9AC 281D0000 */  cmplwi  r29, 0
/* 0D5410 800DA9B0 4182000C */  beq     lbl_800DA9BC
/* 0D5414 800DA9B4 2C1F0000 */  cmpwi   r31, 0
/* 0D5418 800DA9B8 4082FF34 */  bne     lbl_800DA8EC
lbl_800DA9BC:
/* 0D541C 800DA9BC 281D0000 */  cmplwi  r29, 0
/* 0D5420 800DA9C0 41820068 */  beq     lbl_800DAA28
/* 0D5424 800DA9C4 2C1F0000 */  cmpwi   r31, 0
/* 0D5428 800DA9C8 40820060 */  bne     lbl_800DAA28
/* 0D542C 800DA9CC 83FB0018 */  lwz     r31, 0x18(r27)
/* 0D5430 800DA9D0 7C1EEA14 */  add     r0, r30, r29
/* 0D5434 800DA9D4 833B001C */  lwz     r25, 0x1c(r27)
/* 0D5438 800DA9D8 387B0000 */  addi    r3, r27, 0
/* 0D543C 800DA9DC 38810020 */  addi    r4, r1, 0x20
/* 0D5440 800DA9E0 93DB0018 */  stw     r30, 0x18(r27)
/* 0D5444 800DA9E4 93BB001C */  stw     r29, 0x1c(r27)
/* 0D5448 800DA9E8 901B0020 */  stw     r0, 0x20(r27)
/* 0D544C 800DA9EC 4BFFFC45 */  bl      __flush_buffer
/* 0D5450 800DA9F0 2C030000 */  cmpwi   r3, 0
/* 0D5454 800DA9F4 41820014 */  beq     lbl_800DAA08
/* 0D5458 800DA9F8 38000001 */  li      r0, 1
/* 0D545C 800DA9FC 981B000A */  stb     r0, 0xa(r27)
/* 0D5460 800DAA00 38000000 */  li      r0, 0
/* 0D5464 800DAA04 901B0024 */  stw     r0, 0x24(r27)
lbl_800DAA08:
/* 0D5468 800DAA08 80010020 */  lwz     r0, 0x20(r1)
/* 0D546C 800DAA0C 7F63DB78 */  mr      r3, r27
/* 0D5470 800DAA10 93FB0018 */  stw     r31, 0x18(r27)
/* 0D5474 800DAA14 7F9C0214 */  add     r28, r28, r0
/* 0D5478 800DAA18 933B001C */  stw     r25, 0x1c(r27)
/* 0D547C 800DAA1C 4BFFFCE1 */  bl      __prep_buffer
/* 0D5480 800DAA20 38000000 */  li      r0, 0
/* 0D5484 800DAA24 901B0024 */  stw     r0, 0x24(r27)
lbl_800DAA28:
/* 0D5488 800DAA28 881B0004 */  lbz     r0, 4(r27)
/* 0D548C 800DAA2C 5400FFBE */  rlwinm  r0, r0, 0x1f, 0x1e, 0x1f
/* 0D5490 800DAA30 28000002 */  cmplwi  r0, 2
/* 0D5494 800DAA34 4182000C */  beq     lbl_800DAA40
/* 0D5498 800DAA38 38000000 */  li      r0, 0
/* 0D549C 800DAA3C 901B0024 */  stw     r0, 0x24(r27)
lbl_800DAA40:
/* 0D54A0 800DAA40 381AFFFF */  addi    r0, r26, -1
/* 0D54A4 800DAA44 7C1C0214 */  add     r0, r28, r0
/* 0D54A8 800DAA48 7C60D396 */  divwu   r3, r0, r26
lbl_800DAA4C:
/* 0D54AC 800DAA4C BB21002C */  lmw     r25, 0x2c(r1)
/* 0D54B0 800DAA50 8001004C */  lwz     r0, 0x4c(r1)
/* 0D54B4 800DAA54 38210048 */  addi    r1, r1, 0x48
/* 0D54B8 800DAA58 7C0803A6 */  mtlr    r0
/* 0D54BC 800DAA5C 4E800020 */  blr     


