.section .data
output:
    .asciz "this is printf output:%d\n"
text:
    .ascii "hello asm!"
.section .bss
    .lcomm buffer, 4 
.section .text
.globl _start
_start:
    movl $buffer, %edi
    #movs $text, %edi
    push $buffer
    push $output
    call printf
    addl $8, %esp
    push $0
    call exit