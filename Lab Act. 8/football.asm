.model small
.stack 100h
.data
.code
start:
    ; Set video mode to 32x24 with 2 colors
    mov ax, 0011h
    int 10h

    ; Draw football shape
    ; Draw horizontal lines (orange)
    mov si, 10
    mov di, 20
    mov bx, 12
    draw_horizontal:
        mov ah, 0ch
        mov al, 219
        mov bh, 0
        mov cx, 1
        mov bl, 6  ; orange color
        int 10h
        inc si
        cmp si, 18
        jl draw_horizontal

    ; Draw vertical lines (black)
    mov si, 12
    mov di, 10
    mov bx, 20
    draw_vertical:
        mov ah, 0ch
        mov al, 219
        mov bh, 0
        mov cx, 1
        mov bl, 0  ; black color
        int 10h
        inc di
        cmp di, 20
        jl draw_vertical

    ; Draw horizontal lines (orange)
    mov si, 18
    mov di, 20
    mov bx, 12
    draw_horizontal2:
        mov ah, 0ch
        mov al, 219
        mov bh, 0
        mov cx, 1
        mov bl, 6  ; orange color
        int 10h
        inc si
        cmp si, 26
        jl draw_horizontal2

    ; Draw vertical lines (black)
    mov si, 12
    mov di, 20
    mov bx, 18
    draw_vertical2:
        mov ah, 0ch
        mov al, 219
        mov bh, 0
        mov cx, 1
        mov bl, 0  ; black color
        int 10h
        inc di
        cmp di, 26
        jl draw_vertical2

    ; Exit program
    mov ah, 4ch
    int 21h

end start
