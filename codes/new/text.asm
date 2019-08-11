;这个程序在屏幕上显示数据段内的字符
assume cs:codeseg, ds:dataseg, ss:stackseg

dataseg segment
    db 'welcome to masm'
    db 'created by VisualGMQ 2019.8.10'
dataseg ends

stackseg segment
    dw 10 dup (0)
stackseg ends

codeseg segment
start:  mov ax, stackseg
        mov ss, ax
        mov sp, 20
        mov ax, 0
        push ax ;将行数写入

        ;配置ds和es
        mov ax , 0b800H
        mov es, ax
        mov ax, dataseg
        mov ds, ax

        ;开始写文字
        mov ax, 0
        push ax
        mov ax, 15
        push ax
        mov ax, 0000000000001010B
        push ax
        call write

        mov ax,15
        push ax
        mov ax, 30
        push ax
        mov ax, 0000000000000001B
        push ax
        call write

        mov ax, 4c00H
        int 21H

        ;@fn 这个函数将数据段里面的文字输出一行（末尾换行）
        ;这个函数的参数放在栈里面
        ;@param
        ;   字符串开始的位置
        ;   字符串的长度 
        ;   这一行字符串的属性信息（放在低字节中）
write:  ;pop ax  ;先把call指令传入的原IP的值拿出来
        ;pop bx  ;取出这一行字符串的属性信息
        ;pop cx  ;取出字符串长度
        ;pop di  ;取出字符串开始位置
        ;pop dx  ;取出目前的行数
        ;inc dx  ;将行数变为下一行
        ;push dx
        ;push ax
        ;dec dx  ;将行数变回来进行计算

        ;利用bp来使用参数
        push bp
        mov bp, sp
        mov bx, [bp+4]
        mov cx, [bp+6]
        mov di, [bp+8]

        mov al, 160
        ;mul dl
        mul byte ptr [bp+10]
        mov si, ax  ;将运算结果放在si中
s:      mov bh, ds:[di]
        mov byte ptr es:[si], bh
        mov byte ptr es:[si+1], bl
        inc di
        add si, 2
        loop s
        mov dx, [bp+10]
        inc dx
        mov [bp+10], dx
        pop bp
        ret 6
codeseg ends

end start