EXES=helloworld cpuid use_printf mov
DEBUG=-gstabs

helloworld:helloworld.o
	ld -o helloworld helloworld.o
helloworld.o:helloworld.asm
	as ${-gstabs} -o helloworld.o helloworld.asm
cpuid:cpuid.o
	ld -o cpuid cpuid.o
cpuid.o:cpuid.asm
	as ${-gstabs} -o cpuid.o cpuid.asm
#这里想要使用C库的话必须在as前面加上--32，在ld后面加上-m elf_i386，因为这个汇编语言是32位的，但是库是64位的，所以要转换格式
use_printf:use_printf.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o use_printf -lc use_printf.o
use_printf.o:use_printf.asm
	as ${-gstabs} --32 -o use_printf.o use_printf.asm
mov:mov.o
	ld -m elf_i386 -o mov mov.o
mov.o:mov.asm
	as ${-gstabs} --32 -o mov.o mov.asm
.PHONY:clean all
all:${EXES}
clean:
	-rm *.o ${EXES}