;--------------------------------
; Программа вычисления выражения
;--------------------------------
%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Введите значение х: ',0
rem: DB 'Результат: ',0
div: DB 'f(x)=5*(x+18)-28',0
SECTION .bss
x: RESB 80 ; задание переменной
SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения
mov eax,div ; вызов подпрограммы печати
call sprintLF
mov eax, msg
call sprint
mov ecx,x
mov edx, 80
call sread
mov eax, x
call atoi
add eax, 18 ; eax = x + 18
mov ebx,5
mul ebx ; eax = 5*(x + 18)
add eax,-28 ; eax = 5*(x + 18) - 28
mov edi,eax ; запись результата вычисления в 'edi'
; ---- Вывод результата на экран
mov eax,rem ; вызов подпрограммы печати
call sprint 
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edi' в виде символов
call quit ; вызов подпрограммы завершения