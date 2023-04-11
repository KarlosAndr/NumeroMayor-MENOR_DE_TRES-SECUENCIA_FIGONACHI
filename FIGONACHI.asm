# Definir las primeras dos entradas de la secuencia
li $t0, 0  # primer número
li $t1, 1  # segundo número

# Imprimir los primeros dos números de la secuencia
li $v0, 1 # código de syscall para imprimir un entero
move $a0, $t0 # pasar el primer número a la syscall
syscall
move $a0, $t1 # pasar el segundo número a la syscall
syscall

# Calcula r y mostrar los siguientes números en la secuencia
li $t2, 10 # número de elementos a imprimir
li $t3, 2   # contador de elementos
loop:
add $t4, $t0, $t1# sumar los dos números anteriores
move $t0, $t1 # mover el segundo número al primer número
move $t1, $t4 # mover el resultado de la suma al segundo número
li $v0, 1 # código de syscall para imprimir un entero
move $a0, $t4  # pasar el número actual a la syscall
syscall
addi $t3, $t3, 1# incrementar el contador de elementos
blt $t3, $t2, loop# volver al bucle mientras no se hayan impreso todos los elementos
