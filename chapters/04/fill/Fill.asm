// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// KBD: holds the currently pressed key (or 0)
// SCREEN: base RAM location for the 32 words x 256 rows screen pixels
// R0: counter for the fill loop
// R1: max count for the fill loop
// R2: the current color value (0=white, !white=black)

// Setup the number of iterations, a constant
@8192 // 256 * 32, the number of iterations to fill the screen
D=A
@R1
M=D

// Current value is white by default
@R2
M=0

(START)
  @KBD
  D=M
  @BLACK
  D;JNE // If a key is pressed, jump to black to fill in black

(WHITE)
  @R2
  D=M
  @START
  D;JEQ // Jump to start if already white
  @FILL
  0;JMP // Fill with this color

(BLACK)
  @R2
  D=M
  @START
  D;JNE // Jump to start if already black

(FILL)
  @R2
  M=!M // Switch current color
  @R0
  M=0
(FLOOP)
  @R0
  D=M
  @SCREEN
  A=A+D
  M=!M
  @R1
  D=M
  @R0
  M=M+1
  D=M-D
  @START
  D;JEQ // Jump once counter - max loops = 0 (i.e. 8192-8192)
  @FLOOP
  0;JMP // Else, loop again
