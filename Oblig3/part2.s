.text
.global main
@ Function that `main` should call

fib:
    PUSH {lr}
    MOV r3, r1  @ temporary
    ADD r1, r2, r1
    MOV r2, r3
    SUB r0, #1
    CMP r0, #0
    BGT fib

    POP {lr}
    BX lr
    
main:
    
    MOV r0, #13 @ N
    MOV r1, #0  @ current
    MOV r2, #1  @ previous

    BL fib
    
    LDR r0,=output_string
    MOV r1, r1

    BL printf

    MOV r7, #1   @ Avslutter programmet
    SWI 0

.data
output_string:
    .asciz "%d\n"


