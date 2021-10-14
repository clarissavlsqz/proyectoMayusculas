//
//  ViewControllerPreguntasPrototipo.swift
//  proyectoMayusculas
//
//  Created by user198119 on 10/13/21.
//

import UIKit

class ViewControllerPreguntasPrototipo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let buttonX = 0
        let buttonY = 50
        let buttonWidth = 75
        let buttonHeight = 50
        
        let frase = "Esta frase tiene cinco palabras. Despues hay otra oracion."
        
        
        let arrPals = frase.components(separatedBy: " ")
        let arrRespuestas = [true, false, false, false, false, true, false, false, false]
        var bCount = 0
        for pals in arrPals{
            print(pals, terminator: "\n")
            let button = UIButton(type: .roundedRect)
            button.setTitle(pals, for: .normal)
            button.frame = CGRect(x: buttonX + (bCount * (buttonWidth + 10)), y: buttonY, width: buttonWidth, height: buttonHeight)
            button.backgroundColor = UIColor(hue: 0.80, saturation: 1, brightness: 1, alpha: 1)
            button.tintColor = .black
            self.view.addSubview(button)
            bCount+=1
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
