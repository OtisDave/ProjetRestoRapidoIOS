//
//  MenuTableViewCell.swift
//  ProjetRapidoRestoIOS
//
//  Created by Francis on 2016-02-26.
//  Copyright (c) 2016 RestoRapido. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    var id : Int = 0
    @IBOutlet weak var LblTitre: UILabel!
    @IBOutlet weak var TxtDescription: UITextView!
    @IBOutlet weak var ImgRepas: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected : Bool, animated : Bool){
        super.setSelected(selected, animated: animated)
        
    }
}