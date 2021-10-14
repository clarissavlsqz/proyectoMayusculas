//
//  ViewControllerInformation.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 04/10/21.
//

import UIKit

class ViewControllerInformation: UIViewController {
    
    let info1 = "fue desarrollada por estudiantes del Instituto tecnológico y de Estudios Superiores de Monterrey durante el periodo Agosto-Diciembre 2021 como proyecto final para la clase de Proyecto de Desarrollo para Dispositivos Móviles. \n\nDesarrolladores: Ana Lizbeth Zermeño Torres, Clarissa Andrea Velásquez Magaña y Fernando Martínez Ortiz\n\nMaestra: Mtra. Yolanda Martínez Treviño\n\nMentora de proyecto: Martha Aurelia Pérez Velasco\n\nSe prohíbe el uso de "
    let info2 = "con fines de lucro. Esta aplicación fue creada con un enfoque a la información y se prohíbe su distribución para otros usos y medios."
    
    let boldText = "Mayúsculas "
    
    let attrs = [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 12)]
    
    
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attributeText()
        // Do any additional setup after loading the view.
    }
    
    func attributeText() {
        let attrString = NSMutableAttributedString(string:boldText, attributes:attrs)
        let attrString2 = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let part1Normal = NSMutableAttributedString(string:info1)
        let part2Normal = NSMutableAttributedString(string:info2)
        
        attrString.append(part1Normal)
        attrString2.append(part2Normal)
        attrString.append(attrString2)
        
        labelInfo.attributedText = attrString
        
    }
    @IBAction func tapLogo(_ sender: UITapGestureRecognizer) {
        if let url = URL(string: "https://sites.google.com/itesm.mx/cescrituratec/") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
