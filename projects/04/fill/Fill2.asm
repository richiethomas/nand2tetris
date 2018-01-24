(LOOP)
    @SCREEN
    D=A
    @addr
    M=D

    @KBD
    D=M

    @UP
    D;JEQ // no key, go to UP

    @DOWN
    0;JEQ // key, go to DOWN

(DRAW)
    @addr
    D=M
    @KBD
    D=D-A
    @LOOP
    D;JEQ

    @colour
    D=M
    @addr
    A=M
    M=D

    @addr
    M=M+1

    @DRAW
    0;JMP

(UP)
    @colour
    M=0
    @DRAW
    0;JMP

(DOWN)
   @colour
   M=-1
   @DRAW
   0;JMP
