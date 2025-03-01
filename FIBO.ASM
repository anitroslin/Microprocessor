ASSUME CS:CODE, DS:DATA
DATA SEGMENT
OUT1 DB "ENTER RANGE :$"
OUT2 DB 13,10,"FIBONACCI SERIES :$"
F DB 0
S DB 1
N DW ?
SM DB ?

DATA ENDS
CODE SEGMENT
START:
        MOV AX,DATA
        MOV DS,AX
       
MOV DX,OFFSET OUT1
MOV AH,9
INT 21H

MOV N,0
MOV BL,10

INPUT:
MOV AH,1
INT 21H

CMP AL,13
JZ NEXT

SUB AL,30H
MOV AH,0
MOV CX,AX
MOV AX,N
MUL BL
ADD AX,CX
MOV N,AX
JMP INPUT

NEXT:
LEA DX,OUT2
MOV AH,9
INT 21H
MOV CX,N

L1:
PUSH CX
MOV DL,10
MOV AH,2
INT 21H

MOV DL,13
MOV AH,2
INT 21H

MOV BL,F
ADD BL,S
        MOV SM,BL
MOV AH,0
        MOV AL,SM
MOV DX,0
MOV BX,10
MOV CX,0
L2:
DIV BX
PUSH DX
MOV DX,0
MOV AH,0
INC CX
CMP AX,0
JNE L2
MOV AH,2
L3:
        POP DX  
ADD DX,48
INT 21H
LOOP L3
MOV BL,S
MOV F,BL
MOV BL,SM
MOV S,BL
POP CX
LOOP L1

RET
CODE ENDS
END START
