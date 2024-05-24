from customtkinter import *
from PIL import Image, ImageTk
from tkinter import messagebox
import mysql.connector
import json
from DoctorPanel import panelDoctor


# Función para leer configuración de la base de datos desde un archivo JSON
def read_db_config():
    with open('config.json', 'r') as file:
        config = json.load(file)
    return config

# Configurar la aplicación principal
app = CTk()
app.geometry("1000x600")
app.title("Inicio de sesion")
app.resizable(False, False)
set_appearance_mode("dark")

# Crear un Frame con un color específico
color_blanco = "#f4f6f7"
color_verde = "#58d68d"  
negro_color = "#17202a"

frame = CTkFrame(master=app, fg_color=color_verde, corner_radius=0)
centro = CTkFrame(master=app, fg_color=negro_color, corner_radius=0)

# Cargar la imagen del logotipo
logo_path = "icons/logo.png"  
logo_image = Image.open(logo_path)
logo_image = logo_image.resize((300, 300), Image.Resampling.LANCZOS) # Ajusta el tamaño según sea necesario
logo_photo = ImageTk.PhotoImage(logo_image)


# Cargar la imagen del logotipo
equipo_medico_path = "icons/equipo-medico.png"  
equipo_medico = Image.open(equipo_medico_path)
equipo_medico = equipo_medico.resize((150, 150), Image.Resampling.LANCZOS) # Ajusta el tamaño según sea necesario
equipo_medico_photo= ImageTk.PhotoImage(equipo_medico)


# Cargar la imagen del logotipo
fondo_path = "icons/fondo.png"  
fondo = Image.open(fondo_path)
fondo = fondo.resize((900, 900), Image.Resampling.LANCZOS) # Ajusta el tamaño según sea necesario
fondo= ImageTk.PhotoImage(fondo)


# Crear un label para la imagen del logotipo
logo_label = CTkLabel(master=frame, image=logo_photo, text="")  # text="" para no mostrar texto junto a la imagen
logo_label.place(relx=0.5, rely=0.2, anchor="center")  # Ajusta la ubicación según sea necesario


# Crear un label para la imagen del logotipo
equipo_medico_label = CTkLabel(master=frame, image=equipo_medico_photo, text="")  # text="" para no mostrar texto junto a la imagen
equipo_medico_label.place(relx=0.5, rely=0.5, anchor="center")  # Ajusta la ubicación según sea necesario


# Crear un label para la imagen del logotipo
fondo_label = CTkLabel(master=centro, image=fondo, text="")  # text="" para no mostrar texto junto a la imagen
fondo_label.pack()  # Ajusta la ubicación según sea necesario

# Funciones
def getDatos():
    usuario = usuarioEntry.get()
    password = passwordEntry.get()
    caso = funcion.get()
    print(usuario, password, caso)
    authenticate(usuario, password, caso)

def authenticate(usuario, password, caso):
    try:
        # Leer configuración de la base de datos desde el archivo JSON
        config = read_db_config()

        # Conectar a la base de datos usando la configuración leída
        connection = mysql.connector.connect(
            host=config["host"],
            user=config["user"],
            password=config["password"],
            database=config["database"]
        )
        cursor = connection.cursor()

        if caso == "Doctor":
            table = "usuariosDoctor"
        elif caso == "Administrativo":
            table = "usuariosAdministrativos"
        elif caso == "Recepcionista":
            table = "usuariosRecepcionista"
        else:
            messagebox.showerror("Error", "Función no válida")
            return

        query = f"SELECT * FROM {table} WHERE nombre_usuario = %s AND contrasena = %s"
        cursor.execute(query, (usuario, password))
        result = cursor.fetchone()

        if result:
            # Obtener el tipo de usuario
            tipo_usuario = caso.lower()  # Convertir la opción seleccionada a minúsculas
            if tipo_usuario.capitalize() == "Doctor":
                panelDoctor.panelDoctorChido()
                app.destroy()
        else:
            messagebox.showerror("Error", "Usuario o contraseña incorrectos")
        
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error al conectar a la base de datos: {err}")
    except FileNotFoundError:
        messagebox.showerror("Error", "El archivo config.json no se encontró")
    except json.JSONDecodeError:
        messagebox.showerror("Error", "Error al decodificar el archivo JSON")
    finally:
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()

def salir():
    resultado = messagebox.askyesnocancel("Salir", "El proceso ests funcionando, si cierras terminara")
    if resultado == True:
        app.destroy()

# Crear otros widgets
tituloLb = CTkLabel(master=centro, text="USUARIO", font=("Arial", 30), text_color=color_blanco)
usuarioEntry = CTkEntry(master=centro,
                        placeholder_text="ricardo.escobedo",
                        width=250,
                        height=30)

passwordLb = CTkLabel(master=centro, text="PASSWORD", font=("Arial", 30), text_color=color_blanco)
passwordEntry = CTkEntry(master=centro,
                         placeholder_text="*********",
                         width=250,
                         height=30,
                         show="*"
                         )
funcionLb = CTkLabel(master=centro,
                     text="FUNCION",
                     font=("Arial", 30),
                     text_color=color_blanco)

funcion = CTkComboBox(master=centro,
                      values=["Administrativo",
                              "Recepcionista",
                              "Doctor"],
                              width=250,
                              height=30
                              )

btnCancelar = CTkButton(master=frame,
                        text="Salir",
                        width=120,
                        command=salir)
btnTest = CTkButton(master=frame,
                    text="Test Mysql",
                    width=120)
btnGet = CTkButton(master=centro,
                   text="Iniciar Sesion",
                   width=120,
                   command=getDatos)

frame.place(
    relx=0.0,
    rely=0.0,
    relwidth=0.2,
    relheight=1.0)

centro.place(
    relx=0.2,
    rely=0.0,
    relwidth=0.8,
    relheight=1.0
)

tituloLb.place(
    relx=0.4,
    rely=0.2,
    anchor="center"
)
usuarioEntry.place(
    relx=0.4,
    rely=0.3,
    anchor="center"
)
passwordLb.place(
    relx=0.4,
    rely=0.4,
    anchor="center"
)
passwordEntry.place(
    relx=0.4,
    rely=0.5,
    anchor="center"
)
funcionLb.place(
    relx=0.4,
    rely=0.6,
    anchor="center"
)
funcion.place(
    relx=0.4,
    rely=0.7,
    anchor="center"
)

btnCancelar.place(
    relx=0.2,
    rely=0.9
)
btnTest.place(
    relx=0.2,
    rely=0.8
)
btnGet.place(
    relx=0.8,
    rely=0.9
)

app.mainloop()
