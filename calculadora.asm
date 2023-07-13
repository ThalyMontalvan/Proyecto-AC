format binary as 'com'

org 100h

section '.data' data readable writeable
    num1 db 0
    resultado db 0

section '.text' code readable executable
inicio:
    ;iniciar modo texto
    mov ah, 9 
    mov dx, bienvenida
    int 21h

    mov ah, 1 
    int 21h
    sub al, '0'
    mov [num1], al
    
    mov ah, 9
    mov dx, operador
    int 21h

    mov ah, 1
    int 21h

    cmp al, '+'
    je suma

    cmp al, '-'
    je resta

    cmp al, '*'
    je multiplicar

    cmp al, '/'
    je dividir

suma:
    mov ah, 9
    mov dx, pedir_segundo_numero
    int 21h

    mov ah,1
    int 21h
    sub al, '0'

    add [num1], al

    jmp calcular

resta:
    mov ah, 9
    mov dx, pedir_segundo_numero
    int 21h

    mov ah,1
    int 21h
    sub al, '0'

    sub [num1], al

    jmp calcular

multiplicar:
    mov ah, 9
    mov dx, pedir_segundo_numero
    int 21h

    mov ah,1
    int 21h
    sub al, '0'

    mul [num1]

    jmp calcular

dividir:
    mov ah, 9
    mov dx, pedir_segundo_numero
    int 21h

    mov ah,1
    int 21h
    sub al, '0'

    div [num1]

    jmp calcular


calcular:
    mov ah, 9
    mov dx, mostrar_resultado
    int 21h

    add [resultado], '0'

    mov ah, 9
    mov dx, resultado
    int 21h

    mov ah, 4ch
    int 21h

section '.data' data readable writeable

bienvenida db 'Bienvenido, inserte un numero:', 13, 10, '$'

operador db 'Inserte un operador aritmetico:', 13, 10, '$'

pedir_segundo_numero db 'Inserte el segundo numero:', 13, 10, '$'

mostrar_resultado db 'El resultado de la Operacion es:', 13, 10, '$'

section '.bss' data readable buffer resb 1

