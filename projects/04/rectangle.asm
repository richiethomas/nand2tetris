// Store the screen's base address as @addr
  @SCREEN
  D=A
  @addr
  M=D
  
// Store the value of R0 as n
  @R0
  D=M
  @n
  M=D

// Initialize the counter to 0
  @i
  M=0

(LOOP)
// skip to the end of the counter == n
  @i
  D=M
  @n
  D=D-M
  @END
  D;JGT

// Set the value of the pixel to black
  @addr
  A=M
  M=-1

// Increment the counter up by 1
  @i
  M=M+1
  
// Increment the row up by 1 (i.e. 32 bits)
  @16
  D=A
  @addr
  M=D+M

// Repeat the process
  @LOOP
  0;JMP

(END)
// Terminate the program
@END
0;JMP
