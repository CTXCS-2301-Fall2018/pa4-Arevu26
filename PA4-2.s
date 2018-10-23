	@ ADRIAN REVUELTA
	@ PA4-2
	@ 10/22
	@ Takes an integer, n, and computes n! (n factorial = n * (n -1) * (n – 2) … * 2 * 1)
	@ and puts that value into register R2. Uses a loop to compute n!.

	.extern printf
	.extern scanf
	.global main
	.func main
main:	PUSH	{LR}
	LDR	R0, =prompt	@ Get address of prompt
	BL	printf		@ Print prompt to screen
	LDR	R0, =in		@ Get addr of input format string
	LDR	R1, =n		@ Get addr of n
	BL	scanf		@ Put value in n using scanf
	LDR	R0, =n		@ Addr of n into R0
	LDR	R0, [R0]	@ n is now in R0
	@-------------
	@ Your code goes here.  Put n! in R2
	@-------------

    MOV R1, #1        @ moves value of 1 into R1
    MOV R2, R0        @ moves R0(n) into R2

loop:
    SUB R3, R0, R1    @ subtracts R1 from R0(n) and stores in R3
    ADD R1, R1, #1    @ adds value of 1 into R1 and stores in R1
    MUL R2, R2, R3    @ multiplies R3 and R2 and stores in R2
    CMP R0, R1        @ compares R1 and R0(n)
    BGT loop          @ branch GT loop

odd:
    CMP R0, #0         @ compares value 0 to R0(n)
    MOVEQ R2, #1       @ checks if 1 EQ to R2
    CMP R0, #1         @ compares value of 1 to R0(n)
    MOVEQ R2, #1       @ checks if 1 EQ to R2

	@-------------
	@ Do NOT alter code past this line.
	@-------------
	MOV	R1, R2
	LDR	R0, =out
	BL 	printf
	POP	{PC}

.data
n:	.word 0
prompt:	.asciz "Enter n: "
in:	.asciz "%d"
out:	.asciz "factorial is: %d\n"
