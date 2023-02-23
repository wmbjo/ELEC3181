@@ Step 15 of lab
.global _start       @ Provide program starting address

@ load the address of mynumber into R1
_start:    LDR R1, =mynumber 

    LDR  R2, [R1]
    STRB  R2, [R1, #1]

    LDR R3, = 0x01010101
    SUB R2, R2, R3

    STR R2, [r1]

    mov     R0, #0      @ Service command code 0
    mov     R7, #1      @ Service command 1 to terminate the program
    svc     0           @ Call      Linux to terminate     
    
    

@ load the word stored at mynumber into R2


.data

mynumber: .WORD 0x47170140
@helloworld: .ascii "Hello World!\n"


@ @@ Step 13 and 14 of lab
@ .global _start       @ Provide program starting address

@ @ load the address of mynumber into R1
@ _start:    LDR R1, =mynumber 

@     LDR  R2, [R1]
@     STR  R2, [R1]

@     LDR R3, = 0x01010101
@     ADD R2, R2, R3

@     STR R2, [r1]

@     mov     R0, #0      @ Service command code 0
@     mov     R7, #1      @ Service command 1 to terminate the program
@     svc     0           @ Call      Linux to terminate     
    
    

@ @ load the word stored at mynumber into R2


@ .data

@ mynumber: .WORD 0x47170140
@ @helloworld: .ascii "Hello World!\n"




@@@@ Step 10 of lab
@ .global _start       @ Provide program starting address

@ @ load the address of mynumber into R1
@ _start:    LDR R1, =mynumber 

@     LDRH  R2, [R1, #2]!

@     mov     R0, #0      @ Service command code 0
@     mov     R7, #1      @ Service command 1 to terminate the program
@     svc     0           @ Call      Linux to terminate     
    
    

@ @ load the word stored at mynumber into R2


@ .data

@ mynumber: .WORD 0x47170140
@ @helloworld: .ascii "Hello World!\n"



@@@ Steps 1 through 9
@ .global _start       @ Provide program starting address

@ @ load the address of mynumber into R1
@ _start:    LDR R1, =mynumber 

@     LDR R2, [R1]

@     mov     R0, #0      @ Service command code 0
@     mov     R7, #1      @ Service command 1 to terminate the program
@     svc     0           @ Call      Linux to terminate     
    
    

@ @ load the word stored at mynumber into R2


@ .data

@ mynumber: .WORD 0x47170140
@ @helloworld: .ascii "Hello World!\n"

