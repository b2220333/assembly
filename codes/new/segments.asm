assume cs:codeseg,ds:dataseg,ss:stackseg

dataseg segment
    db 'hello'
    db 'world'
dataseg ends

stackseg segment
    db 0,0,0,0,0,0,0,0,0,0
stackseg ends

codeseg segment
start:  mov ax, dataseg
        mov ds, ax
        mov ax, stackseg
        mov ss, ax
        mov bx, 0
        mov cx, 5
        ;你不能mov ip, 0；但是你可以mov sp, 0
        mov sp, 10
        mov di, 10 

        ;将段里面的数据放到栈里面去
      ;push [bx]  ;直接将data放入stack中
s:      mov al, [bx]
        mov dl, [bx+di-1]
        mov [bx+di-1], al
        mov [bx], dl
        inc bx
        dec di
        ;你不能pop或者push单个字节（只能对字进行操作），25，27行虽然可以通过编译，但是最后内存中的代码并没有这两行
        ;pop al
        ;add bx, 1 
        ;push al
        loop s

        mov ax, 4c00H
        int 21H
codeseg ends

end start