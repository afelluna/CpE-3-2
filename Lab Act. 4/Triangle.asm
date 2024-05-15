.model small
.stack 100h ; Allocate 256 bytes for the stack
.code
org 100h
start:

mov cl, 1 
mov bl, 0
mov ch, 4

looprow:
    cmp ch, 0
    jle quit

loopcol:
    cmp bl, cl
    jl dsplay
    jmp next

dsplay:
    mov ah, 02h
    mov dl, '*'    ; display asterisk
    int 21h
    inc bl
    jmp loopcol

next:
    mov dl, 0Ah
    int 21h       ; next line
    mov dl, 0Dh
    int 21h

    mov bl, 0
    dec ch
    inc cl
    jmp looprow

quit:
    mov ah, 4Ch
    int 21h
end start
