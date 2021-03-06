; RUN: llc -mtriple=mipsel-linux-gnu -march=mipsel -mcpu=mips16 -soft-float -mips16-hard-float -relocation-model=static     < %s | FileCheck %s -check-prefix=ci

@i = global i32 0, align 4
@j = common global i32 0, align 4
@k = common global i32 0, align 4

; Function Attrs: nounwind optsize
define i32 @foo() #0 {
entry:
  %0 = load i32* @i, align 4, !tbaa !1
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void asm sideeffect ".space 1000", ""() #1, !srcloc !5
  br label %if.end

if.else:                                          ; preds = %entry
  tail call void asm sideeffect ".space 1004", ""() #1, !srcloc !6
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %storemerge = phi i32 [ 1, %if.else ], [ 0, %if.then ]
  store i32 %storemerge, i32* @i, align 4, !tbaa !1
  ret i32 0
}

; ci:	beqz	$3, $BB0_2
; ci: # BB#1:                                 # %if.else


; Function Attrs: nounwind optsize
define i32 @goo() #0 {
entry:
  %0 = load i32* @i, align 4, !tbaa !1
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call void asm sideeffect ".space 1000000", ""() #1, !srcloc !7
  br label %if.end

if.else:                                          ; preds = %entry
  tail call void asm sideeffect ".space 1000004", ""() #1, !srcloc !8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %storemerge = phi i32 [ 1, %if.else ], [ 0, %if.then ]
  store i32 %storemerge, i32* @i, align 4, !tbaa !1
  ret i32 0
}

; ci:	bnez	$3, $BB1_1  # 16 bit inst
; ci:	jal	$BB1_2	# branch
; ci:	nop
; ci: $BB1_1:                                 # %if.else

attributes #0 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }


!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"int", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{i32 58}
!6 = metadata !{i32 108}
!7 = metadata !{i32 190}
!8 = metadata !{i32 243}
