
.data
message1:  .asciiz "Ingrese el primer numero: "
message2: .asciiz "Ingrese el segundo numero: "
message3:  .asciiz	 "Ingrese el tercer numero: "
result: .asciiz "El número menor es:"

.text 
.globl main		
main:

li $v0 4		# carga $v0 a 4: mostrar una cadena de caracteres.
la $a0 message1		# carga cadena message1 en $a0 para imprimir la variable
syscall  			# se hace la llamada al sistema para ejecutar la instrucción

li $v0 5		# carga $v0 a 5: permite leer un entero
syscall			# llamada al sistema
move $t0 $v0		# mueve al registro $t0 el valor leido en $t0

li $v0 4		# carga $v0 a 4: permite mostrar una cadena
la $a0 message2		# carga cadena number2 en $a0
syscall

li $v0 5
syscall
move $t1 $v0

li $v0 4		# carga $v0 a 4: permite mostrar una cadena
la $a0 message3		# carga cadena number3 en $a0
syscall

li $v0 5
syscall
move $t2 $v0

li $v0,4
la $a0, result


sle $t3 $t0 $t1		# compara if($t0 <= $t1)
syscall
beq $t3 $zero elseB	# compara if($t3 <= 0)
sle $t3 $t0 $t2
beq $t3 $zero elseB
move $a0 $t0
j print			# hace un salto al label print

elseB:
slt $t3 $t1 $t0		# compara if($t1 < $t0)
beq $t3 $zero elseC
sle $t3 $t1 $t2
beq $t3 $zero elseC
move $a0 $t1
j print

elseC:
move $a0 $t2
j print

print:
li $v0 1		# carga $v0 a 1: permite mostrar un entero
syscall
li $v0 10	
syscall			# salida
