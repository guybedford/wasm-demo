	.text
	.file	"native/demo-opt.c"
	.section	.text.getCircleCount,"ax",@progbits
	.hidden	getCircleCount
	.globl	getCircleCount
	.type	getCircleCount,@function
getCircleCount:                         # @getCircleCount
	.result 	i32
# BB#0:                                 # %entry
	i32.const	$push0=, 20000
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

	.section	.text.detectCircleCollision,"ax",@progbits
	.hidden	detectCircleCollision
	.globl	detectCircleCollision
	.type	detectCircleCollision,@function
detectCircleCollision:                  # @detectCircleCollision
	.param  	f32, f32, f32, f32, f32, f32
	.result 	i32
	.local  	i32
# BB#0:                                 # %entry
	i32.const	$6=, 0
	block   	
	f32.add 	$push1=, $0, $2
	f32.sub 	$push0=, $3, $5
	f32.lt  	$push2=, $pop1, $pop0
	br_if   	0, $pop2        # 0: down to label0
# BB#1:                                 # %lor.lhs.false
	f32.sub 	$push4=, $0, $2
	f32.add 	$push3=, $3, $5
	f32.gt  	$push5=, $pop4, $pop3
	br_if   	0, $pop5        # 0: down to label0
# BB#2:                                 # %lor.lhs.false4
	f32.add 	$push7=, $1, $2
	f32.sub 	$push6=, $4, $5
	f32.lt  	$push8=, $pop7, $pop6
	br_if   	0, $pop8        # 0: down to label0
# BB#3:                                 # %lor.lhs.false8
	f32.sub 	$push10=, $1, $2
	f32.add 	$push9=, $4, $5
	f32.gt  	$push11=, $pop10, $pop9
	br_if   	0, $pop11       # 0: down to label0
# BB#4:                                 # %if.end
	f32.sub 	$push20=, $3, $0
	tee_local	$push19=, $0=, $pop20
	f32.mul 	$push13=, $pop19, $0
	f32.sub 	$push18=, $4, $1
	tee_local	$push17=, $0=, $pop18
	f32.mul 	$push12=, $pop17, $0
	f32.add 	$push14=, $pop13, $pop12
	f32.sqrt	$push15=, $pop14
	f32.add 	$push16=, $2, $5
	f32.le  	$6=, $pop15, $pop16
.LBB2_5:                                # %return
	end_block                       # label0:
	copy_local	$push21=, $6
                                        # fallthrough-return: $pop21
	.endfunc
.Lfunc_end2:
	.size	detectCircleCollision, .Lfunc_end2-detectCircleCollision

	.section	.text.init,"ax",@progbits
	.hidden	init
	.globl	init
	.type	init,@function
init:                                   # @init
	.param  	f32, f32
	.local  	f32, f32, f32, i32, i32, f32, i32, i32, i32
# BB#0:                                 # %entry
	i32.const	$8=, 0
.LBB3_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #       Child Loop BB3_7 Depth 3
	block   	
	loop    	                # label2:
	i32.const	$push67=, 20000
	i32.eq  	$push1=, $8, $pop67
	br_if   	1, $pop1        # 1: down to label1
.LBB3_2:                                # %do.body
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_7 Depth 3
	loop    	                # label3:
	f32.call	$7=, randomf@FUNCTION
	f32.call	$3=, randomf@FUNCTION
	f32.mul 	$push41=, $7, $0
	tee_local	$push40=, $2=, $pop41
	f32.call	$push2=, randomf@FUNCTION
	f32.const	$push39=, 0x1p3
	f32.mul 	$push3=, $pop2, $pop39
	f32.call	$push4=, expf@FUNCTION, $pop3
	f64.promote/f32	$push5=, $pop4
	f64.const	$push38=, 0x1.749e83e425aeep4
	f64.div 	$push6=, $pop5, $pop38
	f32.demote/f64	$push7=, $pop6
	f32.ceil	$push37=, $pop7
	tee_local	$push36=, $4=, $pop37
	f32.add 	$push8=, $pop40, $pop36
	f32.sub 	$7=, $0, $pop8
	f32.sub 	$push9=, $2, $4
	f32.const	$push35=, 0x0p0
	f32.lt  	$push10=, $pop9, $pop35
	br_if   	0, $pop10       # 0: up to label3
# BB#3:                                 # %do.body
                                        #   in Loop: Header=BB3_2 Depth=2
	f32.mul 	$3=, $3, $1
	f32.const	$push42=, 0x0p0
	f32.lt  	$push11=, $7, $pop42
	br_if   	0, $pop11       # 0: up to label3
# BB#4:                                 # %lor.lhs.false13
                                        #   in Loop: Header=BB3_2 Depth=2
	f32.add 	$push12=, $3, $4
	f32.sub 	$7=, $1, $pop12
	f32.sub 	$push13=, $3, $4
	f32.const	$push43=, 0x0p0
	f32.lt  	$push14=, $pop13, $pop43
	br_if   	0, $pop14       # 0: up to label3
# BB#5:                                 # %lor.lhs.false13
                                        #   in Loop: Header=BB3_2 Depth=2
	f32.const	$push44=, 0x0p0
	f32.lt  	$push15=, $7, $pop44
	br_if   	0, $pop15       # 0: up to label3
# BB#6:                                 # %for.cond22.preheader
                                        #   in Loop: Header=BB3_2 Depth=2
	i32.const	$10=, circleData
	i32.const	$9=, -1
.LBB3_7:                                # %for.cond22
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	block   	
	loop    	                # label5:
	i32.const	$push47=, 1
	i32.add 	$push46=, $9, $pop47
	tee_local	$push45=, $9=, $pop46
	i32.ge_s	$push16=, $pop45, $8
	br_if   	1, $pop16       # 1: down to label4
# BB#8:                                 # %for.body26
                                        #   in Loop: Header=BB3_7 Depth=3
	i32.const	$push50=, 8
	i32.add 	$5=, $10, $pop50
	i32.const	$push49=, 4
	i32.add 	$6=, $10, $pop49
	f32.load	$7=, 0($10)
	i32.const	$push48=, 12
	i32.add 	$push0=, $10, $pop48
	copy_local	$10=, $pop0
	f32.load	$push33=, 0($6)
	f32.load	$push32=, 0($5)
	i32.call	$push34=, detectCircleCollision@FUNCTION, $2, $3, $4, $7, $pop33, $pop32
	i32.eqz 	$push68=, $pop34
	br_if   	0, $pop68       # 0: up to label5
	br      	2               # 2: up to label3
.LBB3_9:                                # %do.end.critedge
                                        #   in Loop: Header=BB3_1 Depth=1
	end_loop
	end_block                       # label4:
	end_loop
	i32.const	$push66=, 12
	i32.mul 	$push65=, $8, $pop66
	tee_local	$push64=, $10=, $pop65
	i32.const	$push63=, circleData+4
	i32.add 	$push17=, $pop64, $pop63
	f32.store	0($pop17), $3
	i32.const	$push62=, circleData
	i32.add 	$push18=, $10, $pop62
	f32.store	0($pop18), $2
	i32.const	$push61=, circleData+8
	i32.add 	$push19=, $10, $pop61
	f32.store	0($pop19), $4
	i32.const	$push60=, 3
	i32.shl 	$push59=, $8, $pop60
	tee_local	$push58=, $10=, $pop59
	i32.const	$push57=, circlevData
	i32.add 	$push20=, $pop58, $pop57
	f32.call	$push21=, randomf@FUNCTION
	f64.promote/f32	$push22=, $pop21
	f64.const	$push56=, -0x1p-1
	f64.add 	$push23=, $pop22, $pop56
	f64.const	$push55=, 0x1.999999999999ap-4
	f64.mul 	$push24=, $pop23, $pop55
	f32.demote/f64	$push25=, $pop24
	f32.store	0($pop20), $pop25
	i32.const	$push54=, circlevData+4
	i32.add 	$push26=, $10, $pop54
	f32.call	$push27=, randomf@FUNCTION
	f64.promote/f32	$push28=, $pop27
	f64.const	$push53=, -0x1p-1
	f64.add 	$push29=, $pop28, $pop53
	f64.const	$push52=, 0x1.999999999999ap-4
	f64.mul 	$push30=, $pop29, $pop52
	f32.demote/f64	$push31=, $pop30
	f32.store	0($pop26), $pop31
	i32.const	$push51=, 1
	i32.add 	$8=, $8, $pop51
	br      	0               # 0: up to label2
.LBB3_10:                               # %for.cond.cleanup
	end_loop
	end_block                       # label1:
                                        # fallthrough-return
	.endfunc
.Lfunc_end3:
	.size	init, .Lfunc_end3-init

	.section	.text.timeStep,"ax",@progbits
	.hidden	timeStep
	.globl	timeStep
	.type	timeStep,@function
timeStep:                               # @timeStep
	.param  	f32, f32
	.local  	i32, i32, i32, i32, f32, f32, f32, i32, f32, i32, f32, i32, f32, f32, f32, f32, f32, f32, f64, i32, f32, f32, i32, i32
# BB#0:                                 # %entry
	i32.const	$21=, grid
	i32.const	$13=, 0
.LBB4_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_3 Depth 2
	block   	
	loop    	                # label7:
	i32.const	$push96=, 70
	i32.eq  	$push0=, $13, $pop96
	br_if   	1, $pop0        # 1: down to label6
# BB#2:                                 # %for.cond1.preheader
                                        #   in Loop: Header=BB4_1 Depth=1
	i32.const	$25=, 0
.LBB4_3:                                # %for.cond1
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	block   	
	loop    	                # label9:
	i32.const	$push93=, 480
	i32.eq  	$push1=, $25, $pop93
	br_if   	1, $pop1        # 1: down to label8
# BB#4:                                 # %for.body4
                                        #   in Loop: Header=BB4_3 Depth=2
	i32.add 	$push2=, $21, $25
	i32.const	$push92=, 0
	i32.store	0($pop2), $pop92
	i32.const	$push91=, 4
	i32.add 	$25=, $25, $pop91
	br      	0               # 0: up to label9
.LBB4_5:                                # %for.cond.cleanup3
                                        #   in Loop: Header=BB4_1 Depth=1
	end_loop
	end_block                       # label8:
	i32.const	$push95=, 480
	i32.add 	$21=, $21, $pop95
	i32.const	$push94=, 1
	i32.add 	$13=, $13, $pop94
	br      	0               # 0: up to label7
.LBB4_6:                                # %for.cond9.preheader
	end_loop
	end_block                       # label6:
	i32.const	$5=, 0
	i32.const	$11=, 0
.LBB4_7:                                # %for.cond9
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_19 Depth 2
                                        #       Child Loop BB4_21 Depth 3
	block   	
	loop    	                # label11:
	i32.const	$push176=, 20000
	i32.eq  	$push3=, $5, $pop176
	br_if   	1, $pop3        # 1: down to label10
# BB#8:                                 # %for.body12
                                        #   in Loop: Header=BB4_7 Depth=1
	i32.const	$push125=, 12
	i32.mul 	$push124=, $5, $pop125
	tee_local	$push123=, $25=, $pop124
	i32.const	$push122=, circleData
	i32.add 	$push121=, $pop123, $pop122
	tee_local	$push120=, $21=, $pop121
	f32.load	$push119=, 0($pop120)
	tee_local	$push118=, $15=, $pop119
	i32.const	$push117=, circleData+8
	i32.add 	$push5=, $25, $pop117
	f32.load	$push116=, 0($pop5)
	tee_local	$push115=, $7=, $pop116
	f32.add 	$10=, $pop118, $pop115
	i32.const	$push114=, circleData+4
	i32.add 	$push113=, $25, $pop114
	tee_local	$push112=, $25=, $pop113
	f32.load	$6=, 0($pop112)
	i32.const	$push111=, 3
	i32.shl 	$push110=, $5, $pop111
	tee_local	$push109=, $13=, $pop110
	i32.const	$push108=, circlevData+4
	i32.add 	$push107=, $pop109, $pop108
	tee_local	$push106=, $9=, $pop107
	f32.load	$push8=, 0($pop106)
	f64.promote/f32	$push9=, $pop8
	f64.const	$push105=, 0x1.a36e2eb1c432dp-14
	f64.add 	$20=, $pop9, $pop105
	block   	
	block   	
	block   	
	i32.const	$push104=, circlevData
	i32.add 	$push103=, $13, $pop104
	tee_local	$push102=, $13=, $pop103
	f32.load	$push101=, 0($pop102)
	tee_local	$push100=, $16=, $pop101
	f32.const	$push99=, 0x0p0
	f32.le  	$push6=, $pop100, $pop99
	f32.ne  	$push98=, $16, $16
	tee_local	$push97=, $24=, $pop98
	i32.or  	$push7=, $pop6, $pop97
	br_if   	0, $pop7        # 0: down to label14
# BB#9:                                 # %for.body12
                                        #   in Loop: Header=BB4_7 Depth=1
	f32.sub 	$push4=, $0, $10
	f32.const	$push126=, 0x0p0
	f32.lt  	$push10=, $pop4, $pop126
	br_if   	1, $pop10       # 1: down to label13
.LBB4_10:                               # %lor.lhs.false
                                        #   in Loop: Header=BB4_7 Depth=1
	end_block                       # label14:
	f32.sub 	$push129=, $15, $7
	tee_local	$push128=, $8=, $pop129
	f32.const	$push127=, 0x0p0
	f32.ge  	$push11=, $pop128, $pop127
	f32.ne  	$push12=, $8, $8
	i32.or  	$push13=, $pop11, $pop12
	br_if   	1, $pop13       # 1: down to label12
# BB#11:                                # %lor.lhs.false
                                        #   in Loop: Header=BB4_7 Depth=1
	f32.const	$push130=, 0x0p0
	f32.ge  	$push14=, $16, $pop130
	i32.or  	$push15=, $pop14, $24
	br_if   	1, $pop15       # 1: down to label12
.LBB4_12:                               # %if.then
                                        #   in Loop: Header=BB4_7 Depth=1
	end_block                       # label13:
	f32.neg 	$16=, $16
.LBB4_13:                               # %if.end
                                        #   in Loop: Header=BB4_7 Depth=1
	end_block                       # label12:
	f32.demote/f64	$8=, $20
	f32.sub 	$14=, $6, $7
	block   	
	block   	
	block   	
	f32.add 	$push135=, $6, $7
	tee_local	$push134=, $17=, $pop135
	f32.sub 	$push133=, $1, $pop134
	tee_local	$push132=, $19=, $pop133
	f32.const	$push131=, 0x0p0
	f32.ge  	$push16=, $pop132, $pop131
	f32.ne  	$push17=, $19, $19
	i32.or  	$push18=, $pop16, $pop17
	br_if   	0, $pop18       # 0: down to label17
# BB#14:                                # %if.end
                                        #   in Loop: Header=BB4_7 Depth=1
	f32.const	$push136=, 0x0p0
	f32.gt  	$push19=, $8, $pop136
	br_if   	1, $pop19       # 1: down to label16
.LBB4_15:                               # %lor.lhs.false38
                                        #   in Loop: Header=BB4_7 Depth=1
	end_block                       # label17:
	f32.const	$push137=, 0x0p0
	f32.ge  	$push20=, $14, $pop137
	f32.ne  	$push21=, $14, $14
	i32.or  	$push22=, $pop20, $pop21
	br_if   	1, $pop22       # 1: down to label15
# BB#16:                                # %lor.lhs.false38
                                        #   in Loop: Header=BB4_7 Depth=1
	f32.const	$push138=, 0x0p0
	f32.ge  	$push23=, $8, $pop138
	f32.ne  	$push24=, $8, $8
	i32.or  	$push25=, $pop23, $pop24
	br_if   	1, $pop25       # 1: down to label15
.LBB4_17:                               # %if.then45
                                        #   in Loop: Header=BB4_7 Depth=1
	end_block                       # label16:
	f32.neg 	$8=, $8
.LBB4_18:                               # %if.end47
                                        #   in Loop: Header=BB4_7 Depth=1
	end_block                       # label15:
	f32.store	0($13), $16
	f32.store	0($9), $8
	f32.add 	$push26=, $6, $8
	f32.store	0($25), $pop26
	f32.add 	$push27=, $15, $16
	f32.store	0($21), $pop27
	f32.sub 	$push33=, $15, $7
	f32.div 	$push34=, $pop33, $0
	f32.const	$push165=, 0x1.18p6
	f32.mul 	$push35=, $pop34, $pop165
	f32.floor	$push36=, $pop35
	i32.trunc_s/f32	$push164=, $pop36
	tee_local	$push163=, $25=, $pop164
	i32.const	$push162=, 0
	i32.const	$push161=, 0
	i32.gt_s	$push37=, $25, $pop161
	i32.select	$push160=, $pop163, $pop162, $pop37
	tee_local	$push159=, $24=, $pop160
	i32.const	$push158=, 480
	i32.mul 	$push38=, $pop159, $pop158
	f32.div 	$push28=, $14, $1
	f32.const	$push157=, 0x1.ep6
	f32.mul 	$push29=, $pop28, $pop157
	f32.floor	$push30=, $pop29
	i32.trunc_s/f32	$push156=, $pop30
	tee_local	$push155=, $25=, $pop156
	i32.const	$push154=, 0
	i32.const	$push153=, 0
	i32.gt_s	$push31=, $25, $pop153
	i32.select	$push152=, $pop155, $pop154, $pop31
	tee_local	$push151=, $3=, $pop152
	i32.const	$push150=, 2
	i32.shl 	$push32=, $pop151, $pop150
	i32.add 	$push39=, $pop38, $pop32
	i32.const	$push149=, grid
	i32.add 	$4=, $pop39, $pop149
	f32.div 	$push40=, $17, $1
	f32.const	$push148=, 0x1.ep6
	f32.mul 	$push41=, $pop40, $pop148
	f32.floor	$push42=, $pop41
	i32.trunc_s/f32	$push147=, $pop42
	tee_local	$push146=, $25=, $pop147
	i32.const	$push145=, 119
	i32.const	$push144=, 119
	i32.lt_s	$push43=, $25, $pop144
	i32.select	$9=, $pop146, $pop145, $pop43
	f32.div 	$push44=, $10, $0
	f32.const	$push143=, 0x1.18p6
	f32.mul 	$push45=, $pop44, $pop143
	f32.floor	$push46=, $pop45
	i32.trunc_s/f32	$push142=, $pop46
	tee_local	$push141=, $25=, $pop142
	i32.const	$push140=, 69
	i32.const	$push139=, 69
	i32.lt_s	$push47=, $25, $pop139
	i32.select	$2=, $pop141, $pop140, $pop47
.LBB4_19:                               # %for.cond92
                                        #   Parent Loop BB4_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_21 Depth 3
	block   	
	loop    	                # label19:
	i32.gt_s	$push48=, $24, $2
	br_if   	1, $pop48       # 1: down to label18
# BB#20:                                # %for.cond98.preheader
                                        #   in Loop: Header=BB4_19 Depth=2
	i32.const	$push167=, 3
	i32.shl 	$push49=, $11, $pop167
	i32.const	$push166=, cellCircles
	i32.add 	$25=, $pop49, $pop166
	copy_local	$21=, $4
	copy_local	$13=, $3
.LBB4_21:                               # %for.cond98
                                        #   Parent Loop BB4_7 Depth=1
                                        #     Parent Loop BB4_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	block   	
	loop    	                # label21:
	i32.gt_s	$push50=, $13, $9
	br_if   	1, $pop50       # 1: down to label20
# BB#22:                                # %for.body102
                                        #   in Loop: Header=BB4_21 Depth=3
	i32.const	$push172=, 4
	i32.add 	$push51=, $25, $pop172
	i32.load	$push52=, 0($21)
	i32.store	0($pop51), $pop52
	i32.store	0($25), $5
	i32.store	0($21), $25
	i32.const	$push171=, 8
	i32.add 	$25=, $25, $pop171
	i32.const	$push170=, 4
	i32.add 	$21=, $21, $pop170
	i32.const	$push169=, 1
	i32.add 	$13=, $13, $pop169
	i32.const	$push168=, 1
	i32.add 	$11=, $11, $pop168
	br      	0               # 0: up to label21
.LBB4_23:                               # %for.cond.cleanup101
                                        #   in Loop: Header=BB4_19 Depth=2
	end_loop
	end_block                       # label20:
	i32.const	$push174=, 480
	i32.add 	$4=, $4, $pop174
	i32.const	$push173=, 1
	i32.add 	$24=, $24, $pop173
	br      	0               # 0: up to label19
.LBB4_24:                               # %for.cond.cleanup95
                                        #   in Loop: Header=BB4_7 Depth=1
	end_loop
	end_block                       # label18:
	i32.const	$push175=, 1
	i32.add 	$5=, $5, $pop175
	br      	0               # 0: up to label11
.LBB4_25:                               # %for.cond119.preheader
	end_loop
	end_block                       # label10:
	i32.const	$4=, 0
.LBB4_26:                               # %for.cond119
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_28 Depth 2
                                        #       Child Loop BB4_30 Depth 3
                                        #         Child Loop BB4_32 Depth 4
	block   	
	loop    	                # label23:
	i32.const	$push257=, 70
	i32.eq  	$push53=, $4, $pop257
	br_if   	1, $pop53       # 1: down to label22
# BB#27:                                # %for.cond125.preheader
                                        #   in Loop: Header=BB4_26 Depth=1
	i32.const	$24=, 0
.LBB4_28:                               # %for.cond125
                                        #   Parent Loop BB4_26 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_30 Depth 3
                                        #         Child Loop BB4_32 Depth 4
	block   	
	loop    	                # label25:
	i32.const	$push255=, 120
	i32.eq  	$push54=, $24, $pop255
	br_if   	1, $pop54       # 1: down to label24
# BB#29:                                # %for.body129
                                        #   in Loop: Header=BB4_28 Depth=2
	i32.const	$push179=, 480
	i32.mul 	$push56=, $4, $pop179
	i32.const	$push178=, 2
	i32.shl 	$push55=, $24, $pop178
	i32.add 	$push57=, $pop56, $pop55
	i32.const	$push177=, grid
	i32.add 	$25=, $pop57, $pop177
.LBB4_30:                               # %while.cond
                                        #   Parent Loop BB4_26 Depth=1
                                        #     Parent Loop BB4_28 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_32 Depth 4
	block   	
	loop    	                # label27:
	i32.load	$push253=, 0($25)
	tee_local	$push252=, $5=, $pop253
	i32.eqz 	$push258=, $pop252
	br_if   	1, $pop258      # 1: down to label26
# BB#31:                                # %while.body
                                        #   in Loop: Header=BB4_30 Depth=3
	i32.load	$push198=, 0($5)
	tee_local	$push197=, $25=, $pop198
	i32.const	$push196=, 3
	i32.shl 	$push195=, $pop197, $pop196
	tee_local	$push194=, $21=, $pop195
	i32.const	$push193=, circlevData+4
	i32.add 	$push192=, $pop194, $pop193
	tee_local	$push191=, $11=, $pop192
	f32.load	$0=, 0($pop191)
	i32.const	$push190=, circlevData
	i32.add 	$push189=, $21, $pop190
	tee_local	$push188=, $9=, $pop189
	f32.load	$10=, 0($pop188)
	i32.const	$push187=, 12
	i32.mul 	$push186=, $25, $pop187
	tee_local	$push185=, $25=, $pop186
	i32.const	$push184=, circleData+4
	i32.add 	$push58=, $pop185, $pop184
	f32.load	$7=, 0($pop58)
	i32.const	$push183=, circleData
	i32.add 	$push59=, $25, $pop183
	f32.load	$6=, 0($pop59)
	i32.const	$push182=, circleData+8
	i32.add 	$push60=, $25, $pop182
	f32.load	$push181=, 0($pop60)
	tee_local	$push180=, $8=, $pop181
	f32.add 	$12=, $pop180, $8
	copy_local	$25=, $5
.LBB4_32:                               # %while.cond149
                                        #   Parent Loop BB4_26 Depth=1
                                        #     Parent Loop BB4_28 Depth=2
                                        #       Parent Loop BB4_30 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	block   	
	loop    	                # label29:
	i32.load	$push250=, 4($25)
	tee_local	$push249=, $25=, $pop250
	i32.eqz 	$push259=, $pop249
	br_if   	1, $pop259      # 1: down to label28
# BB#33:                                # %while.body152
                                        #   in Loop: Header=BB4_32 Depth=4
	i32.load	$push212=, 0($25)
	tee_local	$push211=, $13=, $pop212
	i32.const	$push210=, 12
	i32.mul 	$push209=, $pop211, $pop210
	tee_local	$push208=, $21=, $pop209
	i32.const	$push207=, circleData
	i32.add 	$push63=, $pop208, $pop207
	f32.load	$push206=, 0($pop63)
	tee_local	$push205=, $14=, $pop206
	i32.const	$push204=, circleData+4
	i32.add 	$push62=, $21, $pop204
	f32.load	$push203=, 0($pop62)
	tee_local	$push202=, $15=, $pop203
	i32.const	$push201=, circleData+8
	i32.add 	$push61=, $21, $pop201
	f32.load	$push200=, 0($pop61)
	tee_local	$push199=, $16=, $pop200
	i32.call	$push64=, detectCircleCollision@FUNCTION, $6, $7, $8, $pop205, $pop202, $pop199
	i32.eqz 	$push260=, $pop64
	br_if   	0, $pop260      # 0: up to label29
# BB#34:                                # %if.then161
                                        #   in Loop: Header=BB4_32 Depth=4
	f32.sub 	$push240=, $14, $6
	tee_local	$push239=, $14=, $pop240
	f32.mul 	$push66=, $14, $14
	f32.sub 	$push238=, $15, $7
	tee_local	$push237=, $14=, $pop238
	f32.mul 	$push65=, $pop237, $14
	f32.add 	$push67=, $pop66, $pop65
	f32.sqrt	$push236=, $pop67
	tee_local	$push235=, $1=, $pop236
	f32.div 	$push234=, $pop239, $pop235
	tee_local	$push233=, $15=, $pop234
	f32.mul 	$push71=, $10, $pop233
	f32.div 	$push232=, $14, $1
	tee_local	$push231=, $14=, $pop232
	f32.mul 	$push70=, $0, $pop231
	f32.add 	$push230=, $pop71, $pop70
	tee_local	$push229=, $1=, $pop230
	i32.const	$push228=, 3
	i32.shl 	$push227=, $13, $pop228
	tee_local	$push226=, $21=, $pop227
	i32.const	$push225=, circlevData
	i32.add 	$push224=, $pop226, $pop225
	tee_local	$push223=, $13=, $pop224
	f32.load	$push222=, 0($pop223)
	tee_local	$push221=, $17=, $pop222
	f32.mul 	$push69=, $pop221, $15
	i32.const	$push220=, circlevData+4
	i32.add 	$push219=, $21, $pop220
	tee_local	$push218=, $21=, $pop219
	f32.load	$push217=, 0($pop218)
	tee_local	$push216=, $18=, $pop217
	f32.mul 	$push68=, $pop216, $14
	f32.add 	$push215=, $pop69, $pop68
	tee_local	$push214=, $19=, $pop215
	f32.sub 	$push72=, $pop229, $pop214
	f32.const	$push213=, 0x0p0
	f32.le  	$push73=, $pop72, $pop213
	br_if   	0, $pop73       # 0: up to label29
# BB#35:                                # %if.end184
                                        #   in Loop: Header=BB4_32 Depth=4
	f32.sub 	$push248=, $8, $16
	tee_local	$push247=, $22=, $pop248
	f32.mul 	$push76=, $pop247, $1
	f32.add 	$push74=, $16, $16
	f32.mul 	$push75=, $pop74, $19
	f32.add 	$push77=, $pop76, $pop75
	f32.add 	$push246=, $8, $16
	tee_local	$push245=, $16=, $pop246
	f32.div 	$push78=, $pop77, $pop245
	f32.sub 	$push244=, $pop78, $1
	tee_local	$push243=, $23=, $pop244
	f32.mul 	$push79=, $14, $pop243
	f32.add 	$push80=, $0, $pop79
	f32.store	0($11), $pop80
	f32.mul 	$push81=, $15, $23
	f32.add 	$push82=, $10, $pop81
	f32.store	0($9), $pop82
	f32.mul 	$push83=, $12, $1
	f32.mul 	$push84=, $22, $19
	f32.sub 	$push85=, $pop83, $pop84
	f32.div 	$push86=, $pop85, $16
	f32.sub 	$push242=, $pop86, $19
	tee_local	$push241=, $16=, $pop242
	f32.mul 	$push87=, $14, $pop241
	f32.add 	$push88=, $18, $pop87
	f32.store	0($21), $pop88
	f32.mul 	$push89=, $15, $16
	f32.add 	$push90=, $17, $pop89
	f32.store	0($13), $pop90
	br      	0               # 0: up to label29
.LBB4_36:                               # %while.end
                                        #   in Loop: Header=BB4_30 Depth=3
	end_loop
	end_block                       # label28:
	i32.const	$push251=, 4
	i32.add 	$25=, $5, $pop251
	br      	0               # 0: up to label27
.LBB4_37:                               # %while.end229
                                        #   in Loop: Header=BB4_28 Depth=2
	end_loop
	end_block                       # label26:
	i32.const	$push254=, 1
	i32.add 	$24=, $24, $pop254
	br      	0               # 0: up to label25
.LBB4_38:                               # %for.cond.cleanup128
                                        #   in Loop: Header=BB4_26 Depth=1
	end_loop
	end_block                       # label24:
	i32.const	$push256=, 1
	i32.add 	$4=, $4, $pop256
	br      	0               # 0: up to label23
.LBB4_39:                               # %for.cond.cleanup122
	end_loop
	end_block                       # label22:
                                        # fallthrough-return
	.endfunc
.Lfunc_end4:
	.size	timeStep, .Lfunc_end4-timeStep

	.hidden	circleData              # @circleData
	.type	circleData,@object
	.section	.bss.circleData,"aw",@nobits
	.globl	circleData
	.p2align	4
circleData:
	.skip	240000
	.size	circleData, 240000

	.hidden	circlevData             # @circlevData
	.type	circlevData,@object
	.section	.bss.circlevData,"aw",@nobits
	.globl	circlevData
	.p2align	4
circlevData:
	.skip	160000
	.size	circlevData, 160000

	.hidden	grid                    # @grid
	.type	grid,@object
	.section	.bss.grid,"aw",@nobits
	.globl	grid
	.p2align	4
grid:
	.skip	33600
	.size	grid, 33600

	.hidden	cellCircles             # @cellCircles
	.type	cellCircles,@object
	.section	.bss.cellCircles,"aw",@nobits
	.globl	cellCircles
	.p2align	4
cellCircles:
	.skip	640000
	.size	cellCircles, 640000


	.ident	"clang version 5.0.0 (git@github.com:llvm-mirror/clang b5e2ee2f62458c5f3f726fffed4a9c193b722c6f) (git@github.com:llvm-mirror/llvm 9d064387c265ee02768dafacedf9179e9ff3d5ee)"
	.functype	sqrtf, f32, f32
	.functype	randomf, f32
	.functype	ceilf, f32, f32
	.functype	expf, f32, f32
	.functype	floorf, f32, f32
