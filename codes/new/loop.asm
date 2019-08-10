assume cs:codeseg

codeseg segment
    mov ax, 083fH
    mov ds, ax
    mov cx, 10
    mov bx, 0
s:  mov ax, [bx]
    inc bx
    loop s

    mov ax, 4c00H
    int 21H
codeseg ends

end