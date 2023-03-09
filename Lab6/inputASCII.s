@
@ Assembler program to input ASCII characters via stdin
@ The program will take a string of up to 50 characters and modify it
@ such that all lower-cased letters will be made upper-case.
@ R0-R2 - parameters to linux function services
@ R7 - linux function number
.global _start @ Provide program starting @ address to linker
@ Set up the parameters to retrieve characters and then call Linux to do it. 
_start: mov R0, #0 @ 0 = StdIn
        ldr R1, =msg @address to receive input
        mov R2, #50 @receive at most 50 characters
        mov R7, #3 @read
        svc 0 @ Call linux to receive input
        mov r2, r0 @captures number of characters input

@ Insert your code here Step 2
loop: LDRB   R5, [R1], #0

@ If R5 > 'z' then goto cont
      CMP    R5, #'z'        @ is letter > 'z'?
      BGT    cont

@ Else if R5 < 'a' then goto end if
      CMP    R5, #'a'
      BLT    cont  @ goto to end if
@ if we got here then the letter is lower-case,
@ so convert it.
      SUB   R5, #('a'-'A')
cont: @ end if
    STRB  R5, [R1], #1 @ store character to outstr
    CMP   R5, #0       @ stop on hitting a null char
    BNE   loop         @ loop if character isn't null


@ Set up stdout to echo those characters back and then call Linux to do it. 
    mov R0, #1 @ 1 = StdOut
    ldr R1, =msg @ string to print

    @mov R2, #2 @ commented out because you will need to calculate the string length
    mov R7, #4 @ linux write system call
    svc 0 @ Call linux to print
    mov R0, #0 @ Use 0 return code
    mov R7, #1 @ Service command code 1
@ terminates this program
    svc 0
.data
msg: .fill 51, 1, '\n' @ Allocates enough memory for 50 characters




@ @
@ @ Assembler program to convert a string to
@ @ all uppercase.
@ @
@ @ R0-R2 - parameters to Linux function services
@ @ R3 - address of output string
@ @ R4 - address of input string
@ @ R5 - current character being processed
@ @ R7 - Linux function number
@ @
@ .global _start @ Provide program starting address
@ _start: LDR  R4, =instr @ start of input string
@        LDR   R3, =outstr @ address of output string
@ @ The loop is until byte pointed to by R1 is non-zero
@ @ Load character and increment pointer
@ loop: LDRB   R5, [R4], #1
@ @ If R5 > 'z' then goto cont
@       CMP    R5, #'z'        @ is letter > 'z'?
@       BGT    cont

@ @ Else if R5 < 'a' then goto end if
@       CMP    R5, #'a'
@       BLT    cont  @ goto to end if
@ @ if we got here then the letter is lower-case,
@ @ so convert it.
@       SUB   R5, #('a'-'A')
@ cont: @ end if
@       STRB  R5, [R3], #1 @ store character to outstr
@       CMP   R5, #0       @ stop on hitting a null char
@       BNE   loop         @ loop if character isn't null
@ @ Set up the parameters to print our hex number
@ @ and then call Linux to do it.
@       MOV   R0, #1       @ 1 = StdOut
@       LDR   R1, =outstr  @ string to print
@ @ get the length by subtracting the pointers
@       SUB   R2, R3, R1
@       MOV   R7, #4       @ linux write system call
@       SVC   0            @ Call linux to output the string
@ @ Set up the parameters to exit the program
@ @ and then call Linux to do it.
@ MOV     R0, #0
@ MOV     R7, #1
@ SVC     0
@ @ Use 0 return code
@ @ Service command code 1
@ @ Call linux to terminate

@ .data
@ instr:  .asciz  "This is our Test String that we will
@ convert.\n"
@ outstr:      .fill 255, 1, 0

