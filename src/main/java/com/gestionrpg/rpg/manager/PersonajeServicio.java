package com.gestionrpg.rpg.manager;

public class PersonajeServicio {
    public boolean validarPersonaje(Personaje personaje) {
        if (personaje.getNombre() == null || personaje.getNombre().trim().isEmpty()) {
            return false;
        }
        if (personaje.getClase() == null || personaje.getClase().trim().isEmpty()) {
            return false;
        }
        String clase = personaje.getClase();
        if (!clase.equalsIgnoreCase("Guerrero") 
            && !clase.equalsIgnoreCase("Mago") 
            && !clase.equalsIgnoreCase("Arquero")) {
        return false;
        }
        if (personaje.getNivel() < 1 || personaje.getNivel() > 100) {
            return false;
        }
        if (personaje.getVida() <= 0) {
            return false;
        }
        return true;
    }
}
