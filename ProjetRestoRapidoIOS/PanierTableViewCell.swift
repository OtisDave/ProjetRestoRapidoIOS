//
//  PanierTableViewCell.swift
//  ProjetRestoRapidoIOS
//
//  Created by Device on 2016-03-08.
//  Copyright © 2016 Device. All rights reserved.
//

import UIKit

class PanierTableViewCell: UITableViewCell {
    @IBOutlet weak var imgRepas: UIImageView!
    @IBOutlet weak var lblQte: UILabel!
    @IBOutlet weak var lblPrix: UILabel!
    @IBOutlet weak var lblNom: UILabel!
    var id : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected : Bool, animated : Bool){
        super.setSelected(selected, animated: animated)
    }
}