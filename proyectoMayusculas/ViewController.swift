//
//  ViewController.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 30/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonRules: UIButton!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var buttonLeaderboard: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonRules.layer.cornerRadius = 5
        buttonPlay.layer.cornerRadius = 5
        buttonLeaderboard.layer.cornerRadius = 5
    }


}


