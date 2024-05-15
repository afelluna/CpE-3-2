
.model small
.stack 100h

.data

.code
start:
    mov ax, 0600h       ; Set video mode to 80x25 color text mode
    mov bh, 00h         ; Page number
    mov cx, 0           ; Upper left corner
    mov dx, 184fh       ; Lower right corner
    int 10h             ; Call BIOS video services

    mov ah, 02h         ; Set cursor position
    mov bh, 0           ; Page number
    mov dh, 10          ; Row
    mov dl, 34          ; Column
    int 10h             ; Call BIOS video services

    mov ah, 02h         ; Print 'T'
    mov dl, 'T'
    int 21h             ; Call DOS interrupt

    mov ah, 02h         ; Print 'I'
    mov dl, 'I'
    int 21h             ; Call DOS interrupt

    mov ah, 02h         ; Print 'P'
    mov dl, 'P'
    int 21h             ; Call DOS interrupt

    mov ah, 4ch         ; Exit program
    int 21h             ; Call DOS interrupt

end start

