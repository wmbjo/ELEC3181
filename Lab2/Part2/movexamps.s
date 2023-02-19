@
@ Examples of the MOV instruction.
@
.global_start @ Provide program starting address
@ Load R2 with 0x4F5D6E3A first using MOV and MOVT
_start: MOV R2, #0x0140
	MOVT R2, #0x4717
	MOV R0, #0 @Use 0 return code
	MOV R7, #1 @Service command code 1
	svc 0 @Call Linux to terminate
