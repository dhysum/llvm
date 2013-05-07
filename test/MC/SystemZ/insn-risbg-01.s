# RUN: llvm-mc -triple s390x-linux-gnu -show-encoding %s | FileCheck %s

#CHECK: risbg	%r0, %r0, 0, 0, 0       # encoding: [0xec,0x00,0x00,0x00,0x00,0x55]
#CHECK: risbg	%r0, %r0, 0, 0, 63      # encoding: [0xec,0x00,0x00,0x00,0x3f,0x55]
#CHECK: risbg	%r0, %r0, 0, 63, 0      # encoding: [0xec,0x00,0x00,0x3f,0x00,0x55]
#CHECK: risbg	%r0, %r0, 63, 0, 0      # encoding: [0xec,0x00,0x3f,0x00,0x00,0x55]
#CHECK: risbg	%r0, %r15, 0, 0, 0      # encoding: [0xec,0x0f,0x00,0x00,0x00,0x55]
#CHECK: risbg	%r15, %r0, 0, 0, 0      # encoding: [0xec,0xf0,0x00,0x00,0x00,0x55]
#CHECK: risbg	%r4, %r5, 6, 7, 8       # encoding: [0xec,0x45,0x06,0x07,0x08,0x55]

	risbg	%r0,%r0,0,0,0
	risbg	%r0,%r0,0,0,63
	risbg	%r0,%r0,0,63,0
	risbg	%r0,%r0,63,0,0
	risbg	%r0,%r15,0,0,0
	risbg	%r15,%r0,0,0,0
	risbg	%r4,%r5,6,7,8