//
//  CommandeTableViewCell.swift
//  ProjetRestoRapidoIOS
//
//  Created by Professeur on 2016-03-10.
//  Copyright © 2016 Device. All rights reserved.
//

import UIKit

public class CommandeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblPrix: UILabel!
    
    @IBOutlet weak var lblPrixTaxe: UILabel!
    
    var CmdId : Int = 0

    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override public func setSelected(selected : Bool, animated : Bool){
        super.setSelected(selected, animated: animated)
        
    }
}
