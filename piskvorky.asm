;### Pocatecni Nastaveni + Pole #####
setb p1.0
mov r0,#00h
jb p0.7,InitializeGameBoard


InitializeGameBoard:
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




;############ Klavesnice #############

cykl:
SETB P0.0
SETB P0.1
SETB P0.2
CLR P0.3

JNB P0.6,jedna
JNB P0.5,dva
JNB P0.4,tri
SETB P0.3
CLR P0.2

JNB P0.6,ctyri
JNB P0.5,pet
JNB P0.4,sest
SETB P0.2
CLR P0.1

JNB P0.6,sedm
JNB P0.5,osm
JNB P0.4,devet
SETB P0.1
CLR P0.0

JNB P0.5,nula
SETB P0.0
JMP cykl

;#### Funkce Klavesnice ##############

jedna:
mov r0,#24h
CJNE @r0, #0, cykl
jb p0.7,SetPlayer

dva:
mov r0,#25h
CJNE @r0, #0, cykl
jb p0.7,SetPlayer

tri:
mov r0,#26h
CJNE @r0, #0, cykl
jb p0.7,SetPlayer

ctyri:
mov r0,#34h
CJNE @r0, #0, cykl
jb p0.7,SetPlayer

pet:
mov r0,#35h
CJNE @r0, #0, cykl
jb p0.7,SetPlayer

sest:
mov r0,#36h
CJNE @r0, #0, cykl
jb p0.7,SetPlayer

sedm:
mov r0,#44h
CJNE @r0, #0, cykl
jb p0.7,SetPlayer

osm:
mov r0,#45h
CJNE @r0, #0, cykl
jb p0.7,SetPlayer

devet:
mov r0,#46h
CJNE @r0, #0, cykl
jb p0.7,SetPlayer

nula:
jb p0.7,ClearBoard
JMP cykl

;####### Nastaveni navesti ###############

SetPlayer:
jnb p1.0,PlayerB
mov @r0,#11h
clr p1.0
JMP cykl
PlayerB:
mov @r0,#22h
SETB p1.0
JMP cykl

ClearBoard:
mov R1,#13h
mov r2,#45h
SubFunction:
mov @r1,#00h
INC r1
DJNZ R2,SubFunction
JMP InitializeGameBoard