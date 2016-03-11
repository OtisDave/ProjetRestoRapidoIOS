//
//  Utilisateurs.swift
//  ProjetRestoRapidoIOS
//
//  Created by Professeur on 2016-03-10.
//  Copyright © 2016 Device. All rights reserved.
//

import UIKit


class Utilisateurs: NSObject {
    /*
    Données membres
    */
    var ID : Int
    var Type : String
    var Prenom : String
    var Nom : String
    var Usager : String
    var Ble : Bool
    var Lait : Bool
    var Oeuf : Bool
    var Arachide : Bool
    var Soja : Bool
    var Coque : Bool
    var Poisson : Bool
    var Sesame : Bool
    var Crustace : Bool
    var Molusque : Bool
    
    
    /*
    Initialiser d'un nouveau usager
    */
    init(_Id : Int, _Type : String, _Prenom : String, _Nom : String, _Usager : String, _ble : Bool, _lait : Bool, _Oeuf : Bool, _Arachide : Bool, _Soja : Bool, _Coque : Bool, _Poisson : Bool, _Sesame : Bool, _Crustace : Bool, _Molusque : Bool){
        ID = _Id
        Type = _Type
        Prenom = _Prenom
        Nom = _Nom
        Usager = _Usager
        Ble = _ble
        Lait = _lait
        Oeuf = _Oeuf
        Arachide = _Arachide
        Soja = _Soja
        Coque = _Coque
        Poisson = _Poisson
        Sesame = _Sesame
        Crustace = _Crustace
        Molusque = _Molusque
        
        
    }
    
}
