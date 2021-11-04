//
//  ViewControllerGameMode.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 04/10/21.
//

import UIKit

class ViewControllerGameMode: UIViewController {
    var modalidad : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
