assume cs:codeseg

codeseg segment
    dw 0001H, 0002H, 0003H, 0004H, 0005H, 0006H, 0007H, 0008H
start:  mov ax, 0
        mov bx, 0
        mov cx, 8
s:      mov ax, cs:[bx]
        add bx, 2
        loop s

        mov ax, 4c00H
        int 21H
codeseg ends

end start