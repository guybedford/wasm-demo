	.text
	.file	"native/demo.c"
	.section	.text.getCircleCount,"ax",@progbits
	.hidden	getCircleCount
	.globl	getCircleCount
	.type	getCircleCount,@function
getCircleCount:                         # @getCircleCount
	.result 	i32
# BB#0:                                 # %entry
	i32.const	$push0=, 1000
                                        # fallthrough-return: $pop0
	.endfunc
.Lfunc_end0:
	.size	getCircleCount, .Lfunc_end0-getCircleCount

	.section	.text.getCircleDataOffset,"ax",@progbits
	.hidden	getCircleDataOffset
	.globl	getCircleDataOffset
	.type	getCircleDataOffset,@function
getCircleDataOffset:                    # @getCircleDataOffset
	.result 	i32
# BB#0:                                 # %entry
	i32.const	$push0=, circleData
                                        # fallthrough-return: $pop0
	.endfunc
.Lfunc_end1:
	.size	getCircleDataOffset, .Lfunc_end1-getCircleDataOffset

	.section	.text.init,"ax",@progbits
	.hidden	init
	.globl	init
	.type	init,@function
init:                                   # @init
	.param  	f32, f32
	.local  	f32, i32, i32
# BB#0:                                 # %entry
	i32.const	$4=, -8000
	i32.const	$3=, circleData
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label1:
	i32.eqz 	$push28=, $4
	br_if   	1, $pop28       # 1: down to label0
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	f32.call	$push0=, randomf@FUNCTION
	f32.mul 	$push1=, $pop0, $0
	f32.store	0($3), $pop1
	f32.call	$2=, randomf@FUNCTION
	i32.const	$push27=, 8
	i32.add 	$push2=, $3, $pop27
	i32.const	$push26=, 1084227584
	i32.store	0($pop2), $pop26
	i32.const	$push25=, 4
	i32.add 	$push3=, $3, $pop25
	f32.mul 	$push4=, $2, $1
	f32.store	0($pop3), $pop4
	i32.const	$push24=, circlevData+8000
	i32.add 	$push5=, $4, $pop24
	f32.call	$push6=, randomf@FUNCTION
	f64.promote/f32	$push7=, $pop6
	f64.const	$push23=, -0x1p-1
	f64.add 	$push8=, $pop7, $pop23
	f64.const	$push22=, 0x1.47ae147ae147bp-7
	f64.mul 	$push9=, $pop8, $pop22
	f32.demote/f64	$push10=, $pop9
	f32.store	0($pop5), $pop10
	i32.const	$push21=, circlevData+8004
	i32.add 	$push11=, $4, $pop21
	f32.call	$push12=, randomf@FUNCTION
	f64.promote/f32	$push13=, $pop12
	f64.const	$push20=, -0x1p-1
	f64.add 	$push14=, $pop13, $pop20
	f64.const	$push19=, 0x1.47ae147ae147bp-7
	f64.mul 	$push15=, $pop14, $pop19
	f32.demote/f64	$push16=, $pop15
	f32.store	0($pop11), $pop16
	i32.const	$push18=, 12
	i32.add 	$3=, $3, $pop18
	i32.const	$push17=, 8
	i32.add 	$4=, $4, $pop17
	br      	0               # 0: up to label1
.LBB2_3:                                # %for.cond.cleanup
	end_loop
	end_block                       # label0:
                                        # fallthrough-return
	.endfunc
.Lfunc_end2:
	.size	init, .Lfunc_end2-init

	.section	.text.timeStep,"ax",@progbits
	.hidden	timeStep
	.globl	timeStep
	.type	timeStep,@function
timeStep:                               # @timeStep
	.param  	f32, f32
	.local  	f32, f32, f32, f32, f32, i32, i32, f32, i32, i32
# BB#0:                                 # %entry
	i32.const	$11=, -8000
	i32.const	$10=, circleData
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label3:
	i32.eqz 	$push65=, $11
	br_if   	1, $pop65       # 1: down to label2
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	f32.load	$push50=, 0($10)
	tee_local	$push49=, $2=, $pop50
	i32.const	$push48=, circlevData+8000
	i32.add 	$push47=, $11, $pop48
	tee_local	$push46=, $7=, $pop47
	f32.load	$push45=, 0($pop46)
	tee_local	$push44=, $5=, $pop45
	f32.add 	$push0=, $pop49, $pop44
	f32.store	0($10), $pop0
	i32.const	$push43=, 4
	i32.add 	$push42=, $10, $pop43
	tee_local	$push41=, $8=, $pop42
	f32.load	$push40=, 0($8)
	tee_local	$push39=, $3=, $pop40
	i32.const	$push38=, circlevData+8004
	i32.add 	$push37=, $11, $pop38
	tee_local	$push36=, $8=, $pop37
	f32.load	$push35=, 0($pop36)
	tee_local	$push34=, $6=, $pop35
	f32.add 	$push1=, $pop39, $pop34
	f32.store	0($pop41), $pop1
	block   	
	block   	
	block   	
	i32.const	$push33=, 8
	i32.add 	$push2=, $10, $pop33
	f32.load	$push32=, 0($pop2)
	tee_local	$push31=, $4=, $pop32
	f32.add 	$push30=, $2, $pop31
	tee_local	$push29=, $9=, $pop30
	f32.le  	$push3=, $pop29, $0
	f32.ne  	$push4=, $9, $9
	f32.ne  	$push5=, $0, $0
	i32.or  	$push6=, $pop4, $pop5
	i32.or  	$push7=, $pop3, $pop6
	br_if   	0, $pop7        # 0: down to label6
# BB#3:                                 # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	f32.const	$push51=, 0x0p0
	f32.gt  	$push8=, $5, $pop51
	br_if   	1, $pop8        # 1: down to label5
.LBB3_4:                                # %lor.lhs.false
                                        #   in Loop: Header=BB3_1 Depth=1
	end_block                       # label6:
	f32.sub 	$push54=, $2, $4
	tee_local	$push53=, $9=, $pop54
	f32.const	$push52=, 0x0p0
	f32.ge  	$push9=, $pop53, $pop52
	f32.ne  	$push10=, $9, $9
	i32.or  	$push11=, $pop9, $pop10
	br_if   	1, $pop11       # 1: down to label4
# BB#5:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB3_1 Depth=1
	f32.const	$push55=, 0x0p0
	f32.ge  	$push12=, $5, $pop55
	f32.ne  	$push13=, $5, $5
	i32.or  	$push14=, $pop12, $pop13
	br_if   	1, $pop14       # 1: down to label4
.LBB3_6:                                # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	end_block                       # label5:
	f32.neg 	$push15=, $5
	f32.store	0($7), $pop15
.LBB3_7:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	end_block                       # label4:
	block   	
	block   	
	block   	
	f32.add 	$push57=, $3, $4
	tee_local	$push56=, $5=, $pop57
	f32.le  	$push16=, $pop56, $1
	f32.ne  	$push17=, $5, $5
	f32.ne  	$push18=, $1, $1
	i32.or  	$push19=, $pop17, $pop18
	i32.or  	$push20=, $pop16, $pop19
	br_if   	0, $pop20       # 0: down to label9
# BB#8:                                 # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	f32.const	$push58=, 0x0p0
	f32.gt  	$push21=, $6, $pop58
	br_if   	1, $pop21       # 1: down to label8
.LBB3_9:                                # %lor.lhs.false28
                                        #   in Loop: Header=BB3_1 Depth=1
	end_block                       # label9:
	f32.sub 	$push61=, $3, $4
	tee_local	$push60=, $5=, $pop61
	f32.const	$push59=, 0x0p0
	f32.ge  	$push22=, $pop60, $pop59
	f32.ne  	$push23=, $5, $5
	i32.or  	$push24=, $pop22, $pop23
	br_if   	1, $pop24       # 1: down to label7
# BB#10:                                # %lor.lhs.false28
                                        #   in Loop: Header=BB3_1 Depth=1
	f32.const	$push62=, 0x0p0
	f32.ge  	$push25=, $6, $pop62
	f32.ne  	$push26=, $6, $6
	i32.or  	$push27=, $pop25, $pop26
	br_if   	1, $pop27       # 1: down to label7
.LBB3_11:                               # %if.then33
                                        #   in Loop: Header=BB3_1 Depth=1
	end_block                       # label8:
	f32.neg 	$push28=, $6
	f32.store	0($8), $pop28
.LBB3_12:                               # %if.end37
                                        #   in Loop: Header=BB3_1 Depth=1
	end_block                       # label7:
	i32.const	$push64=, 12
	i32.add 	$10=, $10, $pop64
	i32.const	$push63=, 8
	i32.add 	$11=, $11, $pop63
	br      	0               # 0: up to label3
.LBB3_13:                               # %for.cond.cleanup
	end_loop
	end_block                       # label2:
                                        # fallthrough-return
	.endfunc
.Lfunc_end3:
	.size	timeStep, .Lfunc_end3-timeStep

	.hidden	circleData              # @circleData
	.type	circleData,@object
	.section	.bss.circleData,"aw",@nobits
	.globl	circleData
	.p2align	4
circleData:
	.skip	12000
	.size	circleData, 12000

	.hidden	circlevData             # @circlevData
	.type	circlevData,@object
	.section	.bss.circlevData,"aw",@nobits
	.globl	circlevData
	.p2align	4
circlevData:
	.skip	8000
	.size	circlevData, 8000


	.ident	"clang version 5.0.0 (git@github.com:llvm-mirror/clang b5e2ee2f62458c5f3f726fffed4a9c193b722c6f) (git@github.com:llvm-mirror/llvm 9d064387c265ee02768dafacedf9179e9ff3d5ee)"
	.functype	randomf, f32
