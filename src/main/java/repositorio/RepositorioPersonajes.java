/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repositorio;
import com.gestionrpg.rpg.manager.Personaje;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Usuario
 */
public class RepositorioPersonajes {
    public static List<Personaje> listaPersonajes = new ArrayList<>();
    
    static{
        listaPersonajes.add(new Personaje("Pepe", "Mago", 1, 80 ));
        listaPersonajes.add(new Personaje("Juan", "Guerrero", 1, 100));
    }
}
