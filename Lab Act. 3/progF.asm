.model small
.stack 100h
.data
 byte1 db 1
 byte2 db 0
 word1 dw 1234h
 word2 dw 0
 string db "stressed!", 0dh, 0ah,"$"
 ;---- this is a comment
.code
main proc
 mov ax, @data
 mov ds, ax

 mov dx, offset string
 mov ah, 9
 int 21h
 mov bx, offset string
 mov al, [bx]
 mov ah, [bx+8]
 mov [bx], ah
 mov [bx+8],al
 mov al, [bx+1]
 mov ah, [bx+7]
 mov [bx+1], ah
 mov [bx+7], al
 mov al, [bx+2]
 mov ah, [bx+6]
 mov [bx+2], ah
 mov [bx+6], al
 mov al, [bx+3]
 mov ah, [bx+5]
 mov [bx+3], ah
 mov [bx+5], al
 mov ah,9
 mov dx, offset string
 int 21h
 mov ax, 4c00h
 int 21h
main endp
end main
