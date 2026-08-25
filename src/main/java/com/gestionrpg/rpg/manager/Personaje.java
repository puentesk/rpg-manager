/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gestionrpg.rpg.manager;

/**
 *
 * @author Estudiante
 */
public class Personaje {
    private String nombre;
    private String clase;
    private int nivel;
    private int vida;

    public Personaje(String nombre, String clase, int nivel, int vida) {
        this.nombre = nombre;
        this.clase = clase;
        this.nivel = nivel;
        this.vida = vida;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getClase() {
        return clase;
    }

    public void setClase(String clase) {
        this.clase = clase;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getVida() {
        return vida;
    }

    public void setVida(int vida) {
        this.vida = vida;
    }

  
    
}
