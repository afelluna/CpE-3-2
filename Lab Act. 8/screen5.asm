.model small
.stack 100h
.code
start:
    mov ax, 0b800h
    mov es, ax

    ; Set Light Blue background
    mov ah, 06h
    mov cl, 00h
    mov ch, 00h
    mov dl, 10h
    mov dh, 18h
    mov bh, 17h
    int 10h

    ; Set Yellow background
    mov ah, 06h
    mov cl, 10h
    mov ch, 00h
    mov dl, 20h
    mov dh, 18h
    mov bh, 60h
    int 10h

    ; Set Magenta background
    mov ah, 06h
    mov cl, 20h
    mov ch, 00h
    mov dl, 30h
    mov dh, 18h
    mov bh, 50h
    int 10h

    ; Set Cyan background
    mov ah, 06h
    mov cl, 30h
    mov ch, 00h
    mov dl, 40h
    mov dh, 18h
    mov bh, 30h
    int 10h

    ; Exit program
    mov ah, 4ch
    int 21h

end start