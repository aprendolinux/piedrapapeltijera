#!/bin/bash

PIEDRA=1
PAPEL=2
TIJERA=3

eleccion_usuario(){
	echo "Elige entre las siguiente opciones:"
	echo "1. Piedra"
	echo "2. Papel"
	echo "3. Tijera"
	read -p "Introduce tu eleccion: " eleccion
	comprobacion_ganador
}

comprobacion_ganador(){
	eleccion_maquina=$RANDOM%3
	eleccion_maquina=$(( $eleccion_maquina + 1 ))
	echo "La maquina elige: " $eleccion_maquina
	case $eleccion_maquina in
		1)
			case $eleccion in
				1)	echo "El usuario ha elegido Piedra"	
					echo "Empate, ambos habéis elegido piedra"
					;;
				2)	echo "El usuario ha elegido Papel"
					echo "Has ganado, papel envuelve a piedra"
					;;
				3)
					echo "El usuario ha elegido Tijera"
					echo "Has perdido, la piedra machaca las tijeras"
					;;
			esac
			;;
		2)
			case $eleccion in
				1)	echo "El usuario ha elegido Piedra"	
					echo "Has perdido, papel envuelve a piedra"
					;;
				2)	echo "El usuario ha elegido Papel"
					echo "Empate, ambos habéis elegido papel"
					;;
				3)
					echo "El usuario ha elegido Tijera"
					echo "Has ganado, las tijeras cortan al papel"
					;;
			esac
			;;
		3)
			case $eleccion in
				1)	echo "El usuario ha elegido Piedra"	
					echo "Has ganado, la piedra machaca las tijeras"
					;;
				2)	echo "El usuario ha elegido Papel"
					echo "Has perdido, las tijeras cortan al papel"
					;;
				3)
					echo "El usuario ha elegido Tijera"
					echo "Empate, ambos habéis elegido tijeras"
					;;
			esac
			;;



	esac
}

eleccion_usuario
