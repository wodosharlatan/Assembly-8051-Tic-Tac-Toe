JNB 0Fh,HracA
cykl:
SETB P0.0
SETB P0.1
SETB P0.2
CLR P0.3;aktivace 1. řádku
;kontrola sloupečků
JNB P0.6,jedna
JNB P0.5,dva
JNB P0.4,tri
SETB P0.3 ;vypnutí 1.řádku
CLR P0.2
;kontrola sloupečků
JNB P0.6,ctyri
JNB P0.5,pet
JNB P0.4,sest
SETB P0.2
CLR P0.1
;kontrola sloupečků
JNB P0.6,sedm
JNB P0.5,osm
JNB P0.4,devet
SETB P0.1
CLR P0.0
;kontrola sloupečků
JNB P0.6,plus
JNB P0.5,nula
JNB P0.4,rovnase
SETB P0.0
JMP cykl

 

jedna:
MOV 01h,0Fh
JMP HracB


dva:
MOV P1,#10100100b;2
JMP cykl

tri:
MOV P1,#10110000b;3
JMP cykl

ctyri:
MOV P1,#10011001b;4
JMP cykl

pet:
MOV P1,#10010010b;5
JMP cykl

sest:
MOV P1,#10000010b;6
JMP cykl

sedm:
MOV P1,#11111000b;7
JMP cykl

osm:
MOV P1,#10000000b;8
JMP cykl

devet:
MOV P1,#10010000b;9
JMP cykl

nula:
MOV P1,#11000000b;0
JMP cykl

plus:
MOV P1,#00000000b;P
JMP cykl

rovnase:
MOV P1,#10111110b;=
JMP cykl

HracA:
MOV 0Fh,#0AAh
JMP cykl

HracB:
MOV 0Fh,#0BBh
JMP cykl

