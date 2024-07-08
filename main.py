import mysql.connector
from mysql.connector import Error
import json
import tkinter as tk
from tkinter import filedialog

def cargar_configuracion(ruta_archivo):
    with open(ruta_archivo, 'r') as archivo:
        return json.load(archivo)

ruta_archivo = r'C:\Users\RUBEN\OneDrive - ULEAM\NIVELACIÓN (CUARTO-QUINTO)\Gestion de Base de Datos\CodigoGestionBD\Seguridad\config.json'

configuracion = cargar_configuracion(ruta_archivo)

DB_HOST = configuracion['DB_HOST']
DB_PORT = configuracion['DB_PORT']
DB_USER = configuracion['DB_USER']
DB_PASSWORD = configuracion['DB_PASSWORD']

def conectar_base_datos():
    try:
        connection = mysql.connector.connect(
            host=DB_HOST,
            port=DB_PORT,
            user=DB_USER,
            password=DB_PASSWORD
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(f'Error conectando a la base de datos: {e}')
        return None

def mostrar_bases_datos(connection):
    try:
        cursor = connection.cursor()
        cursor.execute("SHOW DATABASES")
        bases_datos = cursor.fetchall()
        print("Bases de datos disponibles:")
        for bd in bases_datos:
            print(bd[0])
    except Error as e:
        print(f"Error al mostrar las bases de datos: {e}")

def listar_entidades_atributos(connection, nombre_base_datos):
    try:
        cursor = connection.cursor()
        cursor.execute(f"USE {nombre_base_datos}")

        # Listar las tablas de la base de datos
        cursor.execute("SHOW TABLES")
        tablas = cursor.fetchall()
        
        if tablas:
            print(f"\nTablas en la base de datos '{nombre_base_datos}':")
            for tabla in tablas:
                nombre_tabla = tabla[0]
                print(f"- {nombre_tabla}")
                
                # Obtener información de esquema de la tabla
                cursor.execute(f"DESCRIBE {nombre_tabla}")
                atributos = cursor.fetchall()
                
                for atributo in atributos:
                    print(f"  - {atributo[0]} ({atributo[1]})")  # Nombre del atributo y tipo de dato
        else:
            print(f"\nNo se encontraron tablas en la base de datos '{nombre_base_datos}'.")
    except Error as e:
        print(f"Error al listar atributos de la base de datos: {e}")

def crear_tabla_auditoria(connection, nombre_base_datos):
    try:
        cursor = connection.cursor()
        cursor.execute(f"USE {nombre_base_datos}")
        create_table_query = """
        CREATE TABLE IF NOT EXISTS Auditoria (
            ID INT AUTO_INCREMENT PRIMARY KEY,
            NombreTabla VARCHAR(255),
            FechaHora DATETIME,
            UsuarioActual VARCHAR(255),
            DetalleAccion TEXT
        );
        """
        cursor.execute(create_table_query)
        connection.commit()
        print("Tabla de auditoría creada exitosamente.")
    except Error as e:
        print(f"Error al crear la tabla de auditoría: {e}")

def generar_disparadores(connection, table_columns, nombre_base_datos):
    actions = ['INSERT', 'UPDATE', 'DELETE']
    triggers = []

    for table_name in table_columns.keys():
        # Evitar crear triggers para la tabla de auditoría
        if table_name.lower() == 'auditoria':
            continue

        for action in actions:
            trigger_name = f"{table_name}_{action.lower()}_audit"
            detail = "Datos insertados" if action == "INSERT" else "Datos actualizados" if action == "UPDATE" else "Datos eliminados"
            
            if action == "INSERT":
                trigger_query = f"""
                CREATE TRIGGER {trigger_name}
                AFTER {action} ON {table_name}
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('{table_name}', NOW(), USER(), '{detail}');
                END;
                """
            elif action == "UPDATE":
                trigger_query = f"""
                CREATE TRIGGER {trigger_name}
                AFTER {action} ON {table_name}
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('{table_name}', NOW(), USER(), '{detail}');
                END;
                """
            elif action == "DELETE":
                trigger_query = f"""
                CREATE TRIGGER {trigger_name}
                AFTER {action} ON {table_name}
                FOR EACH ROW
                BEGIN
                    INSERT INTO Auditoria (NombreTabla, FechaHora, UsuarioActual, DetalleAccion)
                    VALUES ('{table_name}', NOW(), USER(), '{detail}');
                END;
                """
            
            triggers.append((trigger_name, trigger_query))
    
    return triggers

def guardar_disparadores_en_archivos(triggers):
    root = tk.Tk()
    root.withdraw()
    carpeta_destino = filedialog.askdirectory(title="Seleccione la carpeta donde desea guardar los archivos SQL")

    if not carpeta_destino:
        print("No se seleccionó ninguna carpeta. Operación cancelada.")
        return

    try:
        for trigger_name, trigger_query in triggers:
            with open(f"{carpeta_destino}/{trigger_name}.sql", "w") as file:
                file.write(trigger_query)
        print("Disparadores guardados en archivos SQL exitosamente.")
    except Exception as e:
        print(f"Error al guardar los disparadores en archivos SQL: {e}")

def ejecutar_disparadores(connection, triggers):
    try:
        cursor = connection.cursor()
        for trigger_name, trigger_query in triggers:
            cursor.execute(trigger_query)
        connection.commit()
        print("Disparadores ejecutados exitosamente en la base de datos.")
    except Error as e:
        print(f"Error al ejecutar los disparadores en la base de datos: {e}")

def ejecutar_tareas():
    connection = conectar_base_datos()
    if connection:
        mostrar_bases_datos(connection)
        nombre_base_datos = input("Ingrese el nombre de la base de datos que desea consultar: ")
        
        cursor = connection.cursor()
        cursor.execute("SHOW DATABASES LIKE %s", (nombre_base_datos,))
        if cursor.fetchone():
            listar_entidades_atributos(connection, nombre_base_datos)
            
            table_columns = listar_entidades(connection)
            triggers = generar_disparadores(connection, table_columns, nombre_base_datos)
            guardar_disparadores_en_archivos(triggers)
            ejecutar_disparadores(connection, triggers)
            crear_tabla_auditoria(connection, nombre_base_datos)  # Crear tabla auditoría después de ejecutar los triggers

            connection.close()
            print("Todas las tareas se han completado exitosamente.")
        else:
            print(f"La base de datos '{nombre_base_datos}' no existe.")
    else:
        print("No se pudo establecer la conexión a la base de datos.")

def listar_entidades(connection):
    cursor = connection.cursor()
    cursor.execute("SHOW TABLES")
    tables = cursor.fetchall()
    table_columns = {}

    for table in tables:
        table_name = table[0]
        cursor.execute(f"SHOW COLUMNS FROM {table_name}")
        columns = cursor.fetchall()
        table_columns[table_name] = columns

    return table_columns

def main():
    while True:
        print("Seleccione una opción:")
        print("1. Ejecutar todas las tareas")
        print("5. Salir")
        opcion = input("Ingrese el número de la opción que desea ejecutar: ")

        if opcion == '1':
            ejecutar_tareas()
        elif opcion == '5':
            print("Saliendo del programa...")
            break
        else:
            print("Opción inválida. Por favor, ingrese un número válido.")

main()
