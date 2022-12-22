#!/bin/bash

PIEDRA=1
PAPEL=2
TIJERA=3

USUARIO=0
MAQUINA=0


eleccion_usuario(){
	echo "Elige entre las siguiente opciones:"
	echo -e "\t1. Piedra"
	echo -e "\t2. Papel"
	echo -e "\t3. Tijera"
	read -p "Introduce tu eleccion (0 para salir): " -n 1 eleccion
	echo ""

	if [[ ${eleccion} -eq 0 ]];then
		echo -e "\nEspero que te haya gustado"
		echo "PUNTUACIONES:"
		echo -e "\tMaquina: $MAQUINA"
		echo -e "\tUsuario: $USUARIO"
		if [[ $MAQUINA -gt $USUARIO ]];then
			echo "Lo siento, has perdido"
		elif [[ $MAQUINA -eq $USUARIO ]];then
			echo "EMPATE!"
			echo ""
			read -p "Quieres echar una partida de desempate?[y/n]: " -n 1 seguir
			if [[ $seguir == "y" ]];then
				echo -e "\n¡Vamos allá!\n"
				eleccion_usuario
			fi
		else
			echo "¡¡Enhorabuena!! ¡Has ganado!!"
		fi
		echo -e "\nHasta luego!!"
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
	#eleccion_maquina=$(( $eleccion_maquina++ ))
	((eleccion_maquina++))
	#echo -e "\nLa maquina elige: " $eleccion_maquina
	case $eleccion_maquina in
		$PIEDRA)
			echo -e "\nLa maquina elige Piedra"	
			case $eleccion in
				$PIEDRA) 
					echo "El usuario ha elegido Piedra"	
					echo "Empate, ambos habéis elegido piedra"
					;;
				$PAPEL)	echo "El usuario ha elegido Papel"
					echo "Has ganado, papel envuelve a piedra"
					USUARIO=$(($USUARIO + 1))
					;;
				$TIJERA)
					echo "El usuario ha elegido Tijera"
					echo "Has perdido, la piedra machaca las tijeras"
					MAQUINA=$(($MAQUINA+ 1))
					;;
			esac
			;;
		$PAPEL)
			echo -e "\nLa maquina elige Papel"	
			case $eleccion in
				$PIEDRA)
					echo "El usuario ha elegido Piedra"	
					echo "Has perdido, papel envuelve a piedra"
					MAQUINA=$(($MAQUINA+ 1))
					;;
				$PAPEL)	echo "El usuario ha elegido Papel"
					echo "Empate, ambos habéis elegido papel"
					;;
				$TIJERA)
					echo "El usuario ha elegido Tijera"
					echo "Has ganado, las tijeras cortan al papel"
					USUARIO=$(($USUARIO + 1))
					;;
			esac
			;;
		$TIJERA)
			echo -e "\nLa maquina elige Tijera"	
			case $eleccion in
				$PIEDRA)
					echo "El usuario ha elegido Piedra"	
					echo "Has ganado, la piedra machaca las tijeras"
					USUARIO=$(($USUARIO + 1))
					;;
				$PAPEL)	echo "El usuario ha elegido Papel"
					echo "Has perdido, las tijeras cortan al papel"
					MAQUINA=$(($MAQUINA+ 1))
					;;
				$TIJERA)
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
