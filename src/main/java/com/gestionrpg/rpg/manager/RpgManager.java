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
        
        /*var app = Javalin.create().start(7070);
        app.get("/personajes", ctx ->{
            ctx.json(RepositorioPersonajes.listaPersonajes);
        });*/
        var app = Javalin.create(config -> {
            config.staticFiles.add("/public");
        }).start(7070);

        app.get("/personajes", ctx -> {
            ctx.json(RepositorioPersonajes.listaPersonajes);
        });
        
        /*app.post("/personajes", ctx->{
           Personaje nuevo = ctx.bodyAsClass(Personaje.class);
           RepositorioPersonajes.listaPersonajes.add(nuevo);         
           ctx.status(201).json(nuevo);
        });*/
        app.post("/personajes", ctx -> {
            String nombre = ctx.formParam("nombre");
            String clase = ctx.formParam("clase");
            int nivel = Integer.parseInt(ctx.formParam("nivel"));
            int vida = Integer.parseInt(ctx.formParam("vida"));

            Personaje nuevo = new Personaje(nombre, clase, nivel, vida);
            RepositorioPersonajes.listaPersonajes.add(nuevo);
            
            ctx.redirect("/");
        });
        
    }
    
}