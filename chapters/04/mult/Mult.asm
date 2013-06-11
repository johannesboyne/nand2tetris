// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R3 // Counter in R3
M=0
@R2 // Sum in R2
M=0

(LOOP)
	@R3
	M=M+1 // Increment counter
	D=M
	@R1
	D=D-M // Check end loop condition: if counter > R1, end
	@END
	D;JGT

	@R0
	D=M // Load the number to add
	@R2
	M=D+M // Add R0 to the current sum, store it back to R2
	@LOOP
	0;JMP

(END)
	@END
	0;JMP
