
.model small
.stack 100h

.data
    password1 db 10 dup(0)
    password2 db 10 dup(0)
    msg1 db 'Enter a 10-character password: $'
    msg2 db 'Password: $'
    msg3 db 'Enter your password: $'
    msg4 db 'Password is CORRECT!$'
    msg5 db 'Password is INCORRECT!$'

.code
.startup

    ; Get the first password
    lea dx, msg1
    mov ah, 09h
    int 21h

    mov si, offset password1
    mov cx, 10

get_password1:
    mov ah, 01h
    int 21h
    mov [si], al
    inc si
    loop get_password1

    ; Print the password as stars
    lea dx, msg2
    mov ah, 09h
    int 21h

    mov si, offset password1
    mov cx, 10

print_stars:
    mov al, '*'
    mov ah, 02h
    int 21h
    loop print_stars

    ; Get the second password
    lea dx, msg3
    mov ah, 09h
    int 21h

    mov si, offset password2
    mov cx, 10

get_password2:
    mov ah, 01h
    int 21h
    mov [si], al
    inc si
    loop get_password2

    ; Compare the passwords
    mov si, offset password1
    mov di, offset password2
    mov cx, 10

compare_passwords:
    mov al, [si]
    cmp al, [di]
    jne incorrect_password
    inc si
    inc di
    loop compare_passwords

    ; If passwords match, print correct message
    lea dx, msg4
    mov ah, 09h
    int 21h
    jmp exit

incorrect_password:
    ; If passwords don't match, print incorrect message
    lea dx, msg5
    mov ah, 09h
    int 21h

exit:
    mov ah, 4Ch
    int 21h

end