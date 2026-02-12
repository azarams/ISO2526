#!/bin/bash
#Script Entregable4. Users.sh
# Autor: Azara Martín Sánchez
# Fecha: 12-02-2026

clear

#Comprobamos que sea ejecutado por Root

if [ $USER != "root" ]; then

	echo "Error, no eres root"
	exit
fi

#Comprobamos que el usuario pasa número, si no lo hace usamos el 1000 como base

if [ -z $1 ]; then

	base=1000
else

	base=$1
fi

fecha=$(date +%d-%m-%Y)
hora=$(date +%H:%M)

echo "=============================================="

echo "Informe de usuarios el día $fecha a las $hora"

contador=0

while  IFS=: read usuario x uid resto; do

	if [ $uid -gt $base ]; then

		echo "$usuario - $uid"
		contador=$((contador+1))
	fi

done < /etc/passwd

echo "Total: $contador usuarios"

echo "=============================================="

#Guardamos el registro en el archivo /tmp/logeventos

echo "$fecha - $hora - El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
