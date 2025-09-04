.text
.global main

main:
    MOV r0, #13 @ N
    MOV r1, #0  @ current
    MOV r2, #1  @ previous

loop:
    
    MOV r3, r1  @ temporary
    ADD r1, r2, r1
    MOV r2, r3
    SUB r0, #1
    CMP r0, #0
    BEQ exit

    B loop

exit:
    BX lr
