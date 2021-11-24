//
//  ViewControllerEachRule.swift
//  proyectoMayusculas
//
//  Created by Ana Zermeño torres on 13/10/21.
//

import UIKit

class ViewControllerEachRule: UIViewController {
    
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbNorma: UILabel!
    @IBOutlet weak var whiteView: UIView!
    
    
    var titleNorma : String!
    var norma : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbTitle.adjustsFontSizeToFitWidth = true
        lbNorma.adjustsFontSizeToFitWidth = true
        lbTitle.text = titleNorma
        lbNorma.text = norma
                
        whiteView.layer.cornerRadius = 10
        whiteView.layer.shadowColor = UIColor.black.cgColor
        whiteView.layer.shadowOffset = CGSize(width: 0, height: 0)
        whiteView.layer.shadowOpacity = 0.2
        whiteView.layer.shadowRadius = 2.0
        
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
