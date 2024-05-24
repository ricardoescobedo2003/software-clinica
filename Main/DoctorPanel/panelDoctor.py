from customtkinter import *
from PIL import Image, ImageTk

set_appearance_mode("dark")

# Crear un Frame con un color específico
color_blanco = "#f4f6f7"
color_verde = "#58d68d"  
negro_color = "#17202a"


def panelDoctorChido():
    panel = CTk()
    panel.title("Panel Doctor")
    panel.geometry("1500x900")
    panel.resizable(False, False)

    frame = CTkFrame(master=panel, fg_color=color_verde, corner_radius=0)
    centro = CTkFrame(master=panel, fg_color=negro_color, corner_radius=0)



    frame.place(
        relx=0.0,
        rely=0.0,
        relwidth=1.0,
        relheight=0.1
    )

    panel.mainloop()

