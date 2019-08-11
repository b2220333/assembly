;这个程序测试汇编在计算加法的时候会不会将最高位视为符号位
;结果是并不会。。。
assume cs:codeseg

codeseg segment
start:  
        mov ax, 1000000000000010B
        mov bx, 0000000000001101B
        add ax, bx
        mov ax, 4c00H
        int 21H
codeseg ends

end start