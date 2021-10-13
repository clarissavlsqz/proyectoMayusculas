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
    var dificultd : Int
    var respuesta : [String]
    var normas : [Int]
    
    init(tipo: Int, enunciado: String, dificultad: Int, respuesta: [String], normas: [Int]) {
        self.tipo = tipo
        self.enunciado = enunciado
        self.dificultd = dificultad
        self.respuesta = respuesta
        self.normas = normas
    }
}
