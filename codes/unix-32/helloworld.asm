.section .data
text:
    .ascii "hello world!\n"
.section .text
.globl _start
_start:
    #调用中断服务直接输出
    movl $4, %eax
    movl $1, %ebx
    movl $text, %ecx
    movl $13, %edx
    int $0x80

    movl $1, %eax
    movl $0, %ebx
    int $0x80