#!/bin/bash
# Script Entregable1.Agenda.sh
# Autor: Azara Martín Sánchez
# Fecha:29-01-2026

clear


while true; do

	echo "---------------------------------------------"
	echo "a) Añadir una entrada"
	echo "b) Buscar por ahí"
	echo "c) Ver la agenda completa"
	echo "d) Eliminar todas las entradas de la agenda"
	echo "e) Finalizar"
	echo "---------------------------------------------"

	read -p "Elige una opción " opt


	case $opt in

		a)

			read -p "Introduce el DNI: " dni

			obtenido=$(grep "^$dni:" agenda.txt)

			if [ $obtenido != " " ]; then

				echo "El DNI introducido ya existe en la genda"
			else

				read -p "Introduce el nombre " nom
				read -p "Introduce los apellidos " apell
				read -p "Introduce la localidad " locali

				echo "$dni:$nom:$apell:$locali" >> agenda.txt
				echo "Persona añadida a la genda correctamente"
			fi
		;;

		b)

			read -p "Introduce el DNI que quieres buscar: " dni

			obtenido=$(grep "^$dni:" agenda.txt)

			if [ $obtenido != " " ]; then

				echo "No exsite ninguna persona con ese DNI"
			else

				nom=$(echo $obtenido | cut -d : -f 2)
				apell=$(echo $obtenido | cut -d : -f 3)
				locali=$(echo $obtenido | cut -d : -f 4)

				echo "La persona con el DNI $dni es: $nom $apell, y vive en $locali"
			fi

		;;

		c)

			if [ ! -s agenda.txt ]; then

				echo "La agenda está vacía"
			else

				cat agenda.txt
			fi

		;;

		d)

			>agenda.txt

				echo "Se han eliminado todas las entradas de la agenda"

		;;

		e)

			echo "Estás saliendo...."
			break

		;;

		*)

			echo "Error opción no válida"

		;;

	esac
done
