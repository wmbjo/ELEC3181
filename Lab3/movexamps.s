@
@ Examples of the MOVS instruction.
@
.global _start         @ Provide program starting address
@ Load R2 with 0x4F5D6E3A first using MOVS and MOVT
_start:    MOV  R2, #0x6E3A
      MOVT R2, #0x4F5D
@ Just MOVe R2 into R1
      MOVS  R1, R2
@ Now let’s see all the shift versions of MOV
    MOVS   R1, R2, LSL #1 @ Logical shift left
    MOVS   R1, R2, LSR #1 @ Logical shift right
    MOVS   R1, R2, ASR #1 @Arithmetic shift right
    MOVS   R1, R2, ROR #1 @ Rotate right
    MOVS   R1, R2, RRX @ Rotate extended right

@ Repeat the above shifts using
@ the Assembler mnemonics.
    LSL   R1, R2, #1 @ Logical shift left
    LSR   R1, R2, #1 @ Logical shift right
    ASR   R1, R2, #1 @Arithmetic shift right
    ROR   R1, R2, #1 @ Rotate right
    RRX   R1, R2 @ Rotate extended right

@ Example that works with 8 bit immediate and shift
    MOVS   R1, #0xAB000000  @ Too big for #imm16

@ Example that can't be represented and
@      results in an error
@ Uncomment the instruction if you want to
@      see the error
@     MOVS   R1, #0xABCDEF11  @ Too big for #imm16

@ Example of MVN
      MVN   R1, #45
    
@ Example of a MOVS that the Assembler will
@      change to MVN
      MOVS   R1, #0xFFFFFFFE  @ (-2)

@ Set up the parameters to exit the program
@ and then call Linux to do it.
    MOVS   R0, #0 @ Use 0 return code
    MOVS  R7, #1 @ Service command code 1
    svc     0  @ Call      Linux to terminate







    
    
    
    
    