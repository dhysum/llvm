; RUN: llc < %s -mtriple=x86_64-apple-darwin -mcpu=corei7 -disable-fp-elim | FileCheck %s

define void @nop_test() {
entry:
; CHECK-LABEL: nop_test:
; CHECK:      nop
; CHECK:      xchgw %ax, %ax
; CHECK:      nopl (%rax)
; CHECK:      nopl 8(%rax)
; CHECK:      nopl 8(%rax,%rax)
; CHECK:      nopw 8(%rax,%rax)
; CHECK:      nopl 512(%rax)
; CHECK:      nopl 512(%rax,%rax)
; CHECK:      nopw 512(%rax,%rax)
; CHECK:      nopw %cs:512(%rax,%rax)

; 11
; CHECK:      .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

; 12
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

; 13
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

; 14
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

; 15
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

; 16
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: nop

; 17
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: xchgw %ax, %ax

; 18
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: nopl (%rax)

; 19
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: nopl 8(%rax)

; 20
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: nopl 8(%rax,%rax)

; 21
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: nopw 8(%rax,%rax)

; 22
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: nopl 512(%rax)

; 23
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: nopl 512(%rax,%rax)

; 24
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: nopw 512(%rax,%rax)

; 25
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

; 26
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

; 27
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

; 28
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

;29
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)

; 30
; CHECK:      .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: .byte 102
; CHECK-NEXT: nopw %cs:512(%rax,%rax)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  0, i32  0)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  1, i32  1)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  2, i32  2)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  3, i32  3)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  4, i32  4)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  5, i32  5)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  6, i32  6)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  7, i32  7)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  8, i32  8)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32  9, i32  9)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 10, i32 10)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 11, i32 11)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 12, i32 12)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 13, i32 13)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 14, i32 14)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 15, i32 15)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 16, i32 16)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 17, i32 17)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 18, i32 18)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 19, i32 19)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 20, i32 20)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 21, i32 21)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 22, i32 22)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 23, i32 23)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 24, i32 24)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 25, i32 25)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 26, i32 26)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 27, i32 27)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 28, i32 28)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 29, i32 29)
  tail call void (i32, i32, ...)* @llvm.experimental.stackmap(i32 30, i32 30)
  ret void
}

declare void @llvm.experimental.stackmap(i32, i32, ...)
