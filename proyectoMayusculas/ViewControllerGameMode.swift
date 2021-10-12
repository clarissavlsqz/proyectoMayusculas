//
//  ViewControllerGameMode.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 04/10/21.
//

import UIKit

class ViewControllerGameMode: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewDifficulty = segue.destination as! ViewControllerDifficulty
        
        if segue.identifier == "basico" {
            viewDifficulty.modeGame = 1
        }
        else {
            viewDifficulty.modeGame = 2
        }
        
        
    }
    

}
