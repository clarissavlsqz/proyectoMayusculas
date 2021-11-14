//
//  Puntaje.swift
//  proyectoMayusculas
//
//  Created by user198119 on 11/13/21.
//

import Foundation

class Puntaje : Equatable, Comparable, Codable{
    
    
    var jugador : String
    var puntos : Int
    var tiempo : Date
    
    init(jugador: String, puntos: Int){
        self.jugador = jugador
        self.puntos = puntos
        self.tiempo = Date()
    }
    
    static func == (lhs: Puntaje, rhs: Puntaje) -> Bool {
        return lhs.puntos == rhs.puntos
    }
    
    static func < (lhs: Puntaje, rhs: Puntaje) -> Bool {
        return lhs.puntos < rhs.puntos
    }
}

