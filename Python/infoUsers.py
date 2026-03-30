import os
import pwd
import shutil

if os.geteuid() != 0:
    print("Este script debe ser ejecutado como root.")
    exit(1)

while opcion != "4":
    print("1. Mostrar información del SSOO y CPU")
    print("2. Buscar o crear usuario")
    print("3. Comprobar o crear directorio")
    print("4. Salir")
    opcion = input("Selecciona una opción: ")

    if opcion == "1":
        print(os.uname().sysname)
        print(cpu.get_cpu_info()["brand_raw"])
        print()

    elif opcion == "2":
        username = input("Introduce el nombre del usuario: ")
        usuarios = [u.pw_name for u in pwd.getpwall()]
        if username in usuarios:
            user_info = pwd.getpwnam(username)
            print(f"Usuario encontrado: {username}")
            print(f"UID: {user_info.pw_uid}")
            print(f"GID: {user_info.pw_gid}")
            print(f"Home: {user_info.pw_dir}")
            print(f"Shell: {user_info.pw_shell}")
        else:
            print(f"El usuario '{username}' no existe.")
            crear = input("¿Deseas crearlo? (s/n): ").lower()
            if crear == "s":
                resultado = os.system(f"useradd {username}")
                if resultado == 0:
                    print(f"Usuario '{username}' creado correctamente.")
                else:
                    print("Error al crear el usuario.")

    elif opcion == "3":
        ruta = input("Introduce la ruta del directorio: ")
        if os.path.exists(ruta):
            if os.path.isdir(ruta):
                print("El directorio ya existe.")
            else:
                print("Existe una ruta con ese nombre, pero no es un directorio.")
        else:
            os.makedirs(ruta)
            print(f"Directorio '{ruta}' creado correctamente.")

    elif opcion == "4":
        print("Saliendo del programa...")
    else:
        print("Opción no válida.")
