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
        
        buttonRules.layer.shadowColor = UIColor.black.cgColor
        buttonRules.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonRules.layer.shadowOpacity = 0.2
        buttonRules.layer.shadowRadius = 3.0
        
        buttonPlay.layer.shadowColor = UIColor.black.cgColor
        buttonPlay.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonPlay.layer.shadowOpacity = 0.2
        buttonPlay.layer.shadowRadius = 3.0
        
        buttonLeaderboard.layer.shadowColor = UIColor.black.cgColor
        buttonLeaderboard.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonLeaderboard.layer.shadowOpacity = 0.2
        buttonLeaderboard.layer.shadowRadius = 3.0
        
        
    }

    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {

    }
}


