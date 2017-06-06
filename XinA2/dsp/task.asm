;******************************************************************************
;* TMS320C6x C/C++ Codegen                                       Unix v6.1.17 *
;* Date/Time created: Tue Jun  6 21:50:02 2017                                *
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
;*   Memory Aliases    : Presume not aliases (optimistic)                     *
;*   Debug Info        : DWARF Debug for Program Analysis w/Optimization      *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss


$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("task.c")
	.dwattr $C$DW$CU, DW_AT_producer("TMS320C6x C/C++ Codegen Unix v6.1.17 Copyright (c) 1996-2010 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/data/home/in4342-10/XinA2/dsp")
;*****************************************************************************
;* CINIT RECORDS                                                             *
;*****************************************************************************
	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_command+0,32
	.field  	1000,32			; _command @ 0

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_count$1+0,32
	.field  	0,32			; _count$1 @ 0


$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("memcpy")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("_memcpy")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$3)
$C$DW$3	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$42)
$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$43)
	.dwendtag $C$DW$1


$C$DW$5	.dwtag  DW_TAG_subprogram, DW_AT_name("MEM_free")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("_MEM_free")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
$C$DW$6	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$22)
$C$DW$7	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$45)
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$43)
	.dwendtag $C$DW$5


$C$DW$9	.dwtag  DW_TAG_subprogram, DW_AT_name("MEM_valloc")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("_MEM_valloc")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$9, DW_AT_declaration
	.dwattr $C$DW$9, DW_AT_external
$C$DW$10	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$22)
$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$43)
$C$DW$12	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$43)
$C$DW$13	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$46)
	.dwendtag $C$DW$9


$C$DW$14	.dwtag  DW_TAG_subprogram, DW_AT_name("SEM_pend")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("_SEM_pend")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$14, DW_AT_declaration
	.dwattr $C$DW$14, DW_AT_external
$C$DW$15	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$58)
$C$DW$16	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$78)
	.dwendtag $C$DW$14


$C$DW$17	.dwtag  DW_TAG_subprogram, DW_AT_name("SEM_post")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("_SEM_post")
	.dwattr $C$DW$17, DW_AT_declaration
	.dwattr $C$DW$17, DW_AT_external
$C$DW$18	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$58)
	.dwendtag $C$DW$17


$C$DW$19	.dwtag  DW_TAG_subprogram, DW_AT_name("_SEM_dopost")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("__SEM_dopost")
	.dwattr $C$DW$19, DW_AT_declaration
	.dwattr $C$DW$19, DW_AT_external
$C$DW$20	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$58)
	.dwendtag $C$DW$19


$C$DW$21	.dwtag  DW_TAG_subprogram, DW_AT_name("NOTIFY_register")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("_NOTIFY_register")
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$21, DW_AT_declaration
	.dwattr $C$DW$21, DW_AT_external
$C$DW$22	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$37)
$C$DW$23	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$37)
$C$DW$24	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$37)
$C$DW$25	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$64)
$C$DW$26	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$45)
	.dwendtag $C$DW$21


$C$DW$27	.dwtag  DW_TAG_subprogram, DW_AT_name("NOTIFY_unregister")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("_NOTIFY_unregister")
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$27, DW_AT_declaration
	.dwattr $C$DW$27, DW_AT_external
$C$DW$28	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$37)
$C$DW$29	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$37)
$C$DW$30	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$37)
$C$DW$31	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$64)
$C$DW$32	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$3)
	.dwendtag $C$DW$27


$C$DW$33	.dwtag  DW_TAG_subprogram, DW_AT_name("NOTIFY_notify")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("_NOTIFY_notify")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$33, DW_AT_declaration
	.dwattr $C$DW$33, DW_AT_external
$C$DW$34	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$37)
$C$DW$35	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$37)
$C$DW$36	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$37)
$C$DW$37	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$37)
	.dwendtag $C$DW$33


$C$DW$38	.dwtag  DW_TAG_subprogram, DW_AT_name("BCACHE_inv")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("_BCACHE_inv")
	.dwattr $C$DW$38, DW_AT_declaration
	.dwattr $C$DW$38, DW_AT_external
$C$DW$39	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$45)
$C$DW$40	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$43)
$C$DW$41	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$65)
	.dwendtag $C$DW$38


$C$DW$42	.dwtag  DW_TAG_subprogram, DW_AT_name("BCACHE_wbInv")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("_BCACHE_wbInv")
	.dwattr $C$DW$42, DW_AT_declaration
	.dwattr $C$DW$42, DW_AT_external
$C$DW$43	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$45)
$C$DW$44	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$43)
$C$DW$45	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$65)
	.dwendtag $C$DW$42


$C$DW$46	.dwtag  DW_TAG_subprogram, DW_AT_name("malloc")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("_malloc")
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$46, DW_AT_declaration
	.dwattr $C$DW$46, DW_AT_external
$C$DW$47	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$43)
	.dwendtag $C$DW$46


$C$DW$48	.dwtag  DW_TAG_subprogram, DW_AT_name("free")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("_free")
	.dwattr $C$DW$48, DW_AT_declaration
	.dwattr $C$DW$48, DW_AT_external
$C$DW$49	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$3)
	.dwendtag $C$DW$48

$C$DW$50	.dwtag  DW_TAG_variable, DW_AT_name("DDR2")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("_DDR2")
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$50, DW_AT_declaration
	.dwattr $C$DW$50, DW_AT_external
$C$DW$51	.dwtag  DW_TAG_variable, DW_AT_name("MPCSXFER_BufferSize")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("_MPCSXFER_BufferSize")
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$51, DW_AT_declaration
	.dwattr $C$DW$51, DW_AT_external
	.global	_bin_width
_bin_width:	.usect	".far",4,4
$C$DW$52	.dwtag  DW_TAG_variable, DW_AT_name("bin_width")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("_bin_width")
	.dwattr $C$DW$52, DW_AT_location[DW_OP_addr _bin_width]
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$52, DW_AT_external
	.global	_cfg
_cfg:	.usect	".far",12,4
$C$DW$53	.dwtag  DW_TAG_variable, DW_AT_name("cfg")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("_cfg")
	.dwattr $C$DW$53, DW_AT_location[DW_OP_addr _cfg]
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$53, DW_AT_external
	.global	_scale
	.sect	".const"
	.align	4
_scale:
	.field  	16,32			; _scale @ 0

$C$DW$54	.dwtag  DW_TAG_variable, DW_AT_name("scale")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("_scale")
	.dwattr $C$DW$54, DW_AT_location[DW_OP_addr _scale]
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$97)
	.dwattr $C$DW$54, DW_AT_external
	.global	_buf
_buf:	.usect	".far",4,4
$C$DW$55	.dwtag  DW_TAG_variable, DW_AT_name("buf")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("_buf")
	.dwattr $C$DW$55, DW_AT_location[DW_OP_addr _buf]
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$71)
	.dwattr $C$DW$55, DW_AT_external
	.global	_length
_length:	.usect	".far",4,4
$C$DW$56	.dwtag  DW_TAG_variable, DW_AT_name("length")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("_length")
	.dwattr $C$DW$56, DW_AT_location[DW_OP_addr _length]
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$56, DW_AT_external
	.global	_command
_command:	.usect	".far",4,4
$C$DW$57	.dwtag  DW_TAG_variable, DW_AT_name("command")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("_command")
	.dwattr $C$DW$57, DW_AT_location[DW_OP_addr _command]
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$57, DW_AT_external
	.global	_target_region
_target_region:	.usect	".far",16,4
$C$DW$58	.dwtag  DW_TAG_variable, DW_AT_name("target_region")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("_target_region")
	.dwattr $C$DW$58, DW_AT_location[DW_OP_addr _target_region]
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$58, DW_AT_external
	.global	_rows
_rows:	.usect	".far",4,4
$C$DW$59	.dwtag  DW_TAG_variable, DW_AT_name("rows")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("_rows")
	.dwattr $C$DW$59, DW_AT_location[DW_OP_addr _rows]
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$59, DW_AT_external
	.global	_cols
_cols:	.usect	".far",4,4
$C$DW$60	.dwtag  DW_TAG_variable, DW_AT_name("cols")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("_cols")
	.dwattr $C$DW$60, DW_AT_location[DW_OP_addr _cols]
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$60, DW_AT_external
_count$1:	.usect	".far",4,4
;	/data/bbToolChain/usr/local/share/c6000/bin/opt6x /tmp/09860SxCScF /tmp/09860kkL2hF 
	.sect	".text"
	.clink

$C$DW$61	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_notify")
	.dwattr $C$DW$61, DW_AT_low_pc(_Task_notify)
	.dwattr $C$DW$61, DW_AT_high_pc(0x00)
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("_Task_notify")
	.dwattr $C$DW$61, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$61, DW_AT_TI_begin_line(0x13a)
	.dwattr $C$DW$61, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$61, DW_AT_frame_base[DW_OP_breg31 8]
	.dwattr $C$DW$61, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 315,column 1,is_stmt,address _Task_notify
$C$DW$62	.dwtag  DW_TAG_formal_parameter, DW_AT_name("eventNo")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("_eventNo")
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$62, DW_AT_location[DW_OP_reg4]
$C$DW$63	.dwtag  DW_TAG_formal_parameter, DW_AT_name("arg")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("_arg")
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$63, DW_AT_location[DW_OP_reg20]
$C$DW$64	.dwtag  DW_TAG_formal_parameter, DW_AT_name("info")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("_info")
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$64, DW_AT_location[DW_OP_reg6]

;******************************************************************************
;* FUNCTION NAME: Task_notify                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,*
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24, *
;*                           A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20, *
;*                           B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31      *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                    *
;******************************************************************************
_Task_notify:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S1     _count$1,A4
           MVKH    .S1     _count$1,A4
           LDW     .D1T1   *A4,A3            ; |321| 
           MVKL    .S2     _SEM_post,B5      ; |325| 
           MVKH    .S2     _SEM_post,B5      ; |325| 
           MVKL    .S1     _buf,A5
           MVKH    .S1     _buf,A5
           ADD     .L1     1,A3,A3           ; |321| 

           CMPEQ   .L1     A3,2,A0           ; |327| 
||         STW     .D1T1   A3,*A4            ; |321| 
||         ADD     .S1X    4,B4,A4           ; |325| 

           CMPEQ   .L2X    A3,1,B0           ; |323| 

   [ B0]   B       .S1     $C$L2             ; |323| 
|| [ B0]   ZERO    .L1     A0                ; |333| nullify predicate
|| [!B0]   MVKL    .S2     _length,B6
|| [ B0]   STW     .D1T1   A6,*A5            ; |324| 

   [ A0]   B       .S2     $C$L1             ; |327| 
|| [!B0]   MVKL    .S1     _command,A5
|| [!B0]   ADD     .L1X    4,B4,A4           ; |333| 

   [!B0]   MVKL    .S2     _SEM_post,B5      ; |333| 
|| [!B0]   MVKL    .S1     _SEM_post,A3      ; |329| 

$C$DW$65	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$65, DW_AT_low_pc(0x00)
	.dwattr $C$DW$65, DW_AT_name("_SEM_post")
	.dwattr $C$DW$65, DW_AT_TI_call
	.dwattr $C$DW$65, DW_AT_TI_return

   [ B0]   CALLRET .S2     B5                ; |325| 
|| [!B0]   MVKH    .S1     _SEM_post,A3      ; |329| 

   [!B0]   MVKH    .S2     _SEM_post,B5      ; |333| 
|| [!B0]   MVKH    .S1     _command,A5

   [!B0]   MVKH    .S2     _length,B6
           ; BRANCHCC OCCURS {$C$L2}         ; |323| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
$C$DW$66	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$66, DW_AT_low_pc(0x00)
	.dwattr $C$DW$66, DW_AT_name("_SEM_post")
	.dwattr $C$DW$66, DW_AT_TI_call
	.dwattr $C$DW$66, DW_AT_TI_return
   [!A0]   CALLRET .S2     B5                ; |333| 
           ; BRANCHCC OCCURS {$C$L1}         ; |327| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           STW     .D1T1   A6,*A5            ; |332| 
           NOP             4
$C$RL0:    ; CALL-RETURN OCCURS {_SEM_post} {0}  ; |333| 
;** --------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 6
$C$DW$67	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$67, DW_AT_low_pc(0x00)
	.dwattr $C$DW$67, DW_AT_name("_SEM_post")
	.dwattr $C$DW$67, DW_AT_TI_call
	.dwattr $C$DW$67, DW_AT_TI_return
           CALLRET .S2X    A3                ; |329| 
           ADD     .L1X    4,B4,A4           ; |329| 
           STW     .D2T1   A6,*B6            ; |328| 
           NOP             3
$C$RL1:    ; CALL-RETURN OCCURS {_SEM_post} {0}  ; |329| 
;** --------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 3
	.dwpsn	file "task.c",line 335,column 3,is_stmt
           NOP             3
$C$RL2:    ; CALL-RETURN OCCURS {_SEM_post} {0}  ; |325| 
	.dwattr $C$DW$61, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$61, DW_AT_TI_end_line(0x14f)
	.dwattr $C$DW$61, DW_AT_TI_end_column(0x03)
	.dwendtag $C$DW$61

	.sect	".text"
	.clink
	.global	_MeanShift_Init

$C$DW$68	.dwtag  DW_TAG_subprogram, DW_AT_name("MeanShift_Init")
	.dwattr $C$DW$68, DW_AT_low_pc(_MeanShift_Init)
	.dwattr $C$DW$68, DW_AT_high_pc(0x00)
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("_MeanShift_Init")
	.dwattr $C$DW$68, DW_AT_external
	.dwattr $C$DW$68, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$68, DW_AT_TI_begin_line(0x155)
	.dwattr $C$DW$68, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$68, DW_AT_frame_base[DW_OP_breg31 0]
	.dwattr $C$DW$68, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 341,column 23,is_stmt,address _MeanShift_Init

;******************************************************************************
;* FUNCTION NAME: MeanShift_Init                                              *
;*                                                                            *
;*   Regs Modified     : A3,A4,A5,B4,B5                                       *
;*   Regs Used         : A3,A4,A5,B3,B4,B5                                    *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_MeanShift_Init:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
$C$DW$69	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$69, DW_AT_low_pc(0x00)
	.dwattr $C$DW$69, DW_AT_TI_return

           RET     .S2     B3                ; |346| 
||         MVKL    .S1     _cfg+8,A3

           MVKH    .S1     _cfg+8,A3

           MVK     .S2     8,B4
||         MVKL    .S1     _bin_width,A4

           SUB     .L2X    A3,B4,B4
||         MVKH    .S1     _bin_width,A4
||         MVK     .L1     8,A5              ; |342| 
||         MVK     .S2     16,B5             ; |343| 

           ADD     .L2     4,B4,B4
||         MVK     .S2     256,B5            ; |344| 
||         MVK     .S1     16,A3             ; |345| 
||         STW     .D2T2   B5,*B4            ; |343| 
||         STW     .D1T1   A5,*A3            ; |342| 

	.dwpsn	file "task.c",line 346,column 1,is_stmt

           STW     .D2T2   B5,*B4            ; |344| 
||         STW     .D1T1   A3,*A4            ; |345| 

           ; BRANCH OCCURS {B3}              ; |346| 
	.dwattr $C$DW$68, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$68, DW_AT_TI_end_line(0x15a)
	.dwattr $C$DW$68, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$68

	.sect	".text"
	.clink
	.global	_SquareRootRounded

$C$DW$70	.dwtag  DW_TAG_subprogram, DW_AT_name("SquareRootRounded")
	.dwattr $C$DW$70, DW_AT_low_pc(_SquareRootRounded)
	.dwattr $C$DW$70, DW_AT_high_pc(0x00)
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("_SquareRootRounded")
	.dwattr $C$DW$70, DW_AT_external
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$70, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$70, DW_AT_TI_begin_line(0x3c)
	.dwattr $C$DW$70, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$70, DW_AT_frame_base[DW_OP_breg31 8]
	.dwattr $C$DW$70, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 61,column 1,is_stmt,address _SquareRootRounded
$C$DW$71	.dwtag  DW_TAG_formal_parameter, DW_AT_name("x")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("_x")
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$71, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: SquareRootRounded                                           *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24, *
;*                           A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20, *
;*                           B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24, *
;*                           A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20, *
;*                           B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31      *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                    *
;******************************************************************************
_SquareRootRounded:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           ZERO    .L1     A1
||         STW     .D2T2   B3,*SP--(8)       ; |61| 

           SET     .S1     A1,0x1e,0x1e,A1
           ADD     .L1     -1,A1,A3
           CMPGTU  .L1     A4,A3,A0          ; |69| 

   [ A0]   BNOP    .S1     $C$L6,3           ; |69| 
|| [!A0]   MV      .L1     A1,A3
|| [!A0]   MVK     .L2     0x1,B0

   [!A0]   SHRU    .S1     A3,2,A3           ; |69| (P) <0,0> 
   [!A0]   CMPGTU  .L1     A3,A4,A0          ; |69| (P) <0,1> 
           ; BRANCHCC OCCURS {$C$L6}         ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           DINT                              ; interrupts off
||         SHRU    .S1     A3,2,A5           ; |69| (P) <1,0> 
|| [!A0]   ZERO    .L2     B0                ; |69| (P) <0,2> 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 69
;*      Loop opening brace source line   : 70
;*      Loop closing brace source line   : 72
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 2
;*      Unpartitioned Resource Bound     : 1
;*      Partitioned Resource Bound(*)    : 1
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1*       0     
;*      .S units                     1*       1*    
;*      .D units                     0        0     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          1        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1*       1*    
;*      Bound(.L .S .D .LS .LSD)     1*       1*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 2  Schedule found with 5 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |   ***                          |*                               |
;*       1: |*  ***                          |*                               |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 4
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 3
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 7 + trip_cnt * 2        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MVK             0x1,B0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C78:
;*   0              SHRU    .S1     A5,2,A5           ; |69| 
;*   1              CMPGTU  .L1     A5,A4,A0          ; |69| 
;*     ||   [ B0]   MV      .S1     A5,A3             ; |69| 
;*   2      [!A0]   ZERO    .L2     B0                ; |69| 
;*   3      [ B0]   B       .S2     $C$C78            ; |69| 
;*   4              NOP             5
;*   9              ; BRANCHCC OCCURS {$C$C78}        ; |69| 
;*
;*       RESTORE CODE
;*
;*                  MV              A3,A5
;*----------------------------------------------------------------------------*
$C$L3:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 4

   [ B0]   B       .S2     $C$L4             ; |69| (P) <0,3> 
|| [ B0]   MV      .S1     A5,A3             ; |69| (P) <1,1> 
||         CMPGTU  .L1     A5,A4,A0          ; |69| (P) <1,1> 

   [!A0]   ZERO    .L2     B0                ; |69| (P) <1,2> 
||         SHRU    .S1     A5,2,A5           ; |69| (P) <2,0> 

   [ B0]   B       .S2     $C$L4             ; |69| (P) <1,3> 
|| [ B0]   MV      .S1     A5,A3             ; |69| (P) <2,1> 
||         CMPGTU  .L1     A5,A4,A0          ; |69| (P) <2,1> 

	.dwpsn	file "task.c",line 69,column 0,is_stmt

   [!A0]   ZERO    .L2     B0                ; |69| (P) <2,2> 
||         SHRU    .S1     A5,2,A5           ; |69| (P) <3,0> 

;** --------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP KERNEL
$C$DW$L$_SquareRootRounded$4$B:
	.dwpsn	file "task.c",line 70,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 2

   [ B0]   B       .S2     $C$L4             ; |69| <2,3> 
|| [ B0]   MV      .S1     A5,A3             ; |69| <3,1> 
||         CMPGTU  .L1     A5,A4,A0          ; |69| <3,1> 

	.dwpsn	file "task.c",line 72,column 0,is_stmt

   [!A0]   ZERO    .L2     B0                ; |69| <3,2> 
||         SHRU    .S1     A5,2,A5           ; |69| <4,0> 

$C$DW$L$_SquareRootRounded$4$E:
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L1     A3,A1
||         RINT                              ; interrupts on

;** --------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 6

   [!A1]   B       .S1     $C$L10            ; |74| 
||         ZERO    .L1     A3                ; |64| 
|| [ A1]   MV      .L2X    A1,B1

   [ A1]   MV      .L2X    A4,B6
   [ A1]   MV      .L2X    A3,B7
   [ A1]   ADD     .L2X    A1,B7,B4          ; |76| 
   [ A1]   CMPLTU  .L2X    A4,B4,B0          ; |76| 

   [ A1]   SUB     .L2X    A4,B7,B8          ; |78| 
|| [!B0]   ADDAH   .D2     B7,B1,B7          ; |79| (P) <0,2>  ^ 

           ; BRANCHCC OCCURS {$C$L10}        ; |74| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           SHRU    .S2     B1,2,B1           ; |82| (P) <0,2> 
||         MVK     .L1     0x1,A0
|| [!B0]   SUB     .L2X    B8,A1,B6          ; |78| 

           SHRU    .S2     B7,1,B7           ; |74| (P) <0,3>  ^ 
|| [!B1]   MV      .L1     A3,A0             ; |82| 
||         MV      .L2     B6,B4             ; |82| (P) <0,3> 

           ADD     .L2     B1,B7,B9          ; |76| (P) <1,0>  ^ 
||         DINT                              ; interrupts off

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 74
;*      Loop opening brace source line   : 75
;*      Loop closing brace source line   : 83
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 4
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 3
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        1     
;*      .S units                     1        2     
;*      .D units                     0        1     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          1        5     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        2     
;*      Bound(.L .S .D .LS .LSD)     1        3*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 4  Schedule found with 3 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*                               | *  ****                        |
;*       1: |*                               | *  ****                        |
;*       2: |*                               | *  ******                      |
;*       3: |*                               |**  *****                       |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 2
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 3
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 7 + trip_cnt * 4        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MVK             0x1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C54:
;*   0              ADD     .D2     B1,B7,B9          ; |76|  ^ 
;*     ||           SUB     .L2     B6,B7,B8          ; |78| 
;*   1              CMPLTU  .L2     B6,B9,B0          ; |76|  ^ 
;*   2      [!B0]   SUB     .L2     B8,B1,B6          ; |78| 
;*     ||   [!B0]   ADDAH   .D2     B7,B1,B7          ; |79|  ^ 
;*     ||           SHRU    .S2     B1,2,B1           ; |82| 
;*   3              SHRU    .S2     B7,1,B7           ; |74|  ^ 
;*     ||   [ A0]   MV      .L2     B6,B4             ; |82| 
;*   4      [ A0]   MV      .S2     B7,B5             ; |82| 
;*     ||   [!B1]   ZERO    .L1     A0                ; |82| 
;*   5      [ A0]   B       .S1     $C$C54            ; |82| 
;*   6              NOP             5
;*  11              ; BRANCHCC OCCURS {$C$C54}        ; |82| 
;*
;*       RESTORE CODE
;*
;*                  MV              B4,B6
;*                  MV              B5,B7
;*----------------------------------------------------------------------------*
$C$L7:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 2

           MV      .S2     B7,B5             ; |82| (P) <0,4> 
||         SUB     .D2     B6,B7,B8          ; |78| (P) <1,0> 
|| [ A0]   B       .S1     $C$L8             ; |82| (P) <0,5> 
||         CMPLTU  .L2     B6,B9,B0          ; |76| (P) <1,1>  ^ 

	.dwpsn	file "task.c",line 74,column 0,is_stmt

   [!B0]   SUB     .L2     B8,B1,B6          ; |78| (P) <1,2> 
||         SHRU    .S2     B1,2,B1           ; |82| (P) <1,2> 
|| [!B0]   ADDAH   .D2     B7,B1,B7          ; |79| (P) <1,2>  ^ 

;** --------------------------------------------------------------------------*
$C$L8:    ; PIPED LOOP KERNEL
$C$DW$L$_SquareRootRounded$10$B:
	.dwpsn	file "task.c",line 75,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 4

   [ A0]   MV      .L2     B6,B4             ; |82| <1,3> 
||         SHRU    .S2     B7,1,B7           ; |74| <1,3>  ^ 

   [ A0]   MV      .S2     B7,B5             ; |82| <1,4> 
|| [!B1]   ZERO    .L1     A0                ; |82| <1,4> 
||         SUB     .L2     B6,B7,B8          ; |78| <2,0> 
||         ADD     .D2     B1,B7,B9          ; |76| <2,0>  ^ 

   [ A0]   B       .S1     $C$L8             ; |82| <1,5> 
||         CMPLTU  .L2     B6,B9,B0          ; |76| <2,1>  ^ 

	.dwpsn	file "task.c",line 83,column 0,is_stmt

   [!B0]   SUB     .L2     B8,B1,B6          ; |78| <2,2> 
||         SHRU    .S2     B1,2,B1           ; |82| <2,2> 
|| [!B0]   ADDAH   .D2     B7,B1,B7          ; |79| <2,2>  ^ 

$C$DW$L$_SquareRootRounded$10$E:
;** --------------------------------------------------------------------------*
$C$L9:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MV      .L1X    B5,A3

           RINT                              ; interrupts on
||         MV      .L1X    B4,A4

;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     __fltuf,B4        ; |86| 
           MVKH    .S2     __fltuf,B4        ; |86| 
$C$DW$72	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$72, DW_AT_low_pc(0x00)
	.dwattr $C$DW$72, DW_AT_name("__fltuf")
	.dwattr $C$DW$72, DW_AT_TI_call
           CALL    .S2     B4                ; |86| 
           CMPGTU  .L1     A4,A3,A4          ; |86| 
           ADDKPC  .S2     $C$RL3,B3,2       ; |86| 
           ADD     .L1     A3,A4,A4          ; |86| 
$C$RL3:    ; CALL OCCURS {__fltuf} {0}       ; |86| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVKL    .S1     __mpyf,A3         ; |86| 
           MVKH    .S1     __mpyf,A3         ; |86| 
           ZERO    .L2     B4
$C$DW$73	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$73, DW_AT_low_pc(0x00)
	.dwattr $C$DW$73, DW_AT_name("__mpyf")
	.dwattr $C$DW$73, DW_AT_TI_call
           CALL    .S2X    A3                ; |86| 
           MVKH    .S2     0x41800000,B4
           ADDKPC  .S2     $C$RL4,B3,3       ; |86| 
$C$RL4:    ; CALL OCCURS {__mpyf} {0}        ; |86| 
           MVKL    .S1     __fixfu,A3        ; |86| 
           MVKH    .S1     __fixfu,A3        ; |86| 
           LDW     .D2T2   *++SP(8),B3       ; |94| 
$C$DW$74	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$74, DW_AT_low_pc(0x00)
	.dwattr $C$DW$74, DW_AT_name("__fixfu")
	.dwattr $C$DW$74, DW_AT_TI_call
	.dwattr $C$DW$74, DW_AT_TI_return
           CALLRET .S2X    A3                ; |86| 
	.dwpsn	file "task.c",line 94,column 1,is_stmt
           NOP             5
$C$RL5:    ; CALL-RETURN OCCURS {__fixfu} {0}  ; |86| 

$C$DW$75	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$75, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L8:1:1496785802")
	.dwattr $C$DW$75, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$75, DW_AT_TI_begin_line(0x4a)
	.dwattr $C$DW$75, DW_AT_TI_end_line(0x53)
$C$DW$76	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$76, DW_AT_low_pc($C$DW$L$_SquareRootRounded$10$B)
	.dwattr $C$DW$76, DW_AT_high_pc($C$DW$L$_SquareRootRounded$10$E)
	.dwendtag $C$DW$75


$C$DW$77	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$77, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L4:1:1496785802")
	.dwattr $C$DW$77, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$77, DW_AT_TI_begin_line(0x45)
	.dwattr $C$DW$77, DW_AT_TI_end_line(0x48)
$C$DW$78	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$78, DW_AT_low_pc($C$DW$L$_SquareRootRounded$4$B)
	.dwattr $C$DW$78, DW_AT_high_pc($C$DW$L$_SquareRootRounded$4$E)
	.dwendtag $C$DW$77

	.dwattr $C$DW$70, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$70, DW_AT_TI_end_line(0x5e)
	.dwattr $C$DW$70, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$70

	.sect	".text"
	.clink
	.global	_CalWeight

$C$DW$79	.dwtag  DW_TAG_subprogram, DW_AT_name("CalWeight")
	.dwattr $C$DW$79, DW_AT_low_pc(_CalWeight)
	.dwattr $C$DW$79, DW_AT_high_pc(0x00)
	.dwattr $C$DW$79, DW_AT_TI_symbol_name("_CalWeight")
	.dwattr $C$DW$79, DW_AT_external
	.dwattr $C$DW$79, DW_AT_type(*$C$DW$T$93)
	.dwattr $C$DW$79, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$79, DW_AT_TI_begin_line(0x15c)
	.dwattr $C$DW$79, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$79, DW_AT_frame_base[DW_OP_breg31 80]
	.dwattr $C$DW$79, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 350,column 1,is_stmt,address _CalWeight
$C$DW$80	.dwtag  DW_TAG_formal_parameter, DW_AT_name("bgr_planes")
	.dwattr $C$DW$80, DW_AT_TI_symbol_name("_bgr_planes")
	.dwattr $C$DW$80, DW_AT_type(*$C$DW$T$72)
	.dwattr $C$DW$80, DW_AT_location[DW_OP_reg4]
$C$DW$81	.dwtag  DW_TAG_formal_parameter, DW_AT_name("target_model")
	.dwattr $C$DW$81, DW_AT_TI_symbol_name("_target_model")
	.dwattr $C$DW$81, DW_AT_type(*$C$DW$T$93)
	.dwattr $C$DW$81, DW_AT_location[DW_OP_reg20]
$C$DW$82	.dwtag  DW_TAG_formal_parameter, DW_AT_name("target_candidate")
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("_target_candidate")
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$93)
	.dwattr $C$DW$82, DW_AT_location[DW_OP_reg6]
$C$DW$83	.dwtag  DW_TAG_formal_parameter, DW_AT_name("rec")
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("_rec")
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$113)
	.dwattr $C$DW$83, DW_AT_location[DW_OP_reg22]
$C$DW$84	.dwtag  DW_TAG_formal_parameter, DW_AT_name("data")
	.dwattr $C$DW$84, DW_AT_TI_symbol_name("_data")
	.dwattr $C$DW$84, DW_AT_type(*$C$DW$T$93)
	.dwattr $C$DW$84, DW_AT_location[DW_OP_reg8]

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
;*   Local Frame Size  : 0 Args + 24 Auto + 56 Save = 80 byte                 *
;******************************************************************************
_CalWeight:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13

           STW     .D2T1   A11,*SP--(8)      ; |350| 
||         MV      .L1     A8,A0             ; |350| 

           STW     .D2T1   A10,*SP--(8)      ; |350| 

           STDW    .D2T2   B13:B12,*SP--     ; |350| 
||         MV      .L2     B4,B12            ; |350| 
||         MV      .S2X    A8,B4             ; |350| 

           STDW    .D2T2   B11:B10,*SP--     ; |350| 

           STDW    .D2T1   A15:A14,*SP--     ; |350| 
||         MV      .L1     A4,A14            ; |350| 

           STDW    .D2T1   A13:A12,*SP--     ; |350| 
           STW     .D2T2   B3,*SP--(32)      ; |350| 

           LDW     .D2T2   *+B6(4),B5        ; |353| 
|| [!A0]   B       .S1     $C$L39            ; |362| 

           STW     .D2T2   B4,*+SP(4)        ; |353| 
   [ A0]   LDW     .D2T2   *B6,B4            ; |366| 
           ZERO    .L1     A4                ; |362| 
           MV      .L1     A6,A12            ; |350| 
           STW     .D2T2   B5,*+SP(8)        ; |353| 
           ; BRANCHCC OCCURS {$C$L39}        ; |362| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MV      .L1     A4,A15            ; |366| 

           CMPGT   .L2     B4,0,B0           ; |366| 
||         STW     .D2T2   B4,*+SP(12)       ; |367| 

   [!B0]   BNOP    .S1     $C$L38,5          ; |366| 
|| [ B0]   LDW     .D2T2   *+SP(8),B4

           ; BRANCHCC OCCURS {$C$L38}        ; |366| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L11
;** --------------------------------------------------------------------------*
$C$L11:    
$C$DW$L$_CalWeight$3$B:
	.dwpsn	file "task.c",line 366,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 7

           CMPGT   .L2     B4,0,B0           ; |367| 
||         MV      .L1X    B4,A5

   [!B0]   B       .S1     $C$L37            ; |367| 
|| [ B0]   LDW     .D1T1   *A14,A3
||         MPY32   .M1     A5,A15,A4
|| [ B0]   MVKL    .S2     _bin_width,B6
|| [ B0]   ZERO    .L1     A30
|| [ B0]   LDW     .D2T2   *+SP(4),B31

   [ B0]   MVKH    .S2     _bin_width,B6
   [ B0]   LDW     .D1T1   *+A14(8),A6
   [ B0]   LDW     .D2T2   *B6,B13
   [ B0]   LDW     .D1T2   *+A14(4),B5

           ADD     .L1     A4,A3,A7
||         SET     .S1     A30,0x1e,0x1e,A3

           ; BRANCHCC OCCURS {$C$L37}        ; |367| 
$C$DW$L$_CalWeight$3$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$4$B:
;          EXCLUSIVE CPU CYCLES: 5

           ADDAD   .D2     B12,16,B4
||         ADD     .L1     -1,A3,A10
||         MVKL    .S1     __divi,A3         ; |63| 
||         ADDAD   .D1     A12,16,A31

           MVKH    .S1     __divi,A3         ; |63| 
||         STW     .D2T1   A5,*+SP(16)
||         SUB     .L1     A7,1,A13
||         ADD     .D1     A4,A6,A11

           MV      .L1X    B4,A5             ; Define a twin register
||         MV      .L2X    A4,B4
||         STW     .D2T1   A31,*+SP(20)

$C$DW$85	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$85, DW_AT_low_pc(0x00)
	.dwattr $C$DW$85, DW_AT_name("__divi")
	.dwattr $C$DW$85, DW_AT_TI_call

           CALL    .S2X    A3                ; |63| 
||         STW     .D2T1   A5,*+SP(24)

	.dwpsn	file "task.c",line 367,column 0,is_stmt

           ADDAW   .D2     B31,B4,B10
||         ADD     .L2X    A4,B5,B11
||         LDBU    .D1T1   *++A13,A4         ; |63| 
||         MV      .S2     B13,B4            ; |63| 

$C$DW$L$_CalWeight$4$E:
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L12
;** --------------------------------------------------------------------------*
$C$L12:    
$C$DW$L$_CalWeight$5$B:
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL6,B3,3       ; |63| 
$C$RL6:    ; CALL OCCURS {__divi} {0}        ; |63| 
$C$DW$L$_CalWeight$5$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$6$B:
;          EXCLUSIVE CPU CYCLES: 9
           MV      .L2X    A4,B4             ; |63| Define a twin register

           LDW     .D2T2   *+B12[B4],B4      ; |63| 
||         MVKL    .S2     __divi,B5         ; |63| 

           MVKH    .S2     __divi,B5         ; |63| 
$C$DW$86	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$86, DW_AT_low_pc(0x00)
	.dwattr $C$DW$86, DW_AT_name("__divi")
	.dwattr $C$DW$86, DW_AT_TI_call

           CALL    .S2     B5                ; |63| 
||         LDW     .D1T1   *+A12[A4],A3      ; |63| 

           ADDKPC  .S2     $C$RL7,B3,1       ; |63| 
           SHL     .S2     B4,7,B4           ; |63| 
           NOP             1

           MV      .L1X    B4,A4             ; |63| 
||         ADD     .L2X    1,A3,B4           ; |63| 

$C$RL7:    ; CALL OCCURS {__divi} {0}        ; |63| 
$C$DW$L$_CalWeight$6$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$7$B:
;          EXCLUSIVE CPU CYCLES: 8

           SHL     .S1     A4,9,A5           ; |63| 
||         ZERO    .L2     B1

           CMPGTU  .L1     A5,A10,A0         ; |69| 
||         SET     .S2     B1,0x1e,0x1e,B1

   [ A0]   BNOP    .S1     $C$L16,2          ; |69| 
|| [!A0]   MVK     .L2     0x1,B0

   [!A0]   MV      .L1X    B1,A3
   [!A0]   SHRU    .S1     A3,2,A3           ; |69| (P) <0,0> 
   [!A0]   CMPGTU  .L1     A3,A5,A0          ; |69| (P) <0,1> 
           ; BRANCHCC OCCURS {$C$L16}        ; |69| 
$C$DW$L$_CalWeight$7$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$8$B:
;          EXCLUSIVE CPU CYCLES: 1

           DINT                              ; interrupts off
||         SHRU    .S1     A3,2,A4           ; |69| (P) <1,0> 
|| [!A0]   ZERO    .L2     B0                ; |69| (P) <0,2> 

$C$DW$L$_CalWeight$8$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 69
;*      Loop opening brace source line   : 70
;*      Loop closing brace source line   : 72
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 2
;*      Unpartitioned Resource Bound     : 1
;*      Partitioned Resource Bound(*)    : 1
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1*       0     
;*      .S units                     1*       1*    
;*      .D units                     0        0     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          1        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1*       1*    
;*      Bound(.L .S .D .LS .LSD)     1*       1*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 2  Schedule found with 5 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |   ***                          |*                               |
;*       1: |*  ***                          |*                               |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 4
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 3
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 7 + trip_cnt * 2        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MVK             0x1,B0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C305:
;*   0              SHRU    .S1     A4,2,A4           ; |69| 
;*   1              CMPGTU  .L1     A4,A5,A0          ; |69| 
;*     ||   [ B0]   MV      .S1     A4,A3             ; |69| 
;*   2      [!A0]   ZERO    .L2     B0                ; |69| 
;*   3      [ B0]   B       .S2     $C$C305           ; |69| 
;*   4              NOP             5
;*   9              ; BRANCHCC OCCURS {$C$C305}       ; |69| 
;*
;*       RESTORE CODE
;*
;*                  MV              A3,A4
;*----------------------------------------------------------------------------*
$C$L13:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 4

   [ B0]   B       .S2     $C$L14            ; |69| (P) <0,3> 
|| [ B0]   MV      .S1     A4,A3             ; |69| (P) <1,1> 
||         CMPGTU  .L1     A4,A5,A0          ; |69| (P) <1,1> 

   [!A0]   ZERO    .L2     B0                ; |69| (P) <1,2> 
||         SHRU    .S1     A4,2,A4           ; |69| (P) <2,0> 

   [ B0]   B       .S2     $C$L14            ; |69| (P) <1,3> 
|| [ B0]   MV      .S1     A4,A3             ; |69| (P) <2,1> 
||         CMPGTU  .L1     A4,A5,A0          ; |69| (P) <2,1> 

	.dwpsn	file "task.c",line 69,column 0,is_stmt

   [!A0]   ZERO    .L2     B0                ; |69| (P) <2,2> 
||         SHRU    .S1     A4,2,A4           ; |69| (P) <3,0> 

;** --------------------------------------------------------------------------*
$C$L14:    ; PIPED LOOP KERNEL
$C$DW$L$_CalWeight$10$B:
	.dwpsn	file "task.c",line 70,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 2

   [ B0]   B       .S2     $C$L14            ; |69| <2,3> 
|| [ B0]   MV      .S1     A4,A3             ; |69| <3,1> 
||         CMPGTU  .L1     A4,A5,A0          ; |69| <3,1> 

	.dwpsn	file "task.c",line 72,column 0,is_stmt

   [!A0]   ZERO    .L2     B0                ; |69| <3,2> 
||         SHRU    .S1     A4,2,A4           ; |69| <4,0> 

$C$DW$L$_CalWeight$10$E:
;** --------------------------------------------------------------------------*
$C$L15:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$12$B:
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L2X    A3,B1
||         RINT                              ; interrupts on

$C$DW$L$_CalWeight$12$E:
;** --------------------------------------------------------------------------*
$C$L16:    
$C$DW$L$_CalWeight$13$B:
;          EXCLUSIVE CPU CYCLES: 6

   [!B1]   BNOP    .S1     $C$L20,1          ; |74| 
||         ZERO    .L1     A3                ; |64| 
|| [ B1]   MV      .L2X    A5,B7

   [ B1]   ADD     .L2X    B1,A3,B4          ; |76| 
   [ B1]   CMPLTU  .L2X    A5,B4,B0          ; |76| 
   [ B1]   MV      .L2X    A3,B6

   [ B1]   SUB     .L2X    A5,B6,B8          ; |78| 
|| [!B0]   ADDAH   .D2     B6,B1,B6          ; |79| (P) <0,2>  ^ 

           ; BRANCHCC OCCURS {$C$L20}        ; |74| 
$C$DW$L$_CalWeight$13$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$14$B:
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .L1     0x1,A0
||         SHRU    .S2     B1,2,B1           ; |82| (P) <0,2> 
|| [!B0]   SUB     .L2     B8,B1,B7          ; |78| (P) <0,2> 

           SHRU    .S2     B6,1,B6           ; |74| (P) <0,3>  ^ 
|| [!B1]   MV      .L1     A3,A0             ; |82| 
||         MV      .L2     B7,B5             ; |82| (P) <0,3> 

           ADD     .L2     B1,B6,B9          ; |76| (P) <1,0>  ^ 
||         DINT                              ; interrupts off

$C$DW$L$_CalWeight$14$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 74
;*      Loop opening brace source line   : 75
;*      Loop closing brace source line   : 83
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 4
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 3
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        1     
;*      .S units                     1        2     
;*      .D units                     0        1     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          1        5     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        2     
;*      Bound(.L .S .D .LS .LSD)     1        3*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 4  Schedule found with 3 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*                               | *  ****                        |
;*       1: |*                               | *  ****                        |
;*       2: |*                               | *  ******                      |
;*       3: |*                               |**  *****                       |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 2
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 3
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 7 + trip_cnt * 4        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MVK             0x1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C281:
;*   0              ADD     .D2     B1,B6,B9          ; |76|  ^ 
;*     ||           SUB     .L2     B7,B6,B8          ; |78| 
;*   1              CMPLTU  .L2     B7,B9,B0          ; |76|  ^ 
;*   2      [!B0]   SUB     .L2     B8,B1,B7          ; |78| 
;*     ||   [!B0]   ADDAH   .D2     B6,B1,B6          ; |79|  ^ 
;*     ||           SHRU    .S2     B1,2,B1           ; |82| 
;*   3              SHRU    .S2     B6,1,B6           ; |74|  ^ 
;*     ||   [ A0]   MV      .L2     B7,B5             ; |82| 
;*   4      [ A0]   MV      .S2     B6,B4             ; |82| 
;*     ||   [!B1]   ZERO    .L1     A0                ; |82| 
;*   5      [ A0]   B       .S1     $C$C281           ; |82| 
;*   6              NOP             5
;*  11              ; BRANCHCC OCCURS {$C$C281}       ; |82| 
;*
;*       RESTORE CODE
;*
;*                  MV              B4,B6
;*                  MV              B5,B7
;*----------------------------------------------------------------------------*
$C$L17:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 2

           MV      .S2     B6,B4             ; |82| (P) <0,4> 
||         SUB     .D2     B7,B6,B8          ; |78| (P) <1,0> 
|| [ A0]   B       .S1     $C$L18            ; |82| (P) <0,5> 
||         CMPLTU  .L2     B7,B9,B0          ; |76| (P) <1,1>  ^ 

	.dwpsn	file "task.c",line 74,column 0,is_stmt

   [!B0]   SUB     .L2     B8,B1,B7          ; |78| (P) <1,2> 
||         SHRU    .S2     B1,2,B1           ; |82| (P) <1,2> 
|| [!B0]   ADDAH   .D2     B6,B1,B6          ; |79| (P) <1,2>  ^ 

;** --------------------------------------------------------------------------*
$C$L18:    ; PIPED LOOP KERNEL
$C$DW$L$_CalWeight$16$B:
	.dwpsn	file "task.c",line 75,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 4

   [ A0]   MV      .L2     B7,B5             ; |82| <1,3> 
||         SHRU    .S2     B6,1,B6           ; |74| <1,3>  ^ 

   [ A0]   MV      .S2     B6,B4             ; |82| <1,4> 
|| [!B1]   ZERO    .L1     A0                ; |82| <1,4> 
||         SUB     .L2     B7,B6,B8          ; |78| <2,0> 
||         ADD     .D2     B1,B6,B9          ; |76| <2,0>  ^ 

   [ A0]   B       .S1     $C$L18            ; |82| <1,5> 
||         CMPLTU  .L2     B7,B9,B0          ; |76| <2,1>  ^ 

	.dwpsn	file "task.c",line 83,column 0,is_stmt

   [!B0]   SUB     .L2     B8,B1,B7          ; |78| <2,2> 
||         SHRU    .S2     B1,2,B1           ; |82| <2,2> 
|| [!B0]   ADDAH   .D2     B6,B1,B6          ; |79| <2,2>  ^ 

$C$DW$L$_CalWeight$16$E:
;** --------------------------------------------------------------------------*
$C$L19:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$18$B:
;          EXCLUSIVE CPU CYCLES: 2
           MV      .L1X    B5,A5

           RINT                              ; interrupts on
||         MV      .L1X    B4,A3

$C$DW$L$_CalWeight$18$E:
;** --------------------------------------------------------------------------*
$C$L20:    
$C$DW$L$_CalWeight$19$B:
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     __fltuf,A6        ; |63| 
           MVKH    .S1     __fltuf,A6        ; |63| 
           CMPGTU  .L1     A5,A3,A4          ; |63| 
$C$DW$87	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$87, DW_AT_low_pc(0x00)
	.dwattr $C$DW$87, DW_AT_name("__fltuf")
	.dwattr $C$DW$87, DW_AT_TI_call
           CALL    .S2X    A6                ; |63| 
           ADDKPC  .S2     $C$RL8,B3,3       ; |63| 
           ADD     .L1     A3,A4,A4          ; |63| 
$C$RL8:    ; CALL OCCURS {__fltuf} {0}       ; |63| 
$C$DW$L$_CalWeight$19$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$20$B:
;          EXCLUSIVE CPU CYCLES: 37
           MVKL    .S1     __mpyf,A3         ; |63| 
           MVKH    .S1     __mpyf,A3         ; |63| 
           ZERO    .L2     B4
$C$DW$88	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$88, DW_AT_low_pc(0x00)
	.dwattr $C$DW$88, DW_AT_name("__mpyf")
	.dwattr $C$DW$88, DW_AT_TI_call
           CALL    .S2X    A3                ; |63| 
           MVKH    .S2     0x41800000,B4
           ADDKPC  .S2     $C$RL9,B3,3       ; |63| 
$C$RL9:    ; CALL OCCURS {__mpyf} {0}        ; |63| 
           MVKL    .S1     __fixfu,A3        ; |63| 
           MVKH    .S1     __fixfu,A3        ; |63| 
           NOP             1
$C$DW$89	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$89, DW_AT_low_pc(0x00)
	.dwattr $C$DW$89, DW_AT_name("__fixfu")
	.dwattr $C$DW$89, DW_AT_TI_call
           CALL    .S2X    A3                ; |63| 
           ADDKPC  .S2     $C$RL10,B3,4      ; |63| 
$C$RL10:   ; CALL OCCURS {__fixfu} {0}       ; |63| 
           MVKL    .S2     __divi,B5         ; |63| 
           MVKH    .S2     __divi,B5         ; |63| 
$C$DW$90	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$90, DW_AT_low_pc(0x00)
	.dwattr $C$DW$90, DW_AT_name("__divi")
	.dwattr $C$DW$90, DW_AT_TI_call

           CALL    .S2     B5                ; |63| 
||         STW     .D2T1   A4,*B10           ; |375| 

           LDBU    .D2T1   *B11,A4           ; |63| 
           ADDKPC  .S2     $C$RL11,B3,2      ; |63| 
           MV      .L2     B13,B4            ; |63| 
$C$RL11:   ; CALL OCCURS {__divi} {0}        ; |63| 
           SHL     .S1     A4,2,A3           ; |63| 
           MVKL    .S1     __divi,A5         ; |63| 
           ADD     .L2X    B12,A3,B4         ; |63| 

           LDW     .D2T2   *+B4(64),B4       ; |63| 
||         MVKH    .S1     __divi,A5         ; |63| 

           ADD     .L1     A12,A3,A31        ; |63| 
$C$DW$91	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$91, DW_AT_low_pc(0x04)
	.dwattr $C$DW$91, DW_AT_name("__divi")
	.dwattr $C$DW$91, DW_AT_TI_call

           LDW     .D1T1   *+A31(64),A3      ; |63| 
||         CALL    .S2X    A5                ; |63| 

           ADDKPC  .S2     $C$RL12,B3,1      ; |63| 
           SHL     .S2     B4,7,B4           ; |63| 
           NOP             1

           MV      .L1X    B4,A4             ; |63| 
||         ADD     .L2X    1,A3,B4           ; |63| 

$C$RL12:   ; CALL OCCURS {__divi} {0}        ; |63| 
$C$DW$L$_CalWeight$20$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$21$B:
;          EXCLUSIVE CPU CYCLES: 8

           SHL     .S1     A4,9,A5           ; |63| 
||         ZERO    .L1     A1

           CMPGTU  .L1     A5,A10,A0         ; |69| 
||         SET     .S1     A1,0x1e,0x1e,A1

   [ A0]   BNOP    .S1     $C$L24,3          ; |69| 
|| [!A0]   MV      .L1     A1,A3
|| [!A0]   MVK     .L2     0x1,B0

   [!A0]   SHRU    .S1     A3,2,A3           ; |69| (P) <0,0> 
   [!A0]   CMPGTU  .L1     A3,A5,A0          ; |69| (P) <0,1> 
           ; BRANCHCC OCCURS {$C$L24}        ; |69| 
$C$DW$L$_CalWeight$21$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$22$B:
;          EXCLUSIVE CPU CYCLES: 1

           DINT                              ; interrupts off
||         SHRU    .S1     A3,2,A4           ; |69| (P) <1,0> 
|| [!A0]   ZERO    .L2     B0                ; |69| (P) <0,2> 

$C$DW$L$_CalWeight$22$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 69
;*      Loop opening brace source line   : 70
;*      Loop closing brace source line   : 72
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 2
;*      Unpartitioned Resource Bound     : 1
;*      Partitioned Resource Bound(*)    : 1
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1*       0     
;*      .S units                     1*       1*    
;*      .D units                     0        0     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          1        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1*       1*    
;*      Bound(.L .S .D .LS .LSD)     1*       1*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 2  Schedule found with 5 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |   ***                          |*                               |
;*       1: |*  ***                          |*                               |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 4
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 3
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 7 + trip_cnt * 2        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MVK             0x1,B0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C240:
;*   0              SHRU    .S1     A4,2,A4           ; |69| 
;*   1              CMPGTU  .L1     A4,A5,A0          ; |69| 
;*     ||   [ B0]   MV      .S1     A4,A3             ; |69| 
;*   2      [!A0]   ZERO    .L2     B0                ; |69| 
;*   3      [ B0]   B       .S2     $C$C240           ; |69| 
;*   4              NOP             5
;*   9              ; BRANCHCC OCCURS {$C$C240}       ; |69| 
;*
;*       RESTORE CODE
;*
;*                  MV              A3,A4
;*----------------------------------------------------------------------------*
$C$L21:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 4

   [ B0]   B       .S2     $C$L22            ; |69| (P) <0,3> 
|| [ B0]   MV      .S1     A4,A3             ; |69| (P) <1,1> 
||         CMPGTU  .L1     A4,A5,A0          ; |69| (P) <1,1> 

   [!A0]   ZERO    .L2     B0                ; |69| (P) <1,2> 
||         SHRU    .S1     A4,2,A4           ; |69| (P) <2,0> 

   [ B0]   B       .S2     $C$L22            ; |69| (P) <1,3> 
|| [ B0]   MV      .S1     A4,A3             ; |69| (P) <2,1> 
||         CMPGTU  .L1     A4,A5,A0          ; |69| (P) <2,1> 

	.dwpsn	file "task.c",line 69,column 0,is_stmt

   [!A0]   ZERO    .L2     B0                ; |69| (P) <2,2> 
||         SHRU    .S1     A4,2,A4           ; |69| (P) <3,0> 

;** --------------------------------------------------------------------------*
$C$L22:    ; PIPED LOOP KERNEL
$C$DW$L$_CalWeight$24$B:
	.dwpsn	file "task.c",line 70,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 2

   [ B0]   B       .S2     $C$L22            ; |69| <2,3> 
|| [ B0]   MV      .S1     A4,A3             ; |69| <3,1> 
||         CMPGTU  .L1     A4,A5,A0          ; |69| <3,1> 

	.dwpsn	file "task.c",line 72,column 0,is_stmt

   [!A0]   ZERO    .L2     B0                ; |69| <3,2> 
||         SHRU    .S1     A4,2,A4           ; |69| <4,0> 

$C$DW$L$_CalWeight$24$E:
;** --------------------------------------------------------------------------*
$C$L23:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$26$B:
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L1     A3,A1
||         RINT                              ; interrupts on

$C$DW$L$_CalWeight$26$E:
;** --------------------------------------------------------------------------*
$C$L24:    
$C$DW$L$_CalWeight$27$B:
;          EXCLUSIVE CPU CYCLES: 6

   [!A1]   B       .S1     $C$L28            ; |74| 
||         ZERO    .L1     A3                ; |64| 
|| [ A1]   MV      .L2X    A1,B1

   [ A1]   MV      .L2X    A5,B7
   [ A1]   MV      .L2X    A3,B6
   [ A1]   ADD     .L2X    A1,B6,B4          ; |76| 
   [ A1]   CMPLTU  .L2X    A5,B4,B0          ; |76| 

   [ A1]   SUB     .L2X    A5,B6,B8          ; |78| 
|| [!B0]   ADDAH   .D2     B6,B1,B6          ; |79| (P) <0,2>  ^ 

           ; BRANCHCC OCCURS {$C$L28}        ; |74| 
$C$DW$L$_CalWeight$27$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$28$B:
;          EXCLUSIVE CPU CYCLES: 3

           SHRU    .S2     B1,2,B1           ; |82| (P) <0,2> 
||         MVK     .L1     0x1,A0
|| [!B0]   SUB     .L2X    B8,A1,B7          ; |78| 

           SHRU    .S2     B6,1,B6           ; |74| (P) <0,3>  ^ 
|| [!B1]   MV      .L1     A3,A0             ; |82| 
||         MV      .L2     B7,B5             ; |82| (P) <0,3> 

           ADD     .L2     B1,B6,B9          ; |76| (P) <1,0>  ^ 
||         DINT                              ; interrupts off

$C$DW$L$_CalWeight$28$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 74
;*      Loop opening brace source line   : 75
;*      Loop closing brace source line   : 83
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 4
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 3
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        1     
;*      .S units                     1        2     
;*      .D units                     0        1     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          1        5     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        2     
;*      Bound(.L .S .D .LS .LSD)     1        3*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 4  Schedule found with 3 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*                               | *  ****                        |
;*       1: |*                               | *  ****                        |
;*       2: |*                               | *  ******                      |
;*       3: |*                               |**  *****                       |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 2
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 3
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 7 + trip_cnt * 4        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MVK             0x1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C216:
;*   0              ADD     .D2     B1,B6,B9          ; |76|  ^ 
;*     ||           SUB     .L2     B7,B6,B8          ; |78| 
;*   1              CMPLTU  .L2     B7,B9,B0          ; |76|  ^ 
;*   2      [!B0]   SUB     .L2     B8,B1,B7          ; |78| 
;*     ||   [!B0]   ADDAH   .D2     B6,B1,B6          ; |79|  ^ 
;*     ||           SHRU    .S2     B1,2,B1           ; |82| 
;*   3              SHRU    .S2     B6,1,B6           ; |74|  ^ 
;*     ||   [ A0]   MV      .L2     B7,B5             ; |82| 
;*   4      [ A0]   MV      .S2     B6,B4             ; |82| 
;*     ||   [!B1]   ZERO    .L1     A0                ; |82| 
;*   5      [ A0]   B       .S1     $C$C216           ; |82| 
;*   6              NOP             5
;*  11              ; BRANCHCC OCCURS {$C$C216}       ; |82| 
;*
;*       RESTORE CODE
;*
;*                  MV              B4,B6
;*                  MV              B5,B7
;*----------------------------------------------------------------------------*
$C$L25:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 2

           MV      .S2     B6,B4             ; |82| (P) <0,4> 
||         SUB     .D2     B7,B6,B8          ; |78| (P) <1,0> 
|| [ A0]   B       .S1     $C$L26            ; |82| (P) <0,5> 
||         CMPLTU  .L2     B7,B9,B0          ; |76| (P) <1,1>  ^ 

	.dwpsn	file "task.c",line 74,column 0,is_stmt

   [!B0]   SUB     .L2     B8,B1,B7          ; |78| (P) <1,2> 
||         SHRU    .S2     B1,2,B1           ; |82| (P) <1,2> 
|| [!B0]   ADDAH   .D2     B6,B1,B6          ; |79| (P) <1,2>  ^ 

;** --------------------------------------------------------------------------*
$C$L26:    ; PIPED LOOP KERNEL
$C$DW$L$_CalWeight$30$B:
	.dwpsn	file "task.c",line 75,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 4

   [ A0]   MV      .L2     B7,B5             ; |82| <1,3> 
||         SHRU    .S2     B6,1,B6           ; |74| <1,3>  ^ 

   [ A0]   MV      .S2     B6,B4             ; |82| <1,4> 
|| [!B1]   ZERO    .L1     A0                ; |82| <1,4> 
||         SUB     .L2     B7,B6,B8          ; |78| <2,0> 
||         ADD     .D2     B1,B6,B9          ; |76| <2,0>  ^ 

   [ A0]   B       .S1     $C$L26            ; |82| <1,5> 
||         CMPLTU  .L2     B7,B9,B0          ; |76| <2,1>  ^ 

	.dwpsn	file "task.c",line 83,column 0,is_stmt

   [!B0]   SUB     .L2     B8,B1,B7          ; |78| <2,2> 
||         SHRU    .S2     B1,2,B1           ; |82| <2,2> 
|| [!B0]   ADDAH   .D2     B6,B1,B6          ; |79| <2,2>  ^ 

$C$DW$L$_CalWeight$30$E:
;** --------------------------------------------------------------------------*
$C$L27:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$32$B:
;          EXCLUSIVE CPU CYCLES: 2
           MV      .L1X    B5,A5

           RINT                              ; interrupts on
||         MV      .L1X    B4,A3

$C$DW$L$_CalWeight$32$E:
;** --------------------------------------------------------------------------*
$C$L28:    
$C$DW$L$_CalWeight$33$B:
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     __fltuf,A6        ; |63| 
           MVKH    .S1     __fltuf,A6        ; |63| 
           CMPGTU  .L1     A5,A3,A4          ; |63| 
$C$DW$92	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$92, DW_AT_low_pc(0x00)
	.dwattr $C$DW$92, DW_AT_name("__fltuf")
	.dwattr $C$DW$92, DW_AT_TI_call
           CALL    .S2X    A6                ; |63| 
           ADDKPC  .S2     $C$RL13,B3,3      ; |63| 
           ADD     .L1     A3,A4,A4          ; |63| 
$C$RL13:   ; CALL OCCURS {__fltuf} {0}       ; |63| 
$C$DW$L$_CalWeight$33$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$34$B:
;          EXCLUSIVE CPU CYCLES: 45
           MVKL    .S2     __mpyf,B5         ; |63| 
           MVKH    .S2     __mpyf,B5         ; |63| 
$C$DW$93	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$93, DW_AT_low_pc(0x00)
	.dwattr $C$DW$93, DW_AT_name("__mpyf")
	.dwattr $C$DW$93, DW_AT_TI_call
           CALL    .S2     B5                ; |63| 
           ZERO    .L2     B4
           MVKH    .S2     0x41800000,B4
           ADDKPC  .S2     $C$RL14,B3,2      ; |63| 
$C$RL14:   ; CALL OCCURS {__mpyf} {0}        ; |63| 
           MVKL    .S1     __fixfu,A3        ; |63| 
           MVKH    .S1     __fixfu,A3        ; |63| 
           NOP             1
$C$DW$94	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$94, DW_AT_low_pc(0x00)
	.dwattr $C$DW$94, DW_AT_name("__fixfu")
	.dwattr $C$DW$94, DW_AT_TI_call
           CALL    .S2X    A3                ; |63| 
           ADDKPC  .S2     $C$RL15,B3,4      ; |63| 
$C$RL15:   ; CALL OCCURS {__fixfu} {0}       ; |63| 
           LDW     .D2T2   *B10,B4           ; |384| 
           SHR     .S1     A4,8,A3           ; |384| 
           MVKL    .S2     __divi,B5         ; |63| 
           MVKH    .S2     __divi,B5         ; |63| 
           MVKL    .S1     __divi,A5         ; |63| 
           SHR     .S2     B4,8,B4           ; |384| 
           MPY32   .M2X    A3,B4,B4          ; |384| 
           MVKH    .S1     __divi,A5         ; |63| 
           NOP             2
$C$DW$95	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$95, DW_AT_low_pc(0x04)
	.dwattr $C$DW$95, DW_AT_name("__divi")
	.dwattr $C$DW$95, DW_AT_TI_call

           STW     .D2T2   B4,*B10           ; |384| 
||         CALL    .S2     B5                ; |63| 

           LDBU    .D1T1   *A11,A4           ; |63| 
           MV      .L2     B13,B4            ; |63| 
           ADDKPC  .S2     $C$RL16,B3,2      ; |63| 
$C$RL16:   ; CALL OCCURS {__divi} {0}        ; |63| 
           LDW     .D2T1   *+SP(20),A3       ; |63| 
           LDW     .D2T1   *+SP(24),A31      ; |63| 
           NOP             3
           LDW     .D1T1   *+A3[A4],A6       ; |63| 
$C$DW$96	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$96, DW_AT_low_pc(0x04)
	.dwattr $C$DW$96, DW_AT_name("__divi")
	.dwattr $C$DW$96, DW_AT_TI_call

           LDW     .D1T1   *+A31[A4],A4      ; |63| 
||         CALL    .S2X    A5                ; |63| 

           ADDKPC  .S2     $C$RL17,B3,3      ; |63| 

           ADD     .L2X    1,A6,B4           ; |63| 
||         SHL     .S1     A4,7,A4           ; |63| 

$C$RL17:   ; CALL OCCURS {__divi} {0}        ; |63| 
$C$DW$L$_CalWeight$34$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$35$B:
;          EXCLUSIVE CPU CYCLES: 8

           SHL     .S1     A4,9,A5           ; |63| 
||         ZERO    .L2     B1

           CMPGTU  .L1     A5,A10,A0         ; |69| 
||         SET     .S2     B1,0x1e,0x1e,B1

   [ A0]   BNOP    .S1     $C$L32,2          ; |69| 
|| [!A0]   MVK     .L2     0x1,B0

   [!A0]   MV      .L1X    B1,A3
   [!A0]   SHRU    .S1     A3,2,A3           ; |69| (P) <0,0> 
   [!A0]   CMPGTU  .L1     A3,A5,A0          ; |69| (P) <0,1> 
           ; BRANCHCC OCCURS {$C$L32}        ; |69| 
$C$DW$L$_CalWeight$35$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$36$B:
;          EXCLUSIVE CPU CYCLES: 1

           DINT                              ; interrupts off
||         SHRU    .S1     A3,2,A4           ; |69| (P) <1,0> 
|| [!A0]   ZERO    .L2     B0                ; |69| (P) <0,2> 

$C$DW$L$_CalWeight$36$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 69
;*      Loop opening brace source line   : 70
;*      Loop closing brace source line   : 72
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 2
;*      Unpartitioned Resource Bound     : 1
;*      Partitioned Resource Bound(*)    : 1
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1*       0     
;*      .S units                     1*       1*    
;*      .D units                     0        0     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          1        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1*       1*    
;*      Bound(.L .S .D .LS .LSD)     1*       1*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 2  Schedule found with 5 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |   ***                          |*                               |
;*       1: |*  ***                          |*                               |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 4
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 3
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 7 + trip_cnt * 2        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MVK             0x1,B0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C175:
;*   0              SHRU    .S1     A4,2,A4           ; |69| 
;*   1              CMPGTU  .L1     A4,A5,A0          ; |69| 
;*     ||   [ B0]   MV      .S1     A4,A3             ; |69| 
;*   2      [!A0]   ZERO    .L2     B0                ; |69| 
;*   3      [ B0]   B       .S2     $C$C175           ; |69| 
;*   4              NOP             5
;*   9              ; BRANCHCC OCCURS {$C$C175}       ; |69| 
;*
;*       RESTORE CODE
;*
;*                  MV              A3,A4
;*----------------------------------------------------------------------------*
$C$L29:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 4

   [ B0]   B       .S2     $C$L30            ; |69| (P) <0,3> 
|| [ B0]   MV      .S1     A4,A3             ; |69| (P) <1,1> 
||         CMPGTU  .L1     A4,A5,A0          ; |69| (P) <1,1> 

   [!A0]   ZERO    .L2     B0                ; |69| (P) <1,2> 
||         SHRU    .S1     A4,2,A4           ; |69| (P) <2,0> 

   [ B0]   B       .S2     $C$L30            ; |69| (P) <1,3> 
|| [ B0]   MV      .S1     A4,A3             ; |69| (P) <2,1> 
||         CMPGTU  .L1     A4,A5,A0          ; |69| (P) <2,1> 

	.dwpsn	file "task.c",line 69,column 0,is_stmt

   [!A0]   ZERO    .L2     B0                ; |69| (P) <2,2> 
||         SHRU    .S1     A4,2,A4           ; |69| (P) <3,0> 

;** --------------------------------------------------------------------------*
$C$L30:    ; PIPED LOOP KERNEL
$C$DW$L$_CalWeight$38$B:
	.dwpsn	file "task.c",line 70,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 2

   [ B0]   B       .S2     $C$L30            ; |69| <2,3> 
|| [ B0]   MV      .S1     A4,A3             ; |69| <3,1> 
||         CMPGTU  .L1     A4,A5,A0          ; |69| <3,1> 

	.dwpsn	file "task.c",line 72,column 0,is_stmt

   [!A0]   ZERO    .L2     B0                ; |69| <3,2> 
||         SHRU    .S1     A4,2,A4           ; |69| <4,0> 

$C$DW$L$_CalWeight$38$E:
;** --------------------------------------------------------------------------*
$C$L31:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$40$B:
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L2X    A3,B1
||         RINT                              ; interrupts on

$C$DW$L$_CalWeight$40$E:
;** --------------------------------------------------------------------------*
$C$L32:    
$C$DW$L$_CalWeight$41$B:
;          EXCLUSIVE CPU CYCLES: 6

   [!B1]   BNOP    .S1     $C$L36,1          ; |74| 
||         ZERO    .L1     A3                ; |64| 
|| [ B1]   MV      .L2X    A5,B7

   [ B1]   ADD     .L2X    B1,A3,B4          ; |76| 
   [ B1]   CMPLTU  .L2X    A5,B4,B0          ; |76| 
   [ B1]   MV      .L2X    A3,B6

   [ B1]   SUB     .L2X    A5,B6,B8          ; |78| 
|| [!B0]   ADDAH   .D2     B6,B1,B6          ; |79| (P) <0,2>  ^ 

           ; BRANCHCC OCCURS {$C$L36}        ; |74| 
$C$DW$L$_CalWeight$41$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$42$B:
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .L1     0x1,A0
||         SHRU    .S2     B1,2,B1           ; |82| (P) <0,2> 
|| [!B0]   SUB     .L2     B8,B1,B7          ; |78| (P) <0,2> 

           SHRU    .S2     B6,1,B6           ; |74| (P) <0,3>  ^ 
|| [!B1]   MV      .L1     A3,A0             ; |82| 
||         MV      .L2     B7,B5             ; |82| (P) <0,3> 

           ADD     .L2     B1,B6,B9          ; |76| (P) <1,0>  ^ 
||         DINT                              ; interrupts off

$C$DW$L$_CalWeight$42$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 74
;*      Loop opening brace source line   : 75
;*      Loop closing brace source line   : 83
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 4
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 3
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        1     
;*      .S units                     1        2     
;*      .D units                     0        1     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          1        5     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        2     
;*      Bound(.L .S .D .LS .LSD)     1        3*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 4  Schedule found with 3 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*                               | *  ****                        |
;*       1: |*                               | *  ****                        |
;*       2: |*                               | *  ******                      |
;*       3: |*                               |**  *****                       |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 2
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 3
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 7 + trip_cnt * 4        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  MVK             0x1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C151:
;*   0              ADD     .D2     B1,B6,B9          ; |76|  ^ 
;*     ||           SUB     .L2     B7,B6,B8          ; |78| 
;*   1              CMPLTU  .L2     B7,B9,B0          ; |76|  ^ 
;*   2      [!B0]   SUB     .L2     B8,B1,B7          ; |78| 
;*     ||   [!B0]   ADDAH   .D2     B6,B1,B6          ; |79|  ^ 
;*     ||           SHRU    .S2     B1,2,B1           ; |82| 
;*   3              SHRU    .S2     B6,1,B6           ; |74|  ^ 
;*     ||   [ A0]   MV      .L2     B7,B5             ; |82| 
;*   4      [ A0]   MV      .S2     B6,B4             ; |82| 
;*     ||   [!B1]   ZERO    .L1     A0                ; |82| 
;*   5      [ A0]   B       .S1     $C$C151           ; |82| 
;*   6              NOP             5
;*  11              ; BRANCHCC OCCURS {$C$C151}       ; |82| 
;*
;*       RESTORE CODE
;*
;*                  MV              B4,B6
;*                  MV              B5,B7
;*----------------------------------------------------------------------------*
$C$L33:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 2

           MV      .S2     B6,B4             ; |82| (P) <0,4> 
||         SUB     .D2     B7,B6,B8          ; |78| (P) <1,0> 
|| [ A0]   B       .S1     $C$L34            ; |82| (P) <0,5> 
||         CMPLTU  .L2     B7,B9,B0          ; |76| (P) <1,1>  ^ 

	.dwpsn	file "task.c",line 74,column 0,is_stmt

   [!B0]   SUB     .L2     B8,B1,B7          ; |78| (P) <1,2> 
||         SHRU    .S2     B1,2,B1           ; |82| (P) <1,2> 
|| [!B0]   ADDAH   .D2     B6,B1,B6          ; |79| (P) <1,2>  ^ 

;** --------------------------------------------------------------------------*
$C$L34:    ; PIPED LOOP KERNEL
$C$DW$L$_CalWeight$44$B:
	.dwpsn	file "task.c",line 75,column 0,is_stmt
;          EXCLUSIVE CPU CYCLES: 4

   [ A0]   MV      .L2     B7,B5             ; |82| <1,3> 
||         SHRU    .S2     B6,1,B6           ; |74| <1,3>  ^ 

   [ A0]   MV      .S2     B6,B4             ; |82| <1,4> 
|| [!B1]   ZERO    .L1     A0                ; |82| <1,4> 
||         SUB     .L2     B7,B6,B8          ; |78| <2,0> 
||         ADD     .D2     B1,B6,B9          ; |76| <2,0>  ^ 

   [ A0]   B       .S1     $C$L34            ; |82| <1,5> 
||         CMPLTU  .L2     B7,B9,B0          ; |76| <2,1>  ^ 

	.dwpsn	file "task.c",line 83,column 0,is_stmt

   [!B0]   SUB     .L2     B8,B1,B7          ; |78| <2,2> 
||         SHRU    .S2     B1,2,B1           ; |82| <2,2> 
|| [!B0]   ADDAH   .D2     B6,B1,B6          ; |79| <2,2>  ^ 

$C$DW$L$_CalWeight$44$E:
;** --------------------------------------------------------------------------*
$C$L35:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$46$B:
;          EXCLUSIVE CPU CYCLES: 2
           MV      .L1X    B5,A5

           RINT                              ; interrupts on
||         MV      .L1X    B4,A3

$C$DW$L$_CalWeight$46$E:
;** --------------------------------------------------------------------------*
$C$L36:    
$C$DW$L$_CalWeight$47$B:
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     __fltuf,A6        ; |86| 
           MVKH    .S1     __fltuf,A6        ; |86| 
           CMPGTU  .L1     A5,A3,A4          ; |86| 
$C$DW$97	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$97, DW_AT_low_pc(0x00)
	.dwattr $C$DW$97, DW_AT_name("__fltuf")
	.dwattr $C$DW$97, DW_AT_TI_call
           CALL    .S2X    A6                ; |86| 
           ADDKPC  .S2     $C$RL18,B3,3      ; |86| 
           ADD     .L1     A3,A4,A4          ; |86| 
$C$RL18:   ; CALL OCCURS {__fltuf} {0}       ; |86| 
$C$DW$L$_CalWeight$47$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$48$B:
;          EXCLUSIVE CPU CYCLES: 17
           MVKL    .S2     __mpyf,B5         ; |86| 
           MVKH    .S2     __mpyf,B5         ; |86| 
$C$DW$98	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$98, DW_AT_low_pc(0x00)
	.dwattr $C$DW$98, DW_AT_name("__mpyf")
	.dwattr $C$DW$98, DW_AT_TI_call
           CALL    .S2     B5                ; |86| 
           ZERO    .L2     B4
           MVKH    .S2     0x41800000,B4
           ADDKPC  .S2     $C$RL19,B3,2      ; |86| 
$C$RL19:   ; CALL OCCURS {__mpyf} {0}        ; |86| 
           MVKL    .S1     __fixfu,A3        ; |86| 
           MVKH    .S1     __fixfu,A3        ; |86| 
           NOP             1
$C$DW$99	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$99, DW_AT_low_pc(0x00)
	.dwattr $C$DW$99, DW_AT_name("__fixfu")
	.dwattr $C$DW$99, DW_AT_TI_call
           CALL    .S2X    A3                ; |86| 
           ADDKPC  .S2     $C$RL20,B3,4      ; |86| 
$C$RL20:   ; CALL OCCURS {__fixfu} {0}       ; |86| 
$C$DW$L$_CalWeight$48$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_CalWeight$49$B:
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D2T2   *B10,B4           ; |393| 
           LDW     .D2T1   *+SP(16),A31
           SHR     .S1     A4,8,A3           ; |393| 
           ADD     .L2     1,B11,B11         ; |367| 
           ADD     .L1     1,A11,A11         ; |367| 
           SHR     .S2     B4,8,B4           ; |393| 

           MPY32   .M2X    A3,B4,B4          ; |393| 
||         SUB     .L1     A31,1,A0          ; |367| 

   [ A0]   BNOP    .S2     $C$L12,1          ; |367| 
|| [ A0]   MVKL    .S1     __divi,A3         ; |63| 

   [ A0]   MVKH    .S1     __divi,A3         ; |63| 

           STW     .D2T2   B4,*B10++         ; |393| 
|| [ A0]   MV      .L2     B13,B4            ; |63| 

$C$DW$100	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$100, DW_AT_low_pc(0x00)
	.dwattr $C$DW$100, DW_AT_name("__divi")
	.dwattr $C$DW$100, DW_AT_TI_call

   [ A0]   CALL    .S2X    A3                ; |63| 
||         STW     .D2T1   A0,*+SP(16)       ; |393| 

	.dwpsn	file "task.c",line 394,column 0,is_stmt
   [ A0]   LDBU    .D1T1   *++A13,A4         ; |63| 
           ; BRANCHCC OCCURS {$C$L12}        ; |367| 
$C$DW$L$_CalWeight$49$E:
;** --------------------------------------------------------------------------*
$C$L37:    
$C$DW$L$_CalWeight$50$B:
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(12),B4
           ADD     .L1     1,A15,A15         ; |366| 
           NOP             3

           SUB     .L1X    B4,1,A0           ; |366| 
||         SUB     .L2     B4,1,B4           ; |366| 

   [ A0]   B       .S1     $C$L11            ; |366| 
||         STW     .D2T2   B4,*+SP(12)       ; |366| 

           LDW     .D2T2   *+SP(8),B4
	.dwpsn	file "task.c",line 395,column 0,is_stmt
           NOP             4
           ; BRANCHCC OCCURS {$C$L11}        ; |366| 
$C$DW$L$_CalWeight$50$E:
;** --------------------------------------------------------------------------*
$C$L38:    
;          EXCLUSIVE CPU CYCLES: 1
           LDW     .D2T1   *+SP(4),A4
;** --------------------------------------------------------------------------*
$C$L39:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(32),B3      ; |398| 
           LDDW    .D2T1   *++SP,A13:A12     ; |398| 
           LDDW    .D2T1   *++SP,A15:A14     ; |398| 
           LDDW    .D2T2   *++SP,B11:B10     ; |398| 
           LDDW    .D2T2   *++SP,B13:B12     ; |398| 
$C$DW$101	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$101, DW_AT_low_pc(0x04)
	.dwattr $C$DW$101, DW_AT_TI_return

           LDW     .D2T1   *++SP(8),A10      ; |398| 
||         RET     .S2     B3                ; |398| 

           LDW     .D2T1   *++SP(8),A11      ; |398| 
	.dwpsn	file "task.c",line 398,column 1,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |398| 

$C$DW$102	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$102, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L11:1:1496785802")
	.dwattr $C$DW$102, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$102, DW_AT_TI_begin_line(0x16e)
	.dwattr $C$DW$102, DW_AT_TI_end_line(0x18b)
$C$DW$103	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$103, DW_AT_low_pc($C$DW$L$_CalWeight$3$B)
	.dwattr $C$DW$103, DW_AT_high_pc($C$DW$L$_CalWeight$3$E)
$C$DW$104	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$104, DW_AT_low_pc($C$DW$L$_CalWeight$4$B)
	.dwattr $C$DW$104, DW_AT_high_pc($C$DW$L$_CalWeight$4$E)
$C$DW$105	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$105, DW_AT_low_pc($C$DW$L$_CalWeight$50$B)
	.dwattr $C$DW$105, DW_AT_high_pc($C$DW$L$_CalWeight$50$E)

$C$DW$106	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$106, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L12:2:1496785802")
	.dwattr $C$DW$106, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$106, DW_AT_TI_begin_line(0x16f)
	.dwattr $C$DW$106, DW_AT_TI_end_line(0x18a)
$C$DW$107	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$107, DW_AT_low_pc($C$DW$L$_CalWeight$5$B)
	.dwattr $C$DW$107, DW_AT_high_pc($C$DW$L$_CalWeight$5$E)
$C$DW$108	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$108, DW_AT_low_pc($C$DW$L$_CalWeight$42$B)
	.dwattr $C$DW$108, DW_AT_high_pc($C$DW$L$_CalWeight$42$E)
$C$DW$109	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$109, DW_AT_low_pc($C$DW$L$_CalWeight$36$B)
	.dwattr $C$DW$109, DW_AT_high_pc($C$DW$L$_CalWeight$36$E)
$C$DW$110	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$110, DW_AT_low_pc($C$DW$L$_CalWeight$28$B)
	.dwattr $C$DW$110, DW_AT_high_pc($C$DW$L$_CalWeight$28$E)
$C$DW$111	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$111, DW_AT_low_pc($C$DW$L$_CalWeight$22$B)
	.dwattr $C$DW$111, DW_AT_high_pc($C$DW$L$_CalWeight$22$E)
$C$DW$112	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$112, DW_AT_low_pc($C$DW$L$_CalWeight$14$B)
	.dwattr $C$DW$112, DW_AT_high_pc($C$DW$L$_CalWeight$14$E)
$C$DW$113	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$113, DW_AT_low_pc($C$DW$L$_CalWeight$8$B)
	.dwattr $C$DW$113, DW_AT_high_pc($C$DW$L$_CalWeight$8$E)
$C$DW$114	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$114, DW_AT_low_pc($C$DW$L$_CalWeight$6$B)
	.dwattr $C$DW$114, DW_AT_high_pc($C$DW$L$_CalWeight$6$E)
$C$DW$115	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$115, DW_AT_low_pc($C$DW$L$_CalWeight$7$B)
	.dwattr $C$DW$115, DW_AT_high_pc($C$DW$L$_CalWeight$7$E)
$C$DW$116	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$116, DW_AT_low_pc($C$DW$L$_CalWeight$12$B)
	.dwattr $C$DW$116, DW_AT_high_pc($C$DW$L$_CalWeight$12$E)
$C$DW$117	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$117, DW_AT_low_pc($C$DW$L$_CalWeight$13$B)
	.dwattr $C$DW$117, DW_AT_high_pc($C$DW$L$_CalWeight$13$E)
$C$DW$118	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$118, DW_AT_low_pc($C$DW$L$_CalWeight$18$B)
	.dwattr $C$DW$118, DW_AT_high_pc($C$DW$L$_CalWeight$18$E)
$C$DW$119	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$119, DW_AT_low_pc($C$DW$L$_CalWeight$19$B)
	.dwattr $C$DW$119, DW_AT_high_pc($C$DW$L$_CalWeight$19$E)
$C$DW$120	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$120, DW_AT_low_pc($C$DW$L$_CalWeight$20$B)
	.dwattr $C$DW$120, DW_AT_high_pc($C$DW$L$_CalWeight$20$E)
$C$DW$121	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$121, DW_AT_low_pc($C$DW$L$_CalWeight$21$B)
	.dwattr $C$DW$121, DW_AT_high_pc($C$DW$L$_CalWeight$21$E)
$C$DW$122	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$122, DW_AT_low_pc($C$DW$L$_CalWeight$26$B)
	.dwattr $C$DW$122, DW_AT_high_pc($C$DW$L$_CalWeight$26$E)
$C$DW$123	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$123, DW_AT_low_pc($C$DW$L$_CalWeight$27$B)
	.dwattr $C$DW$123, DW_AT_high_pc($C$DW$L$_CalWeight$27$E)
$C$DW$124	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$124, DW_AT_low_pc($C$DW$L$_CalWeight$32$B)
	.dwattr $C$DW$124, DW_AT_high_pc($C$DW$L$_CalWeight$32$E)
$C$DW$125	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$125, DW_AT_low_pc($C$DW$L$_CalWeight$33$B)
	.dwattr $C$DW$125, DW_AT_high_pc($C$DW$L$_CalWeight$33$E)
$C$DW$126	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$126, DW_AT_low_pc($C$DW$L$_CalWeight$34$B)
	.dwattr $C$DW$126, DW_AT_high_pc($C$DW$L$_CalWeight$34$E)
$C$DW$127	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$127, DW_AT_low_pc($C$DW$L$_CalWeight$35$B)
	.dwattr $C$DW$127, DW_AT_high_pc($C$DW$L$_CalWeight$35$E)
$C$DW$128	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$128, DW_AT_low_pc($C$DW$L$_CalWeight$40$B)
	.dwattr $C$DW$128, DW_AT_high_pc($C$DW$L$_CalWeight$40$E)
$C$DW$129	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$129, DW_AT_low_pc($C$DW$L$_CalWeight$41$B)
	.dwattr $C$DW$129, DW_AT_high_pc($C$DW$L$_CalWeight$41$E)
$C$DW$130	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$130, DW_AT_low_pc($C$DW$L$_CalWeight$46$B)
	.dwattr $C$DW$130, DW_AT_high_pc($C$DW$L$_CalWeight$46$E)
$C$DW$131	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$131, DW_AT_low_pc($C$DW$L$_CalWeight$47$B)
	.dwattr $C$DW$131, DW_AT_high_pc($C$DW$L$_CalWeight$47$E)
$C$DW$132	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$132, DW_AT_low_pc($C$DW$L$_CalWeight$48$B)
	.dwattr $C$DW$132, DW_AT_high_pc($C$DW$L$_CalWeight$48$E)
$C$DW$133	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$133, DW_AT_low_pc($C$DW$L$_CalWeight$49$B)
	.dwattr $C$DW$133, DW_AT_high_pc($C$DW$L$_CalWeight$49$E)

$C$DW$134	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$134, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L34:3:1496785802")
	.dwattr $C$DW$134, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$134, DW_AT_TI_begin_line(0x4a)
	.dwattr $C$DW$134, DW_AT_TI_end_line(0x53)
$C$DW$135	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$135, DW_AT_low_pc($C$DW$L$_CalWeight$44$B)
	.dwattr $C$DW$135, DW_AT_high_pc($C$DW$L$_CalWeight$44$E)
	.dwendtag $C$DW$134


$C$DW$136	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$136, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L30:3:1496785802")
	.dwattr $C$DW$136, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$136, DW_AT_TI_begin_line(0x45)
	.dwattr $C$DW$136, DW_AT_TI_end_line(0x48)
$C$DW$137	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$137, DW_AT_low_pc($C$DW$L$_CalWeight$38$B)
	.dwattr $C$DW$137, DW_AT_high_pc($C$DW$L$_CalWeight$38$E)
	.dwendtag $C$DW$136


$C$DW$138	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$138, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L26:3:1496785802")
	.dwattr $C$DW$138, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$138, DW_AT_TI_begin_line(0x4a)
	.dwattr $C$DW$138, DW_AT_TI_end_line(0x53)
$C$DW$139	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$139, DW_AT_low_pc($C$DW$L$_CalWeight$30$B)
	.dwattr $C$DW$139, DW_AT_high_pc($C$DW$L$_CalWeight$30$E)
	.dwendtag $C$DW$138


$C$DW$140	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$140, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L22:3:1496785802")
	.dwattr $C$DW$140, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$140, DW_AT_TI_begin_line(0x45)
	.dwattr $C$DW$140, DW_AT_TI_end_line(0x48)
$C$DW$141	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$141, DW_AT_low_pc($C$DW$L$_CalWeight$24$B)
	.dwattr $C$DW$141, DW_AT_high_pc($C$DW$L$_CalWeight$24$E)
	.dwendtag $C$DW$140


$C$DW$142	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$142, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L18:3:1496785802")
	.dwattr $C$DW$142, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$142, DW_AT_TI_begin_line(0x4a)
	.dwattr $C$DW$142, DW_AT_TI_end_line(0x53)
$C$DW$143	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$143, DW_AT_low_pc($C$DW$L$_CalWeight$16$B)
	.dwattr $C$DW$143, DW_AT_high_pc($C$DW$L$_CalWeight$16$E)
	.dwendtag $C$DW$142


$C$DW$144	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$144, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L14:3:1496785802")
	.dwattr $C$DW$144, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$144, DW_AT_TI_begin_line(0x45)
	.dwattr $C$DW$144, DW_AT_TI_end_line(0x48)
$C$DW$145	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$145, DW_AT_low_pc($C$DW$L$_CalWeight$10$B)
	.dwattr $C$DW$145, DW_AT_high_pc($C$DW$L$_CalWeight$10$E)
	.dwendtag $C$DW$144

	.dwendtag $C$DW$106

	.dwendtag $C$DW$102

	.dwattr $C$DW$79, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$79, DW_AT_TI_end_line(0x18e)
	.dwattr $C$DW$79, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$79

	.sect	".text"
	.clink
	.global	_Task_execute

$C$DW$146	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_execute")
	.dwattr $C$DW$146, DW_AT_low_pc(_Task_execute)
	.dwattr $C$DW$146, DW_AT_high_pc(0x00)
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("_Task_execute")
	.dwattr $C$DW$146, DW_AT_external
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$146, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$146, DW_AT_TI_begin_line(0xb3)
	.dwattr $C$DW$146, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$146, DW_AT_frame_base[DW_OP_breg31 56]
	.dwattr $C$DW$146, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 180,column 1,is_stmt,address _Task_execute
$C$DW$147	.dwtag  DW_TAG_formal_parameter, DW_AT_name("info")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("_info")
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$88)
	.dwattr $C$DW$147, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: Task_execute                                                *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B13,SP,*
;*                           A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27, *
;*                           A28,A29,A30,A31,B16,B17,B18,B19,B20,B21,B22,B23, *
;*                           B24,B25,B26,B27,B28,B29,B30,B31                  *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B13,SP,*
;*                           A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27, *
;*                           A28,A29,A30,A31,B16,B17,B18,B19,B20,B21,B22,B23, *
;*                           B24,B25,B26,B27,B28,B29,B30,B31                  *
;*   Local Frame Size  : 0 Args + 16 Auto + 40 Save = 56 byte                 *
;******************************************************************************
_Task_execute:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           STW     .D2T2   B13,*SP--(8)      ; |180| 
           STDW    .D2T2   B11:B10,*SP--     ; |180| 

           STDW    .D2T1   A15:A14,*SP--     ; |180| 
||         MVKL    .S1     _bin_width,A3

           STDW    .D2T1   A13:A12,*SP--     ; |180| 
||         MVKH    .S1     _bin_width,A3
||         MVK     .S2     16,B5             ; |345| 

           STDW    .D2T1   A11:A10,*SP--     ; |180| 
||         STW     .D1T2   B5,*A3            ; |345| 
||         MVKL    .S1     _malloc,A3        ; |192| 

           MVKH    .S1     _malloc,A3        ; |192| 
           MV      .L1     A4,A11            ; |180| 
$C$DW$148	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$148, DW_AT_low_pc(0x04)
	.dwattr $C$DW$148, DW_AT_name("_malloc")
	.dwattr $C$DW$148, DW_AT_TI_call

           MVKL    .S1     _cfg+8,A4
||         CALL    .S2X    A3                ; |192| 

           MVKH    .S1     _cfg+8,A4
           MVK     .S2     8,B4

           SUB     .L2X    A4,B4,B4
||         SUB     .D2     SP,16,SP          ; |180| 

           STW     .D2T2   B5,*B4            ; |343| 
||         MVK     .S2     256,B5            ; |344| 
||         ADD     .L2     4,B4,B4
||         MVK     .S1     0x200,A12         ; |192| 
||         MVK     .L1     8,A5              ; |342| 

           STW     .D2T2   B5,*B4            ; |344| 
||         STW     .D1T1   A5,*A4            ; |342| 
||         MV      .L1     A12,A4            ; |192| 
||         MV      .L2     B3,B13            ; |180| 
||         ADDKPC  .S2     $C$RL21,B3,0      ; |192| 

$C$RL21:   ; CALL OCCURS {_malloc} {0}       ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _malloc,B4        ; |193| 
           MVKH    .S2     _malloc,B4        ; |193| 
$C$DW$149	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$149, DW_AT_low_pc(0x00)
	.dwattr $C$DW$149, DW_AT_name("_malloc")
	.dwattr $C$DW$149, DW_AT_TI_call
           CALL    .S2     B4                ; |193| 
           ADDKPC  .S2     $C$RL22,B3,3      ; |193| 

           MV      .L1     A4,A10            ; |192| 
||         MV      .L2X    A4,B10            ; |192| 
||         MV      .S1     A12,A4            ; |193| 

$C$RL22:   ; CALL OCCURS {_malloc} {0}       ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           MV      .L1     A4,A0             ; |193| 
||         ZERO    .L2     B4                ; |196| 
||         ZERO    .S1     A3                ; |196| 
||         MVKL    .S2     _command,B11
||         MV      .D1     A4,A15            ; |193| 

   [!A0]   MVK     .L2     0x1,B4            ; |196| 
||         MV      .L1X    B10,A0            ; |196| 
||         MVKL    .S2     _NOTIFY_notify,B5 ; |197| 
||         ZERO    .S1     A13               ; |198| 
||         MVK     .D1     0x1,A4            ; |197| 

           MVK     .L1     0x5,A6            ; |197| 
|| [!A0]   MVK     .S1     0x1,A3            ; |196| 

           OR      .L1X    B4,A3,A0          ; |196| 
||         MVKL    .S1     _NOTIFY_notify,A3 ; |202| 
||         MVKH    .S2     _NOTIFY_notify,B5 ; |197| 

   [!A0]   B       .S2     $C$L40            ; |196| 
||         MVKH    .S1     _NOTIFY_notify,A3 ; |202| 

$C$DW$150	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$150, DW_AT_low_pc(0x00)
	.dwattr $C$DW$150, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$150, DW_AT_TI_call
   [ A0]   CALL    .S2     B5                ; |197| 
$C$DW$151	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$151, DW_AT_low_pc(0x00)
	.dwattr $C$DW$151, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$151, DW_AT_TI_call
   [!A0]   CALL    .S2X    A3                ; |202| 
           MVKH    .S2     _command,B11
           ZERO    .L2     B4                ; |198| 
           MVK     .S2     0x29a,B6          ; |197| 
           ; BRANCHCC OCCURS {$C$L40}        ; |196| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL23,B3,0      ; |197| 
$C$RL23:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |197| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
           ADDK    .S2     16,SP             ; |290| 
           LDDW    .D2T1   *++SP,A11:A10     ; |290| 

           MV      .L1     A13,A4            ; |289| 
||         LDDW    .D2T1   *++SP,A13:A12     ; |290| 

           LDDW    .D2T1   *++SP,A15:A14     ; |290| 
||         MV      .L2     B13,B3            ; |290| 

$C$DW$152	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$152, DW_AT_low_pc(0x04)
	.dwattr $C$DW$152, DW_AT_TI_return

           LDDW    .D2T2   *++SP,B11:B10     ; |290| 
||         RET     .S2     B3                ; |290| 

           LDW     .D2T2   *++SP(8),B13      ; |290| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |290| 
;** --------------------------------------------------------------------------*
$C$L40:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL24,B3,0      ; |202| 
           MV      .L2     B4,B6             ; |202| 
$C$RL24:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |202| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B11,B0           ; |204| 
           MVK     .L2     0xffffffff,B10
           ADD     .L1     4,A11,A11
           NOP             2
   [!B0]   B       .S1     $C$L51            ; |204| 
   [!B0]   MVKL    .S1     _free,A3          ; |281| 
   [!B0]   MVKH    .S1     _free,A3          ; |281| 
   [ B0]   MVKL    .S1     _SEM_pend,A3      ; |207| 
$C$DW$153	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$153, DW_AT_low_pc(0x00)
	.dwattr $C$DW$153, DW_AT_name("_free")
	.dwattr $C$DW$153, DW_AT_TI_call
   [!B0]   CALL    .S2X    A3                ; |281| 
   [ B0]   MVKH    .S1     _SEM_pend,A3      ; |207| 
           ; BRANCHCC OCCURS {$C$L51}        ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           NOP             1
$C$DW$154	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$154, DW_AT_low_pc(0x00)
	.dwattr $C$DW$154, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$154, DW_AT_TI_call
           CALL    .S2X    A3                ; |207| 
	.dwpsn	file "task.c",line 204,column 0,is_stmt
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L41:    
$C$DW$L$_Task_execute$9$B:
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL25,B3,2      ; |207| 

           MV      .L2     B10,B4            ; |207| 
||         MV      .L1     A11,A4            ; |207| 

$C$RL25:   ; CALL OCCURS {_SEM_pend} {0}     ; |207| 
$C$DW$L$_Task_execute$9$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$10$B:
;          EXCLUSIVE CPU CYCLES: 14

           MV      .L1X    B11,A3            ; |207| 
||         MVKL    .S2     _buf,B5

           LDW     .D1T1   *A3,A0            ; |209| 
           MVKL    .S2     _length,B4
           MVKH    .S2     _buf,B5
           MVKH    .S2     _length,B4
           LDW     .D2T2   *B5,B5            ; |209| 

           CMPEQ   .L1     A0,1,A1           ; |209| 
||         MV      .S1     A0,A3             ; |209| 

           MV      .L1     A1,A2             ; guard predicate rewrite

           MV      .L2X    A1,B0             ; |209| branch predicate copy
|| [ A1]   B       .S1     $C$L46            ; |209| 
|| [!A1]   CMPEQ   .L1     A3,4,A1           ; |209| 

   [ B0]   MVKL    .S1     _BCACHE_inv,A3    ; |212| 
|| [ A2]   ZERO    .L1     A1                ; |209| nullify predicate

   [ A1]   BNOP    .S2     $C$L42,1          ; |209| 
|| [ B0]   MVKH    .S1     _BCACHE_inv,A3    ; |212| 

$C$DW$155	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$155, DW_AT_low_pc(0x00)
	.dwattr $C$DW$155, DW_AT_name("_BCACHE_inv")
	.dwattr $C$DW$155, DW_AT_TI_call
   [ B0]   CALL    .S2X    A3                ; |212| 
           LDW     .D2T2   *B4,B4            ; |209| 
           ; BRANCHCC OCCURS {$C$L46}        ; |209| 
$C$DW$L$_Task_execute$10$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$11$B:
;          EXCLUSIVE CPU CYCLES: 2

   [!A1]   CMPEQ   .L1     A3,7,A1           ; |209| 
||         MVKL    .S2     _BCACHE_inv,B6    ; |244| 

           MVKH    .S2     _BCACHE_inv,B6    ; |244| 
           ; BRANCHCC OCCURS {$C$L42}        ; |209| 
$C$DW$L$_Task_execute$11$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$12$B:
;          EXCLUSIVE CPU CYCLES: 6

   [ A1]   MVKL    .S1     _CalWeight,A3     ; |268| 
|| [ A1]   B       .S2     $C$L48            ; |209| 

   [!A1]   BNOP    .S2     $C$L50,1          ; |209| 
|| [ A1]   MVKH    .S1     _CalWeight,A3     ; |268| 

$C$DW$156	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$156, DW_AT_low_pc(0x00)
	.dwattr $C$DW$156, DW_AT_name("_CalWeight")
	.dwattr $C$DW$156, DW_AT_TI_call
   [ A1]   CALL    .S2X    A3                ; |268| 
           NOP             2
           ; BRANCHCC OCCURS {$C$L48}        ; |209| 
$C$DW$L$_Task_execute$12$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$13$B:
;          EXCLUSIVE CPU CYCLES: 1
   [ A0]   B       .S1     $C$L41            ; |204| 
           ; BRANCH OCCURS {$C$L50}          ; |209| 
$C$DW$L$_Task_execute$13$E:
;** --------------------------------------------------------------------------*
$C$L42:    
$C$DW$L$_Task_execute$14$B:
;          EXCLUSIVE CPU CYCLES: 6
$C$DW$157	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$157, DW_AT_low_pc(0x00)
	.dwattr $C$DW$157, DW_AT_name("_BCACHE_inv")
	.dwattr $C$DW$157, DW_AT_TI_call
           CALL    .S2     B6                ; |244| 
           ADDKPC  .S2     $C$RL26,B3,3      ; |244| 

           MV      .L1X    B5,A4             ; |244| 
||         MVK     .S1     0x1,A6            ; |244| 

$C$RL26:   ; CALL OCCURS {_BCACHE_inv} {0}   ; |244| 
$C$DW$L$_Task_execute$14$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$15$B:
;          EXCLUSIVE CPU CYCLES: 13
           MVKL    .S1     _buf,A3
           MVKH    .S1     _buf,A3
           LDW     .D1T1   *A3,A0            ; |246| 
           MVKL    .S2     _NOTIFY_notify,B5 ; |248| 
           MVKH    .S2     _NOTIFY_notify,B5 ; |248| 
           NOP             2

   [ A0]   B       .S2     $C$L43            ; |247| 
|| [ A0]   MVKL    .S1     _target_region+4,A3

   [ A0]   MVKH    .S1     _target_region+4,A3
$C$DW$158	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$158, DW_AT_low_pc(0x00)
	.dwattr $C$DW$158, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$158, DW_AT_TI_call

   [!A0]   CALL    .S2     B5                ; |248| 
|| [ A0]   LDW     .D1T1   *A3,A4            ; |251| 

   [ A0]   ADD     .L2X    -4,A3,B4
   [ A0]   LDW     .D2T1   *B4,A3            ; |251| 
           STW     .D2T1   A0,*+SP(8)        ; |246| 
           ; BRANCHCC OCCURS {$C$L43}        ; |247| 
$C$DW$L$_Task_execute$15$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$16$B:
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL27,B3,0      ; |248| 

           MVK     .S2     0x29a,B6          ; |248| 
||         MV      .L2X    A13,B4            ; |248| 
||         MVK     .L1     0x1,A4            ; |248| 
||         MVK     .S1     0x5,A6            ; |248| 

$C$RL27:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |248| 
$C$DW$L$_Task_execute$16$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$17$B:
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S1     _buf,A3
           MVKH    .S1     _buf,A3

           LDW     .D1T1   *A3,A0            ; |248| 
||         MVKL    .S1     _target_region+4,A3

           MVKH    .S1     _target_region+4,A3
           LDW     .D1T1   *A3,A4            ; |251| 
           ADD     .L2X    -4,A3,B4
           LDW     .D2T1   *B4,A3            ; |251| 
           NOP             1
$C$DW$L$_Task_execute$17$E:
;** --------------------------------------------------------------------------*
$C$L43:    
$C$DW$L$_Task_execute$18$B:
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S2     _NOTIFY_notify,B5 ; |253| 
           MVKH    .S2     _NOTIFY_notify,B5 ; |253| 
           NOP             1
           MPY32   .M1     A3,A4,A5          ; |251| 
           NOP             3

           ADD     .L1     A0,A5,A1          ; |252| 
||         ADD     .S1     A5,A0,A6          ; |251| 

   [ A1]   BNOP    .S1     $C$L44,1          ; |252| 
|| [ A1]   MPY32   .M1     A3,A4,A3          ; |256| 

$C$DW$159	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$159, DW_AT_low_pc(0x00)
	.dwattr $C$DW$159, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$159, DW_AT_TI_call
   [!A1]   CALL    .S2     B5                ; |253| 
           STW     .D2T1   A6,*+SP(12)       ; |251| 
   [ A1]   ADDAH   .D1     A0,A3,A4          ; |256| 

   [ A1]   STW     .D2T1   A4,*+SP(16)       ; |256| 
|| [ A1]   ADDAH   .D1     A0,A3,A1          ; |257| 

           ; BRANCHCC OCCURS {$C$L44}        ; |252| 
$C$DW$L$_Task_execute$18$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$19$B:
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL28,B3,0      ; |253| 

           MVK     .S2     0x29a,B6          ; |253| 
||         MV      .L2X    A13,B4            ; |253| 
||         MVK     .L1     0x5,A6            ; |253| 
||         MVK     .S1     0x1,A4            ; |253| 

$C$RL28:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |253| 
$C$DW$L$_Task_execute$19$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$20$B:
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S1     _target_region+4,A3
           MVKH    .S1     _target_region+4,A3
           LDW     .D1T1   *A3,A4            ; |253| 
           ADD     .L2X    -4,A3,B4
           LDW     .D2T1   *B4,A3            ; |253| 
           MVKL    .S1     _buf,A5
           MVKH    .S1     _buf,A5
           LDW     .D1T1   *A5,A0            ; |253| 
           NOP             1
           MPY32   .M1     A3,A4,A3          ; |256| 
           NOP             3
           ADDAH   .D1     A0,A3,A4          ; |256| 

           STW     .D2T1   A4,*+SP(16)       ; |256| 
||         ADDAH   .D1     A0,A3,A1          ; |257| 

$C$DW$L$_Task_execute$20$E:
;** --------------------------------------------------------------------------*
$C$L44:    
$C$DW$L$_Task_execute$21$B:
;          EXCLUSIVE CPU CYCLES: 6

           MVKL    .S2     _NOTIFY_notify,B5 ; |258| 
|| [ A1]   ADDAH   .D1     A3,A3,A3          ; |261| 
|| [ A1]   B       .S1     $C$L45            ; |257| 

   [ A1]   ADD     .L1     A0,A3,A5          ; |261| 
|| [ A1]   MVKL    .S1     _memcpy,A3        ; |261| 
||         MVKH    .S2     _NOTIFY_notify,B5 ; |258| 

$C$DW$160	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$160, DW_AT_low_pc(0x00)
	.dwattr $C$DW$160, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$160, DW_AT_TI_call

   [!A1]   CALL    .S2     B5                ; |258| 
|| [ A1]   MVKH    .S1     _memcpy,A3        ; |261| 

           NOP             1
$C$DW$161	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$161, DW_AT_low_pc(0x00)
	.dwattr $C$DW$161, DW_AT_name("_memcpy")
	.dwattr $C$DW$161, DW_AT_TI_call
   [ A1]   CALL    .S2X    A3                ; |261| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L45}        ; |257| 
$C$DW$L$_Task_execute$21$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$22$B:
;          EXCLUSIVE CPU CYCLES: 2
           MVK     .S2     0x29a,B6          ; |258| 

           MVK     .L1     0x5,A6            ; |258| 
||         MVK     .S1     0x1,A4            ; |258| 
||         ADDKPC  .S2     $C$RL29,B3,0      ; |258| 
||         MV      .L2X    A13,B4            ; |258| 

$C$RL29:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |258| 
$C$DW$L$_Task_execute$22$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$23$B:
;          EXCLUSIVE CPU CYCLES: 19
           MVKL    .S2     _target_region,B4
           MVKH    .S2     _target_region,B4
           LDW     .D2T2   *B4,B31
           ADD     .L1X    4,B4,A3
           LDW     .D1T1   *A3,A3
           MVKL    .S1     _buf,A4
           MVKH    .S1     _buf,A4
           LDW     .D1T1   *A4,A0            ; |258| 
           NOP             1
           MPY32   .M1X    B31,A3,A3
           NOP             3
           ADDAH   .D1     A3,A3,A3          ; |261| 

           ADD     .L1     A0,A3,A5          ; |261| 
||         MVKL    .S1     _memcpy,A3        ; |261| 

           MVKH    .S1     _memcpy,A3        ; |261| 
           NOP             1
$C$DW$162	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$162, DW_AT_low_pc(0x00)
	.dwattr $C$DW$162, DW_AT_name("_memcpy")
	.dwattr $C$DW$162, DW_AT_TI_call
           CALL    .S2X    A3                ; |261| 
           NOP             1
$C$DW$L$_Task_execute$23$E:
;** --------------------------------------------------------------------------*
$C$L45:    
$C$DW$L$_Task_execute$24$B:
;          EXCLUSIVE CPU CYCLES: 4
           MV      .L2X    A5,B4             ; |261| 
           ADDKPC  .S2     $C$RL30,B3,1      ; |261| 

           MV      .L1     A12,A6            ; |261| 
||         MV      .S1     A15,A4            ; |261| 

$C$RL30:   ; CALL OCCURS {_memcpy} {0}       ; |261| 
$C$DW$L$_Task_execute$24$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$25$B:
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _NOTIFY_notify,B5 ; |263| 
           MVKH    .S2     _NOTIFY_notify,B5 ; |263| 
$C$DW$163	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$163, DW_AT_low_pc(0x00)
	.dwattr $C$DW$163, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$163, DW_AT_TI_call
           CALL    .S2     B5                ; |263| 
           MV      .L2X    A13,B4            ; |263| 
           ADDKPC  .S2     $C$RL31,B3,2      ; |263| 

           MVK     .L1     0x5,A6            ; |263| 
||         MVK     .S1     0x1,A4            ; |263| 
||         MV      .L2X    A13,B6            ; |263| 

$C$RL31:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |263| 
$C$DW$L$_Task_execute$25$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$26$B:
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L49            ; |264| 
||         MV      .L2     B11,B4            ; |263| 

           LDW     .D2T1   *B4,A0
           NOP             4
           ; BRANCH OCCURS {$C$L49}          ; |264| 
$C$DW$L$_Task_execute$26$E:
;** --------------------------------------------------------------------------*
$C$L46:    
$C$DW$L$_Task_execute$27$B:
;          EXCLUSIVE CPU CYCLES: 4
           MVK     .L1     0x1,A6            ; |212| 
           MV      .L1X    B5,A4             ; |212| 
           ADDKPC  .S2     $C$RL32,B3,1      ; |212| 
$C$RL32:   ; CALL OCCURS {_BCACHE_inv} {0}   ; |212| 
$C$DW$L$_Task_execute$27$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$28$B:
;          EXCLUSIVE CPU CYCLES: 57
           MVKL    .S1     _buf,A3
           MVKH    .S1     _buf,A3
           LDW     .D1T1   *A3,A3            ; |215| 
           MVKL    .S1     _target_region,A31
           MVKH    .S1     _target_region,A31
           ADD     .L1     4,A31,A4          ; |215| 
           MVKL    .S2     _buf,B4
           LDNW    .D1T1   *A3,A5            ; |215| 
           MVKH    .S2     _buf,B4
           MVKL    .S1     _memcpy,A3        ; |217| 
           MVKH    .S1     _memcpy,A3        ; |217| 
           MVKL    .S2     _buf,B5
           STNW    .D1T1   A5,*A4            ; |215| 
           LDW     .D2T2   *B4,B4            ; |216| 
           MVKH    .S2     _buf,B5
           MV      .L1     A10,A4            ; |217| 
           MV      .L1     A12,A6            ; |217| 
           NOP             1
           ADD     .L2     4,B4,B4           ; |216| 
           LDNW    .D2T2   *B4,B4            ; |216| 
           NOP             4
           STNW    .D1T2   B4,*A31           ; |216| 
$C$DW$164	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$164, DW_AT_low_pc(0x04)
	.dwattr $C$DW$164, DW_AT_name("_memcpy")
	.dwattr $C$DW$164, DW_AT_TI_call

           LDW     .D2T2   *B5,B4            ; |217| 
||         CALL    .S2X    A3                ; |217| 

           ADDKPC  .S2     $C$RL33,B3,3      ; |217| 
           ADD     .L2     8,B4,B4           ; |217| 
$C$RL33:   ; CALL OCCURS {_memcpy} {0}       ; |217| 
           MVKL    .S1     _NOTIFY_notify,A3 ; |220| 
           MVKH    .S1     _NOTIFY_notify,A3 ; |220| 
           MVK     .S2     0x4d2,B6          ; |220| 
$C$DW$165	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$165, DW_AT_low_pc(0x00)
	.dwattr $C$DW$165, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$165, DW_AT_TI_call
           CALL    .S2X    A3                ; |220| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |220| 

           MVK     .L1     0x1,A4            ; |220| 
||         MV      .L2X    A13,B4            ; |220| 
||         MVK     .S1     0x5,A6            ; |220| 

$C$RL34:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |220| 
           MVKL    .S1     _target_region+4,A3
           MVKH    .S1     _target_region+4,A3
           LDW     .D1T1   *A3,A31           ; |233| 
           ADD     .L2X    -4,A3,B4
           LDW     .D2T2   *B4,B4            ; |233| 
           NOP             4

           MPY32   .M1X    B4,A31,A3         ; |233| 
||         MVKL    .S2     _malloc,B4        ; |233| 

           MVKH    .S2     _malloc,B4        ; |233| 
$C$DW$166	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$166, DW_AT_low_pc(0x00)
	.dwattr $C$DW$166, DW_AT_name("_malloc")
	.dwattr $C$DW$166, DW_AT_TI_call
           CALL    .S2     B4                ; |233| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |233| 
           SHL     .S1     A3,2,A4           ; |233| 
$C$RL35:   ; CALL OCCURS {_malloc} {0}       ; |233| 
$C$DW$L$_Task_execute$28$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$29$B:
;          EXCLUSIVE CPU CYCLES: 8

           MV      .L1     A4,A0             ; |233| 
||         MVKL    .S1     _NOTIFY_notify,A3 ; |235| 

           MVKH    .S1     _NOTIFY_notify,A3 ; |235| 
|| [ A0]   MVKL    .S2     _NOTIFY_notify,B5 ; |239| 

   [ A0]   BNOP    .S1     $C$L47,1          ; |234| 
|| [ A0]   MVKH    .S2     _NOTIFY_notify,B5 ; |239| 

$C$DW$167	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$167, DW_AT_low_pc(0x00)
	.dwattr $C$DW$167, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$167, DW_AT_TI_call
   [!A0]   CALL    .S2X    A3                ; |235| 
$C$DW$168	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$168, DW_AT_low_pc(0x00)
	.dwattr $C$DW$168, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$168, DW_AT_TI_call
   [ A0]   CALL    .S2     B5                ; |239| 
           MV      .L1     A4,A14            ; |233| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L47}        ; |234| 
$C$DW$L$_Task_execute$29$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$30$B:
;          EXCLUSIVE CPU CYCLES: 7
           MVK     .S2     0x29a,B6          ; |235| 

           MV      .L2X    A13,B4            ; |235| 
||         ADDKPC  .S2     $C$RL36,B3,0      ; |235| 
||         MVK     .L1     0x1,A4            ; |235| 
||         MVK     .S1     0x5,A6            ; |235| 

$C$RL36:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |235| 
           MVKL    .S2     _NOTIFY_notify,B5 ; |239| 
           MVKH    .S2     _NOTIFY_notify,B5 ; |239| 
$C$DW$169	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$169, DW_AT_low_pc(0x00)
	.dwattr $C$DW$169, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$169, DW_AT_TI_call
           CALL    .S2     B5                ; |239| 
           NOP             2
$C$DW$L$_Task_execute$30$E:
;** --------------------------------------------------------------------------*
$C$L47:    
$C$DW$L$_Task_execute$31$B:
;          EXCLUSIVE CPU CYCLES: 3
           MV      .L2X    A13,B4            ; |239| 
           MVK     .L1     0x5,A6            ; |239| 

           ADDKPC  .S2     $C$RL37,B3,0      ; |239| 
||         MVK     .L1     0x1,A4            ; |239| 
||         MV      .L2X    A13,B6            ; |239| 

$C$RL37:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |239| 
$C$DW$L$_Task_execute$31$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$32$B:
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L49            ; |240| 
||         MV      .L1X    B11,A3            ; |239| 

           LDW     .D1T1   *A3,A0
           NOP             4
           ; BRANCH OCCURS {$C$L49}          ; |240| 
$C$DW$L$_Task_execute$32$E:
;** --------------------------------------------------------------------------*
$C$L48:    
$C$DW$L$_Task_execute$33$B:
;          EXCLUSIVE CPU CYCLES: 3
           MVKL    .S2     _target_region,B6
           MVKH    .S2     _target_region,B6

           MV      .L1     A14,A8            ; |268| 
||         MV      .S1     A15,A6            ; |268| 
||         MV      .L2X    A10,B4            ; |268| 
||         ADD     .D1X    8,SP,A4           ; |268| 
||         ADDKPC  .S2     $C$RL38,B3,0      ; |268| 

$C$RL38:   ; CALL OCCURS {_CalWeight} {0}    ; |268| 
$C$DW$L$_Task_execute$33$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$34$B:
;          EXCLUSIVE CPU CYCLES: 31
           MVKL    .S1     _target_region+4,A3
           MVKH    .S1     _target_region+4,A3
           LDW     .D1T1   *A3,A31           ; |271| 
           ADD     .L2X    -4,A3,B4
           LDW     .D2T2   *B4,B4            ; |271| 
           MVKL    .S2     _memcpy,B5        ; |271| 
           MVKH    .S2     _memcpy,B5        ; |271| 
           MVKL    .S1     _buf,A4
$C$DW$170	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$170, DW_AT_low_pc(0x00)
	.dwattr $C$DW$170, DW_AT_name("_memcpy")
	.dwattr $C$DW$170, DW_AT_TI_call

           CALL    .S2     B5                ; |271| 
||         MVKH    .S1     _buf,A4

           MPY32   .M1X    B4,A31,A3         ; |271| 
||         LDW     .D1T1   *A4,A4            ; |271| 

           MV      .L2X    A14,B4            ; |271| 
           ADDKPC  .S2     $C$RL39,B3,1      ; |271| 
           SHL     .S1     A3,2,A6           ; |271| 
$C$RL39:   ; CALL OCCURS {_memcpy} {0}       ; |271| 
           MVKL    .S1     _BCACHE_wbInv,A3  ; |273| 

           MVKH    .S1     _BCACHE_wbInv,A3  ; |273| 
||         MVKL    .S2     _length,B4

           MVKL    .S1     _buf,A4
||         MVKH    .S2     _length,B4

$C$DW$171	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$171, DW_AT_low_pc(0x00)
	.dwattr $C$DW$171, DW_AT_name("_BCACHE_wbInv")
	.dwattr $C$DW$171, DW_AT_TI_call

           CALL    .S2X    A3                ; |273| 
||         MVKH    .S1     _buf,A4

           LDW     .D1T1   *A4,A4            ; |273| 
||         LDW     .D2T2   *B4,B4            ; |273| 

           ADDKPC  .S2     $C$RL40,B3,2      ; |273| 
           MVK     .L1     0x1,A6            ; |273| 
$C$RL40:   ; CALL OCCURS {_BCACHE_wbInv} {0}  ; |273| 
           MVKL    .S2     _NOTIFY_notify,B5 ; |275| 
           MVKH    .S2     _NOTIFY_notify,B5 ; |275| 
$C$DW$172	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$172, DW_AT_low_pc(0x00)
	.dwattr $C$DW$172, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$172, DW_AT_TI_call
           CALL    .S2     B5                ; |275| 
           MV      .L2X    A13,B4            ; |275| 
           ADDKPC  .S2     $C$RL41,B3,2      ; |275| 

           MV      .L2X    A13,B6            ; |275| 
||         MVK     .L1     0x1,A4            ; |275| 
||         MVK     .S1     0x5,A6            ; |275| 

$C$RL41:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |275| 
$C$DW$L$_Task_execute$34$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$35$B:
;          EXCLUSIVE CPU CYCLES: 6
           MV      .L1X    B11,A3            ; |275| 
           LDW     .D1T1   *A3,A0
           NOP             4
$C$DW$L$_Task_execute$35$E:
;** --------------------------------------------------------------------------*
$C$L49:    
$C$DW$L$_Task_execute$36$B:
;          EXCLUSIVE CPU CYCLES: 1
   [ A0]   B       .S1     $C$L41            ; |204| 
$C$DW$L$_Task_execute$36$E:
;** --------------------------------------------------------------------------*
$C$L50:    
$C$DW$L$_Task_execute$37$B:
;          EXCLUSIVE CPU CYCLES: 5
   [ A0]   MVKL    .S1     _SEM_pend,A3      ; |207| 
   [ A0]   MVKH    .S1     _SEM_pend,A3      ; |207| 
   [!A0]   MVKL    .S1     _free,A3          ; |281| 
$C$DW$173	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$173, DW_AT_low_pc(0x00)
	.dwattr $C$DW$173, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$173, DW_AT_TI_call
   [ A0]   CALL    .S2X    A3                ; |207| 
	.dwpsn	file "task.c",line 279,column 0,is_stmt
   [!A0]   MVKH    .S1     _free,A3          ; |281| 
           ; BRANCHCC OCCURS {$C$L41}        ; |204| 
$C$DW$L$_Task_execute$37$E:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           NOP             1
$C$DW$174	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$174, DW_AT_low_pc(0x00)
	.dwattr $C$DW$174, DW_AT_name("_free")
	.dwattr $C$DW$174, DW_AT_TI_call
           CALL    .S2X    A3                ; |281| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L51:    
;          EXCLUSIVE CPU CYCLES: 4
           MV      .L1     A10,A4            ; |281| 
           ADDKPC  .S2     $C$RL42,B3,2      ; |281| 
$C$RL42:   ; CALL OCCURS {_free} {0}         ; |281| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVKL    .S2     _free,B4          ; |282| 
           MVKH    .S2     _free,B4          ; |282| 
$C$DW$175	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$175, DW_AT_low_pc(0x00)
	.dwattr $C$DW$175, DW_AT_name("_free")
	.dwattr $C$DW$175, DW_AT_TI_call
           CALL    .S2     B4                ; |282| 
           ADDKPC  .S2     $C$RL43,B3,3      ; |282| 
           MV      .L1     A15,A4            ; |282| 
$C$RL43:   ; CALL OCCURS {_free} {0}         ; |282| 
           MVKL    .S1     _free,A3          ; |283| 
           MVKH    .S1     _free,A3          ; |283| 
           MV      .L1     A14,A4            ; |283| 
$C$DW$176	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$176, DW_AT_low_pc(0x00)
	.dwattr $C$DW$176, DW_AT_name("_free")
	.dwattr $C$DW$176, DW_AT_TI_call
           CALL    .S2X    A3                ; |283| 
           ADDKPC  .S2     $C$RL44,B3,4      ; |283| 
$C$RL44:   ; CALL OCCURS {_free} {0}         ; |283| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MVKL    .S2     _free,B4          ; |285| 
           MVKH    .S2     _free,B4          ; |285| 
$C$DW$177	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$177, DW_AT_low_pc(0x00)
	.dwattr $C$DW$177, DW_AT_name("_free")
	.dwattr $C$DW$177, DW_AT_TI_call

           CALL    .S2     B4                ; |285| 
||         ADD     .L1X    8,SP,A10

           LDW     .D1T1   *A10++,A4         ; |285| 
           MVK     .L1     0x3,A11           ; |285| 
	.dwpsn	file "task.c",line 285,column 0,is_stmt
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*----------------------------------------------------------------------------*
$C$L52:    
$C$DW$L$_Task_execute$42$B:
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL45,B3,0      ; |285| 
$C$RL45:   ; CALL OCCURS {_free} {0}         ; |285| 
$C$DW$L$_Task_execute$42$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_Task_execute$43$B:
;          EXCLUSIVE CPU CYCLES: 8

           SUB     .L1     A11,1,A0          ; |285| 
||         MVKL    .S2     _free,B4          ; |285| 
||         SUB     .S1     A11,1,A11         ; |285| 

   [ A0]   LDW     .D1T1   *A10++,A4         ; |285| 
|| [!A0]   ADDK    .S2     16,SP             ; |290| 
|| [!A0]   MV      .L1     A13,A4            ; |289| 
|| [!A0]   MV      .L2     B13,B3            ; |290| 

           MVKH    .S2     _free,B4          ; |285| 
|| [!A0]   LDDW    .D2T1   *++SP,A11:A10     ; |290| 
|| [ A0]   B       .S1     $C$L52            ; |285| 

$C$DW$178	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$178, DW_AT_low_pc(0x00)
	.dwattr $C$DW$178, DW_AT_name("_free")
	.dwattr $C$DW$178, DW_AT_TI_call

   [ A0]   CALL    .S2     B4                ; |285| 
|| [!A0]   LDDW    .D2T1   *++SP,A13:A12     ; |290| 

   [!A0]   LDDW    .D2T1   *++SP,A15:A14     ; |290| 
$C$DW$179	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$179, DW_AT_low_pc(0x00)
	.dwattr $C$DW$179, DW_AT_TI_return

   [!A0]   RET     .S2     B3                ; |290| 
|| [!A0]   LDDW    .D2T2   *++SP,B11:B10     ; |290| 

   [!A0]   LDW     .D2T2   *++SP(8),B13      ; |290| 
	.dwpsn	file "task.c",line 287,column 0,is_stmt
           NOP             1
           ; BRANCHCC OCCURS {$C$L52}        ; |285| 
$C$DW$L$_Task_execute$43$E:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
	.dwpsn	file "task.c",line 290,column 1,is_stmt
           NOP             3
           ; BRANCH OCCURS {B3}              ; |290| 

$C$DW$180	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$180, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L52:1:1496785802")
	.dwattr $C$DW$180, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$180, DW_AT_TI_begin_line(0x11d)
	.dwattr $C$DW$180, DW_AT_TI_end_line(0x11f)
$C$DW$181	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$181, DW_AT_low_pc($C$DW$L$_Task_execute$42$B)
	.dwattr $C$DW$181, DW_AT_high_pc($C$DW$L$_Task_execute$42$E)
$C$DW$182	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$182, DW_AT_low_pc($C$DW$L$_Task_execute$43$B)
	.dwattr $C$DW$182, DW_AT_high_pc($C$DW$L$_Task_execute$43$E)
	.dwendtag $C$DW$180


$C$DW$183	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$183, DW_AT_name("/data/home/in4342-10/XinA2/dsp/task.asm:$C$L41:1:1496785802")
	.dwattr $C$DW$183, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$183, DW_AT_TI_begin_line(0xcc)
	.dwattr $C$DW$183, DW_AT_TI_end_line(0x117)
$C$DW$184	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$184, DW_AT_low_pc($C$DW$L$_Task_execute$9$B)
	.dwattr $C$DW$184, DW_AT_high_pc($C$DW$L$_Task_execute$9$E)
$C$DW$185	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$185, DW_AT_low_pc($C$DW$L$_Task_execute$33$B)
	.dwattr $C$DW$185, DW_AT_high_pc($C$DW$L$_Task_execute$33$E)
$C$DW$186	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$186, DW_AT_low_pc($C$DW$L$_Task_execute$34$B)
	.dwattr $C$DW$186, DW_AT_high_pc($C$DW$L$_Task_execute$34$E)
$C$DW$187	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$187, DW_AT_low_pc($C$DW$L$_Task_execute$27$B)
	.dwattr $C$DW$187, DW_AT_high_pc($C$DW$L$_Task_execute$27$E)
$C$DW$188	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$188, DW_AT_low_pc($C$DW$L$_Task_execute$28$B)
	.dwattr $C$DW$188, DW_AT_high_pc($C$DW$L$_Task_execute$28$E)
$C$DW$189	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$189, DW_AT_low_pc($C$DW$L$_Task_execute$29$B)
	.dwattr $C$DW$189, DW_AT_high_pc($C$DW$L$_Task_execute$29$E)
$C$DW$190	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$190, DW_AT_low_pc($C$DW$L$_Task_execute$30$B)
	.dwattr $C$DW$190, DW_AT_high_pc($C$DW$L$_Task_execute$30$E)
$C$DW$191	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$191, DW_AT_low_pc($C$DW$L$_Task_execute$31$B)
	.dwattr $C$DW$191, DW_AT_high_pc($C$DW$L$_Task_execute$31$E)
$C$DW$192	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$192, DW_AT_low_pc($C$DW$L$_Task_execute$22$B)
	.dwattr $C$DW$192, DW_AT_high_pc($C$DW$L$_Task_execute$22$E)
$C$DW$193	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$193, DW_AT_low_pc($C$DW$L$_Task_execute$19$B)
	.dwattr $C$DW$193, DW_AT_high_pc($C$DW$L$_Task_execute$19$E)
$C$DW$194	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$194, DW_AT_low_pc($C$DW$L$_Task_execute$16$B)
	.dwattr $C$DW$194, DW_AT_high_pc($C$DW$L$_Task_execute$16$E)
$C$DW$195	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$195, DW_AT_low_pc($C$DW$L$_Task_execute$14$B)
	.dwattr $C$DW$195, DW_AT_high_pc($C$DW$L$_Task_execute$14$E)
$C$DW$196	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$196, DW_AT_low_pc($C$DW$L$_Task_execute$15$B)
	.dwattr $C$DW$196, DW_AT_high_pc($C$DW$L$_Task_execute$15$E)
$C$DW$197	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$197, DW_AT_low_pc($C$DW$L$_Task_execute$17$B)
	.dwattr $C$DW$197, DW_AT_high_pc($C$DW$L$_Task_execute$17$E)
$C$DW$198	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$198, DW_AT_low_pc($C$DW$L$_Task_execute$18$B)
	.dwattr $C$DW$198, DW_AT_high_pc($C$DW$L$_Task_execute$18$E)
$C$DW$199	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$199, DW_AT_low_pc($C$DW$L$_Task_execute$20$B)
	.dwattr $C$DW$199, DW_AT_high_pc($C$DW$L$_Task_execute$20$E)
$C$DW$200	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$200, DW_AT_low_pc($C$DW$L$_Task_execute$21$B)
	.dwattr $C$DW$200, DW_AT_high_pc($C$DW$L$_Task_execute$21$E)
$C$DW$201	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$201, DW_AT_low_pc($C$DW$L$_Task_execute$23$B)
	.dwattr $C$DW$201, DW_AT_high_pc($C$DW$L$_Task_execute$23$E)
$C$DW$202	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$202, DW_AT_low_pc($C$DW$L$_Task_execute$24$B)
	.dwattr $C$DW$202, DW_AT_high_pc($C$DW$L$_Task_execute$24$E)
$C$DW$203	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$203, DW_AT_low_pc($C$DW$L$_Task_execute$25$B)
	.dwattr $C$DW$203, DW_AT_high_pc($C$DW$L$_Task_execute$25$E)
$C$DW$204	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$204, DW_AT_low_pc($C$DW$L$_Task_execute$26$B)
	.dwattr $C$DW$204, DW_AT_high_pc($C$DW$L$_Task_execute$26$E)
$C$DW$205	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$205, DW_AT_low_pc($C$DW$L$_Task_execute$32$B)
	.dwattr $C$DW$205, DW_AT_high_pc($C$DW$L$_Task_execute$32$E)
$C$DW$206	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$206, DW_AT_low_pc($C$DW$L$_Task_execute$35$B)
	.dwattr $C$DW$206, DW_AT_high_pc($C$DW$L$_Task_execute$35$E)
$C$DW$207	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$207, DW_AT_low_pc($C$DW$L$_Task_execute$10$B)
	.dwattr $C$DW$207, DW_AT_high_pc($C$DW$L$_Task_execute$10$E)
$C$DW$208	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$208, DW_AT_low_pc($C$DW$L$_Task_execute$11$B)
	.dwattr $C$DW$208, DW_AT_high_pc($C$DW$L$_Task_execute$11$E)
$C$DW$209	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$209, DW_AT_low_pc($C$DW$L$_Task_execute$12$B)
	.dwattr $C$DW$209, DW_AT_high_pc($C$DW$L$_Task_execute$12$E)
$C$DW$210	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$210, DW_AT_low_pc($C$DW$L$_Task_execute$13$B)
	.dwattr $C$DW$210, DW_AT_high_pc($C$DW$L$_Task_execute$13$E)
$C$DW$211	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$211, DW_AT_low_pc($C$DW$L$_Task_execute$36$B)
	.dwattr $C$DW$211, DW_AT_high_pc($C$DW$L$_Task_execute$36$E)
$C$DW$212	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$212, DW_AT_low_pc($C$DW$L$_Task_execute$37$B)
	.dwattr $C$DW$212, DW_AT_high_pc($C$DW$L$_Task_execute$37$E)
	.dwendtag $C$DW$183

	.dwattr $C$DW$146, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$146, DW_AT_TI_end_line(0x122)
	.dwattr $C$DW$146, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$146

	.sect	".text"
	.clink
	.global	_Task_delete

$C$DW$213	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_delete")
	.dwattr $C$DW$213, DW_AT_low_pc(_Task_delete)
	.dwattr $C$DW$213, DW_AT_high_pc(0x00)
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("_Task_delete")
	.dwattr $C$DW$213, DW_AT_external
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$213, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$213, DW_AT_TI_begin_line(0x124)
	.dwattr $C$DW$213, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$213, DW_AT_frame_base[DW_OP_breg31 16]
	.dwattr $C$DW$213, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 293,column 1,is_stmt,address _Task_delete
$C$DW$214	.dwtag  DW_TAG_formal_parameter, DW_AT_name("info")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("_info")
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$88)
	.dwattr $C$DW$214, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: Task_delete                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B13,SP,A16,A17,A18,A19,A20,A21,   *
;*                           A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17, *
;*                           B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29, *
;*                           B30,B31                                          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B13,SP,A16,A17,A18,A19,A20,A21,   *
;*                           A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17, *
;*                           B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29, *
;*                           B30,B31                                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 16 Save = 16 byte                  *
;******************************************************************************
_Task_delete:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     _NOTIFY_unregister,A3 ; |299| 
           MVKH    .S1     _NOTIFY_unregister,A3 ; |299| 
           MVKL    .S2     _Task_notify,B6   ; |299| 
$C$DW$215	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$215, DW_AT_low_pc(0x00)
	.dwattr $C$DW$215, DW_AT_name("_NOTIFY_unregister")
	.dwattr $C$DW$215, DW_AT_TI_call
           CALL    .S2X    A3                ; |299| 
           STW     .D2T2   B13,*SP--(8)      ; |293| 
           MVKH    .S2     _Task_notify,B6   ; |299| 
           MV      .L1     A4,A8             ; |293| 
           ZERO    .L2     B4                ; |299| 

           STDW    .D2T1   A11:A10,*SP--     ; |293| 
||         MV      .L1     A4,A11            ; |293| 
||         MV      .L2     B3,B13            ; |293| 
||         ADDKPC  .S2     $C$RL46,B3,0      ; |299| 
||         MVK     .S1     0x5,A6            ; |299| 
||         MVK     .D1     0x1,A4            ; |299| 

$C$RL46:   ; CALL OCCURS {_NOTIFY_unregister} {0}  ; |299| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _MEM_free,B5      ; |306| 

           MVKH    .S2     _MEM_free,B5      ; |306| 
||         MVKL    .S1     _DDR2,A3

$C$DW$216	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$216, DW_AT_low_pc(0x00)
	.dwattr $C$DW$216, DW_AT_name("_MEM_free")
	.dwattr $C$DW$216, DW_AT_TI_call

           CALL    .S2     B5                ; |306| 
||         MVKH    .S1     _DDR2,A3

           MV      .L1     A4,A10            ; |299| 
||         LDW     .D1T1   *A3,A4            ; |306| 

           ADDKPC  .S2     $C$RL47,B3,2      ; |306| 

           MV      .L2X    A11,B4            ; |306| 
||         MVK     .S1     0x28,A6           ; |306| 

$C$RL47:   ; CALL OCCURS {_MEM_free} {0}     ; |306| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L2     B13,B3            ; |312| 
$C$DW$217	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$217, DW_AT_low_pc(0x00)
	.dwattr $C$DW$217, DW_AT_TI_return

           RET     .S2     B3                ; |312| 
||         MV      .L1     A10,A4            ; |311| 
||         LDDW    .D2T1   *++SP,A11:A10     ; |312| 

           LDW     .D2T2   *++SP(8),B13      ; |312| 
	.dwpsn	file "task.c",line 312,column 1,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |312| 
	.dwattr $C$DW$213, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$213, DW_AT_TI_end_line(0x138)
	.dwattr $C$DW$213, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$213

	.sect	".text"
	.clink
	.global	_Task_create

$C$DW$218	.dwtag  DW_TAG_subprogram, DW_AT_name("Task_create")
	.dwattr $C$DW$218, DW_AT_low_pc(_Task_create)
	.dwattr $C$DW$218, DW_AT_high_pc(0x00)
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("_Task_create")
	.dwattr $C$DW$218, DW_AT_external
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$218, DW_AT_TI_begin_file("task.c")
	.dwattr $C$DW$218, DW_AT_TI_begin_line(0x60)
	.dwattr $C$DW$218, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$218, DW_AT_frame_base[DW_OP_breg31 24]
	.dwattr $C$DW$218, DW_AT_TI_skeletal
	.dwpsn	file "task.c",line 97,column 1,is_stmt,address _Task_create
$C$DW$219	.dwtag  DW_TAG_formal_parameter, DW_AT_name("infoPtr")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("_infoPtr")
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$89)
	.dwattr $C$DW$219, DW_AT_location[DW_OP_reg4]

;******************************************************************************
;* FUNCTION NAME: Task_create                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,A19,A20,   *
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,A19,A20,   *
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 24 Save = 24 byte                  *
;******************************************************************************
_Task_create:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     _MEM_valloc,A3    ; |105| 

           MVKH    .S1     _MEM_valloc,A3    ; |105| 
||         STW     .D2T1   A11,*SP--(8)      ; |97| 

           STDW    .D2T2   B11:B10,*SP--     ; |97| 
||         MV      .L2X    A4,B10            ; |97| 
||         MVKL    .S1     _DDR2,A4

$C$DW$220	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$220, DW_AT_low_pc(0x00)
	.dwattr $C$DW$220, DW_AT_name("_MEM_valloc")
	.dwattr $C$DW$220, DW_AT_TI_call

           CALL    .S2X    A3                ; |105| 
||         STW     .D2T1   A10,*SP--(8)      ; |97| 
||         MVKH    .S1     _DDR2,A4

           LDW     .D1T1   *A4,A4            ; |105| 
           MVK     .S2     0x28,B4           ; |105| 
           MV      .L2     B3,B11            ; |97| 
           ADDKPC  .S2     $C$RL48,B3,0      ; |105| 

           ZERO    .L1     A6                ; |105| 
||         ZERO    .L2     B6                ; |105| 

$C$RL48:   ; CALL OCCURS {_MEM_valloc} {0}   ; |105| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S2     _MPCSXFER_BufferSize,B4
||         MV      .L1     A4,A0             ; |108| 
||         ZERO    .D1     A10               ; |99| 
||         MVKL    .S1     __SEM_dopost,A3
||         STW     .D2T1   A4,*B10           ; |105| 
||         ZERO    .L2     B9                ; |121| 

           MVKH    .S2     _MPCSXFER_BufferSize,B4
|| [ A0]   MV      .L1     A0,A10            ; |114| 
||         MVKH    .S1     __SEM_dopost,A3
||         MVK     .D1     0x1,A4            ; |132| 
||         ZERO    .L2     B8                ; |121| 

           LDHU    .D2T2   *B4,B7            ; |119| 
||         MVK     .L2     0x1,B4            ; |110| 
||         MVKL    .S2     _Task_notify,B6   ; |132| 
||         MVK     .L1     0x5,A6            ; |132| 
||         ADD     .D1     A10,24,A5         ; |87| 
||         MV      .S1     A10,A8            ; |132| 

           MVKH    .S2     _Task_notify,B6   ; |132| 

           MV      .L1X    B4,A11            ; |119| 
||         MVKL    .S2     _NOTIFY_register,B5 ; |132| 
||         ZERO    .L2     B4                ; |121| 

   [ A0]   ZERO    .L1     A11               ; |98| 
||         MVKH    .S2     _NOTIFY_register,B5 ; |132| 

           MV      .L1     A11,A0            ; |132| 

   [ A0]   MVKL    .S1     _NOTIFY_notify,A3 ; |149| 
|| [ A0]   MVK     .L1     0x5,A6            ; |149| 
|| [ A0]   MVK     .D1     0x1,A4            ; |149| 
|| [ A0]   ZERO    .L2     B4                ; |149| 
|| [ A0]   ZERO    .S2     B6                ; |149| 

   [ A0]   B       .S2     $C$L53            ; |119| 
|| [ A0]   MVKH    .S1     _NOTIFY_notify,A3 ; |149| 
|| [!A0]   STW     .D1T2   B9,*+A10(20)      ; |86| 

   [ A0]   BNOP    .S1     $C$L55,3          ; |147| 
$C$DW$221	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$221, DW_AT_low_pc(0x00)
	.dwattr $C$DW$221, DW_AT_name("_NOTIFY_register")
	.dwattr $C$DW$221, DW_AT_TI_call

   [!A0]   CALL    .S2     B5                ; |132| 
|| [!A0]   STW     .D1T2   B7,*+A10(36)      ; |122| 

           ; BRANCHCC OCCURS {$C$L53}        ; |119| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           STW     .D1T2   B8,*A10           ; |121| 
           STW     .D1T1   A3,*+A10(16)      ; |89| 
           STW     .D1T2   B9,*+A10(12)      ; |88| 
           STW     .D1T1   A5,*+A10(24)      ; |87| 

           STW     .D1T1   A5,*+A10(28)      ; |87| 
||         ADDKPC  .S2     $C$RL49,B3,0      ; |132| 

$C$RL49:   ; CALL OCCURS {_NOTIFY_register} {0}  ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MV      .L1     A4,A0             ; |132| 
||         MV      .S1     A4,A11            ; |132| 

   [ A0]   BNOP    .S2     $C$L54,4          ; |132| 
|| [!A0]   MVKL    .S1     _NOTIFY_notify,A3 ; |149| 
|| [!A0]   MVK     .L1     0x1,A4            ; |149| 
|| [!A0]   ZERO    .L2     B6                ; |149| 
|| [!A0]   ZERO    .D2     B4                ; |149| 
|| [!A0]   MVK     .D1     0x5,A6            ; |149| 

   [!A0]   MVKH    .S1     _NOTIFY_notify,A3 ; |149| 
           ; BRANCHCC OCCURS {$C$L54}        ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
   [ A0]   BNOP    .S1     $C$L55,4          ; |147| 
;** --------------------------------------------------------------------------*
$C$L53:    
;          EXCLUSIVE CPU CYCLES: 1
$C$DW$222	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$222, DW_AT_low_pc(0x00)
	.dwattr $C$DW$222, DW_AT_name("_NOTIFY_notify")
	.dwattr $C$DW$222, DW_AT_TI_call
   [!A0]   CALL    .S2X    A3                ; |149| 
           ; BRANCHCC OCCURS {$C$L55}        ; |147| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           ADDKPC  .S2     $C$RL50,B3,4      ; |149| 
$C$RL50:   ; CALL OCCURS {_NOTIFY_notify} {0}  ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S1     _SEM_pend,A3      ; |163| 
||         MV      .L1     A4,A0             ; |149| 

   [!A0]   BNOP    .S2     $C$L56,1          ; |149| 
||         MVKH    .S1     _SEM_pend,A3      ; |163| 

$C$DW$223	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$223, DW_AT_low_pc(0x00)
	.dwattr $C$DW$223, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$223, DW_AT_TI_call
   [!A0]   CALL    .S2X    A3                ; |163| 
           MV      .L1     A4,A11            ; |149| 
           NOP             2
           ; BRANCHCC OCCURS {$C$L56}        ; |149| 
;** --------------------------------------------------------------------------*
$C$L54:    
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T1   *++SP(8),A10      ; |167| 
||         MV      .L2     B11,B3            ; |167| 

$C$DW$224	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$224, DW_AT_low_pc(0x04)
	.dwattr $C$DW$224, DW_AT_TI_return

           LDDW    .D2T2   *++SP,B11:B10     ; |167| 
||         RET     .S2     B3                ; |167| 

           LDW     .D2T1   *++SP(8),A11      ; |167| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |167| 
;** --------------------------------------------------------------------------*
$C$L55:    
;          EXCLUSIVE CPU CYCLES: 7
           MVKL    .S1     _SEM_pend,A3      ; |163| 
           MVKH    .S1     _SEM_pend,A3      ; |163| 
           NOP             1
$C$DW$225	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$225, DW_AT_low_pc(0x00)
	.dwattr $C$DW$225, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$225, DW_AT_TI_call
           CALL    .S2X    A3                ; |163| 
           NOP             3
;** --------------------------------------------------------------------------*
$C$L56:    
;          EXCLUSIVE CPU CYCLES: 2
           ADD     .L1     4,A10,A4          ; |163| 

           ADD     .L1     4,A10,A10         ; |163| 
||         MVK     .L2     0xffffffff,B4     ; |163| 
||         ADDKPC  .S2     $C$RL51,B3,0      ; |163| 

$C$RL51:   ; CALL OCCURS {_SEM_pend} {0}     ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _SEM_pend,B5      ; |164| 
           MVKH    .S2     _SEM_pend,B5      ; |164| 
$C$DW$226	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$226, DW_AT_low_pc(0x00)
	.dwattr $C$DW$226, DW_AT_name("_SEM_pend")
	.dwattr $C$DW$226, DW_AT_TI_call
           CALL    .S2     B5                ; |164| 
           ADDKPC  .S2     $C$RL52,B3,3      ; |164| 

           MV      .L1     A10,A4            ; |164| 
||         MVK     .L2     0xffffffff,B4     ; |164| 

$C$RL52:   ; CALL OCCURS {_SEM_pend} {0}     ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T1   *++SP(8),A10      ; |167| 
||         MV      .L2     B11,B3            ; |167| 

$C$DW$227	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$227, DW_AT_low_pc(0x04)
	.dwattr $C$DW$227, DW_AT_TI_return

           LDDW    .D2T2   *++SP,B11:B10     ; |167| 
||         RET     .S2     B3                ; |167| 

           MV      .L1     A11,A4            ; |164| 
||         LDW     .D2T1   *++SP(8),A11      ; |167| 

	.dwpsn	file "task.c",line 167,column 1,is_stmt
           NOP             4
           ; BRANCH OCCURS {B3}              ; |167| 
	.dwattr $C$DW$218, DW_AT_TI_end_file("task.c")
	.dwattr $C$DW$218, DW_AT_TI_end_line(0xa7)
	.dwattr $C$DW$218, DW_AT_TI_end_column(0x01)
	.dwendtag $C$DW$218

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_MEM_free
	.global	_MEM_valloc
	.global	_SEM_pend
	.global	_SEM_post
	.global	__SEM_dopost
	.global	_NOTIFY_register
	.global	_NOTIFY_unregister
	.global	_NOTIFY_notify
	.global	_BCACHE_inv
	.global	_BCACHE_wbInv
	.global	_malloc
	.global	_free
	.global	_DDR2
	.global	_MPCSXFER_BufferSize
	.global	__fltuf
	.global	__mpyf
	.global	__fixfu
	.global	__divi
	.global	_memcpy

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************
$C$DW$T$3	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$3, DW_AT_address_class(0x20)
$C$DW$T$45	.dwtag  DW_TAG_typedef, DW_AT_name("Ptr")
	.dwattr $C$DW$T$45, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$T$45, DW_AT_language(DW_LANG_C)

$C$DW$T$25	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$25, DW_AT_language(DW_LANG_C)
$C$DW$228	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$24)
	.dwendtag $C$DW$T$25

$C$DW$T$26	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$T$26, DW_AT_address_class(0x20)
$C$DW$T$27	.dwtag  DW_TAG_typedef, DW_AT_name("KNL_Fxn")
	.dwattr $C$DW$T$27, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$T$27, DW_AT_language(DW_LANG_C)
$C$DW$T$41	.dwtag  DW_TAG_const_type
$C$DW$T$42	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$T$42, DW_AT_address_class(0x20)

$C$DW$T$62	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$62, DW_AT_language(DW_LANG_C)
$C$DW$229	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$37)
$C$DW$230	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$230, DW_AT_type(*$C$DW$T$45)
$C$DW$231	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$45)
	.dwendtag $C$DW$T$62

$C$DW$T$63	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$63, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$T$63, DW_AT_address_class(0x20)
$C$DW$T$64	.dwtag  DW_TAG_typedef, DW_AT_name("FnNotifyCbck")
	.dwattr $C$DW$T$64, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$T$64, DW_AT_language(DW_LANG_C)
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
$C$DW$T$71	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$71, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$71, DW_AT_address_class(0x20)
$C$DW$T$72	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$72, DW_AT_type(*$C$DW$T$71)
	.dwattr $C$DW$T$72, DW_AT_address_class(0x20)
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
$C$DW$T$34	.dwtag  DW_TAG_typedef, DW_AT_name("Uint16")
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
$C$DW$T$35	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$35, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$T$35, DW_AT_address_class(0x20)
$C$DW$T$65	.dwtag  DW_TAG_typedef, DW_AT_name("Bool")
	.dwattr $C$DW$T$65, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$65, DW_AT_language(DW_LANG_C)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$22	.dwtag  DW_TAG_typedef, DW_AT_name("Int")
	.dwattr $C$DW$T$22, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$22, DW_AT_language(DW_LANG_C)
$C$DW$T$93	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$93, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$93, DW_AT_address_class(0x20)
$C$DW$T$97	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$97, DW_AT_type(*$C$DW$T$10)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$37	.dwtag  DW_TAG_typedef, DW_AT_name("Uint32")
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
$C$DW$T$43	.dwtag  DW_TAG_typedef, DW_AT_name("size_t")
	.dwattr $C$DW$T$43, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$43, DW_AT_language(DW_LANG_C)
$C$DW$T$78	.dwtag  DW_TAG_typedef, DW_AT_name("Uns")
	.dwattr $C$DW$T$78, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$78, DW_AT_language(DW_LANG_C)
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
$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)
$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)

$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_name("QUE_Elem")
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x08)
$C$DW$232	.dwtag  DW_TAG_member
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$232, DW_AT_name("next")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("_next")
	.dwattr $C$DW$232, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$232, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$233	.dwtag  DW_TAG_member
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$233, DW_AT_name("prev")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("_prev")
	.dwattr $C$DW$233, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$233, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$20

$C$DW$T$19	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$19, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$19, DW_AT_address_class(0x20)
$C$DW$T$21	.dwtag  DW_TAG_typedef, DW_AT_name("QUE_Obj")
	.dwattr $C$DW$T$21, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$21, DW_AT_language(DW_LANG_C)

$C$DW$T$28	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$28, DW_AT_name("KNL_Job")
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x10)
$C$DW$234	.dwtag  DW_TAG_member
	.dwattr $C$DW$234, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$234, DW_AT_name("wListElem")
	.dwattr $C$DW$234, DW_AT_TI_symbol_name("_wListElem")
	.dwattr $C$DW$234, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$234, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$235	.dwtag  DW_TAG_member
	.dwattr $C$DW$235, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$235, DW_AT_name("wCount")
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("_wCount")
	.dwattr $C$DW$235, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$235, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$236	.dwtag  DW_TAG_member
	.dwattr $C$DW$236, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$236, DW_AT_name("fxn")
	.dwattr $C$DW$236, DW_AT_TI_symbol_name("_fxn")
	.dwattr $C$DW$236, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$236, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$28

$C$DW$T$23	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$T$23, DW_AT_address_class(0x20)
$C$DW$T$24	.dwtag  DW_TAG_typedef, DW_AT_name("KNL_JobHandle")
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)
$C$DW$T$29	.dwtag  DW_TAG_typedef, DW_AT_name("KNL_Job")
	.dwattr $C$DW$T$29, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$T$29, DW_AT_language(DW_LANG_C)
$C$DW$T$30	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$30, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$30, DW_AT_name("signed char")
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x01)
$C$DW$T$31	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$31, DW_AT_address_class(0x20)
$C$DW$T$32	.dwtag  DW_TAG_typedef, DW_AT_name("String")
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$T$32, DW_AT_language(DW_LANG_C)
$C$DW$T$46	.dwtag  DW_TAG_typedef, DW_AT_name("Char")
	.dwattr $C$DW$T$46, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$46, DW_AT_language(DW_LANG_C)

$C$DW$T$33	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$33, DW_AT_name("SEM_Obj")
	.dwattr $C$DW$T$33, DW_AT_byte_size(0x20)
$C$DW$237	.dwtag  DW_TAG_member
	.dwattr $C$DW$237, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$237, DW_AT_name("job")
	.dwattr $C$DW$237, DW_AT_TI_symbol_name("_job")
	.dwattr $C$DW$237, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$237, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$238	.dwtag  DW_TAG_member
	.dwattr $C$DW$238, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$238, DW_AT_name("count")
	.dwattr $C$DW$238, DW_AT_TI_symbol_name("_count")
	.dwattr $C$DW$238, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$238, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$239	.dwtag  DW_TAG_member
	.dwattr $C$DW$239, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$239, DW_AT_name("pendQ")
	.dwattr $C$DW$239, DW_AT_TI_symbol_name("_pendQ")
	.dwattr $C$DW$239, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$239, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$240	.dwtag  DW_TAG_member
	.dwattr $C$DW$240, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$240, DW_AT_name("name")
	.dwattr $C$DW$240, DW_AT_TI_symbol_name("_name")
	.dwattr $C$DW$240, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$240, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$33

$C$DW$T$36	.dwtag  DW_TAG_typedef, DW_AT_name("SEM_Obj")
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$36, DW_AT_language(DW_LANG_C)
$C$DW$T$57	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$57, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$57, DW_AT_address_class(0x20)
$C$DW$T$58	.dwtag  DW_TAG_typedef, DW_AT_name("SEM_Handle")
	.dwattr $C$DW$T$58, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$T$58, DW_AT_language(DW_LANG_C)

$C$DW$T$38	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$38, DW_AT_name("Task_TransferInfo_tag")
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x28)
$C$DW$241	.dwtag  DW_TAG_member
	.dwattr $C$DW$241, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$241, DW_AT_name("dataBuf")
	.dwattr $C$DW$241, DW_AT_TI_symbol_name("_dataBuf")
	.dwattr $C$DW$241, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$241, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$242	.dwtag  DW_TAG_member
	.dwattr $C$DW$242, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$242, DW_AT_name("notifySemObj")
	.dwattr $C$DW$242, DW_AT_TI_symbol_name("_notifySemObj")
	.dwattr $C$DW$242, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$242, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$243	.dwtag  DW_TAG_member
	.dwattr $C$DW$243, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$243, DW_AT_name("bufferSize")
	.dwattr $C$DW$243, DW_AT_TI_symbol_name("_bufferSize")
	.dwattr $C$DW$243, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$243, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$38

$C$DW$T$87	.dwtag  DW_TAG_typedef, DW_AT_name("Task_TransferInfo")
	.dwattr $C$DW$T$87, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$87, DW_AT_language(DW_LANG_C)
$C$DW$T$88	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$88, DW_AT_type(*$C$DW$T$87)
	.dwattr $C$DW$T$88, DW_AT_address_class(0x20)
$C$DW$T$89	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$89, DW_AT_type(*$C$DW$T$88)
	.dwattr $C$DW$T$89, DW_AT_address_class(0x20)

$C$DW$T$39	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$39, DW_AT_name("Rect")
	.dwattr $C$DW$T$39, DW_AT_byte_size(0x10)
$C$DW$244	.dwtag  DW_TAG_member
	.dwattr $C$DW$244, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$244, DW_AT_name("height")
	.dwattr $C$DW$244, DW_AT_TI_symbol_name("_height")
	.dwattr $C$DW$244, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$244, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$245	.dwtag  DW_TAG_member
	.dwattr $C$DW$245, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$245, DW_AT_name("width")
	.dwattr $C$DW$245, DW_AT_TI_symbol_name("_width")
	.dwattr $C$DW$245, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$245, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$246	.dwtag  DW_TAG_member
	.dwattr $C$DW$246, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$246, DW_AT_name("x")
	.dwattr $C$DW$246, DW_AT_TI_symbol_name("_x")
	.dwattr $C$DW$246, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$246, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$247	.dwtag  DW_TAG_member
	.dwattr $C$DW$247, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$247, DW_AT_name("y")
	.dwattr $C$DW$247, DW_AT_TI_symbol_name("_y")
	.dwattr $C$DW$247, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$247, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$39

$C$DW$T$113	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$113, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$T$113, DW_AT_address_class(0x20)

$C$DW$T$40	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$40, DW_AT_name("config")
	.dwattr $C$DW$T$40, DW_AT_byte_size(0x0c)
$C$DW$248	.dwtag  DW_TAG_member
	.dwattr $C$DW$248, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$248, DW_AT_name("num_bins")
	.dwattr $C$DW$248, DW_AT_TI_symbol_name("_num_bins")
	.dwattr $C$DW$248, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$248, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$249	.dwtag  DW_TAG_member
	.dwattr $C$DW$249, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$249, DW_AT_name("pixel_range")
	.dwattr $C$DW$249, DW_AT_TI_symbol_name("_pixel_range")
	.dwattr $C$DW$249, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$249, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$250	.dwtag  DW_TAG_member
	.dwattr $C$DW$250, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$250, DW_AT_name("MaxIter")
	.dwattr $C$DW$250, DW_AT_TI_symbol_name("_MaxIter")
	.dwattr $C$DW$250, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$250, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$40

	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$251	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A0")
	.dwattr $C$DW$251, DW_AT_location[DW_OP_reg0]
$C$DW$252	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A1")
	.dwattr $C$DW$252, DW_AT_location[DW_OP_reg1]
$C$DW$253	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A2")
	.dwattr $C$DW$253, DW_AT_location[DW_OP_reg2]
$C$DW$254	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A3")
	.dwattr $C$DW$254, DW_AT_location[DW_OP_reg3]
$C$DW$255	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A4")
	.dwattr $C$DW$255, DW_AT_location[DW_OP_reg4]
$C$DW$256	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A5")
	.dwattr $C$DW$256, DW_AT_location[DW_OP_reg5]
$C$DW$257	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A6")
	.dwattr $C$DW$257, DW_AT_location[DW_OP_reg6]
$C$DW$258	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A7")
	.dwattr $C$DW$258, DW_AT_location[DW_OP_reg7]
$C$DW$259	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A8")
	.dwattr $C$DW$259, DW_AT_location[DW_OP_reg8]
$C$DW$260	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A9")
	.dwattr $C$DW$260, DW_AT_location[DW_OP_reg9]
$C$DW$261	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A10")
	.dwattr $C$DW$261, DW_AT_location[DW_OP_reg10]
$C$DW$262	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A11")
	.dwattr $C$DW$262, DW_AT_location[DW_OP_reg11]
$C$DW$263	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A12")
	.dwattr $C$DW$263, DW_AT_location[DW_OP_reg12]
$C$DW$264	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A13")
	.dwattr $C$DW$264, DW_AT_location[DW_OP_reg13]
$C$DW$265	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A14")
	.dwattr $C$DW$265, DW_AT_location[DW_OP_reg14]
$C$DW$266	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A15")
	.dwattr $C$DW$266, DW_AT_location[DW_OP_reg15]
$C$DW$267	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B0")
	.dwattr $C$DW$267, DW_AT_location[DW_OP_reg16]
$C$DW$268	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B1")
	.dwattr $C$DW$268, DW_AT_location[DW_OP_reg17]
$C$DW$269	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B2")
	.dwattr $C$DW$269, DW_AT_location[DW_OP_reg18]
$C$DW$270	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B3")
	.dwattr $C$DW$270, DW_AT_location[DW_OP_reg19]
$C$DW$271	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B4")
	.dwattr $C$DW$271, DW_AT_location[DW_OP_reg20]
$C$DW$272	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B5")
	.dwattr $C$DW$272, DW_AT_location[DW_OP_reg21]
$C$DW$273	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B6")
	.dwattr $C$DW$273, DW_AT_location[DW_OP_reg22]
$C$DW$274	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B7")
	.dwattr $C$DW$274, DW_AT_location[DW_OP_reg23]
$C$DW$275	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B8")
	.dwattr $C$DW$275, DW_AT_location[DW_OP_reg24]
$C$DW$276	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B9")
	.dwattr $C$DW$276, DW_AT_location[DW_OP_reg25]
$C$DW$277	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B10")
	.dwattr $C$DW$277, DW_AT_location[DW_OP_reg26]
$C$DW$278	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B11")
	.dwattr $C$DW$278, DW_AT_location[DW_OP_reg27]
$C$DW$279	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B12")
	.dwattr $C$DW$279, DW_AT_location[DW_OP_reg28]
$C$DW$280	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B13")
	.dwattr $C$DW$280, DW_AT_location[DW_OP_reg29]
$C$DW$281	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DP")
	.dwattr $C$DW$281, DW_AT_location[DW_OP_reg30]
$C$DW$282	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SP")
	.dwattr $C$DW$282, DW_AT_location[DW_OP_reg31]
$C$DW$283	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FP")
	.dwattr $C$DW$283, DW_AT_location[DW_OP_regx 0x20]
$C$DW$284	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC")
	.dwattr $C$DW$284, DW_AT_location[DW_OP_regx 0x21]
$C$DW$285	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IRP")
	.dwattr $C$DW$285, DW_AT_location[DW_OP_regx 0x22]
$C$DW$286	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IFR")
	.dwattr $C$DW$286, DW_AT_location[DW_OP_regx 0x23]
$C$DW$287	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NRP")
	.dwattr $C$DW$287, DW_AT_location[DW_OP_regx 0x24]
$C$DW$288	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A16")
	.dwattr $C$DW$288, DW_AT_location[DW_OP_regx 0x25]
$C$DW$289	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A17")
	.dwattr $C$DW$289, DW_AT_location[DW_OP_regx 0x26]
$C$DW$290	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A18")
	.dwattr $C$DW$290, DW_AT_location[DW_OP_regx 0x27]
$C$DW$291	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A19")
	.dwattr $C$DW$291, DW_AT_location[DW_OP_regx 0x28]
$C$DW$292	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A20")
	.dwattr $C$DW$292, DW_AT_location[DW_OP_regx 0x29]
$C$DW$293	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A21")
	.dwattr $C$DW$293, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$294	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A22")
	.dwattr $C$DW$294, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$295	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A23")
	.dwattr $C$DW$295, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$296	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A24")
	.dwattr $C$DW$296, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$297	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A25")
	.dwattr $C$DW$297, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$298	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A26")
	.dwattr $C$DW$298, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$299	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A27")
	.dwattr $C$DW$299, DW_AT_location[DW_OP_regx 0x30]
$C$DW$300	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A28")
	.dwattr $C$DW$300, DW_AT_location[DW_OP_regx 0x31]
$C$DW$301	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A29")
	.dwattr $C$DW$301, DW_AT_location[DW_OP_regx 0x32]
$C$DW$302	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A30")
	.dwattr $C$DW$302, DW_AT_location[DW_OP_regx 0x33]
$C$DW$303	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A31")
	.dwattr $C$DW$303, DW_AT_location[DW_OP_regx 0x34]
$C$DW$304	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B16")
	.dwattr $C$DW$304, DW_AT_location[DW_OP_regx 0x35]
$C$DW$305	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B17")
	.dwattr $C$DW$305, DW_AT_location[DW_OP_regx 0x36]
$C$DW$306	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B18")
	.dwattr $C$DW$306, DW_AT_location[DW_OP_regx 0x37]
$C$DW$307	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B19")
	.dwattr $C$DW$307, DW_AT_location[DW_OP_regx 0x38]
$C$DW$308	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B20")
	.dwattr $C$DW$308, DW_AT_location[DW_OP_regx 0x39]
$C$DW$309	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B21")
	.dwattr $C$DW$309, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$310	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B22")
	.dwattr $C$DW$310, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$311	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B23")
	.dwattr $C$DW$311, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$312	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B24")
	.dwattr $C$DW$312, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$313	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B25")
	.dwattr $C$DW$313, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$314	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B26")
	.dwattr $C$DW$314, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$315	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B27")
	.dwattr $C$DW$315, DW_AT_location[DW_OP_regx 0x40]
$C$DW$316	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B28")
	.dwattr $C$DW$316, DW_AT_location[DW_OP_regx 0x41]
$C$DW$317	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B29")
	.dwattr $C$DW$317, DW_AT_location[DW_OP_regx 0x42]
$C$DW$318	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B30")
	.dwattr $C$DW$318, DW_AT_location[DW_OP_regx 0x43]
$C$DW$319	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B31")
	.dwattr $C$DW$319, DW_AT_location[DW_OP_regx 0x44]
$C$DW$320	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("AMR")
	.dwattr $C$DW$320, DW_AT_location[DW_OP_regx 0x45]
$C$DW$321	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CSR")
	.dwattr $C$DW$321, DW_AT_location[DW_OP_regx 0x46]
$C$DW$322	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISR")
	.dwattr $C$DW$322, DW_AT_location[DW_OP_regx 0x47]
$C$DW$323	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ICR")
	.dwattr $C$DW$323, DW_AT_location[DW_OP_regx 0x48]
$C$DW$324	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IER")
	.dwattr $C$DW$324, DW_AT_location[DW_OP_regx 0x49]
$C$DW$325	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISTP")
	.dwattr $C$DW$325, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$326	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IN")
	.dwattr $C$DW$326, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$327	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OUT")
	.dwattr $C$DW$327, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$328	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ACR")
	.dwattr $C$DW$328, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$329	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ADR")
	.dwattr $C$DW$329, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$330	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FADCR")
	.dwattr $C$DW$330, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$331	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FAUCR")
	.dwattr $C$DW$331, DW_AT_location[DW_OP_regx 0x50]
$C$DW$332	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FMCR")
	.dwattr $C$DW$332, DW_AT_location[DW_OP_regx 0x51]
$C$DW$333	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GFPGFR")
	.dwattr $C$DW$333, DW_AT_location[DW_OP_regx 0x52]
$C$DW$334	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DIER")
	.dwattr $C$DW$334, DW_AT_location[DW_OP_regx 0x53]
$C$DW$335	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("REP")
	.dwattr $C$DW$335, DW_AT_location[DW_OP_regx 0x54]
$C$DW$336	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCL")
	.dwattr $C$DW$336, DW_AT_location[DW_OP_regx 0x55]
$C$DW$337	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCH")
	.dwattr $C$DW$337, DW_AT_location[DW_OP_regx 0x56]
$C$DW$338	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ARP")
	.dwattr $C$DW$338, DW_AT_location[DW_OP_regx 0x57]
$C$DW$339	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ILC")
	.dwattr $C$DW$339, DW_AT_location[DW_OP_regx 0x58]
$C$DW$340	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RILC")
	.dwattr $C$DW$340, DW_AT_location[DW_OP_regx 0x59]
$C$DW$341	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DNUM")
	.dwattr $C$DW$341, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$342	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SSR")
	.dwattr $C$DW$342, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$343	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYA")
	.dwattr $C$DW$343, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$344	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYB")
	.dwattr $C$DW$344, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$345	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSR")
	.dwattr $C$DW$345, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$346	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ITSR")
	.dwattr $C$DW$346, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$347	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NTSR")
	.dwattr $C$DW$347, DW_AT_location[DW_OP_regx 0x60]
$C$DW$348	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("EFR")
	.dwattr $C$DW$348, DW_AT_location[DW_OP_regx 0x61]
$C$DW$349	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ECR")
	.dwattr $C$DW$349, DW_AT_location[DW_OP_regx 0x62]
$C$DW$350	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IERR")
	.dwattr $C$DW$350, DW_AT_location[DW_OP_regx 0x63]
$C$DW$351	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DMSG")
	.dwattr $C$DW$351, DW_AT_location[DW_OP_regx 0x64]
$C$DW$352	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CMSG")
	.dwattr $C$DW$352, DW_AT_location[DW_OP_regx 0x65]
$C$DW$353	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_ADDR")
	.dwattr $C$DW$353, DW_AT_location[DW_OP_regx 0x66]
$C$DW$354	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_DATA")
	.dwattr $C$DW$354, DW_AT_location[DW_OP_regx 0x67]
$C$DW$355	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_CNTL")
	.dwattr $C$DW$355, DW_AT_location[DW_OP_regx 0x68]
$C$DW$356	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCU_CNTL")
	.dwattr $C$DW$356, DW_AT_location[DW_OP_regx 0x69]
$C$DW$357	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_REC_CNTL")
	.dwattr $C$DW$357, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$358	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_XMT_CNTL")
	.dwattr $C$DW$358, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$359	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_CFG")
	.dwattr $C$DW$359, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$360	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RDATA")
	.dwattr $C$DW$360, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$361	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WDATA")
	.dwattr $C$DW$361, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$362	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RADDR")
	.dwattr $C$DW$362, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$363	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WADDR")
	.dwattr $C$DW$363, DW_AT_location[DW_OP_regx 0x70]
$C$DW$364	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("MFREG0")
	.dwattr $C$DW$364, DW_AT_location[DW_OP_regx 0x71]
$C$DW$365	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DBG_STAT")
	.dwattr $C$DW$365, DW_AT_location[DW_OP_regx 0x72]
$C$DW$366	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("BRK_EN")
	.dwattr $C$DW$366, DW_AT_location[DW_OP_regx 0x73]
$C$DW$367	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0_CNT")
	.dwattr $C$DW$367, DW_AT_location[DW_OP_regx 0x74]
$C$DW$368	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0")
	.dwattr $C$DW$368, DW_AT_location[DW_OP_regx 0x75]
$C$DW$369	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP1")
	.dwattr $C$DW$369, DW_AT_location[DW_OP_regx 0x76]
$C$DW$370	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP2")
	.dwattr $C$DW$370, DW_AT_location[DW_OP_regx 0x77]
$C$DW$371	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP3")
	.dwattr $C$DW$371, DW_AT_location[DW_OP_regx 0x78]
$C$DW$372	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OVERLAY")
	.dwattr $C$DW$372, DW_AT_location[DW_OP_regx 0x79]
$C$DW$373	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC_PROF")
	.dwattr $C$DW$373, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$374	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ATSR")
	.dwattr $C$DW$374, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$375	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TRR")
	.dwattr $C$DW$375, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$376	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCRR")
	.dwattr $C$DW$376, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$377	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DESR")
	.dwattr $C$DW$377, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$378	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DETR")
	.dwattr $C$DW$378, DW_AT_location[DW_OP_regx 0x7f]
$C$DW$379	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CIE_RETA")
	.dwattr $C$DW$379, DW_AT_location[DW_OP_regx 0xe4]
	.dwendtag $C$DW$CU

