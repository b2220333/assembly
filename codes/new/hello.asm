assume cs:codeseg

codeseg segment
    mov ax, 00feH
    mov bx, 00eeH
    mov dx, 00deH

    mov ax,4c00H 
    int 21H
codeseg ends

end