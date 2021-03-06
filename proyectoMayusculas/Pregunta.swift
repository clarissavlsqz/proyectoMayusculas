//
//  Pregunta.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 09/10/21.
//

import Foundation

class Pregunta : Codable {
    var tipo : Int
    var enunciado : String
    var dificultad : Int
    var respuesta : [String]
    var normas : [Int]
    var opciones: [[String]]
    
    init(tipo: Int, enunciado: String, dificultad: Int, respuesta: [String], normas: [Int], opciones: [[String]]) {
        self.tipo = tipo
        self.enunciado = enunciado
        self.dificultad = dificultad
        self.respuesta = respuesta
        self.normas = normas
        self.opciones = opciones
    }
}
