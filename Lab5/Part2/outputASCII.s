@
@ Assembler program to input ASCII characters via stdin
@ The program will transform a lower-cased character to upper case @ or an upper case character to lower case
@ R0-R2 - parameters to linux function services
@ R7 - linux function number
.global _start @ Provide program starting @ address to linker
@ Set up the parameters to retrieve the character and then call Linux to do it.

_start: mov R0, #0 
ldr R1, =msg
mov R2, #1 
mov R7, #3 
svc 0

mov R0, #1 
ldr R1, =msg
mov R2, #2 
mov R7, #4 
svc 0
mov R0, #0
mov R7, #1 @ terminates this program

svc 0
.data
msg: .ascii "0\n"

