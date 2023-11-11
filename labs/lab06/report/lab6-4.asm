%include 'in_out.asm'
SECTION .data
msg: DB 'Введите значение x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`
mov  ebx,8 ; EBX=8
mul ebx;EAX=EAX*EBX=x*8
add eax,-6 ; eax=eax-6=x*8-6
xor edx,edx ; обнуляем EDX для корректной работы div
mov ebx,2 ; EBX=2
div ebx ; EAX=EAX/2, EDX=остаток от деления
mov edi,eax

mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edi' в виде символов

call quit ; вызов подпрограммы завершения
