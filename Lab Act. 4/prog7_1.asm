.model small
.stack 100h
.data
.code
main proc
    mov ax, @data
    mov ds, ax
    mov cx, 0005h
    mov ah, 02h
    mov dl, '*'
A: 
    int 21h
    loop A
    mov ax, 4c00h
    int 21h
main endp
end main
