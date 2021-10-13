//
//  ViewControllerGame.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 12/10/21.
//

import UIKit

class ViewControllerGame: UIViewController {
    
    var gameMode : Int!
    var difficulty : Int!
    
    @IBOutlet weak var labelInstruction: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var buttonMin: UIButton!
    @IBOutlet weak var buttonMayu: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
