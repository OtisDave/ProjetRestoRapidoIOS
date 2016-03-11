//
//  CCommande.swift
//  ProjetRestoRapidoIOS
//
//  Created by Professeur on 2016-03-10.
//  Copyright © 2016 Device. All rights reserved.
//

import UIKit
import Foundation
public class CCommande
{
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    
    var cmdId : Int
    var cmdStatusCommandes : Int
    var cmdDate : String
    var cmdPrix : float_t
    
    var cmdPrixTaxe : float_t
    
    var cmdLst : [RepasCommande]
    
    
    
    init(_Id : Int, _status : Int, _Prix : float_t, _PrixTaxe : float_t, _Date : String, _lstRepas : [RepasCommande])
    {
        cmdId = _Id
        cmdStatusCommandes = _status
        cmdPrix = _Prix
        cmdPrixTaxe = _PrixTaxe
        cmdDate = _Date
        
        cmdLst = _lstRepas
        
    }
}
