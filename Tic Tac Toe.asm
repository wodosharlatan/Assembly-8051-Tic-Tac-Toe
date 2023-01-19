;### Pocatecni Nastaveni + Pole #####
mov R1,#13h
mov r2,#45h
SubFunction:
mov @r1,#00h
INC r1
DJNZ R2,SubFunction

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




;############ Kontrola Vyhry #############################
;=========== HRAC 1 ======================
;############ 4 kombinace Zacinajici Stredem #############
cykl:

jnb p2.4,SkipMiddle
jnb p2.0,P1_Diagonal_False
jnb p1.7,P1_Diagonal_False
;############ Levo nahore -> Pravo Dole #############

;## Osetreni Vyhry Hrace 1 ##
P1_Wins:
ljmp onesWin
;## Osetreni Vyhry Hrace 1 ##

P1_Diagonal_False:
jnb p2.1,P1_MidCol_False
jb p2.7,P1_Wins
;############ Uprodsted nahore -> Uprodsted Dole #############

P1_MidCol_False:
jnb p2.2,P1_Diagonal2
jb p2.6,P1_Wins
;############ Pravo nahore -> Levo Dole #############

P1_Diagonal2:
jnb p2.3,SkipMiddle
jb p2.5,P1_Wins
;############ Levo uprodsted -> Pravo uprodsted #############
;############ 2 Kombinace Zacinajici Levo nahore #############

SkipMiddle:
jnb p2.0,P1_TopLeft_False
jnb p2.1,P1_JumpHere
jb p2.2,P1_Wins
;############ Levo nahore -> Pravo nahore #############

P1_JumpHere:
jnb p2.3,P1_TopLeft_False
jb p2.6,P1_Wins
;############ Levo nahore -> Levo Dole #############
;############ 2 Kombinace Zacinajici Pravo Dole #############

P1_TopLeft_False:
jnb p1.7,CheckPlayer2
jnb p2.5,P1_BotCol_False
jb p2.2,P1_Wins
;############ Pravo dole -> Pravo nahore #############

P1_BotCol_False:
jnb p2.7,CheckPlayer2
jb p2.6,P1_Wins
;############ Pravo dole -> Pravo nahore #############
;=========== HRAC 2 ======================

CheckPlayer2:

jnb p3.4,SkipMiddle2
jnb p3.0,P2_Diagonal_False
jnb p1.6,P2_Diagonal_False
;############ Levo nahore -> Pravo Dole #############

;## Osetreni Vyhry Hrace 1 ##
P2_Wins:
ljmp twosWin
;## Osetreni Vyhry Hrace 1 ##

P2_Diagonal_False:
jnb p3.1,P2_MidCol_False
jb p3.7,P2_Wins
;############ Uprodsted nahore -> Uprodsted Dole #############

P2_MidCol_False:
jnb p3.2,P2_Diagonal2
jb p3.6,P2_Wins
;############ Pravo nahore -> Levo Dole #############

P2_Diagonal2:
jnb p3.3,SkipMiddle2
jb p3.5,P2_Wins
;############ Levo uprodsted -> Pravo uprodsted #############
;############ 2 Kombinace Zacinajici Levo nahore #############

SkipMiddle2:
jnb p3.0,P2_TopLeft_False
jnb p3.1,P2_JumpHere
jb p3.2,P2_Wins
;############ Levo nahore -> Pravo nahore #############

P2_JumpHere:
jnb p3.3,P2_TopLeft_False
jb p3.6,P2_Wins
;############ Levo nahore -> Levo Dole #############
;############ 2 Kombinace Zacinajici Pravo Dole #############

P2_TopLeft_False:
jnb p1.6,Continue
jnb p3.5,P2_BotCol_False
jb p3.2,P2_Wins
;############ Pravo dole -> Pravo nahore #############

P2_BotCol_False:
jnb p3.7,Continue
jb p3.6,P2_Wins

Continue:
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
SETB P0.0
JMP cykl

;#### Funkce Klavesnice ##############

jedna:
mov r0,#24h
CJNE @r0, #0, jjedna
jb p0.7,SetPlayer
jjedna:
ljmp cykl


dva:
mov r0,#25h
CJNE @r0, #0, ddva
jb p0.7,SetPlayer
ddva:
ljmp cykl

tri:
mov r0,#26h
CJNE @r0, #0, ttri
jb p0.7,SetPlayer
ttri:
ljmp cykl

ctyri:
mov r0,#34h
CJNE @r0, #0, cctyri
jb p0.7,SetPlayer
cctyri:
ljmp cykl


pet:
mov r0,#35h
CJNE @r0, #0, ppet
jb p0.7,SetPlayer
ppet:
ljmp cykl


sest:
mov r0,#36h
CJNE @r0, #0, ssest
jb p0.7,SetPlayer
ssest:
ljmp cykl

sedm:
mov r0,#44h
CJNE @r0, #0, ssedm
jb p0.7,SetPlayer
ssedm:
ljmp cykl


osm:
mov r0,#45h
CJNE @r0, #0, oosm
jb p0.7,SetPlayer
oosm:
ljmp cykl


devet:
mov r0,#46h
CJNE @r0, #0, ddevet
jb p0.7,SetPlayer
ddevet:
ljmp cykl
;####### Nastaveni navesti ###############

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
JMP cykl
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
JMP cykl



onesWin:
mov p1,#11111001b
jmp game
twosWin:
mov p1,#10100100b
game:
end
