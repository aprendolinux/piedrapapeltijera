#!/bin/bash

PIEDRA=1
PAPEL=2
TIJERA=3

eleccion_usuario(){
	echo "Elige entre las siguiente opciones:"
	echo "1. Piedra"
	echo "2. Papel"
	echo "3. Tijera"
	read -p "Introduce tu eleccion (0 para salir): " -n 1 eleccion

	if [[ ${eleccion} -eq 0 ]];then
		echo -e "\nEspero que te haya gustado"
		echo "Hasta luego!!"
		exit 0
	elif [[ ${eleccion} -gt 3 ]];then
		echo -e "\nERROR EN DATO INTRODUCIDO"
		echo "Debes hacer una eleccion entre 1 y 3..."
		echo ""
		eleccion_usuario
	
	fi	
	comprobacion_ganador
}

comprobacion_ganador(){
	eleccion_maquina=$RANDOM%3
	eleccion_maquina=$(( $eleccion_maquina + 1 ))
	#echo -e "\nLa maquina elige: " $eleccion_maquina
	case $eleccion_maquina in
		1)
			echo -e "\nLa maquina elige Piedra"	
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
			echo -e "\nLa maquina elige Papel"	
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
			echo -e "\nLa maquina elige Tijera"	
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
	echo ""
	echo "Otra partida!"
	eleccion_usuario
}

eleccion_usuario
