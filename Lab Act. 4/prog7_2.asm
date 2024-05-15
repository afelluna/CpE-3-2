.model small
.stack 100h
.data
.code
main proc
    call print
    mov ah, 01h
    int 21h
    mov ax, 0
    ret
main endp

print proc
    mov cx, 1
loop_start:
    cmp cx, 5
    jg loop_end
    mov ah, 02h
    mov dl, '*'
    int 21h
    inc cx
    jmp loop_start
loop_end:
    ret
print endp
end main
