%include 'in_out.asm'
section .data
msg1 db 'Введите a: ',0h
msg2 db 'Введите b: ',0h
msg3 db 'Введите c: ',0h
msg4 db 'Наименьшее число: ',0h
section .bss
a resb 10
b resb 10
c resb 10
min resb 10

section .text
global _start
_start:

mov eax,msg1
call sprint
mov ecx,a
mov edx,10
call sread
mov eax,a
call atoi
mov [a],eax

mov eax,msg2
call sprint
mov ecx,b
mov edx,10
call sread
mov eax,b
call atoi
mov [b],eax

mov eax,msg3
call sprint
mov ecx,c
mov edx,10
call sread
mov eax,c
call atoi
mov [c],eax

mov ecx,[a]
mov [min],ecx
cmp ecx,[b]
jl check_c
mov ecx,[b]
mov [min],ecx

check_c:
cmp ecx,[c]
jl fin
mov ecx,[c]
mov [min],ecx

fin:
mov eax, msg4
call sprint
mov eax,[min]
call iprintLF
call quit

