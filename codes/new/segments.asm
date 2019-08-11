;这个程序将数据段里面的helloworld左右颠倒
assume cs:codeseg,ds:dataseg

dataseg segment
    db 'hello'
    db 'world'
dataseg ends

codeseg segment
start:  mov ax, dataseg
        mov ds, ax
        mov bx, 0
        mov cx, 5
        ;你不能mov ip, 0；但是你可以mov sp, 0
        mov sp, 10
        mov di, 10 

s:      mov al, [bx]
        mov dl, [di-1]
        mov [di-1], al
        mov [bx], dl
        inc bx
        dec di
        loop s

;        mov byte ptr [bx], [di-1] ;没有这种操作

        ;你不能pop或者push单个字节（只能对字进行操作），25，27行虽然可以通过编译，但是最后内存中的代码并没有这两行
        ;pop al
        ;add bx, 1 
        ;push al

        mov ax, 4c00H
        int 21H
codeseg ends

end start