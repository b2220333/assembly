assume cs:codeseg

codeseg segment
start:  int 0

        mov ax, 4c00H
        int 21H
codeseg ends

end start