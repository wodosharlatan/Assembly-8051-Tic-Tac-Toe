mov R1,#13h
mov r2,#45h
ResetGameBoard:
mov @r1,#00h
INC r1
DJNZ R2,ResetGameBoard

setb p1.0

mov r0,#00h
mov 70h,#11h
mov p2,#0
mov p3,#0
mov p1,#00111111b
 

Mov 13h,#0FFh
Mov 14h,#0FFh
Mov 15h,#0FFh
Mov 16h,#0FFh
Mov 17h,#0FFh
Mov 23h,#0FFh
Mov 27h,#0FFh
Mov 33h,#0FFh
Mov 37h,#0FFh
Mov 43h,#0FFh
Mov 47h,#0FFh
Mov 53h,#0FFh
Mov 54h,#0FFh
Mov 55h,#0FFh
Mov 56h,#0FFh
Mov 57h,#0FFh


MainLoop:
jnb p2.4,SkipMiddle
jnb p2.0,P1_Diagonal_False
jnb p1.7,P1_Diagonal_False

P1_Wins:
ljmp Player1Victorious

P1_Diagonal_False:
jnb p2.1,P1_MidCol_False
jb p2.7,P1_Wins

P1_MidCol_False:
jnb p2.2,P1_Diagonal2
jb p2.6,P1_Wins

P1_Diagonal2:
jnb p2.3,SkipMiddle
jb p2.5,P1_Wins


SkipMiddle:
jnb p2.0,P1_TopLeft_False
jnb p2.1,P1_JumpHere
jb p2.2,P1_Wins

P1_JumpHere:
jnb p2.3,P1_TopLeft_False
jb p2.6,P1_Wins

P1_TopLeft_False:
jnb p1.7,CheckPlayer2
jnb p2.5,P1_BotCol_False
jb p2.2,P1_Wins

P1_BotCol_False:
jnb p2.7,CheckPlayer2
jb p2.6,P1_Wins

CheckPlayer2:

jnb p3.4,SkipMiddle2
jnb p3.0,P2_Diagonal_False
jnb p1.6,P2_Diagonal_False

P2_Wins:
ljmp Player2Victorious

P2_Diagonal_False:
jnb p3.1,P2_MidCol_False
jb p3.7,P2_Wins

P2_MidCol_False:
jnb p3.2,P2_Diagonal2
jb p3.6,P2_Wins

P2_Diagonal2:
jnb p3.3,SkipMiddle2
jb p3.5,P2_Wins

SkipMiddle2:
jnb p3.0,P2_TopLeft_False
jnb p3.1,P2_JumpHere
jb p3.2,P2_Wins

P2_JumpHere:
jnb p3.3,P2_TopLeft_False
jb p3.6,P2_Wins

P2_TopLeft_False:
jnb p1.6,Continue
jnb p3.5,P2_BotCol_False
jb p3.2,P2_Wins

P2_BotCol_False:
jnb p3.7,Continue
jb p3.6,P2_Wins
Continue:


SETB P0.0
SETB P0.1
SETB P0.2
CLR P0.3

JNB P0.6,One
JNB P0.5,Two
JNB P0.4,Three
SETB P0.3
CLR P0.2

JNB P0.6,Four
JNB P0.5,Five
JNB P0.4,Six
SETB P0.2
CLR P0.1

JNB P0.6,Seven
JNB P0.5,Eight
JNB P0.4,Nine
SETB P0.1
CLR P0.0
SETB P0.0
JMP MainLoop

One:
mov r0,#24h
CJNE @r0, #0, GoBack
jb p0.7,SetPlayer


Two:
mov r0,#25h
CJNE @r0, #0, GoBack
jb p0.7,SetPlayer

Three:
mov r0,#26h
CJNE @r0, #0, GoBack
jb p0.7,SetPlayer

Four:
mov r0,#34h
CJNE @r0, #0, GoBack
jb p0.7,SetPlayer

Five:
mov r0,#35h
CJNE @r0, #0, GoBack
jb p0.7,SetPlayer

GoBack:
ljmp MainLoop

Six:
mov r0,#36h
CJNE @r0, #0, GoBack
jb p0.7,SetPlayer

Seven:
mov r0,#44h
CJNE @r0, #0, GoBack
jb p0.7,SetPlayer

Eight:
mov r0,#45h
CJNE @r0, #0, GoBack
jb p0.7,SetPlayer

Nine:
mov r0,#46h
CJNE @r0, #0, GoBack
jb p0.7,SetPlayer







SetPlayer:
jnb p1.0,PlayerB

mov @r0,#11h
mov 70h,#22h

CJNE r0, #24h,ones24
setb p2.0
ones24:
CJNE r0, #25h,ones25
setb p2.1
ones25:
CJNE r0, #26h,ones26
setb p2.2
ones26:
CJNE r0, #34h,ones34
setb p2.3
ones34:
CJNE r0, #35h,ones35
setb p2.4
ones35:
CJNE r0, #36h,ones36
setb p2.5
ones36:
CJNE r0, #44h,ones44
setb p2.6
ones44:
CJNE r0, #45h,ones45
setb p2.7
ones45:
CJNE r0, #46h,ones46
setb p1.7
ones46:
clr p1.0
JMP MainLoop


PlayerB:
mov @r0,#22h
mov 70h,#11h
CJNE r0, #24h,twos24
setb p3.0
twos24:
CJNE r0, #25h,twos25
setb p3.1
twos25:
CJNE r0, #26h,twos26
setb p3.2
twos26:
CJNE r0, #34h,twos34
setb p3.3
twos34:
CJNE r0, #35h,twos35
setb p3.4
twos35:
CJNE r0, #36h,twos36
setb p3.5
twos36:
CJNE r0, #44h,twos44
setb p3.6
twos44:
CJNE r0, #45h,twos45
setb p3.7
twos45:
CJNE r0, #46h,twos46
setb p1.6
twos46:
clr p1.0
SETB p1.0
JMP MainLoop

Player1Victorious:
mov p1,#11111001b
jmp SkipP2Win

Player2Victorious:
mov p1,#10100100b

SkipP2Win:
END
