from customtkinter import *

set_appearance_mode("dark")

# Crear un Frame con un color específico
color_blanco = "#f4f6f7"
color_verde = "#58d68d"  
negro_color = "#17202a"


def panelRecp():
    panel = CTk()
    panel.title("Registro de Paciente")
    panel.geometry("900x600")
    panel.resizable(False, False)


    panel.mainloop()


