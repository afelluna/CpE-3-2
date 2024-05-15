
.model small
.stack 100h
.data

.code
start:
    mov ax, @data
    mov ds, ax

    mov cx, 30h

display_loop:
    mov ah, 02h
    mov dl, '*'
    int 21h

    loop display_loop

    mov ax, 4c00h
    int 21h
end start