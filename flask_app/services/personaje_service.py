def validar_personaje(nombre, clase, nivel, vida):
    if nombre.strip() == "":
        return False, "El nombre no puede estar vacio"
    if clase.strip() == "":
        return False, "La clase no puede estar vacia"
    if clase.lower() not in ["mago", "guerrero", "arquero"]:
        return False, "La clase debe ser mago, guerrero o arquero" 
    if nivel < 1 or nivel > 100:
        return False, "El nivel debe estar entre 1 y 100"
   
    return True, ""