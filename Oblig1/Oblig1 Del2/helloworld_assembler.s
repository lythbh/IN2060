.text
.global main
main:
	push {lr}
	ldr r0, =string
	bl printf
	
	mov r0, $5
	mov r1, $3
	add r0, r1
	pop {lr}
	bx lr

.data
string: .asciz "Hello World!\n"
