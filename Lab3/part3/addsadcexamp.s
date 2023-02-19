
.global _start       @ Provide program starting address

_start:    MOV   R3, #0xFFFF     
      MOVT R3, #0x7FFF

      MOV  R2, #0x1839
      MOVT  R2, #0x4853

      ADDS R1, R3, R2      @ Lower order word

mov     R7, #1 @ Service command code 1
svc     0 @ Call      Linux to terminate

