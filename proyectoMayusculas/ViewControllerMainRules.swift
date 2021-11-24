//
//  ViewControllerMainRules.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 04/10/21.
//

import UIKit

class ViewControllerMainRules: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var normas = [
        [
            Norma(nombre: "Nombres propios", descripcion:"Los nombres propios se escriben con mayúscula inicial (de personas, ciudades, ríos, festividades, disciplinas científicas), o los apodos o sobrenombres que acompañan o sustituyen a un nombre propio. \n\n1b. Cargos \nVayan o no acompañados del nombre de la persona, se escribe con minúscula la palabra que indica el cargo que dicha persona ostenta."),
            Norma(nombre: "La primera letra", descripcion:"La primera letra de cada enunciado y después de punto deberá ser mayúscula. \n\n2b. Penínsulas \nLos nombres de penínsulas, cuando son un adjetivo que se refiere a un topónimo."),
            Norma(nombre: "En cartas y documentos formales", descripcion:"La primera palabra después de las fórmulas de cortesía con las que inician las cartas y otros documentos formales. \n\n3b. Premios \nEn general, las categorías de los premios y el  nombre del premio cuando se refiere a la persona que lo recibió o al objeto (estatuilla, por ejemplo)."),
            Norma(nombre: "Siglas y acrónimos", descripcion:"Las siglas o acrónimos deberán ir en mayúsculas. \n\n4b. Puntos cardinales \nLos puntos cardinales y las líneas imaginarias no son nombres propios."),
            Norma(nombre: "Sustantivos y adjetivos", descripcion:"Los sustantivos y adjetivos que forman parte de  los nombres de instituciones, entidades, organismo, partidos políticos, etc. o de un plan, programa o proyecto. o materias y cursos. o de congresos y reuniones académicas, técnicas, culturales o políticas. \n\n5b. Fragmento incompleto en una cita \nEn una cita textual, después de los puntos suspensivos iniciales que indican que se omite el principio del fragmento citado."),
            Norma(nombre: "Sustantivos colectivos", descripcion:"Los sustantivos colectivos que significan entidades o corporaciones. \n\n6b. Fragmento que comienza con cifra \nSi un texto comienza con una cifra, la palabra siguiente inicia con minúscula."),
            Norma(nombre: "Fórmulas de tratamiento", descripcion:"Las fórmulas de tratamiento abreviadas: Sto., Lic., Sr., Ud. \n\n7b. Símbolos internacionales \nLos símbolos de caracter internacional mantinen su escritura fija de mayúscula o minúscula."),
            Norma(nombre: "Guerras y batallas", descripcion:"En el caso de las guerras y batallas se escriben con mayúsculas las palabras que especifican de cuál conflicto se habla, excepto los dos mundiales. \n\n8b. Días, meses, estaciones \nLos días de la semana, los meses del año y las estaciones son nombres comunes."),
            Norma(nombre: "Direcciones electrónicas", descripcion:"Es preferible escribir las direcciones electónicas  tal como aparecen en el buscador, es decir, con minúscula.  Se sugiere no ponerlas al inicio de un enunciado. \n\n9b. Direcciones electrónicas \nEs preferible escribir las direcciones electónicas tal como aparecen en el buscador, es decir, con minúscula. Se sugiere no ponerlas al inicio de un enunciado."),
            Norma(nombre: "Artículos en topónimos", descripcion:"Los artículos cuando forman parte del nombre propio; además, en este caso, no se contraen. \n\n10b. Aposiciones \nLas aposiciones explicativas que usualmente acompañan a nombres de personas o ciudades."),
            Norma(nombre: "Premios", descripcion:"Los artículos cuando forman parte del nombre propio; además, en este caso, no se contraen. \n\n11b. Metonimias y antonomasias \nCuando un nombre propio se usa para llamar un objeto común.")
            ],
        [
        ]
    ]
    
    @IBOutlet weak var whiteView: UIView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.navigationBar.tintColor =  UIColor.white
        
        whiteView.layer.cornerRadius = 10
        whiteView.layer.shadowColor = UIColor.black.cgColor
        whiteView.layer.shadowOffset = CGSize(width: 0, height: 0)
        whiteView.layer.shadowOpacity = 0.7
        whiteView.layer.shadowRadius = 4.0
        // Do any additional setup after loading the view.
    }
    
    @objc func holdDown(sender : UIButton) {
        sender.backgroundColor = UIColor(red: 0.70, green: 0.67, blue: 0.83, alpha: 1.00)
    }
    
    @objc func holdRelease(sender : UIButton) {
        sender.backgroundColor = UIColor(red: 0.86, green: 0.82, blue: 1.00, alpha: 1.00)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return normas.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Mayúsculas"
        case 1:
            return "Minúsculas"
        default:
            return ""
        }
    }
    
    // MARK: - Navigation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return normas[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "norma", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "\(indexPath.row + 1). \(normas[indexPath.section][indexPath.row].nombre)"
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        //cell.puntaje?.text = normas[indexPath.row].descripcion
        return cell
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewNorma = segue.destination as! ViewControllerEachRule
        
        let indice = tableView.indexPathForSelectedRow!
        viewNorma.titleNorma = normas[indice.section][indice.row].nombre
        viewNorma.norma = normas[indice.section][indice.row].descripcion
    }
    
    
    
    

}
