#!/bin/bash


valores=( piedra papel tijera )

declare -A REGLAS
REGLAS=([piedra]=tijera 
        [tijera]=papel
	[papel]=piedra	
	)

USUARIO=0
MAQUINA=0


eleccion_usuario(){
	echo "Elige entre las siguiente opciones:"
	echo -e "\t1. Piedra"
	echo -e "\t2. Papel"
	echo -e "\t3. Tijera"
	read -p "Introduce tu eleccion (0 para salir): " -n 1 eleccionUser
	echo ""

	if [[ ${eleccionUser} -eq 0 ]];then
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
	elif [[ ${eleccionUser} -gt 3 ]];then
		echo -e "\nERROR EN DATO INTRODUCIDO"
		echo "Debes hacer una eleccion entre 1 y 3..."
		echo ""
		eleccion_usuario
	
	fi	
	ganador
}


ganador(){
	eleccion_maquina=$(($RANDOM%3))
	((eleccionUser--))
	echo "Maquina: ${valores[$eleccion_maquina]}"
	echo "Usuario: ${valores[$eleccionUser]}"
	#set -x
	if [[ $eleccion_maquina -eq $eleccionUser ]];then
		echo "Habéis elegido lo mismo..EMPATE!"
		eleccion_usuario
	else
		if [[ ${REGLAS[${valores[$eleccionUser]}]} == ${valores[$eleccion_maquina]} ]];then
			echo "Enhorabuena, has ganado!!"
			USUARIO=$(($USUARIO + 1))
		else
			echo "Que pena, has perdido.."
			MAQUINA=$(($MAQUINA+ 1))
		fi	
	fi
	echo ""
	echo "Otra partida!"
	eleccion_usuario
	#set +x
}


eleccion_usuario
