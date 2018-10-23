    @ADRIAN REVUELTA
    @PA4-1
    @10/21
    @This code creates the two integers, startval and endval,
    @loads startval into R2 and endval into R3 while using a loop.

	.extern printf
	.extern scanf
	.global main
	.func main
main:
	PUSH	{LR}
	LDR	R2, =startval 	@ get addr of startval
	LDR	R2, [R2]	    @ Load startval -> R2
	LDR	R3, =endval	    @ get addr of endval
	LDR	R3, [R3]	    @ Load endval -> R3
	@-------------
	@ Your code begins here
	@ Your code must put the final answer
	@ in R1.
	@-------------

    MOV R1, #0      @ MOVED 0 INTO R1

loop:
    CMP R3, R2      @ COMPARES IF R2=R3
    ADD R1, R1, R2  @ ADDS VALUE OF R2 + R1 STORED IN R1
    ADD R2, R2, #1  @ ADDS 1 INTO R2 STORES IN R2
    BGT loop        @ BRANCH GREATER THAN WILL LOOP INTO IS >

	@-------------
	@ Do NOT alter code past this line.
	@-------------
	LDR	R0, =out
	BL	printf
	POP	{PC}

.data
startval:	.word 1
endval:		.word 5
out:		.asciz "%d\n"
