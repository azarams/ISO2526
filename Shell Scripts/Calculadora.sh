#!/bin/bash
# Script Entregable2. Calculadora.sh
# Autor: Azara Martín Sánchez
# Fecha: 04-02-2026

clear

echo "Autor: Azara Martín Sánchez"

fichero=$1
operaciones=$2


#Control de comprobación de parámetros
if [ $# -ne 2 ]; then

	echo "Error, el número de parámetros es incorrecto"
	exit
fi
#Control de comprobación de si el fichero existe
if [ -f $1 ]; then

	echo "El fichero ya existe"
	exit
fi

read -p "Operación Op1 Op2" Op op1 op2

num=0

while [$num -lt $2 ]; do

	echo "------------------"
	echo "Elige S para hacer una suma"
	echo "Elige R para hacer una resta"
	echo "Elige M para hacer una multiplicación"
	echo "Elige D para hacer una división"
	echo "Elige X para salir"
	echo "------------------"

	case $Op in

		"S")

			resul=$((op1+op2))
		;;

		"R")

			resul=$((op1-op2)
		;;

		"M")

			resul=$((op1*op2))
		;;

		"D")

			resul=$((op1/op2))
		;;

		"X")

			echo "Estás saliendo...."
			break
		;;

		*)

			echo "Error opción no válida"
		;;

	esac

		echo "El resultado es: $resul"
		echo "$Op $op1 $op2" >> $1

done

echo "La ruta del fichero es: $(pwd)/$1*"
cat $1
