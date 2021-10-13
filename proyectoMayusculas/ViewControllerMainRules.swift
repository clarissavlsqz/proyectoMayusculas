//
//  ViewControllerMainRules.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 04/10/21.
//

import UIKit

class ViewControllerMainRules: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewNorma = segue.destination as! ViewControllerEachRule
        
        if segue.identifier == "rule1" {
            viewNorma.titleNorma = "Nombres propios"
            viewNorma.norma = "Los nombres propios se escriben con mayúscula inicial (de personas, ciudades, ríos, festividades, disciplinas científicas), o los apodos o sobrenombres que acompañan o sustituyen a un nombre propio."
            
        } else if segue.identifier == "rule2" {
            viewNorma.titleNorma = "La primera letra"
            viewNorma.norma = "La primera letra de cada enunciado y después de punto deberá ser mayúscula."
            
        } else if segue.identifier == "rule3" {
            viewNorma.titleNorma = "En cartas y documentos formales"
            viewNorma.norma = "La primera palabra después de las fórmulas de cortesía con las que inician las cartas y otros documentos formales."
            
        } else if segue.identifier == "rule4" {
            viewNorma.titleNorma = "Siglas o acrónimos"
            viewNorma.norma = "Las siglas o acrónimos deberán ir en mayúsculas."
            
        } else if segue.identifier == "rule5" {
            viewNorma.titleNorma = "Sustantivos y adjetivos"
            viewNorma.norma = "Los sustantivos y adjetivos que forman parte de  los nombres de instituciones, entidades, organismo, partidos políticos, etc. o de un plan, programa o proyecto. o materias y cursos. o de congresos y reuniones académicas, técnicas, culturales o políticas. "
            
        } else if segue.identifier == "rule6" {
            viewNorma.titleNorma = "Sustantivos colectivos"
            viewNorma.norma = "Los sustantivos colectivos que significan entidades o corporaciones."
            
        } else if segue.identifier == "rule7" {
            viewNorma.titleNorma = "Fórmulas de tratamiento"
            viewNorma.norma = "Las fórmulas de tratamiento abreviadas: Sto., Lic., Sr., Ud."
            
        } else if segue.identifier == "rule8" {
            viewNorma.titleNorma = "Guerras y batallas"
            viewNorma.norma = "En el caso de las guerras y batallas se escriben con mayúsculas las palabras que especifican de cuál conflicto se habla, excepto los dos mundiales."
            
        } else if segue.identifier == "rule9" {
            viewNorma.titleNorma = "Direcciones electrónicas"
            viewNorma.norma = "Es preferible escribir las direcciones electónicas  tal como aparecen en el buscador, es decir, con minúscula.  Se sugiere no ponerlas al inicio de un enunciado."
        }
        
        
    }
    

}
