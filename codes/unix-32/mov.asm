.section .data
value:
    .int 1,2,3,4,5,6,7
value2:
    .int 21
.section .bss
.section .text
.globl _start
_start:
    nop
    movl $3, %edi
    movl value(,%edi,4), %eax
    movl $value, %ebx
    movl %ebx, (%eax)

    movl $1, %eax
    movl $0, %ebx
    int $0x80