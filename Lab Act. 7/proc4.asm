.model small
.stack 100h

.data
    msg1 db 13, 10, "Enter first number:$"
    msg2 db 13, 10, "Enter second number:$"
    msg3 db 13, 10, "Sum in decimal number:$"
    num1 db ?
    sum db ?
    res db 20 DUP('$')
    error_msg db 13, 10, "Invalid input! Only single digit numbers are accepted.$"

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 9
    jae invalid_input
    mov num1, al

    lea dx, msg2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 9
    jae invalid_input
    add al, num1
    mov sum, al

    lea dx, msg3
    mov ah, 09h
    int 21h

    mov si, offset res
    mov ax, 0
    mov al, sum
    call dec_to_str

    lea dx, res
    mov ah, 09h
    int 21h

    mov ax, 4C00h
    int 21h

invalid_input:
    lea dx, error_msg
    mov ah, 09h
    int 21h
    mov ax, 4C00h
    int 21h

main endp

dec_to_str proc near
    push ax
    push bx
    push cx
    push dx
    push si

    mov cx, 0
    mov bx, 0Ah

convert_loop:
    xor dx, dx
    div bx

    add dl, '0'
    push dx

    inc cx
    test ax, ax
    jnz convert_loop

output_loop:
    pop dx
    mov [si], dl
    inc si
    loop output_loop

    mov al, '$'
    mov [si], al

    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
dec_to_str endp

end main
