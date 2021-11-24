//
//  ViewControllerDifficulty.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 12/10/21.
//

import UIKit

class ViewControllerDifficulty: UIViewController {
    
    var modeGame : Int!
    var modalidad : String!
    
    @IBOutlet weak var buttonBasico: UIButton!
    @IBOutlet weak var buttonAvanzado: UIButton!
    @IBOutlet weak var whiteContainer: UIView!
    @IBOutlet weak var viewGradient: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = .white
            //UIColor.init(red: 0.44, green: 0.20, blue: 0.66, alpha: 1.00)
        
        whiteContainer.layer.cornerRadius = 10
        whiteContainer.layer.shadowColor = UIColor.black.cgColor
        whiteContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
        whiteContainer.layer.shadowOpacity = 0.7
        whiteContainer.layer.shadowRadius = 4.0
        
        buttonBasico.layer.cornerRadius = 7
        buttonBasico.layer.shadowColor = UIColor.black.cgColor
        buttonBasico.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonBasico.layer.shadowOpacity = 0.1
        buttonBasico.layer.shadowRadius = 1.0
        
        buttonAvanzado.layer.cornerRadius = 7
        buttonAvanzado.layer.shadowColor = UIColor.black.cgColor
        buttonAvanzado.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonAvanzado.layer.shadowOpacity = 0.1
        buttonAvanzado.layer.shadowRadius = 1.0
        
        view.sendSubviewToBack(viewGradient)

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.44, green: 0.20, blue: 0.66, alpha: 1.00).cgColor, UIColor(red: 0.56, green: 0.14, blue: 0.85, alpha: 1.00).cgColor]
        gradientLayer.shouldRasterize = true
        viewGradient.layer.addSublayer(gradientLayer)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewGame = segue.destination as! ViewControllerGame
        if segue.identifier == "facil" {
            viewGame.gameMode = modeGame
            viewGame.difficulty = 1
            modalidad += "F"
        }
        else {
            viewGame.gameMode = modeGame
            viewGame.difficulty = 2
            modalidad += "D"
        }
        viewGame.modalidad = modalidad
    }
    

}
