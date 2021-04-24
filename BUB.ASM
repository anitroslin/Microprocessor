ASSUME CS:CODE,DS:DATA
DATA SEGMENT
LIST DW 9H, 1H, 7H, 2H, 8H, 3H
COUNT EQU 06
DATA ENDS

CODE SEGMENT
START:
       MOV AX,DATA
       MOV DS,AX
       MOV DX,COUNT-1
AGAIN0:MOV CX,DX
       MOV SI,OFFSET LIST

AGAIN1:MOV AX,[SI]
       CMP AX,[SI+2]
       JL SATI
       XCHG [SI+2],AX
       XCHG [SI],AX

SATI:  ADD SI,02
       LOOP AGAIN1
       DEC DX
       JNZ AGAIN0
       MOV DI,OFFSET LIST
       MOV CX,COUNT

L1:    MOV AX,[DI]
       AAM
       ADD AX,03030H
       MOV DX,AX
       MOV AH,02H
       INT 21H
       ADD DI,02
       LOOP L1

      MOV AH,4CH
      INT 21H
      CODE ENDS
      END START
