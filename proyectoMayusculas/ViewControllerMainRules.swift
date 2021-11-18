//
//  ViewControllerMainRules.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 04/10/21.
//

import UIKit

class ViewControllerMainRules: UIViewController {
    
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var buttonR1: UIButton!
    @IBOutlet weak var buttonR2: UIButton!
    @IBOutlet weak var buttonR3: UIButton!
    @IBOutlet weak var buttonR4: UIButton!
    @IBOutlet weak var buttonR5: UIButton!
    @IBOutlet weak var buttonR6: UIButton!
    @IBOutlet weak var buttonR7: UIButton!
    @IBOutlet weak var buttonR8: UIButton!
    @IBOutlet weak var buttonR9: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteView.layer.cornerRadius = 10
        whiteView.layer.shadowColor = UIColor.black.cgColor
        whiteView.layer.shadowOffset = CGSize(width: 0, height: 0)
        whiteView.layer.shadowOpacity = 0.7
        whiteView.layer.shadowRadius = 4.0
        
        buttonR1.layer.cornerRadius = 5
        buttonR2.layer.cornerRadius = 5
        buttonR3.layer.cornerRadius = 5
        buttonR4.layer.cornerRadius = 5
        buttonR5.layer.cornerRadius = 5
        buttonR6.layer.cornerRadius = 5
        buttonR7.layer.cornerRadius = 5
        buttonR8.layer.cornerRadius = 5
        buttonR9.layer.cornerRadius = 5
        
        buttonR1.layer.shadowColor = UIColor.black.cgColor
        buttonR1.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonR1.layer.shadowOpacity = 0.2
        buttonR1.layer.shadowRadius = 2.0
        
        buttonR2.layer.shadowColor = UIColor.black.cgColor
        buttonR2.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonR2.layer.shadowOpacity = 0.2
        buttonR2.layer.shadowRadius = 2.0
        
        buttonR3.layer.shadowColor = UIColor.black.cgColor
        buttonR3.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonR3.layer.shadowOpacity = 0.2
        buttonR3.layer.shadowRadius = 2.0
        
        buttonR4.layer.shadowColor = UIColor.black.cgColor
        buttonR4.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonR4.layer.shadowOpacity = 0.2
        buttonR4.layer.shadowRadius = 2.0
        
        buttonR5.layer.shadowColor = UIColor.black.cgColor
        buttonR5.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonR5.layer.shadowOpacity = 0.2
        buttonR5.layer.shadowRadius = 2.0
        
        buttonR6.layer.shadowColor = UIColor.black.cgColor
        buttonR6.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonR6.layer.shadowOpacity = 0.2
        buttonR6.layer.shadowRadius = 2.0
        
        buttonR7.layer.shadowColor = UIColor.black.cgColor
        buttonR7.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonR7.layer.shadowOpacity = 0.2
        buttonR7.layer.shadowRadius = 2.0
        
        buttonR8.layer.shadowColor = UIColor.black.cgColor
        buttonR8.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonR8.layer.shadowOpacity = 0.2
        buttonR8.layer.shadowRadius = 2.0
        
        buttonR9.layer.shadowColor = UIColor.black.cgColor
        buttonR9.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonR9.layer.shadowOpacity = 0.2
        buttonR9.layer.shadowRadius = 2.0
        
        buttonR1.addTarget(self, action: #selector(holdDown), for: .touchDown)
        buttonR1.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        
        buttonR2.addTarget(self, action: #selector(holdDown), for: .touchDown)
        buttonR2.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        
        buttonR3.addTarget(self, action: #selector(holdDown), for: .touchDown)
        buttonR3.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        
        buttonR4.addTarget(self, action: #selector(holdDown), for: .touchDown)
        buttonR4.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        
        buttonR5.addTarget(self, action: #selector(holdDown), for: .touchDown)
        buttonR5.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        
        buttonR6.addTarget(self, action: #selector(holdDown), for: .touchDown)
        buttonR6.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        
        buttonR7.addTarget(self, action: #selector(holdDown), for: .touchDown)
        buttonR7.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        
        buttonR8.addTarget(self, action: #selector(holdDown), for: .touchDown)
        buttonR8.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        
        buttonR9.addTarget(self, action: #selector(holdDown), for: .touchDown)
        buttonR9.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func holdDown(sender : UIButton) {
        sender.backgroundColor = UIColor(red: 0.70, green: 0.67, blue: 0.83, alpha: 1.00)
    }
    
    @objc func holdRelease(sender : UIButton) {
        sender.backgroundColor = UIColor(red: 0.86, green: 0.82, blue: 1.00, alpha: 1.00)
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
