// Adds two numbers 
// R[2] = R[0] + R[1]
// Usage: put the values that you wish to add
//        in R[0] and R[1]

  @ 0
  D=M
  @1
  D=D+M
  @2
  M=D

  @6
  0;JMP
