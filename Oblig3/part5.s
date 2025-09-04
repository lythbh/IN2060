@ The two numbers we want to add
num1:   .word   0x40000000
num2:   .word   0x3f010000

.text
.global main
main:
    @ Load numbers
    LDR r0, num1
    LDR r1, num2

@ 1. steg
    LDR r2, =0x7F800000 @ Maske for eksponenten
    @ Lagrer eksponentene
    AND r4, r0, r2 
    AND r5, r1, r2
    @ Shifter slik at eksponenten ligger i de minst signifikante bits i registrene
    LSR r4, r4, #23
    LSR r5, r5, #23

@ 2. steg
    LDR r2, =0x007FFFFF @ Maske for fraksjonen
    AND r6, r0, r2
    AND r7, r1, r2
    @ Legger til et ledende 1 tall 
    ORR r6, r6, #0x00800000
    ORR r7, r7, #0x00800000

@ 3., 4., 5., 6. og 7. steg
    CMP r4, r5
    BGT r4_storst
    BLE r5_storst

r4_storst:
    SUB r4, r4, r5 @ Forskjellen mellom eksponentene
    LSR r6, r6, r4 @ Høyreskifte med eksponentforskjellen
    LSR r5, r5, r4 @ Oppdaterer num2 sin eksponent
    LSL r5, r5, #23 @ Shifter tilbake så eksponenten er på riktig posisjon  
    ADD r8, r6, r7 @ Summere desimalene
    AND r8, r8, #0xFF7FFFFF @ Fjerner ledende 1
    ADD r8, r5, r8 @ Legger til eksponent
    B exit

r5_storst:
    SUB r5, r5, r4 @ Forskjellen mellom eksponentene
    LSR r7, r7, r5 @ Høyreskifte med eksponentforskjellen
    LSR r4, r4, r5 @ Oppdaterer num1 sin eksponent
    LSL r4, r4, #23 @ Shifter tilbake så eksponenten er på riktig posisjon
    ADD r8, r6, r7 @ Summere desimalene
    AND r8, r8, #0xFF7FFFFF @ Fjerner ledende 1
    ADD r8, r4, r8 @ Legger til eksponent
    B exit

exit:
@ 8. steg
    MOV r0, r8
    BX lr

