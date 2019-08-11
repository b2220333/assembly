assume cs:codeseg 

codeseg segment
        ;中断安装
start:  mov ax, cs
        mov ds, ax

        mov cx, offset do0End - offset do0
        mov si, offset do0
        mov ax, 0
        mov es, ax
        mov di, 200H
        cld
        rep movsb   ;安装

        ;将地址放入中断向量表中
        mov ax, 0
        mov es, ax
        mov word ptr es:[0], 200H
        mov word ptr es:[2], 0

        mov ax, 4c00H
        int 21H

;中断程序
do0:    jmp short do0Start  ;这条指令占两个字节
        db "overflow!"

do0Start:   mov ax, cs
            mov ds, ax
            mov di, 202H    ;0中断在200H处，jmp指令2字节，所以字符串是在202H处
            mov ax, 0b800H
            mov es, ax
            mov si, 0
            mov cx, 9
        s:  mov al, [di]
            mov byte ptr es:[si], al
            mov byte ptr es:[si+1], 00000100B
            add si, 2
            inc di
            loop s
            ;iret   ;这里不实用iret而是直接mov ax,4c00H int 21H是因为发生除零错误的话应该直接终止程序，所以没有返回程序
            mov ax, 4c00H
            int 21H
do0End: nop
codeseg ends

end start