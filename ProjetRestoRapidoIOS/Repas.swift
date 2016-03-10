//
//  Repas.swift
//  ProjetRapidoRestoIOS
//
//  Created by Francis on 2016-02-26.
//  Copyright (c) 2016 RestoRapido. All rights reserved.
//

import Foundation
import UIKit

public class Repas {
    
    var id : Int
    var nom : String = ""
    var Image : UIImage = UIImage()
    var prix : float_t
    var description : String = ""
    
    var boBle : Bool
    var boLait : Bool
    var boOeuf : Bool
    var boArachide : Bool
    var boSoja : Bool
    var boFruitCoque : Bool
    var boPoisson : Bool
    var boSesame : Bool
    var boCrustace : Bool
    var boMollusque : Bool
    
    init(){
        
        id = 0
        nom = ""
        prix = 0.0
        description = ""
        boBle = false
        boLait = false
        boOeuf = false
        boArachide = false
        boSoja = false
        boFruitCoque = false
        boPoisson = false
        boSesame = false
        boCrustace = false
        boMollusque = false
        Image = UIImage()
    }
    
    init(_Id : Int, _Nom : String,  _Image : UIImage, _Prix : float_t, _Description : String, _boBle : Bool, _boLait : Bool, _boOeuf : Bool, _boArachide : Bool, _boSoja : Bool, _boFruitCoque : Bool, _boPoisson : Bool, _boSesame : Bool, _boCrustace : Bool, _boMollusque : Bool){
        
        
        id = _Id
        nom = _Nom
        prix = _Prix
        description = _Description
        boBle = _boBle
        boLait = _boLait
        boOeuf = _boOeuf
        boArachide = _boArachide
        boSoja = _boSoja
        boFruitCoque = _boFruitCoque
        boPoisson = _boPoisson
        boSesame = _boSesame
        boCrustace = _boCrustace
        boMollusque = _boMollusque
        Image = _Image
    }
    
}