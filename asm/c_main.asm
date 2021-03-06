; Because we have a reference to 'main'
; we can compile with nasm to create the
; .o object file, and then compile that with
; gcc. Example
; nasm -f elf64 c_main.asm 
; gcc c_main.o
; ./a.out

SECTION .DATA
	hello:     db 'Hello world!',10
	helloLen:  equ $-hello

SECTION .TEXT
	GLOBAL main

main:
	mov eax,4            ; 'write' system call = 4
	mov ebx,2            ; file descriptor 1 = STDOUT
	mov ecx,hello        ; string to write
	mov edx,helloLen     ; length of string to write
	int 80h              ; call the kernel

	; Terminate program
	mov eax,1            ; 'exit' system call
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel
