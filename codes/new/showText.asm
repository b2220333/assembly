;使用BIOS中断服务显示文字
assume cs:codeseg, ds:dataseg

dataseg segment
    db "hello world, hello text", '$'
dataseg ends

codeseg segment
start:  mov ax, dataseg
        mov ds, ax
        mov ah, 02H ;设置光标位置
        mov bh, 0   ;设置页码
        mov dh, 5   ;设置行
        mov dl, 5   ;设置列
        int 10H     ;设置光标

        mov dx, 0   ;设置字符串开头偏移量
        mov ah, 9
        int 21H

        mov ax, 4c00H
        int 21H
codeseg ends

end start