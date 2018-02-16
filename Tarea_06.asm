.data
.text

addi $t0, $zero,10 # declarar n


Fibonnaci:
	bgt $t0,1,if		#si es mayor a 1 saltar a if
	add $v0,$t0,$zero	#se guarda en v0 lo que hay en t0 cuando llego a 1
	jr $ra

	if:
		addi $sp,$sp,-12	#restar en el stack la memoria que se usa
		sw $ra,0($sp)		#guardar eñ registro de ra
		sw $t0,4($sp)		#guardar el registro de n o t0
		
		addi $t0,$t0,-1		#para el primer sumando se le resta 1 a t0
		jal Fibonnaci		#regresar a la funcion para validar que siga siendo mayor a 1
		lw $t0, 4($sp)		#cargar lo que hay en t0
		sw $v0, 8($sp)		#guardar lo que hay en v0
		
		addi $t0,$t0,-2		#para el primer sumando se le resta 2 a t0
		jal Fibonnaci		#regresar a la funcion para validar que sea mayor a 1
		
		lw $t0, 8($sp)		#guardar lo que hay en t0
		add $v0,$t0,$v0		#se agrega lo que habia en la parte anterior cuando se le restaba 1 a t0, con lo que se le resta 2 a t0
		
		lw $ra,0($sp)		#cargar el registro ra
		addi $sp,$sp,12		#sumar en el stack la memoria que se usa
		jr $ra			
end:		
		
		
		
		
