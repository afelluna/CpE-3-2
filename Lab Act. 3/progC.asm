.model small
.stack 100h

.data
    prompt1 db 'Hello, What''s your name? $'
    max_username_length equ 31
    prompt2 db 0dh, 0ah, 'Hello, $', max_username_length, ' ' 
    prompt3 db 'Congratulations! Your first program is working!'
    username db 31 dup('$')  

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

    mov ah, 09h
    lea dx, prompt2
    int 21h

    mov si, offset username + 2
    mov di, offset prompt2 + 7
replace_loop:
    mov al, [si]
    cmp al, 0
    je end_replace
    mov [di], al
    inc si
    inc di
    jmp replace_loop
end_replace:

    mov ah, 09h
    lea dx, prompt3
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main
