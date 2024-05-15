.model small
.stack 100h

.data
    prompt1 db 'Hello, What''s your name? $'
    prompt2 db 0dh, 0ah, 'Hello, $', 30 dup(' '), 0dh, 0ah
    prompt3 db 'Congratulations! Your first program is working!'
    username db 31, ?, 30 dup('$')

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, prompt1
    int 21h

    mov ah, 0ah
    lea dx, username
    int 21h

    mov si, offset username + 2
    mov di, offset prompt2 + 7

    mov cl, [username + 1]
    add di, cx

    mov cx, 30

replace_loop:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop replace_loop

    mov ah, 09h
    lea dx, prompt2
    int 21h

    mov ah, 09h
    lea dx, prompt3
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main
