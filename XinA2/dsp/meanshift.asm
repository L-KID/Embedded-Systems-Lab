;******************************************************************************
;* TMS320C6x C/C++ Codegen                                       Unix v6.1.17 *
;* Date/Time created: Mon May 29 13:23:07 2017                                *
;******************************************************************************
	.compiler_opts --c64p_l1d_workaround=default --disable:=sploop --endian=little --hll_source=on --mem_model:code=far --mem_model:const=data --mem_model:data=far --predefine_memory_model_macros --quiet --silicon_version=6500 --symdebug:skeletal 

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C64x+                                          *
;*   Optimization      : Enabled at level 3                                   *
;*   Optimizing for    : Speed                                                *
;*                       Based on options: -o3, no -ms                        *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Data Access Model : Far                                                  *
;*   Pipelining        : Enabled                                              *
;*   Speculate Loads   : Disabled                                             *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : DWARF Debug for Program Analysis w/Optimization      *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss


$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("meanshift.c")
	.dwattr $C$DW$CU, DW_AT_producer("TMS320C6x C/C++ Codegen Unix v6.1.17 Copyright (c) 1996-2010 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/data/home/in4342-10/RajanA2DSP/dsp")

$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("abs")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("_abs")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$10)
	.dwendtag $C$DW$1


$C$DW$3	.dwtag  DW_TAG_subprogram, DW_AT_name("malloc")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("_malloc")
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$3, DW_AT_declaration
	.dwattr $C$DW$3, DW_AT_external
$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$25)
	.dwendtag $C$DW$3


$C$DW$5	.dwtag  DW_TAG_subprogram, DW_AT_name("free")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("_free")
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
$C$DW$6	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$3)
	.dwendtag $C$DW$5


$C$DW$7	.dwtag  DW_TAG_subprogram, DW_AT_name("sqrt")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("_sqrt")
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$17)
	.dwattr $C$DW$7, DW_AT_declaration
	.dwattr $C$DW$7, DW_AT_external
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$17)
	.dwendtag $C$DW$7


$C$DW$9	.dwtag  DW_TAG_subprogram, DW_AT_name("pow")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("_pow")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$17)
	.dwattr $C$DW$9, DW_AT_declaration
	.dwattr $C$DW$9, DW_AT_external
$C$DW$10	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$17)
$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$17)
	.dwendtag $C$DW$9

	.global	_bin_width
_bin_width:	.usect	".far",4,4
$C$DW$12	.dwtag  DW_TAG_variable, DW_AT_name("bin_width")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("_bin_width")
	.dwattr $C$DW$12, DW_AT_location[DW_OP_addr _bin_width]
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$16)
	.dwattr $C$DW$12, DW_AT_external
	.global	_cfg
_cfg:	.usect	".far",12,4
$C$DW$13	.dwtag  DW_TAG_variable, DW_AT_name("cfg")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("_cfg")
	.dwattr $C$DW$13, DW_AT_location[DW_OP_addr _cfg]
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$13, DW_AT_external
;	/data/bbToolChain/usr/local/share/c6000/bin/opt6x /tmp/29386zSwtb5 /tmp/29386lgZ5dV 
	.sect	".text"
	.clink
	.global	_CalWeight

$C$DW$14	.dwtag  DW_TAG_subprogram, DW_AT_name("CalWeight")
	.dwattr $C$DW$14, DW_AT_low_pc(_CalWeight)
	.dwattr $C$DW$14, DW_AT_high_pc(0x00)
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("_CalWeight")
	.dwattr $C$DW$14, DW_AT_external
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$14, DW_AT_TI_begin_file("meanshift.c")
	.dwattr $C$DW$14, DW_AT_TI_begin_line(0x5d)
	.dwattr $C$DW$14, DW_AT_TI_begin_column(0x0f)
	.dwattr $C$DW$14, DW_AT_frame_base[DW_OP_breg31 104]
	.dwattr $C$DW$14, DW_AT_TI_skeletal
	.dwpsn	file "meanshift.c",line 95,column 1,is_stmt,address _CalWeight
$C$DW$15	.dwtag  DW_TAG_formal_parameter, DW_AT_name("bgr_planes")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("_bgr_planes")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$15, DW_AT_location[DW_OP_reg4]
$C$DW$16	.dwtag  DW_TAG_formal_parameter, DW_AT_name("target_model")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("_target_model")
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$16, DW_AT_location[DW_OP_reg20]
$C$DW$17	.dwtag  DW_TAG_formal_parameter, DW_AT_name("target_candidate")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("_target_candidate")
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$17, DW_AT_location[DW_OP_reg6]
$C$DW$18	.dwtag  DW_TAG_formal_parameter, DW_AT_name("rec")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("_rec")
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$18, DW_AT_location[DW_OP_reg22]

;******************************************************************************
;* FUNCTION NAME: CalWeight                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Local Frame Size  : 0 Args + 48 Auto + 56 Save = 104 byte                *
;******************************************************************************
_CalWeight:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           STW     .D2T1   A11,*SP--(8)      ; |95| 
           STW     .D2T1   A10,*SP--(8)      ; |95| 
           STDW    .D2T2   B13:B12,*SP--     ; |95| 
           STDW    .D2T2   B11:B10,*SP--     ; |95| 
           STDW    .D2T1   A15:A14,*SP--     ; |95| 
           STDW    .D2T1   A13:A12,*SP--     ; |95| 
           STW     .D2T2   B3,*SP--(56)      ; |95| 
           LDW     .D2T2   *+B6(4),B12       ; |99| 
           LDW     .D2T2   *B6,B11           ; |98| 
           MV      .L2     B4,B10            ; |95| 

           MV      .L2X    A3,B4             ; |95| 
||         MVKL    .S1     _malloc,A3        ; |104| 

           MVKH    .S1     _malloc,A3        ; |104| 

           STW     .D2T2   B4,*+SP(16)       ; |104| 
||         MV      .L1     A4,A10            ; |95| 
||         LDW     .D1T1   *+A6(8),A4        ; |95| 

$C$DW$19	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$19, DW_AT_low_pc(0x08)
	.dwattr $C$DW$19, DW_AT_name("_malloc")
	.dwattr $C$DW$19, DW_AT_TI_call

           MPY32   .M2     B12,B11,B5        ; |104| 
||         LDW     .D2T2   *+B6(12),B4       ; |95| 
||         CALL    .S2X    A3                ; |104| 

           LDW     .D2T2   *+B6(8),B13       ; |95| 
           ADDKPC  .S2     $C$RL4,B3,1       ; |104| 
           STW     .D2T1   A4,*+SP(20)       ; |95| 

           STW     .D2T2   B4,*+SP(24)       ; |95| 
||         SHL     .S1X    B5,2,A4           ; |104| 

$C$RL4:    ; CALL OCCURS {_malloc} {0}       ; |104| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           STW     .D2T1   A4,*+SP(28)       ; |104| 

           LDW     .D2T2   *+SP(24),B10
||         CMPGT   .L2     B11,0,B0          ; |110| 
||         MV      .L1X    B10,A3            ; |95| 

   [!B0]   B       .S1     $C$L5             ; |110| 
||         STW     .D2T1   A3,*+SP(36)       ; |95| 
||         MV      .L1     A10,A4            ; |95| 

           STW     .D2T1   A4,*+SP(32)       ; |95| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
||         ZERO    .L1     A11               ; |107| 

	.dwpsn	file "meanshift.c",line 107,column 0,is_stmt

   [ B1]   LDW     .D2T1   *+SP(32),A3
|| [ B0]   MPY32   .M1X    B11,A11,A15
|| [ B0]   ZERO    .L1     A13               ; |110| 
|| [ B0]   MV      .L2     B11,B4            ; |112| 

;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L1
;** --------------------------------------------------------------------------*
$C$L1:    
$C$DW$L$_CalWeight$3$B:
	.dwpsn	file "meanshift.c",line 108,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 3

   [ B0]   STW     .D2T2   B4,*+SP(40)       ; |112| 
|| [ B0]   CMPGT   .L2     B12,0,B0          ; |113| 

   [ B0]   MPY32   .M2     B11,B10,B4
           NOP             1
           ; BRANCHCC OCCURS {$C$L5}         ; |110| 
$C$DW$L$_CalWeight$3$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$4$B:
;          EXCLUSIVE CPU CYCLES: 4
   [!B0]   BNOP    .S1     $C$L4,2           ; |113| 
	.dwpsn	file "meanshift.c",line 110,column 0,is_stmt
   [ B0]   ADD     .L2     B13,B4,B4
$C$DW$L$_CalWeight$4$E:
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L2
;** --------------------------------------------------------------------------*
$C$L2:    
$C$DW$L$_CalWeight$5$B:
	.dwpsn	file "meanshift.c",line 111,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 2
   [ B0]   LDW     .D1T1   *+A3[A11],A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L4}         ; |113| 
$C$DW$L$_CalWeight$5$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$6$B:
;          EXCLUSIVE CPU CYCLES: 9

           LDW     .D2T1   *+SP(28),A31      ; |117| 
||         SHL     .S1     A15,2,A30
||         MV      .L2     B12,B31
||         MPY32   .M1X    B11,A13,A5

           STW     .D2T2   B31,*+SP(44)
           STW     .D2T1   A30,*+SP(48)

           ADD     .L1X    A4,B4,A12
||         MVKL    .S2     __fltuf,B4        ; |117| 

           MVKH    .S2     __fltuf,B4        ; |117| 
$C$DW$20	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$20, DW_AT_low_pc(0x00)
	.dwattr $C$DW$20, DW_AT_name("__fltuf")
	.dwattr $C$DW$20, DW_AT_TI_call
           CALL    .S2     B4                ; |117| 
           LDBU    .D1T1   *A12++,A4         ; |117| 
           ADDAW   .D1     A31,A5,A14
	.dwpsn	file "meanshift.c",line 113,column 0,is_stmt
           NOP             1
$C$DW$L$_CalWeight$6$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*----------------------------------------------------------------------------*
$C$L3:    
$C$DW$L$_CalWeight$7$B:
	.dwpsn	file "meanshift.c",line 114,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL6,B3,1       ; |117| 
$C$RL6:    ; CALL OCCURS {__fltuf} {0}       ; |117| 
$C$DW$L$_CalWeight$7$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$8$B:
;          EXCLUSIVE CPU CYCLES: 75
           MVKL    .S1     __divf,A3         ; |117| 

           MVKH    .S1     __divf,A3         ; |117| 
||         MVKL    .S2     _bin_width,B4

           MVKH    .S2     _bin_width,B4
$C$DW$21	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$21, DW_AT_low_pc(0x00)
	.dwattr $C$DW$21, DW_AT_name("__divf")
	.dwattr $C$DW$21, DW_AT_TI_call
           CALL    .S2X    A3                ; |117| 
           LDW     .D2T2   *B4,B4            ; |117| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |117| 
$C$RL7:    ; CALL OCCURS {__divf} {0}        ; |117| 
           MVKL    .S1     __fixfi,A3        ; |117| 
           MVKH    .S1     __fixfi,A3        ; |117| 
           NOP             1
$C$DW$22	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$22, DW_AT_low_pc(0x00)
	.dwattr $C$DW$22, DW_AT_name("__fixfi")
	.dwattr $C$DW$22, DW_AT_TI_call
           CALL    .S2X    A3                ; |117| 
           ADDKPC  .S2     $C$RL8,B3,4       ; |117| 
$C$RL8:    ; CALL OCCURS {__fixfi} {0}       ; |117| 
           LDW     .D2T1   *+SP(36),A3       ; |117| 
           MVKL    .S1     __fltuf,A5        ; |117| 
           MVKH    .S1     __fltuf,A5        ; |117| 
           MV      .L1     A4,A10            ; |117| 
$C$DW$23	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$23, DW_AT_low_pc(0x04)
	.dwattr $C$DW$23, DW_AT_name("__fltuf")
	.dwattr $C$DW$23, DW_AT_TI_call

           ADD     .L1     A15,A4,A4         ; |117| 
||         CALL    .S2X    A5                ; |117| 

           LDBU    .D1T1   *+A4[A3],A4       ; |117| 
           ADDKPC  .S2     $C$RL14,B3,3      ; |117| 
$C$RL14:   ; CALL OCCURS {__fltuf} {0}       ; |117| 
           LDW     .D2T1   *+SP(48),A3       ; |117| 
           LDW     .D2T1   *+SP(20),A31      ; |117| 
           MVKL    .S2     __divf,B5         ; |117| 
           MVKH    .S2     __divf,B5         ; |117| 
           NOP             1
           ADDAW   .D1     A3,A10,A5         ; |117| 
$C$DW$24	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$24, DW_AT_low_pc(0x04)
	.dwattr $C$DW$24, DW_AT_name("__divf")
	.dwattr $C$DW$24, DW_AT_TI_call

           ADD     .L1     A31,A5,A3         ; |117| 
||         CALL    .S2     B5                ; |117| 

           LDW     .D1T2   *A3,B4            ; |117| 
           ADDKPC  .S2     $C$RL15,B3,3      ; |117| 
$C$RL15:   ; CALL OCCURS {__divf} {0}        ; |117| 
           MVKL    .S1     __cvtfd,A3        ; |117| 
           MVKH    .S1     __cvtfd,A3        ; |117| 
           NOP             1
$C$DW$25	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$25, DW_AT_low_pc(0x00)
	.dwattr $C$DW$25, DW_AT_name("__cvtfd")
	.dwattr $C$DW$25, DW_AT_TI_call
           CALL    .S2X    A3                ; |117| 
           ADDKPC  .S2     $C$RL16,B3,4      ; |117| 
$C$RL16:   ; CALL OCCURS {__cvtfd} {0}       ; |117| 
           MVKL    .S1     _sqrt,A3          ; |117| 
           MVKH    .S1     _sqrt,A3          ; |117| 
           NOP             1
$C$DW$26	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$26, DW_AT_low_pc(0x00)
	.dwattr $C$DW$26, DW_AT_name("_sqrt")
	.dwattr $C$DW$26, DW_AT_TI_call
           CALL    .S2X    A3                ; |117| 
           ADDKPC  .S2     $C$RL17,B3,4      ; |117| 
$C$RL17:   ; CALL OCCURS {_sqrt} {0}         ; |117| 
           MVKL    .S1     __cvtdf,A3        ; |117| 
           MVKH    .S1     __cvtdf,A3        ; |117| 
           NOP             1
$C$DW$27	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$27, DW_AT_low_pc(0x00)
	.dwattr $C$DW$27, DW_AT_name("__cvtdf")
	.dwattr $C$DW$27, DW_AT_TI_call
           CALL    .S2X    A3                ; |117| 
           ADDKPC  .S2     $C$RL18,B3,4      ; |117| 
$C$RL18:   ; CALL OCCURS {__cvtdf} {0}       ; |117| 
           MVKL    .S2     __mpyf,B5         ; |117| 
           MVKH    .S2     __mpyf,B5         ; |117| 
$C$DW$28	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$28, DW_AT_low_pc(0x00)
	.dwattr $C$DW$28, DW_AT_name("__mpyf")
	.dwattr $C$DW$28, DW_AT_TI_call
           CALL    .S2     B5                ; |117| 

           MV      .L2X    A4,B4             ; |117| 
||         LDW     .D1T1   *A14,A4           ; |117| 

           ADDKPC  .S2     $C$RL19,B3,3      ; |117| 
$C$RL19:   ; CALL OCCURS {__mpyf} {0}        ; |117| 
$C$DW$L$_CalWeight$8$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$9$B:
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(44),B4       ; |117| 
           STW     .D1T1   A4,*A14++         ; |117| 
           NOP             3

           SUB     .L1X    B4,1,A0           ; |113| 
||         SUB     .L2     B4,1,B4           ; |113| 

   [ A0]   B       .S1     $C$L3             ; |113| 
||         STW     .D2T2   B4,*+SP(44)       ; |117| 
||         MVKL    .S2     __fltuf,B4        ; |117| 

           MVKH    .S2     __fltuf,B4        ; |117| 
$C$DW$29	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$29, DW_AT_low_pc(0x00)
	.dwattr $C$DW$29, DW_AT_name("__fltuf")
	.dwattr $C$DW$29, DW_AT_TI_call
   [ A0]   CALL    .S2     B4                ; |117| 
   [ A0]   LDBU    .D1T1   *A12++,A4         ; |117| 
	.dwpsn	file "meanshift.c",line 119,column 0,is_stmt
           NOP             2
           ; BRANCHCC OCCURS {$C$L3}         ; |113| 
$C$DW$L$_CalWeight$9$E:
;** --------------------------------------------------------------------------*
$C$L4:    
$C$DW$L$_CalWeight$10$B:
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(40),B4
           ADD     .L1     1,A13,A13         ; |110| 
           ADD     .L2     1,B10,B10         ; |110| 
           CMPGT   .L2     B12,0,B0          ; |113| 
           LDW     .D2T1   *+SP(32),A3

           SUB     .L1X    B4,1,A0           ; |110| 
||         SUB     .L2     B4,1,B4           ; |110| 

   [!A0]   MVK     .L2     0x1,B0            ; nullify predicate
|| [ A0]   B       .S1     $C$L2             ; |110| 
||         STW     .D2T2   B4,*+SP(40)       ; |110| 

   [ B0]   MPY32   .M2     B11,B10,B4
   [!B0]   BNOP    .S1     $C$L4,2           ; |113| 
	.dwpsn	file "meanshift.c",line 121,column 0,is_stmt
   [ B0]   ADD     .L2     B13,B4,B4
           ; BRANCHCC OCCURS {$C$L2}         ; |110| 
$C$DW$L$_CalWeight$10$E:
;** --------------------------------------------------------------------------*
$C$L5:    
$C$DW$L$_CalWeight$11$B:
;          EXCLUSIVE CPU CYCLES: 8

           ADD     .L1     1,A11,A11         ; |107| 
||         LDW     .D2T2   *+SP(24),B10

           CMPLT   .L1     A11,3,A0          ; |107| 
   [ A0]   B       .S1     $C$L1             ; |107| 
           CMPGT   .L2     B11,0,B0          ; |110| 

   [!A0]   MVK     .L2     0x1,B0            ; nullify predicate
|| [ A0]   MV      .S2     B0,B1             ; guard predicate rewrite

   [ B0]   MV      .L2     B11,B4            ; |112| 
|| [ B0]   ZERO    .L1     A13               ; |110| 
|| [!B0]   B       .S1     $C$L5             ; |110| 
|| [ B1]   LDW     .D2T1   *+SP(32),A3

   [!A0]   LDW     .D2T1   *+SP(28),A3       ; |125| 
	.dwpsn	file "meanshift.c",line 122,column 0,is_stmt
   [ B0]   MPY32   .M1X    B11,A11,A15
           ; BRANCHCC OCCURS {$C$L1}         ; |107| 
$C$DW$L$_CalWeight$11$E:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           LDW     .D2T1   *+SP(16),A0       ; |126| 
           ADD     .L2     4,SP,B4           ; |128| 
           STW     .D2T2   B11,*+SP(4)       ; |124| 
           STW     .D2T2   B12,*+SP(8)       ; |125| 
           STW     .D2T1   A3,*+SP(12)       ; |126| 
   [ A0]   LDW     .D2T2   *+B4(8),B5        ; |128| 
   [ A0]   LDNDW   .D2T2   *B4,B7:B6         ; |128| 
   [ A0]   MV      .L2X    A0,B4             ; |128| 
           NOP             2

   [ A0]   STW     .D2T2   B5,*+B4(8)        ; |128| 
|| [ A0]   MV      .L2X    A0,B4             ; |128| 

   [ A0]   STNDW   .D2T2   B7:B6,*B4         ; |128| 
           LDW     .D2T2   *++SP(56),B3      ; |129| 
           LDDW    .D2T1   *++SP,A13:A12     ; |129| 
           LDDW    .D2T1   *++SP,A15:A14     ; |129| 
           LDDW    .D2T2   *++SP,B11:B10     ; |129| 
           LDDW    .D2T2   *++SP,B13:B12     ; |129| 
$C$DW$30	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$30, DW_AT_low_pc(0x04)
	.dwattr $C$DW$30, DW_AT_TI_return

           LDW     .D2T1   *++SP(8),A10      ; |129| 
||         RET     .S2     B3                ; |129| 

           LDW     .D2T1   *++SP(8),A11      ; |129| 
	.dwpsn	file "meanshift.c",line 129,column 1,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |129| 

$C$DW$31	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$31, DW_AT_name("/data/home/in4342-10/RajanA2DSP/dsp/meanshift.asm:$C$L1:1:1496064188")
	.dwattr $C$DW$31, DW_AT_TI_begin_file("meanshift.c")
	.dwattr $C$DW$31, DW_AT_TI_begin_line(0x6b)
	.dwattr $C$DW$31, DW_AT_TI_end_line(0x7a)
$C$DW$32	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$32, DW_AT_low_pc($C$DW$L$_CalWeight$3$B)
	.dwattr $C$DW$32, DW_AT_high_pc($C$DW$L$_CalWeight$3$E)
$C$DW$33	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$33, DW_AT_low_pc($C$DW$L$_CalWeight$4$B)
	.dwattr $C$DW$33, DW_AT_high_pc($C$DW$L$_CalWeight$4$E)
$C$DW$34	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$34, DW_AT_low_pc($C$DW$L$_CalWeight$11$B)
	.dwattr $C$DW$34, DW_AT_high_pc($C$DW$L$_CalWeight$11$E)

$C$DW$35	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$35, DW_AT_name("/data/home/in4342-10/RajanA2DSP/dsp/meanshift.asm:$C$L2:2:1496064188")
	.dwattr $C$DW$35, DW_AT_TI_begin_file("meanshift.c")
	.dwattr $C$DW$35, DW_AT_TI_begin_line(0x6e)
	.dwattr $C$DW$35, DW_AT_TI_end_line(0x79)
$C$DW$36	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$36, DW_AT_low_pc($C$DW$L$_CalWeight$5$B)
	.dwattr $C$DW$36, DW_AT_high_pc($C$DW$L$_CalWeight$5$E)
$C$DW$37	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$37, DW_AT_low_pc($C$DW$L$_CalWeight$6$B)
	.dwattr $C$DW$37, DW_AT_high_pc($C$DW$L$_CalWeight$6$E)
$C$DW$38	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$38, DW_AT_low_pc($C$DW$L$_CalWeight$10$B)
	.dwattr $C$DW$38, DW_AT_high_pc($C$DW$L$_CalWeight$10$E)

$C$DW$39	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$39, DW_AT_name("/data/home/in4342-10/RajanA2DSP/dsp/meanshift.asm:$C$L3:3:1496064188")
	.dwattr $C$DW$39, DW_AT_TI_begin_file("meanshift.c")
	.dwattr $C$DW$39, DW_AT_TI_begin_line(0x71)
	.dwattr $C$DW$39, DW_AT_TI_end_line(0x77)
$C$DW$40	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$40, DW_AT_low_pc($C$DW$L$_CalWeight$7$B)
	.dwattr $C$DW$40, DW_AT_high_pc($C$DW$L$_CalWeight$7$E)
$C$DW$41	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$41, DW_AT_low_pc($C$DW$L$_CalWeight$8$B)
	.dwattr $C$DW$41, DW_AT_high_pc($C$DW$L$_CalWeight$8$E)
$C$DW$42	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$42, DW_AT_low_pc($C$DW$L$_CalWeight$9$B)
	.dwattr $C$DW$42, DW_AT_high_pc($C$DW$L$_CalWeight$9$E)
	.dwendtag $C$DW$39

	.dwendtag $C$DW$35

	.dwendtag $C$DW$31

	.dwattr $C$DW$14, DW_AT_TI_end_file("meanshift.c")
	.dwattr $C$DW$14, DW_AT_TI_end_line(0x81)
	.dwattr $C$DW$14, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$14

	.sect	".text"
	.clink
	.global	_MeanShift_Track

$C$DW$43	.dwtag  DW_TAG_subprogram, DW_AT_name("MeanShift_Track")
	.dwattr $C$DW$43, DW_AT_low_pc(_MeanShift_Track)
	.dwattr $C$DW$43, DW_AT_high_pc(0x00)
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("_MeanShift_Track")
	.dwattr $C$DW$43, DW_AT_external
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$43, DW_AT_TI_begin_file("meanshift.c")
	.dwattr $C$DW$43, DW_AT_TI_begin_line(0x85)
	.dwattr $C$DW$43, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$43, DW_AT_frame_base[DW_OP_breg31 192]
	.dwattr $C$DW$43, DW_AT_TI_skeletal
	.dwpsn	file "meanshift.c",line 134,column 1,is_stmt,address _MeanShift_Track
$C$DW$44	.dwtag  DW_TAG_formal_parameter, DW_AT_name("bgr_planes")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("_bgr_planes")
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$44, DW_AT_location[DW_OP_reg4]
$C$DW$45	.dwtag  DW_TAG_formal_parameter, DW_AT_name("target_model")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("_target_model")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_reg20]
$C$DW$46	.dwtag  DW_TAG_formal_parameter, DW_AT_name("target_region")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("_target_region")
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$46, DW_AT_location[DW_OP_reg6]

;******************************************************************************
;* FUNCTION NAME: MeanShift_Track                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Local Frame Size  : 0 Args + 136 Auto + 56 Save = 192 byte               *
;******************************************************************************
_MeanShift_Track:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28

           STW     .D2T1   A11,*SP--(8)      ; |134| 
||         MVKL    .S1     _cfg+8,A5

           STW     .D2T1   A10,*SP--(8)      ; |134| 
           STDW    .D2T2   B13:B12,*SP--     ; |134| 
           STDW    .D2T2   B11:B10,*SP--     ; |134| 
           STDW    .D2T1   A15:A14,*SP--     ; |134| 
           STDW    .D2T1   A13:A12,*SP--     ; |134| 
           STW     .D2T2   B3,*SP--(8)       ; |134| 
           LDNDW   .D1T1   *+A6(8),A9:A8     ; |134| 
           LDNDW   .D1T1   *A6,A7:A6         ; |134| 
           MVKH    .S1     _cfg+8,A5
           ADDK    .S2     -136,SP           ; |134| 
           ADD     .D2     SP,28,B5          ; |134| 
           STNDW   .D2T1   A9:A8,*+B5(8)     ; |134| 
           STNDW   .D2T1   A7:A6,*B5         ; |134| 

           LDW     .D1T1   *A5,A5            ; |139| 
||         LDW     .D2T2   *+SP(28),B5

           STW     .D2T1   A3,*+SP(60)       ; |139| 
           LDW     .D2T1   *+SP(40),A3
           STW     .D2T1   A4,*+SP(84)
           STW     .D2T2   B4,*+SP(80)

           CMPGT   .L1     A5,0,A0           ; |139| 
||         STW     .D2T2   B5,*+SP(64)
||         ZERO    .S1     A5

           LDW     .D2T2   *+SP(32),B5
           STW     .D2T1   A3,*+SP(72)

   [!A0]   B       .S1     $C$L13            ; |139| 
||         LDW     .D2T1   *+SP(36),A3

           STW     .D2T1   A5,*+SP(76)
           MVKL    .S1     _CalWeight,A5     ; |145| 
           MVKH    .S1     _CalWeight,A5     ; |145| 
           STW     .D2T2   B5,*+SP(68)
           STW     .D2T1   A3,*+SP(88)
           ; BRANCHCC OCCURS {$C$L13}        ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
$C$DW$47	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$47, DW_AT_low_pc(0x00)
	.dwattr $C$DW$47, DW_AT_name("_CalWeight")
	.dwattr $C$DW$47, DW_AT_TI_call

           CALL    .S2X    A5                ; |145| 
||         LDW     .D2T2   *+SP(80),B4       ; |145| 

           LDW     .D2T1   *+SP(84),A4       ; |145| 
           ADDAW   .D1X    SP,4,A6           ; |145| 
           ADD     .L1X    4,SP,A3           ; |145| 
	.dwpsn	file "meanshift.c",line 139,column 0,is_stmt
           NOP             1
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L6
;** --------------------------------------------------------------------------*
$C$L6:    
$C$DW$L$_MeanShift_Track$3$B:
	.dwpsn	file "meanshift.c",line 140,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 1

           ADDAW   .D2     SP,7,B6           ; |145| 
||         ADDKPC  .S2     $C$RL21,B3,0      ; |145| 

$C$RL21:   ; CALL OCCURS {_CalWeight} {0}    ; |145| 
$C$DW$L$_MeanShift_Track$3$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$4$B:
;          EXCLUSIVE CPU CYCLES: 26
           MVKL    .S2     __fltid,B4        ; |150| 
           MVKH    .S2     __fltid,B4        ; |150| 
$C$DW$48	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$48, DW_AT_low_pc(0x00)
	.dwattr $C$DW$48, DW_AT_name("__fltid")
	.dwattr $C$DW$48, DW_AT_TI_call

           CALL    .S2     B4                ; |150| 
||         LDW     .D2T1   *+SP(4),A10       ; |150| 

           ADDKPC  .S2     $C$RL22,B3,3      ; |150| 

           SUB     .L1     A10,1,A4          ; |150| 
||         STW     .D2T1   A10,*+SP(92)      ; |150| 

$C$RL22:   ; CALL OCCURS {__fltid} {0}       ; |150| 
           MVKL    .S1     __mpyd,A3         ; |150| 
           MVKH    .S1     __mpyd,A3         ; |150| 
           ZERO    .L2     B5
$C$DW$49	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$49, DW_AT_low_pc(0x00)
	.dwattr $C$DW$49, DW_AT_name("__mpyd")
	.dwattr $C$DW$49, DW_AT_TI_call
           CALL    .S2X    A3                ; |150| 
           SET     .S2     B5,0x15,0x1d,B5
           ADDKPC  .S2     $C$RL23,B3,2      ; |150| 
           ZERO    .L2     B4                ; |150| 
$C$RL23:   ; CALL OCCURS {__mpyd} {0}        ; |150| 
           MVKL    .S1     __cvtdf,A3        ; |150| 
           MVKH    .S1     __cvtdf,A3        ; |150| 
           NOP             1
$C$DW$50	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$50, DW_AT_low_pc(0x00)
	.dwattr $C$DW$50, DW_AT_name("__cvtdf")
	.dwattr $C$DW$50, DW_AT_TI_call
           CALL    .S2X    A3                ; |150| 
           ADDKPC  .S2     $C$RL24,B3,4      ; |150| 
$C$RL24:   ; CALL OCCURS {__cvtdf} {0}       ; |150| 
$C$DW$L$_MeanShift_Track$4$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$5$B:
;          EXCLUSIVE CPU CYCLES: 9

           CMPGT   .L1     A10,0,A0          ; |158| 
||         MV      .L2X    A4,B12            ; |150| 
||         LDW     .D2T1   *+SP(72),A4
||         ZERO    .S1     A3
||         ZERO    .D1     A10

           LDW     .D2T2   *+SP(64),B4       ; |150| 
||         ZERO    .L1     A12

           LDW     .D2T1   *+SP(88),A5

           LDW     .D2T2   *+SP(68),B31      ; |156| 
|| [!A0]   B       .S1     $C$L10            ; |158| 

           STW     .D2T1   A3,*+SP(104)      ; |156| 
           STW     .D2T1   A4,*+SP(100)      ; |156| 
           STW     .D2T2   B4,*+SP(44)       ; |156| 
           STW     .D2T1   A5,*+SP(96)       ; |156| 
           STW     .D2T2   B31,*+SP(48)      ; |155| 
           ; BRANCHCC OCCURS {$C$L10}        ; |158| 
$C$DW$L$_MeanShift_Track$5$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$6$B:
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(8),B5
           LDW     .D2T2   *+SP(92),B4
           MV      .L1     A10,A31
           LDW     .D2T1   *+SP(12),A3
           STW     .D2T1   A31,*+SP(116)
           STW     .D2T2   B5,*+SP(120)
           STW     .D2T2   B4,*+SP(112)
           LDW     .D2T2   *+SP(120),B4
           STW     .D2T1   A3,*+SP(108)
           MVKL    .S1     __fltif,A3
           MVKH    .S1     __fltif,A3
	.dwpsn	file "meanshift.c",line 158,column 0,is_stmt
           NOP             1
$C$DW$L$_MeanShift_Track$6$E:
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L7
;** --------------------------------------------------------------------------*
$C$L7:    
$C$DW$L$_MeanShift_Track$7$B:
	.dwpsn	file "meanshift.c",line 159,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 7
           CMPGT   .L2     B4,0,B0           ; |160| 

   [!B0]   B       .S1     $C$L9             ; |160| 
|| [ B0]   LDW     .D2T1   *+SP(116),A11

$C$DW$51	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$51, DW_AT_low_pc(0x00)
	.dwattr $C$DW$51, DW_AT_name("__fltif")
	.dwattr $C$DW$51, DW_AT_TI_call
   [ B0]   CALL    .S2X    A3
           NOP             4
           ; BRANCHCC OCCURS {$C$L9}         ; |160| 
$C$DW$L$_MeanShift_Track$7$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$8$B:
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L1     A11,A4
||         ADDKPC  .S2     $C$RL27,B3,0

$C$RL27:   ; CALL OCCURS {__fltif} {0} 
$C$DW$L$_MeanShift_Track$8$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$9$B:
;          EXCLUSIVE CPU CYCLES: 25
           MVKL    .S2     __subf,B5
           MVKH    .S2     __subf,B5
$C$DW$52	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$52, DW_AT_low_pc(0x00)
	.dwattr $C$DW$52, DW_AT_name("__subf")
	.dwattr $C$DW$52, DW_AT_TI_call
           CALL    .S2     B5
           ADDKPC  .S2     $C$RL28,B3,3
           MV      .L2     B12,B4
$C$RL28:   ; CALL OCCURS {__subf} {0} 
           MVKL    .S1     __divf,A3
           MVKH    .S1     __divf,A3
           MV      .L2     B12,B4
$C$DW$53	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$53, DW_AT_low_pc(0x00)
	.dwattr $C$DW$53, DW_AT_name("__divf")
	.dwattr $C$DW$53, DW_AT_TI_call
           CALL    .S2X    A3
           ADDKPC  .S2     $C$RL29,B3,4
$C$RL29:   ; CALL OCCURS {__divf} {0} 
           MVKL    .S2     __cvtfd,B4
           MVKH    .S2     __cvtfd,B4
$C$DW$54	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$54, DW_AT_low_pc(0x00)
	.dwattr $C$DW$54, DW_AT_name("__cvtfd")
	.dwattr $C$DW$54, DW_AT_TI_call
           CALL    .S2     B4
           MV      .L2X    A4,B5
           ADDKPC  .S2     $C$RL30,B3,2
           STW     .D2T2   B5,*+SP(124)
$C$RL30:   ; CALL OCCURS {__cvtfd} {0} 
$C$DW$L$_MeanShift_Track$9$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$10$B:
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D2T1   *+SP(92),A3
           LDW     .D2T2   *+SP(120),B4
           LDW     .D2T1   *+SP(108),A31
           STW     .D2T1   A5,*+SP(132)
           STW     .D2T1   A4,*+SP(136)

           MPY32   .M1     A11,A3,A6
||         MVKL    .S1     __fltif,A3        ; |163| 

           MVKH    .S1     __fltif,A3        ; |163| 
           STW     .D2T2   B4,*+SP(128)
$C$DW$55	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$55, DW_AT_low_pc(0x00)
	.dwattr $C$DW$55, DW_AT_name("__fltif")
	.dwattr $C$DW$55, DW_AT_TI_call
           CALL    .S2X    A3                ; |163| 
           ZERO    .L2     B13               ; |160| 
           ADDAW   .D1     A31,A6,A14
	.dwpsn	file "meanshift.c",line 160,column 0,is_stmt
           NOP             2
$C$DW$L$_MeanShift_Track$10$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L8:    
$C$DW$L$_MeanShift_Track$11$B:
	.dwpsn	file "meanshift.c",line 161,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L1X    B13,A4            ; |163| 
||         ADDKPC  .S2     $C$RL33,B3,0      ; |163| 

$C$RL33:   ; CALL OCCURS {__fltif} {0}       ; |163| 
$C$DW$L$_MeanShift_Track$11$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$12$B:
;          EXCLUSIVE CPU CYCLES: 87
           MVKL    .S2     __subf,B5         ; |163| 
           MVKH    .S2     __subf,B5         ; |163| 
$C$DW$56	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$56, DW_AT_low_pc(0x00)
	.dwattr $C$DW$56, DW_AT_name("__subf")
	.dwattr $C$DW$56, DW_AT_TI_call
           CALL    .S2     B5                ; |163| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |163| 
           MV      .L2     B12,B4            ; |163| 
$C$RL34:   ; CALL OCCURS {__subf} {0}        ; |163| 
           MVKL    .S1     __divf,A3         ; |163| 
           MVKH    .S1     __divf,A3         ; |163| 
           MV      .L2     B12,B4            ; |163| 
$C$DW$57	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$57, DW_AT_low_pc(0x00)
	.dwattr $C$DW$57, DW_AT_name("__divf")
	.dwattr $C$DW$57, DW_AT_TI_call
           CALL    .S2X    A3                ; |163| 
           ADDKPC  .S2     $C$RL35,B3,4      ; |163| 
$C$RL35:   ; CALL OCCURS {__divf} {0}        ; |163| 
           MVKL    .S1     _pow,A3           ; |164| 
           MVKH    .S1     _pow,A3           ; |164| 
           LDW     .D2T1   *+SP(132),A5
$C$DW$58	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$58, DW_AT_low_pc(0x00)
	.dwattr $C$DW$58, DW_AT_name("_pow")
	.dwattr $C$DW$58, DW_AT_TI_call
           CALL    .S2X    A3                ; |164| 

           MV      .L1     A4,A13            ; |163| 
||         LDW     .D2T1   *+SP(136),A4

           ZERO    .L2     B5
           SET     .S2     B5,0x1e,0x1e,B5
           ADDKPC  .S2     $C$RL37,B3,0      ; |164| 
           ZERO    .L2     B4                ; |164| 
$C$RL37:   ; CALL OCCURS {_pow} {0}          ; |164| 
           MVKL    .S1     __cvtfd,A3        ; |164| 
           MVKH    .S1     __cvtfd,A3        ; |164| 
           MV      .L1     A4,A15            ; |164| 
$C$DW$59	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$59, DW_AT_low_pc(0x00)
	.dwattr $C$DW$59, DW_AT_name("__cvtfd")
	.dwattr $C$DW$59, DW_AT_TI_call
           CALL    .S2X    A3                ; |164| 
           MV      .L1     A5,A11            ; |164| 
           MV      .L1     A13,A4            ; |164| 
           ADDKPC  .S2     $C$RL38,B3,2      ; |164| 
$C$RL38:   ; CALL OCCURS {__cvtfd} {0}       ; |164| 
           MVKL    .S1     _pow,A3           ; |164| 
           MVKH    .S1     _pow,A3           ; |164| 
           ZERO    .L2     B5
$C$DW$60	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$60, DW_AT_low_pc(0x00)
	.dwattr $C$DW$60, DW_AT_name("_pow")
	.dwattr $C$DW$60, DW_AT_TI_call
           CALL    .S2X    A3                ; |164| 
           SET     .S2     B5,0x1e,0x1e,B5
           ADDKPC  .S2     $C$RL39,B3,2      ; |164| 
           ZERO    .L2     B4                ; |164| 
$C$RL39:   ; CALL OCCURS {_pow} {0}          ; |164| 
           MVKL    .S1     __addd,A6         ; |164| 
           MVKH    .S1     __addd,A6         ; |164| 
           MV      .L2X    A4,B4             ; |164| 
$C$DW$61	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$61, DW_AT_low_pc(0x00)
	.dwattr $C$DW$61, DW_AT_name("__addd")
	.dwattr $C$DW$61, DW_AT_TI_call
           CALL    .S2X    A6                ; |164| 
           ADDKPC  .S2     $C$RL40,B3,3      ; |164| 

           MV      .L1     A15,A4            ; |164| 
||         MV      .L2X    A5,B5             ; |164| 
||         MV      .S1     A11,A5            ; |164| 

$C$RL40:   ; CALL OCCURS {__addd} {0}        ; |164| 
           MVKL    .S1     __cmpd,A3         ; |164| 
           MVKH    .S1     __cmpd,A3         ; |164| 
           ZERO    .L2     B5
$C$DW$62	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$62, DW_AT_low_pc(0x00)
	.dwattr $C$DW$62, DW_AT_name("__cmpd")
	.dwattr $C$DW$62, DW_AT_TI_call
           CALL    .S2X    A3                ; |164| 
           SET     .S2     B5,0x14,0x1d,B5
           ADDKPC  .S2     $C$RL41,B3,2      ; |164| 
           ZERO    .L2     B4                ; |164| 
$C$RL41:   ; CALL OCCURS {__cmpd} {0}        ; |164| 
           MVKL    .S2     __mpyf,B5         ; |160| 
           MVKH    .S2     __mpyf,B5         ; |160| 
$C$DW$63	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$63, DW_AT_low_pc(0x00)
	.dwattr $C$DW$63, DW_AT_name("__mpyf")
	.dwattr $C$DW$63, DW_AT_TI_call

           CALL    .S2     B5                ; |160| 
||         LDW     .D1T1   *A14++,A11        ; |160| 

           ADDKPC  .S2     $C$RL42,B3,3      ; |160| 

           MV      .L2X    A13,B4            ; |160| 
||         MV      .L1     A4,A15            ; |164| 
||         MV      .S1     A11,A4            ; |160| 

$C$RL42:   ; CALL OCCURS {__mpyf} {0}        ; |160| 
           MVKL    .S2     __cvtfd,B4        ; |160| 
           MVKH    .S2     __cvtfd,B4        ; |160| 
$C$DW$64	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$64, DW_AT_low_pc(0x00)
	.dwattr $C$DW$64, DW_AT_name("__cvtfd")
	.dwattr $C$DW$64, DW_AT_TI_call
           CALL    .S2     B4                ; |160| 
           ADDKPC  .S2     $C$RL43,B3,4      ; |160| 
$C$RL43:   ; CALL OCCURS {__cvtfd} {0}       ; |160| 
           MVKL    .S1     __mpyd,A3         ; |160| 
           MVKH    .S1     __mpyd,A3         ; |160| 
           CMPGT   .L1     A15,0,A0          ; |164| 
$C$DW$65	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$65, DW_AT_low_pc(0x00)
	.dwattr $C$DW$65, DW_AT_name("__mpyd")
	.dwattr $C$DW$65, DW_AT_TI_call
           CALL    .S2X    A3                ; |160| 
   [!A0]   ZERO    .L2     B11
   [!A0]   SET     .S2     B11,0x14,0x1d,B11
   [!A0]   ZERO    .L2     B10               ; |164| 
   [ A0]   ZERO    .L2     B11:B10           ; |164| 

           ADDKPC  .S2     $C$RL44,B3,0      ; |160| 
||         MV      .L2     B11,B5            ; |160| 
||         MV      .D2     B10,B4            ; |160| 

$C$RL44:   ; CALL OCCURS {__mpyd} {0}        ; |160| 
$C$DW$L$_MeanShift_Track$12$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$13$B:
;          EXCLUSIVE CPU CYCLES: 1
           LDW     .D2T1   *+SP(124),A13     ; |160| 
$C$DW$L$_MeanShift_Track$13$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$14$B:
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     __cvtdf,A3        ; |160| 
           MVKH    .S1     __cvtdf,A3        ; |160| 
           NOP             1
$C$DW$66	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$66, DW_AT_low_pc(0x00)
	.dwattr $C$DW$66, DW_AT_name("__cvtdf")
	.dwattr $C$DW$66, DW_AT_TI_call
           CALL    .S2X    A3                ; |160| 
           ADDKPC  .S2     $C$RL45,B3,4      ; |160| 
$C$RL45:   ; CALL OCCURS {__cvtdf} {0}       ; |160| 
$C$DW$L$_MeanShift_Track$14$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$15$B:
;          EXCLUSIVE CPU CYCLES: 59
           MVKL    .S1     __addf,A3         ; |160| 
           MVKH    .S1     __addf,A3         ; |160| 
           MV      .L2X    A4,B4             ; |160| 
$C$DW$67	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$67, DW_AT_low_pc(0x00)
	.dwattr $C$DW$67, DW_AT_name("__addf")
	.dwattr $C$DW$67, DW_AT_TI_call
           CALL    .S2X    A3                ; |160| 
           MV      .L1     A10,A4            ; |160| 
           ADDKPC  .S2     $C$RL46,B3,3      ; |160| 
$C$RL46:   ; CALL OCCURS {__addf} {0}        ; |160| 
           MVKL    .S2     __mpyf,B5         ; |166| 
           MVKH    .S2     __mpyf,B5         ; |166| 
$C$DW$68	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$68, DW_AT_low_pc(0x00)
	.dwattr $C$DW$68, DW_AT_name("__mpyf")
	.dwattr $C$DW$68, DW_AT_TI_call
           CALL    .S2     B5                ; |166| 
           ADDKPC  .S2     $C$RL47,B3,3      ; |166| 

           MV      .L1     A4,A10            ; |160| 
||         MV      .S1     A11,A4            ; |166| 
||         MV      .L2X    A13,B4            ; |166| 

$C$RL47:   ; CALL OCCURS {__mpyf} {0}        ; |166| 
           MVKL    .S2     __cvtfd,B4        ; |166| 
           MVKH    .S2     __cvtfd,B4        ; |166| 
$C$DW$69	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$69, DW_AT_low_pc(0x00)
	.dwattr $C$DW$69, DW_AT_name("__cvtfd")
	.dwattr $C$DW$69, DW_AT_TI_call
           CALL    .S2     B4                ; |166| 
           ADDKPC  .S2     $C$RL48,B3,4      ; |166| 
$C$RL48:   ; CALL OCCURS {__cvtfd} {0}       ; |166| 
           MVKL    .S1     __mpyd,A3         ; |166| 
           MVKH    .S1     __mpyd,A3         ; |166| 
           MV      .L2     B11,B5            ; |166| 
$C$DW$70	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$70, DW_AT_low_pc(0x00)
	.dwattr $C$DW$70, DW_AT_name("__mpyd")
	.dwattr $C$DW$70, DW_AT_TI_call
           CALL    .S2X    A3                ; |166| 
           MV      .L2     B10,B4            ; |166| 
           ADDKPC  .S2     $C$RL49,B3,3      ; |166| 
$C$RL49:   ; CALL OCCURS {__mpyd} {0}        ; |166| 
           MVKL    .S2     __cvtdf,B4        ; |166| 
           MVKH    .S2     __cvtdf,B4        ; |166| 
$C$DW$71	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$71, DW_AT_low_pc(0x00)
	.dwattr $C$DW$71, DW_AT_name("__cvtdf")
	.dwattr $C$DW$71, DW_AT_TI_call
           CALL    .S2     B4                ; |166| 
           ADDKPC  .S2     $C$RL50,B3,4      ; |166| 
$C$RL50:   ; CALL OCCURS {__cvtdf} {0}       ; |166| 
           MVKL    .S1     __addf,A5         ; |166| 
           MVKH    .S1     __addf,A5         ; |166| 
           MV      .L2X    A4,B4             ; |166| 
$C$DW$72	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$72, DW_AT_low_pc(0x00)
	.dwattr $C$DW$72, DW_AT_name("__addf")
	.dwattr $C$DW$72, DW_AT_TI_call
           CALL    .S2X    A5                ; |166| 
           LDW     .D2T1   *+SP(104),A4      ; |166| 
           ADDKPC  .S2     $C$RL51,B3,3      ; |166| 
$C$RL51:   ; CALL OCCURS {__addf} {0}        ; |166| 
           MVKL    .S2     __cvtfd,B4        ; |167| 
           MVKH    .S2     __cvtfd,B4        ; |167| 
$C$DW$73	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$73, DW_AT_low_pc(0x00)
	.dwattr $C$DW$73, DW_AT_name("__cvtfd")
	.dwattr $C$DW$73, DW_AT_TI_call
           CALL    .S2     B4                ; |167| 
           ADDKPC  .S2     $C$RL53,B3,3      ; |167| 

           STW     .D2T1   A4,*+SP(104)      ; |167| 
||         MV      .L1     A11,A4            ; |167| 

$C$RL53:   ; CALL OCCURS {__cvtfd} {0}       ; |167| 
$C$DW$L$_MeanShift_Track$15$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$16$B:
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     __mpyd,A3         ; |167| 
           MVKH    .S1     __mpyd,A3         ; |167| 
           MV      .L2     B10,B4            ; |167| 
$C$DW$74	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$74, DW_AT_low_pc(0x00)
	.dwattr $C$DW$74, DW_AT_name("__mpyd")
	.dwattr $C$DW$74, DW_AT_TI_call
           CALL    .S2X    A3                ; |167| 
           MV      .L2     B11,B5            ; |167| 
           ADDKPC  .S2     $C$RL54,B3,3      ; |167| 
$C$RL54:   ; CALL OCCURS {__mpyd} {0}        ; |167| 
$C$DW$L$_MeanShift_Track$16$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$17$B:
;          EXCLUSIVE CPU CYCLES: 17
           MVKL    .S1     __cvtdf,A3        ; |167| 
           MVKH    .S1     __cvtdf,A3        ; |167| 
           NOP             1
$C$DW$75	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$75, DW_AT_low_pc(0x00)
	.dwattr $C$DW$75, DW_AT_name("__cvtdf")
	.dwattr $C$DW$75, DW_AT_TI_call
           CALL    .S2X    A3                ; |167| 
           ADDKPC  .S2     $C$RL55,B3,4      ; |167| 
$C$RL55:   ; CALL OCCURS {__cvtdf} {0}       ; |167| 
           MVKL    .S2     __addf,B5         ; |167| 
           MVKH    .S2     __addf,B5         ; |167| 
$C$DW$76	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$76, DW_AT_low_pc(0x00)
	.dwattr $C$DW$76, DW_AT_name("__addf")
	.dwattr $C$DW$76, DW_AT_TI_call
           CALL    .S2     B5                ; |167| 
           ADDKPC  .S2     $C$RL56,B3,3      ; |167| 

           MV      .L2X    A4,B4             ; |167| 
||         MV      .L1     A12,A4            ; |167| 

$C$RL56:   ; CALL OCCURS {__addf} {0}        ; |167| 
$C$DW$L$_MeanShift_Track$17$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$18$B:
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(128),B4      ; |167| 
           MVKL    .S1     __fltif,A3        ; |163| 
           MVKH    .S1     __fltif,A3        ; |163| 
           ADD     .L2     1,B13,B13         ; |160| 
           MV      .L1     A4,A12            ; |167| 
           SUB     .L1X    B4,1,A0           ; |160| 
   [ A0]   B       .S1     $C$L8             ; |160| 
$C$DW$77	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$77, DW_AT_low_pc(0x00)
	.dwattr $C$DW$77, DW_AT_name("__fltif")
	.dwattr $C$DW$77, DW_AT_TI_call
   [ A0]   CALL    .S2X    A3                ; |163| 
           SUB     .L2     B4,1,B4           ; |160| 
           STW     .D2T2   B4,*+SP(128)      ; |160| 
	.dwpsn	file "meanshift.c",line 168,column 0,is_stmt
           NOP             2
           ; BRANCHCC OCCURS {$C$L8}         ; |160| 
$C$DW$L$_MeanShift_Track$18$E:
;** --------------------------------------------------------------------------*
$C$L9:    
$C$DW$L$_MeanShift_Track$19$B:
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(112),B4
           LDW     .D2T1   *+SP(116),A3
           NOP             3

           SUB     .L1X    B4,1,A0           ; |158| 
||         SUB     .L2     B4,1,B4           ; |158| 

   [ A0]   B       .S1     $C$L7             ; |158| 
||         STW     .D2T2   B4,*+SP(112)      ; |158| 
||         ADD     .L1     1,A3,A3           ; |158| 

   [!A0]   BNOP    .S1     $C$L11,1          ; |158| 
||         LDW     .D2T2   *+SP(120),B4

           STW     .D2T1   A3,*+SP(116)      ; |158| 
   [ A0]   MVKL    .S1     __fltif,A3
	.dwpsn	file "meanshift.c",line 169,column 0,is_stmt
   [ A0]   MVKH    .S1     __fltif,A3
           ; BRANCHCC OCCURS {$C$L7}         ; |158| 
$C$DW$L$_MeanShift_Track$19$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$20$B:
;          EXCLUSIVE CPU CYCLES: 1
           MVKL    .S1     _free,A3          ; |171| 
           ; BRANCH OCCURS {$C$L11}          ; |158| 
$C$DW$L$_MeanShift_Track$20$E:
;** --------------------------------------------------------------------------*
$C$L10:    
$C$DW$L$_MeanShift_Track$21$B:
;          EXCLUSIVE CPU CYCLES: 6
           LDW     .D2T1   *+SP(12),A3
           NOP             4

           STW     .D2T1   A3,*+SP(108)
||         MVKL    .S1     _free,A3          ; |171| 

$C$DW$L$_MeanShift_Track$21$E:
;** --------------------------------------------------------------------------*
$C$L11:    
$C$DW$L$_MeanShift_Track$22$B:
;          EXCLUSIVE CPU CYCLES: 8
           MVKH    .S1     _free,A3          ; |171| 
           LDW     .D2T1   *+SP(108),A4      ; |171| 
$C$DW$78	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$78, DW_AT_low_pc(0x00)
	.dwattr $C$DW$78, DW_AT_name("_free")
	.dwattr $C$DW$78, DW_AT_TI_call
           CALL    .S2X    A3                ; |171| 
           ADDKPC  .S2     $C$RL57,B3,4      ; |171| 
$C$RL57:   ; CALL OCCURS {_free} {0}         ; |171| 
$C$DW$L$_MeanShift_Track$22$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$23$B:
;          EXCLUSIVE CPU CYCLES: 51
           MVKL    .S2     __divf,B5         ; |173| 
           MVKH    .S2     __divf,B5         ; |173| 
$C$DW$79	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$79, DW_AT_low_pc(0x00)
	.dwattr $C$DW$79, DW_AT_name("__divf")
	.dwattr $C$DW$79, DW_AT_TI_call
           CALL    .S2     B5                ; |173| 
           ADDKPC  .S2     $C$RL58,B3,3      ; |173| 

           MV      .L1     A10,A4            ; |173| 
||         MV      .L2X    A12,B4            ; |173| 

$C$RL58:   ; CALL OCCURS {__divf} {0}        ; |173| 
           MVKL    .S2     __mpyf,B5         ; |173| 
           MVKH    .S2     __mpyf,B5         ; |173| 
$C$DW$80	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$80, DW_AT_low_pc(0x00)
	.dwattr $C$DW$80, DW_AT_name("__mpyf")
	.dwattr $C$DW$80, DW_AT_TI_call
           CALL    .S2     B5                ; |173| 
           ADDKPC  .S2     $C$RL59,B3,3      ; |173| 
           MV      .L2     B12,B4            ; |173| 
$C$RL59:   ; CALL OCCURS {__mpyf} {0}        ; |173| 
           MVKL    .S1     __fixfi,A3        ; |173| 
           MVKH    .S1     __fixfi,A3        ; |173| 
           NOP             1
$C$DW$81	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$81, DW_AT_low_pc(0x00)
	.dwattr $C$DW$81, DW_AT_name("__fixfi")
	.dwattr $C$DW$81, DW_AT_TI_call
           CALL    .S2X    A3                ; |173| 
           ADDKPC  .S2     $C$RL60,B3,4      ; |173| 
$C$RL60:   ; CALL OCCURS {__fixfi} {0}       ; |173| 
           MVKL    .S1     __divf,A3         ; |174| 
           MVKH    .S1     __divf,A3         ; |174| 
           MV      .L1     A4,A10            ; |173| 
$C$DW$82	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$82, DW_AT_low_pc(0x00)
	.dwattr $C$DW$82, DW_AT_name("__divf")
	.dwattr $C$DW$82, DW_AT_TI_call
           CALL    .S2X    A3                ; |174| 
           LDW     .D2T1   *+SP(104),A4      ; |174| 
           ADDKPC  .S2     $C$RL61,B3,2      ; |174| 
           MV      .L2X    A12,B4            ; |174| 
$C$RL61:   ; CALL OCCURS {__divf} {0}        ; |174| 
           MVKL    .S2     __mpyf,B5         ; |174| 
           MVKH    .S2     __mpyf,B5         ; |174| 
$C$DW$83	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$83, DW_AT_low_pc(0x00)
	.dwattr $C$DW$83, DW_AT_name("__mpyf")
	.dwattr $C$DW$83, DW_AT_TI_call
           CALL    .S2     B5                ; |174| 
           ADDKPC  .S2     $C$RL62,B3,3      ; |174| 
           MV      .L2     B12,B4            ; |174| 
$C$RL62:   ; CALL OCCURS {__mpyf} {0}        ; |174| 
           MVKL    .S1     __fixfi,A3        ; |174| 
           MVKH    .S1     __fixfi,A3        ; |174| 
           NOP             1
$C$DW$84	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$84, DW_AT_low_pc(0x00)
	.dwattr $C$DW$84, DW_AT_name("__fixfi")
	.dwattr $C$DW$84, DW_AT_TI_call
           CALL    .S2X    A3                ; |174| 
           ADDKPC  .S2     $C$RL63,B3,4      ; |174| 
$C$RL63:   ; CALL OCCURS {__fixfi} {0}       ; |174| 
$C$DW$L$_MeanShift_Track$23$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_MeanShift_Track$24$B:
;          EXCLUSIVE CPU CYCLES: 18
           LDW     .D2T1   *+SP(100),A3      ; |174| 
           LDW     .D2T1   *+SP(96),A5       ; |174| 
           LDW     .D2T1   *+SP(72),A6       ; |174| 
           NOP             2
           ADD     .L1     A4,A3,A3          ; |174| 

           ADD     .L1     A10,A5,A4         ; |173| 
||         STW     .D2T1   A3,*+SP(100)      ; |174| 

           SUB     .L1     A4,A5,A5          ; |178| 
||         SUB     .S1     A3,A6,A6          ; |178| 
||         STW     .D2T1   A4,*+SP(96)       ; |174| 

           ABS     .L1     A5,A5             ; |178| 

           ABS     .L2X    A6,B4             ; |178| 
||         CMPGT   .L1     A5,0,A5           ; |178| 

           CMPGT   .L2     B4,0,B4           ; |178| 

           OR      .L2X    B4,A5,B0          ; |178| 
||         MVKL    .S1     _cfg+8,A5

   [ B0]   B       .S2     $C$L12            ; |178| 
|| [ B0]   LDW     .D2T1   *+SP(76),A31      ; |183| 
||         MVKH    .S1     _cfg+8,A5

   [!B0]   BNOP    .S1     $C$L14,2          ; |187| 
|| [ B0]   LDW     .D1T1   *A5,A8            ; |139| 

   [!B0]   STW     .D2T1   A3,*+SP(56)
   [ B0]   ADD     .L1     1,A31,A5          ; |139| 
           ; BRANCHCC OCCURS {$C$L12}        ; |178| 
$C$DW$L$_MeanShift_Track$24$E:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           ADDAW   .D1X    SP,11,A3          ; |187| 
||         STW     .D2T1   A4,*+SP(52)

           ; BRANCH OCCURS {$C$L14}          ; |187| 
;** --------------------------------------------------------------------------*
$C$L12:    
$C$DW$L$_MeanShift_Track$26$B:
;          EXCLUSIVE CPU CYCLES: 8

           CMPGT   .L1     A8,A5,A0          ; |139| 
||         STW     .D2T1   A5,*+SP(76)       ; |183| 
||         MVKL    .S1     _CalWeight,A5     ; |145| 
||         MV      .D1     A4,A6             ; |183| 

           MVKH    .S1     _CalWeight,A5     ; |145| 
|| [ A0]   LDW     .D2T2   *+SP(80),B4       ; |145| 
||         MV      .L1     A3,A7             ; |139| 
|| [ A0]   ADD     .D1X    4,SP,A3           ; |145| 

   [ A0]   B       .S1     $C$L6             ; |139| 
|| [ A0]   LDW     .D2T1   *+SP(84),A4       ; |145| 

$C$DW$85	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$85, DW_AT_low_pc(0x00)
	.dwattr $C$DW$85, DW_AT_name("_CalWeight")
	.dwattr $C$DW$85, DW_AT_TI_call

   [ A0]   CALL    .S2X    A5                ; |145| 
||         STW     .D2T1   A6,*+SP(36)       ; |182| 

           STW     .D2T1   A6,*+SP(88)       ; |183| 
||         ADDAW   .D1X    SP,4,A6           ; |145| 

           STW     .D2T1   A7,*+SP(40)       ; |183| 
           STW     .D2T1   A7,*+SP(72)       ; |183| 
	.dwpsn	file "meanshift.c",line 185,column 0,is_stmt
   [!A0]   STW     .D2T1   A3,*+SP(56)
           ; BRANCHCC OCCURS {$C$L6}         ; |139| 
$C$DW$L$_MeanShift_Track$26$E:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           STW     .D2T1   A4,*+SP(52)
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDAW   .D1X    SP,11,A3          ; |187| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 23
           LDW     .D2T1   *+SP(60),A0
           NOP             4
   [ A0]   LDNDW   .D1T1   *+A3(8),A5:A4     ; |187| 
   [ A0]   LDNDW   .D1T1   *A3,A7:A6         ; |187| 
           ADDK    .S2     136,SP            ; |188| 
   [ A0]   MV      .L1     A0,A3             ; |187| 
           NOP             1

   [ A0]   STNDW   .D1T1   A5:A4,*+A3(8)     ; |187| 
|| [ A0]   MV      .L1     A0,A3             ; |187| 

   [ A0]   STNDW   .D1T1   A7:A6,*A3         ; |187| 
           LDW     .D2T2   *++SP(8),B3       ; |188| 
           LDDW    .D2T1   *++SP,A13:A12     ; |188| 
           LDDW    .D2T1   *++SP,A15:A14     ; |188| 
           LDDW    .D2T2   *++SP,B11:B10     ; |188| 
           LDDW    .D2T2   *++SP,B13:B12     ; |188| 
$C$DW$86	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$86, DW_AT_low_pc(0x04)
	.dwattr $C$DW$86, DW_AT_TI_return

           LDW     .D2T1   *++SP(8),A10      ; |188| 
||         RET     .S2     B3                ; |188| 

           LDW     .D2T1   *++SP(8),A11      ; |188| 
	.dwpsn	file "meanshift.c",line 188,column 1,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |188| 

$C$DW$87	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$87, DW_AT_name("/data/home/in4342-10/RajanA2DSP/dsp/meanshift.asm:$C$L6:1:1496064188")
	.dwattr $C$DW$87, DW_AT_TI_begin_file("meanshift.c")
	.dwattr $C$DW$87, DW_AT_TI_begin_line(0x8b)
	.dwattr $C$DW$87, DW_AT_TI_end_line(0xb9)
$C$DW$88	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$88, DW_AT_low_pc($C$DW$L$_MeanShift_Track$3$B)
	.dwattr $C$DW$88, DW_AT_high_pc($C$DW$L$_MeanShift_Track$3$E)
$C$DW$89	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$89, DW_AT_low_pc($C$DW$L$_MeanShift_Track$4$B)
	.dwattr $C$DW$89, DW_AT_high_pc($C$DW$L$_MeanShift_Track$4$E)
$C$DW$90	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$90, DW_AT_low_pc($C$DW$L$_MeanShift_Track$5$B)
	.dwattr $C$DW$90, DW_AT_high_pc($C$DW$L$_MeanShift_Track$5$E)
$C$DW$91	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$91, DW_AT_low_pc($C$DW$L$_MeanShift_Track$6$B)
	.dwattr $C$DW$91, DW_AT_high_pc($C$DW$L$_MeanShift_Track$6$E)
$C$DW$92	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$92, DW_AT_low_pc($C$DW$L$_MeanShift_Track$20$B)
	.dwattr $C$DW$92, DW_AT_high_pc($C$DW$L$_MeanShift_Track$20$E)
$C$DW$93	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$93, DW_AT_low_pc($C$DW$L$_MeanShift_Track$21$B)
	.dwattr $C$DW$93, DW_AT_high_pc($C$DW$L$_MeanShift_Track$21$E)
$C$DW$94	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$94, DW_AT_low_pc($C$DW$L$_MeanShift_Track$22$B)
	.dwattr $C$DW$94, DW_AT_high_pc($C$DW$L$_MeanShift_Track$22$E)
$C$DW$95	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$95, DW_AT_low_pc($C$DW$L$_MeanShift_Track$23$B)
	.dwattr $C$DW$95, DW_AT_high_pc($C$DW$L$_MeanShift_Track$23$E)
$C$DW$96	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$96, DW_AT_low_pc($C$DW$L$_MeanShift_Track$24$B)
	.dwattr $C$DW$96, DW_AT_high_pc($C$DW$L$_MeanShift_Track$24$E)
$C$DW$97	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$97, DW_AT_low_pc($C$DW$L$_MeanShift_Track$26$B)
	.dwattr $C$DW$97, DW_AT_high_pc($C$DW$L$_MeanShift_Track$26$E)

$C$DW$98	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$98, DW_AT_name("/data/home/in4342-10/RajanA2DSP/dsp/meanshift.asm:$C$L7:2:1496064188")
	.dwattr $C$DW$98, DW_AT_TI_begin_file("meanshift.c")
	.dwattr $C$DW$98, DW_AT_TI_begin_line(0x9e)
	.dwattr $C$DW$98, DW_AT_TI_end_line(0xa9)
$C$DW$99	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$99, DW_AT_low_pc($C$DW$L$_MeanShift_Track$7$B)
	.dwattr $C$DW$99, DW_AT_high_pc($C$DW$L$_MeanShift_Track$7$E)
$C$DW$100	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$100, DW_AT_low_pc($C$DW$L$_MeanShift_Track$8$B)
	.dwattr $C$DW$100, DW_AT_high_pc($C$DW$L$_MeanShift_Track$8$E)
$C$DW$101	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$101, DW_AT_low_pc($C$DW$L$_MeanShift_Track$9$B)
	.dwattr $C$DW$101, DW_AT_high_pc($C$DW$L$_MeanShift_Track$9$E)
$C$DW$102	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$102, DW_AT_low_pc($C$DW$L$_MeanShift_Track$10$B)
	.dwattr $C$DW$102, DW_AT_high_pc($C$DW$L$_MeanShift_Track$10$E)
$C$DW$103	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$103, DW_AT_low_pc($C$DW$L$_MeanShift_Track$19$B)
	.dwattr $C$DW$103, DW_AT_high_pc($C$DW$L$_MeanShift_Track$19$E)

$C$DW$104	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$104, DW_AT_name("/data/home/in4342-10/RajanA2DSP/dsp/meanshift.asm:$C$L8:3:1496064188")
	.dwattr $C$DW$104, DW_AT_TI_begin_file("meanshift.c")
	.dwattr $C$DW$104, DW_AT_TI_begin_line(0xa0)
	.dwattr $C$DW$104, DW_AT_TI_end_line(0xa8)
$C$DW$105	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$105, DW_AT_low_pc($C$DW$L$_MeanShift_Track$11$B)
	.dwattr $C$DW$105, DW_AT_high_pc($C$DW$L$_MeanShift_Track$11$E)
$C$DW$106	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$106, DW_AT_low_pc($C$DW$L$_MeanShift_Track$12$B)
	.dwattr $C$DW$106, DW_AT_high_pc($C$DW$L$_MeanShift_Track$12$E)
$C$DW$107	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$107, DW_AT_low_pc($C$DW$L$_MeanShift_Track$13$B)
	.dwattr $C$DW$107, DW_AT_high_pc($C$DW$L$_MeanShift_Track$13$E)
$C$DW$108	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$108, DW_AT_low_pc($C$DW$L$_MeanShift_Track$14$B)
	.dwattr $C$DW$108, DW_AT_high_pc($C$DW$L$_MeanShift_Track$14$E)
$C$DW$109	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$109, DW_AT_low_pc($C$DW$L$_MeanShift_Track$15$B)
	.dwattr $C$DW$109, DW_AT_high_pc($C$DW$L$_MeanShift_Track$15$E)
$C$DW$110	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$110, DW_AT_low_pc($C$DW$L$_MeanShift_Track$16$B)
	.dwattr $C$DW$110, DW_AT_high_pc($C$DW$L$_MeanShift_Track$16$E)
$C$DW$111	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$111, DW_AT_low_pc($C$DW$L$_MeanShift_Track$17$B)
	.dwattr $C$DW$111, DW_AT_high_pc($C$DW$L$_MeanShift_Track$17$E)
$C$DW$112	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$112, DW_AT_low_pc($C$DW$L$_MeanShift_Track$18$B)
	.dwattr $C$DW$112, DW_AT_high_pc($C$DW$L$_MeanShift_Track$18$E)
	.dwendtag $C$DW$104

	.dwendtag $C$DW$98

	.dwendtag $C$DW$87

	.dwattr $C$DW$43, DW_AT_TI_end_file("meanshift.c")
	.dwattr $C$DW$43, DW_AT_TI_end_line(0xbc)
	.dwattr $C$DW$43, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$43

	.sect	".text"
	.clink
	.global	_MeanShift_Init

$C$DW$113	.dwtag  DW_TAG_subprogram, DW_AT_name("MeanShift_Init")
	.dwattr $C$DW$113, DW_AT_low_pc(_MeanShift_Init)
	.dwattr $C$DW$113, DW_AT_high_pc(0x00)
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("_MeanShift_Init")
	.dwattr $C$DW$113, DW_AT_external
	.dwattr $C$DW$113, DW_AT_TI_begin_file("meanshift.c")
	.dwattr $C$DW$113, DW_AT_TI_begin_line(0x14)
	.dwattr $C$DW$113, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$113, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$113, DW_AT_TI_skeletal
	.dwpsn	file "meanshift.c",line 20,column 23,is_stmt,address _MeanShift_Init

;******************************************************************************
;* FUNCTION NAME: MeanShift_Init                                              *
;*                                                                            *
;*   Regs Modified     : A3,A4,A5,A6,B4,B5                                    *
;*   Regs Used         : A3,A4,A5,A6,B3,B4,B5                                 *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_MeanShift_Init:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
$C$DW$114	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$114, DW_AT_low_pc(0x00)
	.dwattr $C$DW$114, DW_AT_TI_return

           RET     .S2     B3                ; |25| 
||         MVKL    .S1     _cfg+8,A3

           MVKH    .S1     _cfg+8,A3

           MVK     .S2     8,B4
||         MVKL    .S1     _bin_width,A5

           SUB     .L2X    A3,B4,B4
||         MVKH    .S1     _bin_width,A5
||         ZERO    .L1     A4
||         MVK     .D1     8,A6              ; |21| 
||         MVK     .S2     16,B5             ; |22| 

           ADD     .L2     4,B4,B4
||         MVK     .S2     256,B5            ; |23| 
||         STW     .D2T2   B5,*B4            ; |22| 
||         STW     .D1T1   A6,*A3            ; |21| 
||         MVKH    .S1     0x41800000,A4

	.dwpsn	file "meanshift.c",line 25,column 1,is_stmt

           STW     .D2T2   B5,*B4            ; |23| 
||         STW     .D1T1   A4,*A5            ; |24| 

           ; BRANCH OCCURS {B3}              ; |25| 
	.dwattr $C$DW$113, DW_AT_TI_end_file("meanshift.c")
	.dwattr $C$DW$113, DW_AT_TI_end_line(0x19)
	.dwattr $C$DW$113, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$113

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_malloc
	.global	_free
	.global	_sqrt
	.global	_pow
	.global	__divf
	.global	__fltuf
	.global	__cvtfd
	.global	__fixfi
	.global	__cvtdf
	.global	__mpyf
	.global	__fltid
	.global	__mpyd
	.global	__fltif
	.global	__subf
	.global	__addd
	.global	__cmpd
	.global	__addf

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************
$C$DW$T$3	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$3, DW_AT_address_class(0x20)
$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)
$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)
$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)
$C$DW$T$31	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$31, DW_AT_address_class(0x20)
$C$DW$T$32	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$T$32, DW_AT_address_class(0x20)
$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x02)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$25	.dwtag  DW_TAG_typedef, DW_AT_name("size_t")
	.dwattr $C$DW$T$25, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$25, DW_AT_language(DW_LANG_C)
$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$12, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$12, DW_AT_bit_offset(0x18)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$13, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$13, DW_AT_bit_offset(0x18)
$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)
$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)
$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)
$C$DW$T$19	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$19, DW_AT_type(*$C$DW$T$16)
	.dwattr $C$DW$T$19, DW_AT_address_class(0x20)
$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)
$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)

$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_name("Matrix")
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x0c)
$C$DW$115	.dwtag  DW_TAG_member
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$115, DW_AT_name("rows")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("_rows")
	.dwattr $C$DW$115, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$115, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$116	.dwtag  DW_TAG_member
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$116, DW_AT_name("cols")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("_cols")
	.dwattr $C$DW$116, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$116, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$117	.dwtag  DW_TAG_member
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$117, DW_AT_name("data")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("_data")
	.dwattr $C$DW$117, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$117, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$20

$C$DW$T$42	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$42, DW_AT_address_class(0x20)

$C$DW$T$21	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$21, DW_AT_name("Rect")
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x10)
$C$DW$118	.dwtag  DW_TAG_member
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$118, DW_AT_name("height")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("_height")
	.dwattr $C$DW$118, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$118, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$119	.dwtag  DW_TAG_member
	.dwattr $C$DW$119, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$119, DW_AT_name("width")
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("_width")
	.dwattr $C$DW$119, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$119, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$120	.dwtag  DW_TAG_member
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$120, DW_AT_name("x")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("_x")
	.dwattr $C$DW$120, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$120, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$121	.dwtag  DW_TAG_member
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$121, DW_AT_name("y")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("_y")
	.dwattr $C$DW$121, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$121, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$21

$C$DW$T$45	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$45, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$45, DW_AT_address_class(0x20)

$C$DW$T$22	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$22, DW_AT_name("config")
	.dwattr $C$DW$T$22, DW_AT_byte_size(0x0c)
$C$DW$122	.dwtag  DW_TAG_member
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$122, DW_AT_name("num_bins")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("_num_bins")
	.dwattr $C$DW$122, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$122, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$123	.dwtag  DW_TAG_member
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$123, DW_AT_name("pixel_range")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("_pixel_range")
	.dwattr $C$DW$123, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$123, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$124	.dwtag  DW_TAG_member
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$124, DW_AT_name("MaxIter")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("_MaxIter")
	.dwattr $C$DW$124, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$124, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$22


$C$DW$T$23	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$23, DW_AT_name("S3_1")
	.dwattr $C$DW$T$23, DW_AT_declaration
	.dwendtag $C$DW$T$23


$C$DW$T$24	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$24, DW_AT_name("U3_0")
	.dwattr $C$DW$T$24, DW_AT_declaration
	.dwendtag $C$DW$T$24

	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$125	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A0")
	.dwattr $C$DW$125, DW_AT_location[DW_OP_reg0]
$C$DW$126	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A1")
	.dwattr $C$DW$126, DW_AT_location[DW_OP_reg1]
$C$DW$127	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A2")
	.dwattr $C$DW$127, DW_AT_location[DW_OP_reg2]
$C$DW$128	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A3")
	.dwattr $C$DW$128, DW_AT_location[DW_OP_reg3]
$C$DW$129	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A4")
	.dwattr $C$DW$129, DW_AT_location[DW_OP_reg4]
$C$DW$130	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A5")
	.dwattr $C$DW$130, DW_AT_location[DW_OP_reg5]
$C$DW$131	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A6")
	.dwattr $C$DW$131, DW_AT_location[DW_OP_reg6]
$C$DW$132	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A7")
	.dwattr $C$DW$132, DW_AT_location[DW_OP_reg7]
$C$DW$133	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A8")
	.dwattr $C$DW$133, DW_AT_location[DW_OP_reg8]
$C$DW$134	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A9")
	.dwattr $C$DW$134, DW_AT_location[DW_OP_reg9]
$C$DW$135	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A10")
	.dwattr $C$DW$135, DW_AT_location[DW_OP_reg10]
$C$DW$136	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A11")
	.dwattr $C$DW$136, DW_AT_location[DW_OP_reg11]
$C$DW$137	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A12")
	.dwattr $C$DW$137, DW_AT_location[DW_OP_reg12]
$C$DW$138	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A13")
	.dwattr $C$DW$138, DW_AT_location[DW_OP_reg13]
$C$DW$139	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A14")
	.dwattr $C$DW$139, DW_AT_location[DW_OP_reg14]
$C$DW$140	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A15")
	.dwattr $C$DW$140, DW_AT_location[DW_OP_reg15]
$C$DW$141	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B0")
	.dwattr $C$DW$141, DW_AT_location[DW_OP_reg16]
$C$DW$142	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B1")
	.dwattr $C$DW$142, DW_AT_location[DW_OP_reg17]
$C$DW$143	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B2")
	.dwattr $C$DW$143, DW_AT_location[DW_OP_reg18]
$C$DW$144	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B3")
	.dwattr $C$DW$144, DW_AT_location[DW_OP_reg19]
$C$DW$145	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B4")
	.dwattr $C$DW$145, DW_AT_location[DW_OP_reg20]
$C$DW$146	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B5")
	.dwattr $C$DW$146, DW_AT_location[DW_OP_reg21]
$C$DW$147	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B6")
	.dwattr $C$DW$147, DW_AT_location[DW_OP_reg22]
$C$DW$148	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B7")
	.dwattr $C$DW$148, DW_AT_location[DW_OP_reg23]
$C$DW$149	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B8")
	.dwattr $C$DW$149, DW_AT_location[DW_OP_reg24]
$C$DW$150	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B9")
	.dwattr $C$DW$150, DW_AT_location[DW_OP_reg25]
$C$DW$151	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B10")
	.dwattr $C$DW$151, DW_AT_location[DW_OP_reg26]
$C$DW$152	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B11")
	.dwattr $C$DW$152, DW_AT_location[DW_OP_reg27]
$C$DW$153	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B12")
	.dwattr $C$DW$153, DW_AT_location[DW_OP_reg28]
$C$DW$154	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B13")
	.dwattr $C$DW$154, DW_AT_location[DW_OP_reg29]
$C$DW$155	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DP")
	.dwattr $C$DW$155, DW_AT_location[DW_OP_reg30]
$C$DW$156	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SP")
	.dwattr $C$DW$156, DW_AT_location[DW_OP_reg31]
$C$DW$157	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FP")
	.dwattr $C$DW$157, DW_AT_location[DW_OP_regx 0x20]
$C$DW$158	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC")
	.dwattr $C$DW$158, DW_AT_location[DW_OP_regx 0x21]
$C$DW$159	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IRP")
	.dwattr $C$DW$159, DW_AT_location[DW_OP_regx 0x22]
$C$DW$160	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IFR")
	.dwattr $C$DW$160, DW_AT_location[DW_OP_regx 0x23]
$C$DW$161	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NRP")
	.dwattr $C$DW$161, DW_AT_location[DW_OP_regx 0x24]
$C$DW$162	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A16")
	.dwattr $C$DW$162, DW_AT_location[DW_OP_regx 0x25]
$C$DW$163	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A17")
	.dwattr $C$DW$163, DW_AT_location[DW_OP_regx 0x26]
$C$DW$164	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A18")
	.dwattr $C$DW$164, DW_AT_location[DW_OP_regx 0x27]
$C$DW$165	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A19")
	.dwattr $C$DW$165, DW_AT_location[DW_OP_regx 0x28]
$C$DW$166	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A20")
	.dwattr $C$DW$166, DW_AT_location[DW_OP_regx 0x29]
$C$DW$167	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A21")
	.dwattr $C$DW$167, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$168	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A22")
	.dwattr $C$DW$168, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$169	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A23")
	.dwattr $C$DW$169, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$170	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A24")
	.dwattr $C$DW$170, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$171	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A25")
	.dwattr $C$DW$171, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$172	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A26")
	.dwattr $C$DW$172, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$173	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A27")
	.dwattr $C$DW$173, DW_AT_location[DW_OP_regx 0x30]
$C$DW$174	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A28")
	.dwattr $C$DW$174, DW_AT_location[DW_OP_regx 0x31]
$C$DW$175	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A29")
	.dwattr $C$DW$175, DW_AT_location[DW_OP_regx 0x32]
$C$DW$176	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A30")
	.dwattr $C$DW$176, DW_AT_location[DW_OP_regx 0x33]
$C$DW$177	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A31")
	.dwattr $C$DW$177, DW_AT_location[DW_OP_regx 0x34]
$C$DW$178	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B16")
	.dwattr $C$DW$178, DW_AT_location[DW_OP_regx 0x35]
$C$DW$179	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B17")
	.dwattr $C$DW$179, DW_AT_location[DW_OP_regx 0x36]
$C$DW$180	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B18")
	.dwattr $C$DW$180, DW_AT_location[DW_OP_regx 0x37]
$C$DW$181	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B19")
	.dwattr $C$DW$181, DW_AT_location[DW_OP_regx 0x38]
$C$DW$182	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B20")
	.dwattr $C$DW$182, DW_AT_location[DW_OP_regx 0x39]
$C$DW$183	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B21")
	.dwattr $C$DW$183, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$184	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B22")
	.dwattr $C$DW$184, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$185	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B23")
	.dwattr $C$DW$185, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$186	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B24")
	.dwattr $C$DW$186, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$187	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B25")
	.dwattr $C$DW$187, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$188	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B26")
	.dwattr $C$DW$188, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$189	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B27")
	.dwattr $C$DW$189, DW_AT_location[DW_OP_regx 0x40]
$C$DW$190	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B28")
	.dwattr $C$DW$190, DW_AT_location[DW_OP_regx 0x41]
$C$DW$191	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B29")
	.dwattr $C$DW$191, DW_AT_location[DW_OP_regx 0x42]
$C$DW$192	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B30")
	.dwattr $C$DW$192, DW_AT_location[DW_OP_regx 0x43]
$C$DW$193	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B31")
	.dwattr $C$DW$193, DW_AT_location[DW_OP_regx 0x44]
$C$DW$194	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("AMR")
	.dwattr $C$DW$194, DW_AT_location[DW_OP_regx 0x45]
$C$DW$195	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CSR")
	.dwattr $C$DW$195, DW_AT_location[DW_OP_regx 0x46]
$C$DW$196	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISR")
	.dwattr $C$DW$196, DW_AT_location[DW_OP_regx 0x47]
$C$DW$197	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ICR")
	.dwattr $C$DW$197, DW_AT_location[DW_OP_regx 0x48]
$C$DW$198	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IER")
	.dwattr $C$DW$198, DW_AT_location[DW_OP_regx 0x49]
$C$DW$199	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISTP")
	.dwattr $C$DW$199, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$200	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IN")
	.dwattr $C$DW$200, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$201	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OUT")
	.dwattr $C$DW$201, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$202	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ACR")
	.dwattr $C$DW$202, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$203	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ADR")
	.dwattr $C$DW$203, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$204	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FADCR")
	.dwattr $C$DW$204, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$205	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FAUCR")
	.dwattr $C$DW$205, DW_AT_location[DW_OP_regx 0x50]
$C$DW$206	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FMCR")
	.dwattr $C$DW$206, DW_AT_location[DW_OP_regx 0x51]
$C$DW$207	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GFPGFR")
	.dwattr $C$DW$207, DW_AT_location[DW_OP_regx 0x52]
$C$DW$208	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DIER")
	.dwattr $C$DW$208, DW_AT_location[DW_OP_regx 0x53]
$C$DW$209	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("REP")
	.dwattr $C$DW$209, DW_AT_location[DW_OP_regx 0x54]
$C$DW$210	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCL")
	.dwattr $C$DW$210, DW_AT_location[DW_OP_regx 0x55]
$C$DW$211	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCH")
	.dwattr $C$DW$211, DW_AT_location[DW_OP_regx 0x56]
$C$DW$212	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ARP")
	.dwattr $C$DW$212, DW_AT_location[DW_OP_regx 0x57]
$C$DW$213	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ILC")
	.dwattr $C$DW$213, DW_AT_location[DW_OP_regx 0x58]
$C$DW$214	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RILC")
	.dwattr $C$DW$214, DW_AT_location[DW_OP_regx 0x59]
$C$DW$215	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DNUM")
	.dwattr $C$DW$215, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$216	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SSR")
	.dwattr $C$DW$216, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$217	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYA")
	.dwattr $C$DW$217, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$218	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYB")
	.dwattr $C$DW$218, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$219	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSR")
	.dwattr $C$DW$219, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$220	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ITSR")
	.dwattr $C$DW$220, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$221	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NTSR")
	.dwattr $C$DW$221, DW_AT_location[DW_OP_regx 0x60]
$C$DW$222	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("EFR")
	.dwattr $C$DW$222, DW_AT_location[DW_OP_regx 0x61]
$C$DW$223	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ECR")
	.dwattr $C$DW$223, DW_AT_location[DW_OP_regx 0x62]
$C$DW$224	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IERR")
	.dwattr $C$DW$224, DW_AT_location[DW_OP_regx 0x63]
$C$DW$225	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DMSG")
	.dwattr $C$DW$225, DW_AT_location[DW_OP_regx 0x64]
$C$DW$226	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CMSG")
	.dwattr $C$DW$226, DW_AT_location[DW_OP_regx 0x65]
$C$DW$227	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_ADDR")
	.dwattr $C$DW$227, DW_AT_location[DW_OP_regx 0x66]
$C$DW$228	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_DATA")
	.dwattr $C$DW$228, DW_AT_location[DW_OP_regx 0x67]
$C$DW$229	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_CNTL")
	.dwattr $C$DW$229, DW_AT_location[DW_OP_regx 0x68]
$C$DW$230	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCU_CNTL")
	.dwattr $C$DW$230, DW_AT_location[DW_OP_regx 0x69]
$C$DW$231	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_REC_CNTL")
	.dwattr $C$DW$231, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$232	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_XMT_CNTL")
	.dwattr $C$DW$232, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$233	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_CFG")
	.dwattr $C$DW$233, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$234	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RDATA")
	.dwattr $C$DW$234, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$235	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WDATA")
	.dwattr $C$DW$235, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$236	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RADDR")
	.dwattr $C$DW$236, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$237	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WADDR")
	.dwattr $C$DW$237, DW_AT_location[DW_OP_regx 0x70]
$C$DW$238	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("MFREG0")
	.dwattr $C$DW$238, DW_AT_location[DW_OP_regx 0x71]
$C$DW$239	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DBG_STAT")
	.dwattr $C$DW$239, DW_AT_location[DW_OP_regx 0x72]
$C$DW$240	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("BRK_EN")
	.dwattr $C$DW$240, DW_AT_location[DW_OP_regx 0x73]
$C$DW$241	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0_CNT")
	.dwattr $C$DW$241, DW_AT_location[DW_OP_regx 0x74]
$C$DW$242	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0")
	.dwattr $C$DW$242, DW_AT_location[DW_OP_regx 0x75]
$C$DW$243	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP1")
	.dwattr $C$DW$243, DW_AT_location[DW_OP_regx 0x76]
$C$DW$244	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP2")
	.dwattr $C$DW$244, DW_AT_location[DW_OP_regx 0x77]
$C$DW$245	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP3")
	.dwattr $C$DW$245, DW_AT_location[DW_OP_regx 0x78]
$C$DW$246	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OVERLAY")
	.dwattr $C$DW$246, DW_AT_location[DW_OP_regx 0x79]
$C$DW$247	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC_PROF")
	.dwattr $C$DW$247, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$248	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ATSR")
	.dwattr $C$DW$248, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$249	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TRR")
	.dwattr $C$DW$249, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$250	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCRR")
	.dwattr $C$DW$250, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$251	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DESR")
	.dwattr $C$DW$251, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$252	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DETR")
	.dwattr $C$DW$252, DW_AT_location[DW_OP_regx 0x7f]
$C$DW$253	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CIE_RETA")
	.dwattr $C$DW$253, DW_AT_location[DW_OP_regx 0xe4]
	.dwendtag $C$DW$CU

