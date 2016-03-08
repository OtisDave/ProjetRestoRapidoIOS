//
//  PanierTableViewCell.swift
//  ProjetRestoRapidoIOS
//
//  Created by Device on 2016-03-08.
//  Copyright © 2016 Device. All rights reserved.
//

import Foundation
import UIKit

class PanierTableViewCell: UITableViewCell {
    @IBOutlet weak var lblQte: UILabel!
    @IBOutlet weak var lblPrix: UILabel!
    @IBOutlet weak var lblNom: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected : Bool, animated : Bool){
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func SupprimerClick(sender: AnyObject) {
        
    }
}