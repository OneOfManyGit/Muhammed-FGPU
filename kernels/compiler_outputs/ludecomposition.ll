; ModuleID = 'ludecomposition.cl'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-uknown"

; Function Attrs: nounwind readnone
define float @__divsf3(float %a, float %b) #0 {
entry:
  %0 = bitcast float %a to i32
  %shr = lshr i32 %0, 23
  %and = and i32 %shr, 255
  %1 = bitcast float %b to i32
  %shr2 = lshr i32 %1, 23
  %and3 = and i32 %shr2, 255
  %xor = xor i32 %1, %0
  %and6 = and i32 %xor, -2147483648
  %and8 = and i32 %0, 8388607
  %and10 = and i32 %1, 8388607
  %sub = add nsw i32 %and, -1
  %cmp = icmp ugt i32 %sub, 253
  %sub11 = add nsw i32 %and3, -1
  %cmp12 = icmp ugt i32 %sub11, 253
  %or.cond = or i1 %cmp, %cmp12
  br i1 %or.cond, label %if.then, label %if.end.61

if.then:                                          ; preds = %entry
  %and14 = and i32 %0, 2147483647
  %and16 = and i32 %1, 2147483647
  %cmp17 = icmp ugt i32 %and14, 2139095040
  br i1 %cmp17, label %if.then.18, label %if.end

if.then.18:                                       ; preds = %if.then
  %or = or i32 %0, 4194304
  %2 = bitcast i32 %or to float
  br label %cleanup.146

if.end:                                           ; preds = %if.then
  %cmp21 = icmp ugt i32 %and16, 2139095040
  br i1 %cmp21, label %if.then.22, label %if.end.26

if.then.22:                                       ; preds = %if.end
  %or24 = or i32 %1, 4194304
  %3 = bitcast i32 %or24 to float
  br label %cleanup.146

if.end.26:                                        ; preds = %if.end
  %cmp27 = icmp eq i32 %and14, 2139095040
  %cmp29 = icmp eq i32 %and16, 2139095040
  br i1 %cmp27, label %if.then.28, label %if.end.34

if.then.28:                                       ; preds = %if.end.26
  br i1 %cmp29, label %cleanup.146, label %if.else

if.else:                                          ; preds = %if.then.28
  %4 = and i32 %1, -2147483648
  %or32 = xor i32 %4, %0
  %5 = bitcast i32 %or32 to float
  br label %cleanup.146

if.end.34:                                        ; preds = %if.end.26
  br i1 %cmp29, label %if.then.36, label %if.end.38

if.then.36:                                       ; preds = %if.end.34
  %6 = bitcast i32 %and6 to float
  br label %cleanup.146

if.end.38:                                        ; preds = %if.end.34
  %tobool = icmp eq i32 %and14, 0
  %tobool46 = icmp ne i32 %and16, 0
  br i1 %tobool, label %if.then.39, label %if.end.45

if.then.39:                                       ; preds = %if.end.38
  %7 = bitcast i32 %and6 to float
  %. = select i1 %tobool46, float %7, float 0x7FF8000000000000
  ret float %.

if.end.45:                                        ; preds = %if.end.38
  br i1 %tobool46, label %if.end.50, label %if.then.47

if.then.47:                                       ; preds = %if.end.45
  %or48 = or i32 %and6, 2139095040
  %8 = bitcast i32 %or48 to float
  br label %cleanup.146

if.end.50:                                        ; preds = %if.end.45
  %cmp51 = icmp ult i32 %and14, 8388608
  br i1 %cmp51, label %if.then.52, label %if.end.54

if.then.52:                                       ; preds = %if.end.50
  %9 = tail call i32 @llvm.ctlz.i32(i32 %and8, i1 false) #3
  %sub.i.339 = add nuw nsw i32 %9, 24
  %shl.mask.i.340 = and i32 %sub.i.339, 31
  %shl.i.341 = shl i32 %and8, %shl.mask.i.340
  %sub2.i.342 = sub nsw i32 9, %9
  br label %if.end.54

if.end.54:                                        ; preds = %if.then.52, %if.end.50
  %aSignificand.0 = phi i32 [ %shl.i.341, %if.then.52 ], [ %and8, %if.end.50 ]
  %scale.0 = phi i32 [ %sub2.i.342, %if.then.52 ], [ 0, %if.end.50 ]
  %cmp55 = icmp ult i32 %and16, 8388608
  br i1 %cmp55, label %if.then.56, label %if.end.61

if.then.56:                                       ; preds = %if.end.54
  %10 = tail call i32 @llvm.ctlz.i32(i32 %and10, i1 false) #3
  %sub.i = add nuw nsw i32 %10, 24
  %shl.mask.i = and i32 %sub.i, 31
  %shl.i = shl i32 %and10, %shl.mask.i
  %sub2.i354 = add nsw i32 %scale.0, -9
  %sub58 = add nsw i32 %sub2.i354, %10
  br label %if.end.61

if.end.61:                                        ; preds = %if.then.56, %if.end.54, %entry
  %aSignificand.2 = phi i32 [ %and8, %entry ], [ %aSignificand.0, %if.then.56 ], [ %aSignificand.0, %if.end.54 ]
  %bSignificand.1 = phi i32 [ %and10, %entry ], [ %shl.i, %if.then.56 ], [ %and10, %if.end.54 ]
  %scale.3 = phi i32 [ 0, %entry ], [ %sub58, %if.then.56 ], [ %scale.0, %if.end.54 ]
  %or62 = or i32 %aSignificand.2, 8388608
  %or63 = or i32 %bSignificand.1, 8388608
  %sub64 = sub nsw i32 %and, %and3
  %add65 = add nsw i32 %sub64, %scale.3
  %shl = shl i32 %or63, 8
  %sub66 = sub i32 1963258675, %shl
  %and.i.320 = and i32 %sub66, 65331
  %and1.i.321 = and i32 %shl, 65280
  %mul.i.322 = mul nuw i32 %and.i.320, %and1.i.321
  %shr.i.323 = lshr i32 %sub66, 16
  %mul3.i.324 = mul nuw i32 %shr.i.323, %and1.i.321
  %11 = lshr i32 %or63, 8
  %shr4.i.325 = and i32 %11, 65535
  %mul6.i.326 = mul nuw i32 %and.i.320, %shr4.i.325
  %mul9.i.327 = mul nuw i32 %shr.i.323, %shr4.i.325
  %shr10.i.328 = lshr i32 %mul.i.322, 16
  %and11.i.329 = and i32 %mul3.i.324, 65280
  %add.i.330 = add nuw nsw i32 %shr10.i.328, %and11.i.329
  %and12.i.331 = and i32 %mul6.i.326, 65535
  %add13.i.332 = add nuw nsw i32 %add.i.330, %and12.i.331
  %shr14.i.333 = lshr i32 %add13.i.332, 16
  %shr15.i.334 = lshr i32 %mul3.i.324, 16
  %shr17.i.335 = lshr i32 %mul6.i.326, 16
  %add16.i.336 = add i32 %mul9.i.327, %shr15.i.334
  %add18.i.337 = add i32 %shr17.i.335, %add16.i.336
  %add19.i.338 = add i32 %add18.i.337, %shr14.i.333
  %sub68 = sub i32 0, %add19.i.338
  %and1.i.297 = and i32 %sub68, 65535
  %mul.i.298 = mul nuw i32 %and1.i.297, %and.i.320
  %shr.i.299 = lshr i32 %mul.i.298, 16
  %mul9.i.302 = mul nuw i32 %and1.i.297, %shr.i.323
  %add.i.303 = add i32 %shr.i.299, %mul9.i.302
  %shr14.i.304 = lshr i32 %add.i.303, 16
  %shr18.i.305 = and i32 %add.i.303, 65535
  %shr22.i.306 = lshr i32 %sub68, 16
  %mul24.i.307 = mul nuw i32 %shr22.i.306, %and.i.320
  %add25.i.308 = add i32 %shr18.i.305, %mul24.i.307
  %fold.i.309 = add i32 %add.i.303, %mul24.i.307
  %shl27.i.310 = shl i32 %fold.i.309, 16
  %shr31.i.312 = lshr i32 %add25.i.308, 16
  %mul37.i.313 = mul nuw i32 %shr22.i.306, %shr.i.323
  %add34.i.314 = add i32 %shr14.i.304, %mul37.i.313
  %add40.i.315 = add i32 %add34.i.314, %shr31.i.312
  %r.sroa.8.0.insert.ext.i.316 = zext i32 %shl27.i.310 to i64
  %r.sroa.0.0.insert.ext.i.317 = zext i32 %add40.i.315 to i64
  %r.sroa.0.0.insert.shift.i.318 = shl nuw i64 %r.sroa.0.0.insert.ext.i.317, 32
  %r.sroa.0.0.insert.insert.i.319 = or i64 %r.sroa.0.0.insert.shift.i.318, %r.sroa.8.0.insert.ext.i.316
  %shr70.224 = lshr i64 %r.sroa.0.0.insert.insert.i.319, 31
  %conv = trunc i64 %shr70.224 to i32
  %and.i.277 = and i32 %conv, 65535
  %mul.i.279 = mul nuw i32 %and.i.277, %and1.i.321
  %shr.i.280350 = lshr i32 %add40.i.315, 15
  %shr.i.280 = and i32 %shr.i.280350, 65535
  %mul3.i.281 = mul nuw i32 %shr.i.280, %and1.i.321
  %mul6.i.283 = mul nuw i32 %and.i.277, %shr4.i.325
  %mul9.i.284 = mul nuw i32 %shr.i.280, %shr4.i.325
  %shr10.i.285 = lshr i32 %mul.i.279, 16
  %and11.i.286 = and i32 %mul3.i.281, 65280
  %add.i.287 = add nuw nsw i32 %shr10.i.285, %and11.i.286
  %and12.i.288 = and i32 %mul6.i.283, 65535
  %add13.i.289 = add nuw nsw i32 %add.i.287, %and12.i.288
  %shr14.i.290 = lshr i32 %add13.i.289, 16
  %shr15.i.291 = lshr i32 %mul3.i.281, 16
  %shr17.i.292 = lshr i32 %mul6.i.283, 16
  %add16.i.293 = add i32 %mul9.i.284, %shr15.i.291
  %add18.i.294 = add i32 %add16.i.293, %shr17.i.292
  %add19.i.295 = add i32 %add18.i.294, %shr14.i.290
  %sub72 = sub i32 0, %add19.i.295
  %and1.i.254 = and i32 %sub72, 65535
  %mul.i.255 = mul nuw i32 %and1.i.254, %and.i.277
  %shr.i.256 = lshr i32 %mul.i.255, 16
  %mul9.i.259 = mul nuw i32 %and1.i.254, %shr.i.280
  %add.i.260 = add i32 %shr.i.256, %mul9.i.259
  %shr14.i.261 = lshr i32 %add.i.260, 16
  %shr18.i.262 = and i32 %add.i.260, 65535
  %shr22.i.263 = lshr i32 %sub72, 16
  %mul24.i.264 = mul nuw i32 %shr22.i.263, %and.i.277
  %add25.i.265 = add i32 %shr18.i.262, %mul24.i.264
  %fold.i.266 = add i32 %add.i.260, %mul24.i.264
  %shl27.i.267 = shl i32 %fold.i.266, 16
  %shr31.i.269 = lshr i32 %add25.i.265, 16
  %mul37.i.270 = mul nuw i32 %shr22.i.263, %shr.i.280
  %add34.i.271 = add i32 %shr14.i.261, %mul37.i.270
  %add40.i.272 = add i32 %add34.i.271, %shr31.i.269
  %r.sroa.8.0.insert.ext.i.273 = zext i32 %shl27.i.267 to i64
  %r.sroa.0.0.insert.ext.i.274 = zext i32 %add40.i.272 to i64
  %r.sroa.0.0.insert.shift.i.275 = shl nuw i64 %r.sroa.0.0.insert.ext.i.274, 32
  %r.sroa.0.0.insert.insert.i.276 = or i64 %r.sroa.0.0.insert.shift.i.275, %r.sroa.8.0.insert.ext.i.273
  %shr74.225 = lshr i64 %r.sroa.0.0.insert.insert.i.276, 31
  %conv75 = trunc i64 %shr74.225 to i32
  %and.i.234 = and i32 %conv75, 65535
  %mul.i.236 = mul nuw i32 %and.i.234, %and1.i.321
  %shr.i.237352 = lshr i32 %add40.i.272, 15
  %shr.i.237 = and i32 %shr.i.237352, 65535
  %mul3.i.238 = mul nuw i32 %shr.i.237, %and1.i.321
  %mul6.i.240 = mul nuw i32 %and.i.234, %shr4.i.325
  %mul9.i.241 = mul nuw i32 %shr.i.237, %shr4.i.325
  %shr10.i.242 = lshr i32 %mul.i.236, 16
  %and11.i.243 = and i32 %mul3.i.238, 65280
  %add.i.244 = add nuw nsw i32 %shr10.i.242, %and11.i.243
  %and12.i.245 = and i32 %mul6.i.240, 65535
  %add13.i.246 = add nuw nsw i32 %add.i.244, %and12.i.245
  %shr14.i.247 = lshr i32 %add13.i.246, 16
  %shr15.i.248 = lshr i32 %mul3.i.238, 16
  %shr17.i.249 = lshr i32 %mul6.i.240, 16
  %add16.i.250 = add i32 %mul9.i.241, %shr15.i.248
  %add18.i.251 = add i32 %add16.i.250, %shr17.i.249
  %add19.i.252 = add i32 %add18.i.251, %shr14.i.247
  %sub77 = sub i32 0, %add19.i.252
  %and1.i.228 = and i32 %sub77, 65535
  %mul.i.229 = mul nuw i32 %and1.i.228, %and.i.234
  %shr.i.230 = lshr i32 %mul.i.229, 16
  %mul9.i.231 = mul nuw i32 %and1.i.228, %shr.i.237
  %add.i.232 = add i32 %shr.i.230, %mul9.i.231
  %shr14.i.233 = lshr i32 %add.i.232, 16
  %shr18.i = and i32 %add.i.232, 65535
  %shr22.i = lshr i32 %sub77, 16
  %mul24.i = mul nuw i32 %shr22.i, %and.i.234
  %add25.i = add i32 %shr18.i, %mul24.i
  %fold.i = add i32 %add.i.232, %mul24.i
  %shl27.i = shl i32 %fold.i, 16
  %shr31.i = lshr i32 %add25.i, 16
  %mul37.i = mul nuw i32 %shr22.i, %shr.i.237
  %add34.i = add i32 %shr14.i.233, %mul37.i
  %add40.i = add i32 %add34.i, %shr31.i
  %r.sroa.8.0.insert.ext.i = zext i32 %shl27.i to i64
  %r.sroa.0.0.insert.ext.i = zext i32 %add40.i to i64
  %r.sroa.0.0.insert.shift.i = shl nuw i64 %r.sroa.0.0.insert.ext.i, 32
  %r.sroa.0.0.insert.insert.i = or i64 %r.sroa.0.0.insert.shift.i, %r.sroa.8.0.insert.ext.i
  %shr79.226 = lshr i64 %r.sroa.0.0.insert.insert.i, 31
  %conv80 = trunc i64 %shr79.226 to i32
  %sub81 = add i32 %conv80, -2
  %shl82 = shl i32 %aSignificand.2, 1
  %and.i = and i32 %sub81, 65535
  %and1.i = and i32 %shl82, 65534
  %mul.i = mul nuw i32 %and.i, %and1.i
  %shr.i = lshr i32 %sub81, 16
  %mul3.i = mul nuw i32 %shr.i, %and1.i
  %12 = lshr i32 %or62, 15
  %shr4.i = and i32 %12, 65535
  %mul6.i = mul nuw i32 %and.i, %shr4.i
  %mul9.i = mul nuw i32 %shr.i, %shr4.i
  %shr10.i = lshr i32 %mul.i, 16
  %and11.i = and i32 %mul3.i, 65534
  %add.i = add nuw nsw i32 %shr10.i, %and11.i
  %and12.i = and i32 %mul6.i, 65535
  %add13.i = add nuw nsw i32 %add.i, %and12.i
  %shr14.i = lshr i32 %add13.i, 16
  %shr15.i = lshr i32 %mul3.i, 16
  %shr17.i = lshr i32 %mul6.i, 16
  %add16.i = add i32 %shr15.i, %mul9.i
  %add18.i = add i32 %add16.i, %shr17.i
  %add19.i = add i32 %add18.i, %shr14.i
  %cmp84 = icmp ult i32 %add19.i, 16777216
  %cond = zext i1 %cmp84 to i32
  %cond.neg = sext i1 %cmp84 to i32
  %sub87 = add i32 %add65, %cond.neg
  %cond89 = xor i32 %cond, 1
  %shr90 = lshr i32 %add19.i, %cond89
  %add95 = add nsw i32 %sub87, 127
  %cmp96 = icmp sgt i32 %add95, 254
  br i1 %cmp96, label %if.then.98, label %if.else.101

if.then.98:                                       ; preds = %if.end.61
  %or99 = or i32 %and6, 2139095040
  %13 = bitcast i32 %or99 to float
  br label %cleanup.146

if.else.101:                                      ; preds = %if.end.61
  %cond92 = select i1 %cmp84, i32 24, i32 23
  %shl93 = shl i32 %or62, %cond92
  %mul = mul i32 %shr90, %or63
  %sub94 = sub i32 %shl93, %mul
  %cmp102 = icmp slt i32 %add95, 1
  %shl105 = shl i32 %sub94, 1
  %cmp106 = icmp ugt i32 %shl105, %or63
  br i1 %cmp102, label %if.then.104, label %if.else.122

if.then.104:                                      ; preds = %if.else.101
  %sub108 = sub i32 -126, %sub87
  %cmp109 = icmp ult i32 %sub108, 31
  %cond111 = select i1 %cmp109, i32 %sub108, i32 31
  %conv113 = zext i1 %cmp106 to i32
  %add114 = add i32 %conv113, %shr90
  %shr.mask115 = and i32 %cond111, 31
  %shr116 = lshr i32 %add114, %shr.mask115
  %or117 = or i32 %shr116, %and6
  %14 = bitcast i32 %or117 to float
  br label %cleanup.146

if.else.122:                                      ; preds = %if.else.101
  %and128 = and i32 %shr90, 8388607
  %shl129 = shl i32 %add95, 23
  %or130 = or i32 %and128, %shl129
  %conv132 = zext i1 %cmp106 to i32
  %add133 = add i32 %conv132, %or130
  %or134 = or i32 %add133, %and6
  %15 = bitcast i32 %or134 to float
  br label %cleanup.146

cleanup.146:                                      ; preds = %if.then.28, %if.then.47, %if.then.36, %if.else, %if.then.22, %if.then.18, %if.then.98, %if.then.104, %if.else.122
  %retval.2 = phi float [ %13, %if.then.98 ], [ %14, %if.then.104 ], [ %15, %if.else.122 ], [ 0x7FF8000000000000, %if.then.28 ], [ %8, %if.then.47 ], [ %6, %if.then.36 ], [ %5, %if.else ], [ %3, %if.then.22 ], [ %2, %if.then.18 ]
  ret float %retval.2
}

; Function Attrs: nounwind readnone
define float @__subsf3(float %a, float %b) #0 {
entry:
  %0 = bitcast float %b to i32
  %xor = xor i32 %0, -2147483648
  %1 = bitcast i32 %xor to float
  %2 = bitcast float %a to i32
  %and = and i32 %2, 2147483647
  %and4 = and i32 %0, 2147483647
  %sub = add nsw i32 %and, -1
  %cmp = icmp ugt i32 %sub, 2139095038
  %sub5 = add nsw i32 %and4, -1
  %cmp6 = icmp ugt i32 %sub5, 2139095038
  %or.cond = or i1 %cmp, %cmp6
  br i1 %or.cond, label %if.then, label %if.end.34

if.then:                                          ; preds = %entry
  %cmp7 = icmp ugt i32 %and, 2139095040
  %cmp8 = icmp ugt i32 %and4, 2139095040
  %3 = or i1 %cmp7, %cmp8
  %cmp9 = icmp eq i32 %and, 2139095040
  %xor12 = xor i32 %xor, %2
  %cmp13 = icmp eq i32 %xor12, -2147483648
  %4 = and i1 %cmp9, %cmp13
  %or238 = or i1 %3, %4
  %brmerge = or i1 %cmp9, %3
  %.mux = select i1 %or238, float 0x7FF8000000000000, float %a
  br i1 %brmerge, label %cleanup.166, label %if.end.18

if.end.18:                                        ; preds = %if.then
  %cmp19 = icmp eq i32 %and4, 2139095040
  br i1 %cmp19, label %cleanup.166, label %if.end.21

if.end.21:                                        ; preds = %if.end.18
  %tobool22 = icmp eq i32 %and, 0
  %tobool31 = icmp ne i32 %and4, 0
  br i1 %tobool22, label %if.then.23, label %cleanup

if.then.23:                                       ; preds = %if.end.21
  br i1 %tobool31, label %cleanup.166, label %if.then.25

if.then.25:                                       ; preds = %if.then.23
  %and28 = and i32 %xor, %2
  %5 = bitcast i32 %and28 to float
  br label %cleanup.166

cleanup:                                          ; preds = %if.end.21
  br i1 %tobool31, label %if.end.34, label %cleanup.166

if.end.34:                                        ; preds = %entry, %cleanup
  %cmp35 = icmp ugt i32 %and4, %and
  %cond = select i1 %cmp35, i32 %2, i32 %xor
  %cond41 = select i1 %cmp35, i32 %xor, i32 %2
  %shr = lshr i32 %cond41, 23
  %and42 = and i32 %shr, 255
  %shr43 = lshr i32 %cond, 23
  %and44 = and i32 %shr43, 255
  %and45 = and i32 %cond41, 8388607
  %and46 = and i32 %cond, 8388607
  %cmp47 = icmp eq i32 %and42, 0
  br i1 %cmp47, label %if.then.49, label %if.end.51

if.then.49:                                       ; preds = %if.end.34
  %6 = tail call i32 @llvm.ctlz.i32(i32 %and45, i1 false) #3
  %sub.i.239 = add nuw nsw i32 %6, 24
  %shl.mask.i.240 = and i32 %sub.i.239, 31
  %shl.i.241 = shl i32 %and45, %shl.mask.i.240
  %sub2.i.242 = sub nsw i32 9, %6
  br label %if.end.51

if.end.51:                                        ; preds = %if.then.49, %if.end.34
  %aSignificand.0 = phi i32 [ %shl.i.241, %if.then.49 ], [ %and45, %if.end.34 ]
  %aExponent.0 = phi i32 [ %sub2.i.242, %if.then.49 ], [ %and42, %if.end.34 ]
  %cmp52 = icmp eq i32 %and44, 0
  br i1 %cmp52, label %if.then.54, label %if.end.56

if.then.54:                                       ; preds = %if.end.51
  %7 = tail call i32 @llvm.ctlz.i32(i32 %and46, i1 false) #3
  %sub.i = add nuw nsw i32 %7, 24
  %shl.mask.i = and i32 %sub.i, 31
  %shl.i = shl i32 %and46, %shl.mask.i
  %sub2.i = sub nsw i32 9, %7
  br label %if.end.56

if.end.56:                                        ; preds = %if.then.54, %if.end.51
  %bSignificand.0 = phi i32 [ %shl.i, %if.then.54 ], [ %and46, %if.end.51 ]
  %bExponent.0 = phi i32 [ %sub2.i, %if.then.54 ], [ %and44, %if.end.51 ]
  %and57 = and i32 %cond41, -2147483648
  %xor58 = xor i32 %cond41, %cond
  %tobool60 = icmp slt i32 %xor58, 0
  %or61 = shl i32 %aSignificand.0, 3
  %shl = or i32 %or61, 67108864
  %or62 = shl i32 %bSignificand.0, 3
  %shl63 = or i32 %or62, 67108864
  %sub64 = sub nsw i32 %aExponent.0, %bExponent.0
  %tobool65 = icmp eq i32 %aExponent.0, %bExponent.0
  br i1 %tobool65, label %if.end.80, label %if.then.66

if.then.66:                                       ; preds = %if.end.56
  %cmp67 = icmp ult i32 %sub64, 32
  br i1 %cmp67, label %if.then.69, label %if.end.80

if.then.69:                                       ; preds = %if.then.66
  %8 = sub nsw i32 0, %sub64
  %shl.mask = and i32 %8, 31
  %shl71 = shl i32 %shl63, %shl.mask
  %tobool72 = icmp ne i32 %shl71, 0
  %shr.mask = and i32 %sub64, 31
  %shr74 = lshr i32 %shl63, %shr.mask
  %conv76 = zext i1 %tobool72 to i32
  %or77 = or i32 %conv76, %shr74
  br label %if.end.80

if.end.80:                                        ; preds = %if.then.66, %if.end.56, %if.then.69
  %bSignificand.1 = phi i32 [ %shl63, %if.end.56 ], [ %or77, %if.then.69 ], [ 1, %if.then.66 ]
  br i1 %tobool60, label %if.then.82, label %if.else.99

if.then.82:                                       ; preds = %if.end.80
  %sub83 = sub i32 %shl, %bSignificand.1
  %cmp84 = icmp eq i32 %shl, %bSignificand.1
  br i1 %cmp84, label %cleanup.166, label %if.end.88

if.end.88:                                        ; preds = %if.then.82
  %cmp89 = icmp ult i32 %sub83, 67108864
  br i1 %cmp89, label %if.then.91, label %if.end.113

if.then.91:                                       ; preds = %if.end.88
  %9 = tail call i32 @llvm.ctlz.i32(i32 %sub83, i1 false) #3
  %sub94 = add nsw i32 %9, -5
  %shl.mask95 = and i32 %sub94, 31
  %shl96 = shl i32 %sub83, %shl.mask95
  %sub97 = sub nsw i32 %aExponent.0, %sub94
  br label %if.end.113

if.else.99:                                       ; preds = %if.end.80
  %add = add i32 %bSignificand.1, %shl
  %and100 = and i32 %add, 134217728
  %tobool101 = icmp eq i32 %and100, 0
  br i1 %tobool101, label %if.end.113, label %if.then.102

if.then.102:                                      ; preds = %if.else.99
  %fold = add i32 %bSignificand.1, %or61
  %and104 = and i32 %fold, 1
  %shr107 = lshr i32 %add, 1
  %or110 = or i32 %shr107, %and104
  %add111 = add nsw i32 %aExponent.0, 1
  br label %if.end.113

if.end.113:                                       ; preds = %if.else.99, %if.then.102, %if.end.88, %if.then.91
  %aSignificand.1 = phi i32 [ %shl96, %if.then.91 ], [ %sub83, %if.end.88 ], [ %add, %if.else.99 ], [ %or110, %if.then.102 ]
  %aExponent.1 = phi i32 [ %sub97, %if.then.91 ], [ %aExponent.0, %if.end.88 ], [ %aExponent.0, %if.else.99 ], [ %add111, %if.then.102 ]
  %cmp114 = icmp sgt i32 %aExponent.1, 254
  br i1 %cmp114, label %if.then.116, label %if.end.119

if.then.116:                                      ; preds = %if.end.113
  %or117 = or i32 %and57, 2139095040
  %10 = bitcast i32 %or117 to float
  br label %cleanup.166

if.end.119:                                       ; preds = %if.end.113
  %cmp120 = icmp slt i32 %aExponent.1, 1
  br i1 %cmp120, label %if.then.122, label %if.end.136

if.then.122:                                      ; preds = %if.end.119
  %sub124 = sub nsw i32 1, %aExponent.1
  %11 = sub nsw i32 0, %sub124
  %shl.mask127 = and i32 %11, 31
  %shl128 = shl i32 %aSignificand.1, %shl.mask127
  %tobool129 = icmp ne i32 %shl128, 0
  %shr.mask131 = and i32 %sub124, 31
  %shr132 = lshr i32 %aSignificand.1, %shr.mask131
  %conv134 = zext i1 %tobool129 to i32
  %or135 = or i32 %conv134, %shr132
  br label %if.end.136

if.end.136:                                       ; preds = %if.then.122, %if.end.119
  %aSignificand.2 = phi i32 [ %or135, %if.then.122 ], [ %aSignificand.1, %if.end.119 ]
  %aExponent.2 = phi i32 [ 0, %if.then.122 ], [ %aExponent.1, %if.end.119 ]
  %and137 = and i32 %aSignificand.2, 7
  %shr138 = lshr i32 %aSignificand.2, 3
  %and139 = and i32 %shr138, 8388607
  %shl140 = shl i32 %aExponent.2, 23
  %or141 = or i32 %shl140, %and57
  %or142 = or i32 %or141, %and139
  %cmp143 = icmp ugt i32 %and137, 4
  %inc = zext i1 %cmp143 to i32
  %inc.or142 = add i32 %or142, %inc
  %cmp147 = icmp eq i32 %and137, 4
  %and150 = and i32 %inc.or142, 1
  %add151 = select i1 %cmp147, i32 %and150, i32 0
  %result.1 = add i32 %add151, %inc.or142
  %12 = bitcast i32 %result.1 to float
  br label %cleanup.166

cleanup.166:                                      ; preds = %if.then, %if.then.23, %if.end.18, %if.then.25, %if.then.116, %if.end.136, %if.then.82, %cleanup
  %retval.2 = phi float [ %a, %cleanup ], [ %10, %if.then.116 ], [ %12, %if.end.136 ], [ 0.000000e+00, %if.then.82 ], [ %.mux, %if.then ], [ %1, %if.then.23 ], [ %1, %if.end.18 ], [ %5, %if.then.25 ]
  ret float %retval.2
}

; Function Attrs: nounwind readnone
define i64 @__muldsi3(i32 signext %a, i32 signext %b) #0 {
entry:
  %and = and i32 %a, 65535
  %and1 = and i32 %b, 65535
  %mul = mul nuw i32 %and1, %and
  %shr = lshr i32 %mul, 16
  %and6 = and i32 %mul, 65535
  %shr7 = lshr i32 %a, 16
  %mul9 = mul nuw i32 %and1, %shr7
  %add = add i32 %shr, %mul9
  %shr14 = lshr i32 %add, 16
  %shr18 = and i32 %add, 65535
  %shr22 = lshr i32 %b, 16
  %mul24 = mul nuw i32 %shr22, %and
  %add25 = add i32 %shr18, %mul24
  %fold = add i32 %add, %mul24
  %shl27 = shl i32 %fold, 16
  %add30 = or i32 %shl27, %and6
  %shr31 = lshr i32 %add25, 16
  %mul37 = mul nuw i32 %shr22, %shr7
  %add34 = add i32 %shr14, %mul37
  %add40 = add i32 %add34, %shr31
  %r.sroa.8.0.insert.ext = zext i32 %add30 to i64
  %r.sroa.0.0.insert.ext = zext i32 %add40 to i64
  %r.sroa.0.0.insert.shift = shl nuw i64 %r.sroa.0.0.insert.ext, 32
  %r.sroa.0.0.insert.insert = or i64 %r.sroa.0.0.insert.shift, %r.sroa.8.0.insert.ext
  ret i64 %r.sroa.0.0.insert.insert
}

; Function Attrs: nounwind readnone
define i64 @__muldi3(i64 signext %a, i64 signext %b) #0 {
entry:
  %x.sroa.0.0.extract.shift = lshr i64 %a, 32
  %x.sroa.0.0.extract.trunc = trunc i64 %x.sroa.0.0.extract.shift to i32
  %x.sroa.4.0.extract.trunc = trunc i64 %a to i32
  %y.sroa.0.0.extract.shift = lshr i64 %b, 32
  %y.sroa.0.0.extract.trunc = trunc i64 %y.sroa.0.0.extract.shift to i32
  %y.sroa.4.0.extract.trunc = trunc i64 %b to i32
  %and.i = and i32 %x.sroa.4.0.extract.trunc, 65535
  %and1.i = and i32 %y.sroa.4.0.extract.trunc, 65535
  %mul.i = mul nuw i32 %and1.i, %and.i
  %shr.i = lshr i32 %mul.i, 16
  %and6.i = and i32 %mul.i, 65535
  %shr7.i = lshr i32 %x.sroa.4.0.extract.trunc, 16
  %mul9.i = mul nuw i32 %and1.i, %shr7.i
  %add.i = add i32 %shr.i, %mul9.i
  %shr14.i = lshr i32 %add.i, 16
  %shr18.i = and i32 %add.i, 65535
  %shr22.i = lshr i32 %y.sroa.4.0.extract.trunc, 16
  %mul24.i = mul nuw i32 %shr22.i, %and.i
  %add25.i = add i32 %shr18.i, %mul24.i
  %fold.i = add i32 %add.i, %mul24.i
  %shl27.i = shl i32 %fold.i, 16
  %add30.i = or i32 %shl27.i, %and6.i
  %shr31.i = lshr i32 %add25.i, 16
  %mul37.i = mul nuw i32 %shr22.i, %shr7.i
  %r.sroa.8.0.insert.ext.i = zext i32 %add30.i to i64
  %mul = mul i32 %x.sroa.0.0.extract.trunc, %y.sroa.4.0.extract.trunc
  %mul12 = mul i32 %y.sroa.0.0.extract.trunc, %x.sroa.4.0.extract.trunc
  %add34.i = add i32 %mul12, %mul
  %add40.i = add i32 %add34.i, %mul37.i
  %add = add i32 %add40.i, %shr14.i
  %add15 = add i32 %add, %shr31.i
  %r.sroa.0.0.insert.ext = zext i32 %add15 to i64
  %r.sroa.0.0.insert.shift = shl nuw i64 %r.sroa.0.0.insert.ext, 32
  %r.sroa.0.0.insert.insert = or i64 %r.sroa.0.0.insert.shift, %r.sroa.8.0.insert.ext.i
  ret i64 %r.sroa.0.0.insert.insert
}

; Function Attrs: nounwind readnone
define float @__mulsf3(float %a, float %b) #0 {
entry:
  %0 = bitcast float %a to i32
  %shr = lshr i32 %0, 23
  %and = and i32 %shr, 255
  %1 = bitcast float %b to i32
  %shr2 = lshr i32 %1, 23
  %and3 = and i32 %shr2, 255
  %xor = xor i32 %1, %0
  %and6 = and i32 %xor, -2147483648
  %and8 = and i32 %0, 8388607
  %and10 = and i32 %1, 8388607
  %sub = add nsw i32 %and, -1
  %cmp = icmp ugt i32 %sub, 253
  %sub11 = add nsw i32 %and3, -1
  %cmp12 = icmp ugt i32 %sub11, 253
  %or.cond = or i1 %cmp, %cmp12
  br i1 %or.cond, label %if.then, label %if.end.59

if.then:                                          ; preds = %entry
  %and14 = and i32 %0, 2147483647
  %and16 = and i32 %1, 2147483647
  %cmp17 = icmp ugt i32 %and14, 2139095040
  %cmp18 = icmp ugt i32 %and16, 2139095040
  %2 = or i1 %cmp17, %cmp18
  br i1 %2, label %cleanup.123, label %if.end

if.end:                                           ; preds = %if.then
  %cmp21 = icmp eq i32 %and14, 2139095040
  %cmp23 = icmp eq i32 %and16, 2139095040
  %3 = or i1 %cmp21, %cmp23
  br i1 %3, label %if.then.28, label %if.end.35

if.then.28:                                       ; preds = %if.end
  %cond = select i1 %cmp21, i32 %and16, i32 %and14
  %tobool29 = icmp ne i32 %cond, 0
  %or = or i32 %and6, 2139095040
  %4 = bitcast i32 %or to float
  %5 = select i1 %tobool29, float %4, float 0x7FF8000000000000
  br label %cleanup.123

if.end.35:                                        ; preds = %if.end
  %tobool36 = icmp eq i32 %and14, 0
  %lnot = icmp eq i32 %and16, 0
  %.lnot = or i1 %tobool36, %lnot
  br i1 %.lnot, label %if.then.42, label %if.end.44

if.then.42:                                       ; preds = %if.end.35
  %6 = bitcast i32 %and6 to float
  br label %cleanup.123

if.end.44:                                        ; preds = %if.end.35
  %cmp45 = icmp ult i32 %and14, 8388608
  br i1 %cmp45, label %if.then.46, label %if.end.48

if.then.46:                                       ; preds = %if.end.44
  %7 = tail call i32 @llvm.ctlz.i32(i32 %and8, i1 false) #3
  %sub.i.181 = add nuw nsw i32 %7, 24
  %shl.mask.i.182 = and i32 %sub.i.181, 31
  %shl.i.183 = shl i32 %and8, %shl.mask.i.182
  %sub2.i.184 = sub nsw i32 9, %7
  br label %if.end.48

if.end.48:                                        ; preds = %if.then.46, %if.end.44
  %aSignificand.0 = phi i32 [ %shl.i.183, %if.then.46 ], [ %and8, %if.end.44 ]
  %scale.0 = phi i32 [ %sub2.i.184, %if.then.46 ], [ 0, %if.end.44 ]
  %cmp49 = icmp ult i32 %and16, 8388608
  br i1 %cmp49, label %if.then.50, label %if.end.59

if.then.50:                                       ; preds = %if.end.48
  %8 = tail call i32 @llvm.ctlz.i32(i32 %and10, i1 false) #3
  %sub.i = add nuw nsw i32 %8, 24
  %shl.mask.i.179 = and i32 %sub.i, 31
  %shl.i.180 = shl i32 %and10, %shl.mask.i.179
  %sub2.i = add nsw i32 %scale.0, 9
  %add52 = sub nsw i32 %sub2.i, %8
  br label %if.end.59

if.end.59:                                        ; preds = %if.end.48, %if.then.50, %entry
  %aSignificand.2 = phi i32 [ %and8, %entry ], [ %aSignificand.0, %if.then.50 ], [ %aSignificand.0, %if.end.48 ]
  %bSignificand.1 = phi i32 [ %and10, %entry ], [ %shl.i.180, %if.then.50 ], [ %and10, %if.end.48 ]
  %scale.5 = phi i32 [ 0, %entry ], [ %add52, %if.then.50 ], [ %scale.0, %if.end.48 ]
  %or60 = or i32 %aSignificand.2, 8388608
  %or61 = shl i32 %bSignificand.1, 8
  %shl = or i32 %or61, -2147483648
  %conv.i.177 = zext i32 %or60 to i64
  %conv1.i = zext i32 %shl to i64
  %mul.i = mul nuw i64 %conv1.i, %conv.i.177
  %shr.i.178 = lshr i64 %mul.i, 32
  %conv2.i = trunc i64 %shr.i.178 to i32
  %conv3.i = trunc i64 %mul.i to i32
  %shl65206 = shl nuw nsw i64 %shr.i.178, 1
  %shl65 = trunc i64 %shl65206 to i32
  %shr66 = lshr i32 %conv3.i, 31
  %or67 = or i32 %shl65, %shr66
  %and70 = and i32 %conv2.i, 8388608
  %tobool71 = icmp ne i32 %and70, 0
  %and70.lobit = lshr exact i32 %and70, 23
  %add62 = add nsw i32 %and, -127
  %sub63 = add nsw i32 %add62, %and3
  %add64 = add nsw i32 %sub63, %scale.5
  %add73 = add i32 %add64, %and70.lobit
  %cond78 = select i1 %tobool71, i32 %conv2.i, i32 %or67
  %shl68 = xor i32 %and70.lobit, 1
  %cond83 = shl i32 %conv3.i, %shl68
  %cmp84 = icmp slt i32 %add73, 1
  br i1 %cmp84, label %if.then.85, label %if.else

if.then.85:                                       ; preds = %if.end.59
  %sub86 = sub i32 1, %add73
  %cmp87 = icmp ugt i32 %sub86, 31
  br i1 %cmp87, label %cleanup.91, label %cleanup.91.thread

cleanup.91.thread:                                ; preds = %if.then.85
  %9 = sub i32 0, %sub86
  %shl.mask.i = and i32 %9, 31
  %shl.i = shl i32 %cond83, %shl.mask.i
  %tobool.i = icmp ne i32 %shl.i, 0
  %shl3.i = shl i32 %cond78, %shl.mask.i
  %shr.mask.i = and i32 %sub86, 31
  %shr.i = lshr i32 %cond83, %shr.mask.i
  %or.i = or i32 %shl3.i, %shr.i
  %conv.i = zext i1 %tobool.i to i32
  %or5.i = or i32 %or.i, %conv.i
  %shr7.i = lshr i32 %cond78, %shr.mask.i
  br label %if.end.97

cleanup.91:                                       ; preds = %if.then.85
  %10 = bitcast i32 %and6 to float
  br label %cleanup.123

if.else:                                          ; preds = %if.end.59
  %and94 = and i32 %cond78, 8388607
  %shl95 = shl i32 %add73, 23
  %or96 = or i32 %and94, %shl95
  br label %if.end.97

if.end.97:                                        ; preds = %cleanup.91.thread, %if.else
  %productHi.2 = phi i32 [ %or96, %if.else ], [ %shr7.i, %cleanup.91.thread ]
  %productLo.2 = phi i32 [ %cond83, %if.else ], [ %or5.i, %cleanup.91.thread ]
  %or98 = or i32 %productHi.2, %and6
  %cmp99 = icmp ugt i32 %productLo.2, -2147483648
  %conv = zext i1 %cmp99 to i32
  %add100 = add i32 %conv, %or98
  %cmp101 = icmp eq i32 %productLo.2, -2147483648
  %and104 = and i32 %add100, 1
  %cond107 = select i1 %cmp101, i32 %and104, i32 0
  %add108 = add i32 %cond107, %add100
  %cmp109 = icmp sgt i32 %add73, 254
  %or112 = or i32 %and6, 2139095040
  %cond115 = select i1 %cmp109, i32 %or112, i32 %add108
  %11 = bitcast i32 %cond115 to float
  br label %cleanup.123

cleanup.123:                                      ; preds = %if.then, %if.then.42, %if.then.28, %if.end.97, %cleanup.91
  %retval.6 = phi float [ %11, %if.end.97 ], [ %10, %cleanup.91 ], [ 0x7FF8000000000000, %if.then ], [ %6, %if.then.42 ], [ %5, %if.then.28 ]
  ret float %retval.6
}

; Function Attrs: nounwind
define void @ludecomposition_L_pass(float* nocapture readonly %mat, float* nocapture %L, i32 signext %size, i32 signext %k) #1 {
entry:
  %0 = tail call i32 asm sideeffect "lid $0, $1", "=r,I,~{$1}"(i32 0) #3, !srcloc !8
  %1 = tail call i32 asm sideeffect "wgoff $0, $1", "=r,I,~{$1}"(i32 0) #3, !srcloc !9
  %add.i = add nsw i32 %1, %0
  %cmp = icmp ult i32 %add.i, %size
  br i1 %cmp, label %if.then, label %if.end.13

if.then:                                          ; preds = %entry
  %mul = mul i32 %add.i, %size
  %add = add i32 %mul, %k
  %arrayidx = getelementptr inbounds float, float* %mat, i32 %add
  %2 = load float, float* %arrayidx, align 4, !tbaa !10
  %mul1 = mul i32 %k, %size
  %add2 = add i32 %mul1, %k
  %arrayidx3 = getelementptr inbounds float, float* %mat, i32 %add2
  %3 = load float, float* %arrayidx3, align 4, !tbaa !10
  %div = fdiv float %2, %3, !fpmath !14
  %arrayidx6 = getelementptr inbounds float, float* %L, i32 %add
  store float %div, float* %arrayidx6, align 4, !tbaa !10
  %add7 = add i32 %k, 1
  %cmp8 = icmp eq i32 %add.i, %add7
  br i1 %cmp8, label %if.then.9, label %if.end.13

if.then.9:                                        ; preds = %if.then
  %arrayidx12 = getelementptr inbounds float, float* %L, i32 %add2
  store float 1.000000e+00, float* %arrayidx12, align 4, !tbaa !10
  br label %if.end.13

if.end.13:                                        ; preds = %if.then, %if.then.9, %entry
  ret void
}

; Function Attrs: nounwind
define void @ludecomposition_U_pass(float* nocapture %mat, float* nocapture readonly %L, i32 signext %size, i32 signext %k) #1 {
entry:
  %0 = tail call i32 asm sideeffect "lid $0, $1", "=r,I,~{$1}"(i32 1) #3, !srcloc !8
  %1 = tail call i32 asm sideeffect "wgoff $0, $1", "=r,I,~{$1}"(i32 1) #3, !srcloc !9
  %add.i = add nsw i32 %1, %0
  %2 = tail call i32 asm sideeffect "lid $0, $1", "=r,I,~{$1}"(i32 0) #3, !srcloc !8
  %3 = tail call i32 asm sideeffect "wgoff $0, $1", "=r,I,~{$1}"(i32 0) #3, !srcloc !9
  %add.i.39 = add nsw i32 %3, %2
  %mul = mul i32 %add.i, %size
  %add = add i32 %mul, %k
  %arrayidx = getelementptr inbounds float, float* %L, i32 %add
  %4 = load float, float* %arrayidx, align 4, !tbaa !10
  %add9 = add i32 %add.i.39, %mul
  %arrayidx10 = getelementptr inbounds float, float* %mat, i32 %add9
  %5 = load float, float* %arrayidx10, align 4, !tbaa !10
  %mul11 = mul i32 %k, %size
  %add12 = add i32 %add.i.39, %mul11
  %arrayidx13 = getelementptr inbounds float, float* %mat, i32 %add12
  %6 = load float, float* %arrayidx13, align 4, !tbaa !10
  %neg = fsub float -0.000000e+00, %4
  %7 = tail call float @llvm.fmuladd.f32(float %neg, float %6, float %5)
  store float %7, float* %arrayidx10, align 4, !tbaa !10
  ret void
}

; Function Attrs: nounwind readnone
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ctlz.i32(i32, i1) #2

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!opencl.kernels = !{!0, !6}
!llvm.ident = !{!7}

!0 = !{void (float*, float*, i32, i32)* @ludecomposition_L_pass, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"float*", !"float*", !"uint", !"uint"}
!4 = !{!"kernel_arg_base_type", !"float*", !"float*", !"uint", !"uint"}
!5 = !{!"kernel_arg_type_qual", !"", !"", !"", !""}
!6 = !{void (float*, float*, i32, i32)* @ludecomposition_U_pass, !1, !2, !3, !4, !5}
!7 = !{!"clang version 3.7.0 (tags/RELEASE_371/final)"}
!8 = !{i32 12926}
!9 = !{i32 13066}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{float 2.500000e+00}
