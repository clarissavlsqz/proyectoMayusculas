//
//  ViewControllerGameMode.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 04/10/21.
//

import UIKit

class ViewControllerGameMode: UIViewController {
    var modalidad : String!
    
    @IBOutlet weak var viewGradient: UIView!
    @IBOutlet weak var whiteContainer: UIView!
    @IBOutlet weak var buttonZen: UIButton!
    @IBOutlet weak var buttonContrareloj: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whiteContainer.layer.cornerRadius = 10
        whiteContainer.layer.shadowColor = UIColor.black.cgColor
        whiteContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
        whiteContainer.layer.shadowOpacity = 0.7
        whiteContainer.layer.shadowRadius = 4.0
        
        buttonZen.layer.cornerRadius = 7
        buttonZen.layer.shadowColor = UIColor.black.cgColor
        buttonZen.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonZen.layer.shadowOpacity = 0.1
        buttonZen.layer.shadowRadius = 1.0
        
        buttonContrareloj.layer.cornerRadius = 7
        buttonContrareloj.layer.shadowColor = UIColor.black.cgColor
        buttonContrareloj.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonContrareloj.layer.shadowOpacity = 0.1
        buttonContrareloj.layer.shadowRadius = 1.0

        
        
        buttonContrareloj.layer.cornerRadius = 7

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = .white
            //UIColor.init(red: 0.44, green: 0.20, blue: 0.66, alpha: 1.00)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.44, green: 0.20, blue: 0.66, alpha: 1.00).cgColor, UIColor(red: 0.56, green: 0.14, blue: 0.85, alpha: 1.00).cgColor]
        gradientLayer.shouldRasterize = true
        viewGradient.layer.addSublayer(gradientLayer)
    }
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewDifficulty = segue.destination as! ViewControllerDifficulty
        
        if segue.identifier == "zen" {
            viewDifficulty.modeGame = 1
            modalidad = "Z"
        }
        else {
            viewDifficulty.modeGame = 2
            modalidad = "C"
        }
        viewDifficulty.modalidad = modalidad
        
    }
    

}
