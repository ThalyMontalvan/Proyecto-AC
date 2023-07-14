org 100h

include 'emu8086.inc'
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

jmp inicio

texto db 13,10,13,10, 'CALCULADORA ASSEMBLER'

db 13,10,13,10, ' ELIJA UNA OPCION => [1] SUMA => [2] RESTA => [3] MULTIPLICACION => [4] DIVISION'
ingreso db 13,10,13,10, 'Ingrese una de las opciones: $'
opcion_s db 13,10,13,10, ' El programa ha finalizado $'
opcion_1 db 13,10,13,10, ' Opciones invalidas$'
texto1 db 13,10,13,13, 'Ingrese el primer numero: $'
texto2 db 13,10,13,10, 'Ingrese el segundo numero: $'
texto3 db 13,10,13,10, 'la suma es: $'
texto4 db 13,10,13,10, 'la resta es: $'
texto5 db 13,10,13,10, 'la multiplicacion es es: $'
texto6 db 13,10,13,10, 'la division es: $'

num1 dw ?
num2 dw ?
numero dw ?
inicio:

	mov ah, 09
	lea dx, texto
	int 21h

	call SCAN_NUM
	lea dx, ingreso
	mov numero, cx

	cmp numero, 01h
	je suma
	cmp numero, 02h
	je resta
	cmp numero, 03h
	je multiplicacion
	cmp numero, 04h
	je division
	cmp numero, 05h
	je salir
	cmp numero, 05h
	jnz invalido

invalido:
	mov ah, 09h
	lea dx, opcion_1
	int 21h
	jmp inicio
suma:

	mov ah, 09
	lea dx, texto1
	int 21h

	call SCAN_NUM
	mov num1, cx

	mov ah, 09
	lea dx, texto2
	int 21h
	
	call SCAN_NUM
	mov num2, cx

	mov ah, 09
	lea dx, texto3
	int 21h
	
	mov ax, num1
	add ax, num2
	call PRINT_NUM
	jmp inicio

resta:

	mov ah, 09
	lea dx, texto1
	int 21h

	call SCAN_NUM
	mov num1, cx

	mov ah, 09
	lea dx, texto2
	int 21h
	
	call SCAN_NUM
	mov num2, cx

	mov ah, 09
	lea dx, texto4
	int 21h
	mov ax, num1
	sub ax, num2
	call PRINT_NUM
	jmp inicio

multiplicacion:
	mov ah, 09
	lea dx, texto1
	int 21h
	
	call SCAN_NUM
	mov num1, cx

	mov ah, 09
	lea dx, texto2
	int 21h

	call SCAN_NUM
	mov num2, cx

	mov ah, 09
	lea dx, texto5
	int 21h
	mov ax, num1
	mov bx, num2
	mul bx
	call PRINT_NUM
	jmp inicio

division:
	mov ah, 09
	lea dx, texto1
	int 21h

	call SCAN_NUM
	mov num1, cx

	mov ah, 09
	lea dx, texto2
	int 21h
	
	call SCAN_NUM
	mov num2, cx

	mov ah, 09
	lea dx, texto6
	int 21h
	xor dx, dx
	mov ax, num1
	mov bx, num2
	div bx
	call PRINT_NUM
	jmp inicio

salir:
	mov ah, 09
	lea dx, opcion_s
	int 21h
	end
ret

mov ax,  4c00h
int 21h

ends

end start
