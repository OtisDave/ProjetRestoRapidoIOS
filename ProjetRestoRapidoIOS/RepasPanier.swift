//
//  RepasPanier.swift
//  ProjetRestoRapidoIOS
//
//  Created by Device on 2016-03-08.
//  Copyright © 2016 Device. All rights reserved.
//

import Foundation
import UIKit

public class RepasPanier : Repas {
    var Qte : Int
    
    init(_Id : Int, _Nom : String,  _Image : UIImage, _Prix : float_t, _Description : String, _boBle : Bool, _boLait : Bool, _boOeuf : Bool, _boArachide : Bool, _boSoja : Bool, _boFruitCoque : Bool, _boPoisson : Bool, _boSesame : Bool, _boCrustace : Bool, _boMollusque : Bool, _qte : Int) {
        
        Qte = _qte
        
        super.init(_Id: _Id, _Nom: _Nom, _Image: _Image, _Prix: _Prix, _Description: _Description, _boBle: _boBle, _boLait: _boLait, _boOeuf: _boOeuf, _boArachide: _boArachide, _boSoja: _boSoja, _boFruitCoque: _boFruitCoque, _boPoisson: _boPoisson, _boSesame: _boSesame, _boCrustace: _boCrustace, _boMollusque: _boMollusque)
    }
}