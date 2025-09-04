	.cpu arm10tdmi
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"part3.c"
	.text
	.align	2
	.global	_Z3fibj
	.arch armv5t
	.syntax unified
	.arm
	.fpu neon
	.type	_Z3fibj, %function
_Z3fibj:
	.fnstart
.LFB12:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r3, r0, #0
	beq	.L4
	mov	r1, #1
	mov	r2, #0
.L3:
	subs	r3, r3, #1
	add	r0, r2, r1
	mov	r1, r2
	bxeq	lr
	mov	r2, r0
	b	.L3
.L4:
	mov	r0, r3
	bx	lr
	.cantunwind
	.fnend
	.size	_Z3fibj, .-_Z3fibj
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\012\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu neon
	.type	main, %function
main:
	.fnstart
.LFB13:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L10
	mov	r1, #233
	push	{r4, lr}
	.save {r4, lr}
.LPIC0:
	add	r0, pc, r0
	bl	printf(PLT)
	mov	r0, #0
	pop	{r4, pc}
.L11:
	.align	2
.L10:
	.word	.LC0-(.LPIC0+8)
	.fnend
	.size	main, .-main
	.ident	"GCC: (GNU) 9.2.0"
	.section	.note.GNU-stack,"",%progbits
