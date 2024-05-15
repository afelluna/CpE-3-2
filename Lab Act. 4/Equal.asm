
.model small
.stack 0100h
.data
.code
MAIN SEGMENT
ASSUME CS:MAIN,DS:MAIN,ES:MAIN,SS:MAIN
org 100h
start:
             MOV DL,41h
             MOV DH,41h
             CMP DH,DL
             JE TheyAreEqual
             JMP TheyAreNotEqual
TheyAreNotEqual:
            MOV AH,02h
            MOV DL,4Eh
            INT 21h
            INT 20h
TheyAreEqual:
            MOV AH,02h
            MOV DL,59h
            INT 21h
            INT 20h
main ends
end start