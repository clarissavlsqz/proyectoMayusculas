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
            Norma(nombre: "Nombres propios", descripcion:"Los nombres propios se escriben con mayúscula inicial (de personas, ciudades, ríos, festividades, disciplinas científicas), o los apodos o sobrenombres que acompañan o sustituyen a un nombre propio."),
            Norma(nombre: "La primera letra", descripcion:"La primera letra de cada enunciado y después de punto deberá ser mayúscula.\n\nLa primera palabra después de las fórmulas de cortesía con las que inician las cartas y otros documentos formales."),
//            Norma(nombre: "En cartas y documentos formales", descripcion:"La primera palabra después de las fórmulas de cortesía con las que inician las cartas y otros documentos formales."),
            Norma(nombre: "Siglas y acrónimos", descripcion:"Las siglas o acrónimos deberán ir en mayúsculas.\n\nLos sustantivos y adjetivos que forman parte de  los nombres de instituciones, entidades, organismo, partidos políticos, etc. o de un plan, programa o proyecto. o materias y cursos. o de congresos y reuniones académicas, técnicas, culturales o políticas.\n\nLos sustantivos colectivos que significan entidades o corporaciones."),
//            Norma(nombre: "Sustantivos y adjetivos", descripcion:"Los sustantivos y adjetivos que forman parte de  los nombres de instituciones, entidades, organismo, partidos políticos, etc. o de un plan, programa o proyecto. o materias y cursos. o de congresos y reuniones académicas, técnicas, culturales o políticas."),
//            Norma(nombre: "Sustantivos colectivos", descripcion:"Los sustantivos colectivos que significan entidades o corporaciones."),
            Norma(nombre: "Fórmulas de tratamiento", descripcion:"Las fórmulas de tratamiento abreviadas: Sto., Lic., Sr., Ud. \n\n7b. Símbolos internacionales \nLos símbolos de caracter internacional mantinen su escritura fija de mayúscula o minúscula."),
            Norma(nombre: "Guerras y batallas", descripcion:"En el caso de las guerras y batallas se escriben con mayúsculas las palabras que especifican de cuál conflicto se habla, excepto los dos mundiales"),
            Norma(nombre: "Artículos en topónimos", descripcion:"Los artículos cuando forman parte del nombre propio; además, en este caso, no se contraen."),
            Norma(nombre: "Premios", descripcion:"Los artículos cuando forman parte del nombre propio; además, en este caso, no se contraen."),
            Norma(nombre: "Puntos cardinales", descripcion: "Únicamente se escriben con mayúscula si son parte de un nombre propio."),
            Norma(nombre: "Dos puntos", descripcion: "Despuésde dos puntos, cuando señalan el comienzo de un fragmento con sentido independiente."),
            Norma(nombre: "Interrogación y exclamación", descripcion: "Si los signos encierran un enunciado completo, este iniciará con mayúscula y la palabra después del signo de cierre lleva mayúsculas."),
            Norma(nombre: "Sustantivo común genérico en nombres", descripcion: "En organismos, entidades, instituciones, cuando el sustantivo común genérico especifica la clase a la que pertenece la entidad y en teatros o museos,  cuando el sustantivo común se refiere a la institución cultural que representan y no solamente al edificio donde están ubicados."),
            Norma(nombre: "Fulano", descripcion: "Únicamente si los nombres genéricos para referirse a personas (Fulano de Tal, Perengano) se utilizan para nombrar a un personaje ficticio."),
            Norma(nombre: "Apellidos", descripcion: "En los apellidos que comienzan con preposición, esta se escribe con mayúscula cuando se utilizará el apellido (sin nombres de pila) para referirse a las personas o cuando se utilizará el apellido del marido después del de la esposa, con la preposición \"de\"."),
            Norma(nombre: "Familias o dinastías", descripcion: "Los nombres propios que se utilizan para nombrar una familia o dinastía."),
            Norma(nombre: "Plurales de nombres", descripcion: "Los nombres de pila y apellidos que se usan para referirse a varias personas que se llaman igual.")
            ],
        [
            Norma(nombre:"Cargos", descripcion: "Vayan o no acompañados del nombre de la persona, se escribe con minúscula la palabra que indica el cargo que dicha persona ostenta."),
            Norma(nombre:"Penínsulas", descripcion: "Los nombres de penínsulas, cuando son un adjetivo que se refiere a un topónimo."),
            Norma(nombre:"Premios", descripcion: "En general, las categorías de los premios y el nombre del premio cuando se refiere a la persona que lo recibió o al objeto (estatuilla, por ejemplo)."),
            Norma(nombre:"Puntos cardinales", descripcion: "Los puntos cardinales y las líneas imaginarias no son nombres propios."),
            Norma(nombre:"Fragmento incompleto en una cita", descripcion: "En una cita textual, después de los puntos suspensivos iniciales que indican que se omite el principio del fragmento citado."),
            Norma(nombre:"Fragmento que comienza con cifra", descripcion: "Si un texto comienza con una cifra, la palabra siguiente inicia con minúscula."),
            Norma(nombre:"Símbolos internacionales", descripcion: "Los símbolos de caracter internacional mantinen su escritura fija de mayúscula o minúscula."),
            Norma(nombre:"Días, meses, estaciones", descripcion: "Los días de la semana, los meses del año y las estaciones son nombres comunes."),
            Norma(nombre:"Direcciones electrónicas", descripcion: "Es preferible escribir las direcciones electónicas tal como aparecen en el buscador, es decir, con minúscula. Se sugiere no ponerlas al inicio de un enunciado."),
            Norma(nombre:"Aposiciones", descripcion: "Las aposiciones explicativas que usualmente acompañan a nombres de personas o ciudades."),
            Norma(nombre:"Metonimias, antonomasias", descripcion: "Cuando un nombre propio se usa para llamar un objeto común."),
            Norma(nombre:"Sustantivo común genérico en nombres", descripcion: "En los nombres geográficos, el sustantivo genérico (río, océano, mar, sierra, golfo, ciudad, estrecho) es común porque sirve como clasificador."),
            Norma(nombre:"Artículos o preposiciones en nombres de pila", descripcion: "Los artículos o preposiciones en nombres de pila."),
            Norma(nombre:"Fulano", descripcion: "Los nombres para referirse a personas de modo genérico(fulano, zutano, mengano, etc) se escriben con minúscula."),
            Norma(nombre:"Derivados de nombres propios", descripcion: "Los sustantivos comunes y adjetivos derivados de nombres de personas o personajes ficticios.")
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
