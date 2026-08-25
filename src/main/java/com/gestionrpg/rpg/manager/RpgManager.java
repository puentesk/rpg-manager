/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.gestionrpg.rpg.manager;

import io.javalin.Javalin;
import repositorio.RepositorioPersonajes;
/**
 *
 * @author Usuario
 */
public class RpgManager {

    public static void main(String[] args) {
        
        var app = Javalin.create().start(7070);
        app.get("/personajes", ctx ->{
            ctx.json(RepositorioPersonajes.listaPersonajes);
        });
    }
    
}