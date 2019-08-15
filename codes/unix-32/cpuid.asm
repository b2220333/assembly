.section .data
output:
    .ascii "The processor Vendor is xxxxxxxxxxxx\n"
.section .text
.globl _start
_start:
    #首先调用cpuid指令获得cpu信息
    movl $0, %eax
    cpuid

    #将信息放入字符串output中
    movl $output, %edi
    movl %ebx, 24(%edi)
    movl %edx, 28(%edi)
    movl %ecx, 32(%edi) 

    #调用终端服务输出字符串
    movl $4, %eax
    movl $1, %ebx
    movl $output, %ecx  #字符串开头放在exc中
    movl $37, %edx  #字符串长度放在edx中
    int $0x80

    #程序返回
    movl $1, %eax
    movl $0, %ebx
    int $0x80