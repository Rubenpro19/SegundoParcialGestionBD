import json
import tkinter as tk
from tkinter import filedialog
from fpdf import FPDF
import mysql.connector
from mysql.connector import Error
import threading
import time

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

        cursor.execute("SHOW TABLES")
        tablas = cursor.fetchall()
        
        if tablas:
            print(f"\nTablas en la base de datos '{nombre_base_datos}':")
            for tabla in tablas:
                nombre_tabla = tabla[0]
                print(f"- {nombre_tabla}")
                
                cursor.execute(f"DESCRIBE {nombre_tabla}")
                atributos = cursor.fetchall()
                
                for atributo in atributos:
                    print(f"  - {atributo[0]} ({atributo[1]})")
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

def guardar_disparadores_en_archivo_unico(triggers):
    root = tk.Tk()
    root.withdraw()
    carpeta_destino = filedialog.askdirectory(title="Seleccione la carpeta donde desea guardar el archivo SQL")

    if not carpeta_destino:
        print("No se seleccionó ninguna carpeta. Operación cancelada.")
        return

    archivo_destino = f"{carpeta_destino}/triggers_auditoria.sql"

    try:
        with open(archivo_destino, "w") as file:
            for trigger_name, trigger_query in triggers:
                file.write(trigger_query + "\n")
        print("Disparadores guardados en un archivo SQL exitosamente.")
    except Exception as e:
        print(f"Error al guardar los disparadores en el archivo SQL: {e}")

def ejecutar_disparadores(connection, triggers):
    try:
        cursor = connection.cursor()
        for trigger_name, trigger_query in triggers:
            cursor.execute(trigger_query)
        connection.commit()
        print("Disparadores ejecutados exitosamente en la base de datos.")
    except Error as e:
        print(f"Error al ejecutar los disparadores en la base de datos: {e}")

# Nueva función para leer los logs desde el archivo
def leer_logs(ruta_archivo):
    try:
        with open(ruta_archivo, 'r') as archivo:
            logs = archivo.readlines()
        return logs
    except Exception as e:
        print(f"Error al leer el archivo de logs: {e}")
        return []

# Nueva función para generar el informe PDF
def generar_informe_pdf(logs, ruta_destino):
    class PDF(FPDF):
        def header(self):
            self.set_font('Arial', 'B', 12)
            self.cell(0, 10, 'Reporte de Logs de Auditoría', 0, 1, 'C')

        def footer(self):
            self.set_y(-15)
            self.set_font('Arial', 'I', 8)
            self.cell(0, 10, f'Page {self.page_no()}', 0, 0, 'C')

    pdf = PDF()
    pdf.add_page()
    pdf.set_font('Arial', 'B', 10)
    pdf.cell(200, 10, 'Log', 1)
    pdf.ln()

    pdf.set_font('Arial', '', 10)
    for log in logs:
        pdf.multi_cell(0, 10, log, 1)
        pdf.ln()

    pdf.output(ruta_destino)

# Nueva función para visualizar logs y generar el informe PDF
def visualizar_logs():
    ruta_archivo = 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\DESKTOP-71HF2T4.log'
    logs = leer_logs(ruta_archivo)
    
    guardar = input("¿Desea guardar los logs en un archivo PDF? (s/n): ")
    if guardar.lower() == 's':
        root = tk.Tk()
        root.withdraw()
        ruta_destino = filedialog.asksaveasfilename(defaultextension=".pdf", title="Guardar archivo PDF", filetypes=[("PDF files", "*.pdf")])
        
        if ruta_destino:
            generar_informe_pdf(logs, ruta_destino)
            print(f"Logs guardados en {ruta_destino}")
        else:
            print("No se seleccionó ninguna ruta. Operación cancelada.")

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
            guardar_disparadores_en_archivo_unico(triggers)
            ejecutar_disparadores(connection, triggers)
            crear_tabla_auditoria(connection, nombre_base_datos)

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

# Ejecutar una consulta y medir el tiempo de respuesta
def ejecutar_consulta(query, resultados, index, nombre_base_datos):
    try:
        connection = conectar_base_datos()
        if connection:
            cursor = connection.cursor()
            cursor.execute(f"USE {nombre_base_datos}")
            inicio = time.time()
            cursor.execute(query)
            cursor.fetchall() 
            fin = time.time()
            resultados[index] = fin - inicio
            cursor.close()
            connection.close()
    except Error as e:
        print(f"Error al ejecutar la consulta: {e}")
        resultados[index] = None

# Comparar consultas aplicando hilos
def comparar_consultas():
    connection = conectar_base_datos()
    if connection:
        
        
        cursor = connection.cursor()
        cursor.execute("SHOW DATABASES LIKE %s", ('tienda_test4',))
        if cursor.fetchone():
            # Definir las consultas
            consultas = [
                "SELECT * FROM bodega",
                "SELECT * FROM auditoria",
                """SELECT 
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    SUM(f.total) AS total_ventas
FROM 
    factura f
JOIN 
    empleado e ON f.empleado_id = e.id_empleado
GROUP BY 
    e.id_empleado;""",

                """SELECT 
    f.id_factura,
    f.fecha_factura,
    f.total,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado
FROM 
    factura f
JOIN 
    cliente c ON f.cliente_id = c.id_cliente
JOIN 
    empleado e ON f.empleado_id = e.id_empleado;""",
                """SELECT 
    f.id_factura,
    f.fecha_factura,
    f.total,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado
FROM 
    factura f
JOIN 
    cliente c ON f.cliente_id = c.id_cliente
JOIN 
    empleado e ON f.empleado_id = e.id_empleado;"""
            ]

            # Lista para almacenar los resultados de tiempo
            resultados = [None] * len(consultas)

            # Crear y ejecutar los hilos
            hilos = []
            for i in range(len(consultas)):
                hilo = threading.Thread(target=ejecutar_consulta, args=(consultas[i], resultados, i, 'tienda_test4'))
                hilos.append(hilo)
                hilo.start()

            # Esperar a que todos los hilos terminen
            for hilo in hilos:
                hilo.join()

            # Mostrar los resultados
            for i in range(len(consultas)):
                if resultados[i] is not None:
                    print(f"Consulta {i + 1}: {resultados[i]:.6f} segundos")
                else:
                    print(f"Consulta {i + 1}: Error al ejecutar")
        else:
            print(f"La base de datos no existe.")
        connection.close()
    else:
        print("No se pudo establecer la conexión a la base de datos.")

def main():
    while True:
        print("Seleccione una opción:")
        print("1. Generación de disparadores de auditoria")
        print("2. Visualizar logs y generar informe PDF")
        print("3. Comparar consultas aplicando hilos")
        print("5. Salir")
        opcion = input("Ingrese el número de la opción que desea ejecutar: ")

        if opcion == '1':
            ejecutar_tareas()
        elif opcion == '2':
            visualizar_logs()
        elif opcion == '3':
            comparar_consultas()
        elif opcion == '5':
            print("Saliendo del programa...")
            break
        else:
            print("Opción inválida. Por favor, ingrese un número válido.")

main()
