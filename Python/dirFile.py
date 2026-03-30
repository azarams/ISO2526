import os
import shutil

archivos = []
directorios = []

if os.path.exists("rutas.txt"):
    f = open("rutas.txt", "r")
    for linea in f:
        ruta = linea.strip()
        if os.path.isfile(ruta):
            archivos.append(ruta)
        elif os.path.isdir(ruta):
            directorios.append(ruta)
    f.close()
else:
    print("El archivo rutas.txt no existe.")
    exit(1)

while opcion != "E":
    print("A. Eliminar archivo")
    print("B. Mostrar información de directorio")
    print("C. Copiar archivo")
    print("D. Mostrar lista de archivos/directorios")
    print("E. Salir")
    opcion = input("Selecciona una opción: ")

    if opcion == "A":
        archivo = input("Introduce el nombre del archivo a eliminar: ")
        if os.path.isfile(archivo):
            os.remove(archivo)
            print(f"Archivo '{archivo}' eliminado.")
        else:
            print("El archivo no existe o no es válido.")

    elif opcion == "B":
        directorio = input("Introduce el nombre del directorio: ")
        if os.path.isdir(directorio):
            print("Información del directorio")
            print(f"Ruta absoluta: {os.path.abspath(directorio)}")
            print(f"Contenido: {os.listdir(directorio)}")
            tamanio = 0
            for f in os.listdir(directorio):
                ruta = os.path.join(directorio, f)
                if os.path.isfile(ruta):
                    tamanio += os.path.getsize(ruta)
            print(f"Tamaño total (bytes): {tamanio}")
        else:
            print("El directorio no existe.")

    elif opcion == "C":
        origen = input("Introduce el nombre del archivo a copiar: ")
        destino = input("Introduce el destino: ")
        if os.path.isfile(origen):
            shutil.copy(origen, destino)
            print(f"Archivo copiado a {destino}.")
        else:
            print("El archivo no existe.")

    elif opcion == "D":
        lista = input("¿Qué lista deseas mostrar? (A)rchivos / (D)irectorios: ").lower()
        if lista == "a":
            print("Lista de archivos ")
            for archivo in archivos:
                print(archivo)
        elif lista == "d":
            print("Lista de directorios ")
            for directorio in directorios:
                print(directorio)
        else:
            print("Opción inválida.")

    elif opcion == "E":
        print("Saliendo del programa...")
    else:
        print("Opción no válida.")
