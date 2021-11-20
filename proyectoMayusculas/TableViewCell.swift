//
//  TableViewCell.swift
//  proyectoMayusculas
//
//  Created by user198119 on 11/13/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var puntaje: UILabel!
    @IBOutlet weak var tiempo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
