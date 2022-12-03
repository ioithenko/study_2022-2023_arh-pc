%include 'in_out.asm'
SECTION .data
    msgA:	DB 'Введите A: ',0
    msgX:       DB 'Введите X: ',0
    msg: DB 'Результат: ',0

SECTION .bss
    A resb  80
    X resb  80
    result resb 80

SECTION .text
    GLOBAL _start

_start:
    mov eax,msgA
    call sprint
    mov ecx,A
    mov edx,80
    call sread
    mov eax,A
    call atoi 
    mov [A],eax

    mov eax,msgX
    call sprint
    mov ecx,X
    mov edx,80
    call sread
    mov eax,X
    call atoi
    mov [X],eax

    mov ebx, [X]
    cmp ebx, 2
    jg first
    jmp second
    mov eax,msg
    call sprint

first:
    mov eax,[X]
    add eax,-2
    call iprintLF 
    call quit
second:
    mov eax, [A]
    mov ebx, 3
    mul eax
    call iprintLF 
    call quit