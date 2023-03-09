@step 1: Smith text 92 - 95

@ step 2
@
@ Assembler program to print "Hello World!"
@ to stdout.
@
@ R0-R2 - parameters to linux function services
@ R7 - linux function number
@
.global _start         @ Provide program starting
@ address to linker
@ Set up the parameters to print hello world
@ and then call Linux to do it.

_start: mov R0, #1     @ 1 = StdOut
    ldr   R1, =helloworld   @ string to print
    mov   R2, #13 @ length of our string
    mov   R7, #4 @ linux write system call
    svc   0 @ Call linux to print

@ Set up the parameters to exit the program
@ and then call Linux to do it.
    mov R0, #0  @ Use 0 return code
    mov R7, #1  @ Service command code 1
            @ terminates this program
    svc 0       @ Call linux to terminate

@.fill 4073,1,0 @Uncomment for Step 5
.fill 255,1,0 @Uncomment for Step 5

.data
@ .word  0x1234ABCD, -1434 @Uncomment for Step 3 


helloworld:  .ascii  "Hello World!\n"

@@ Step 2 command: objdump -s -d HellowWorld.o. Screenshot where in memory
@@ Step 3  and Step 4 Add space between svc 0 and .data in HelloWorld code. See where object dump of HelloWorld is in memory .word  0x1234ABCD, -1434





@@ Step 6
