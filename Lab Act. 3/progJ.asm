.model small, C
.stack 100h
.data
prompt1 db 13,10,"Hello, what's your name?$"
prompt2 db "Hello, $"
prompt3 db 13,10,"Congratulations! Your first program is working!$"
username db 24 dup("$")
newline db 13,10,"$"
.code
Start:
mov ax, @data
mov ds, ax
mov es, ax

mov ah, 09h
mov dx, offset prompt1
int 21h

mov ah, 0Ah
mov dx, offset username
int 21h

mov ah, 09h
mov dx, offset newline
int 21h

mov ah, 09h
mov dx, offset prompt2
int 21h

mov si, 2
lea dx, username[si]
mov ah, 09h
int 21h

mov ah, 09h
mov dx, offset prompt3
int 21h

mov ah, 4Ch
int 21h
end Start
