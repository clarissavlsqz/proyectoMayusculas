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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
