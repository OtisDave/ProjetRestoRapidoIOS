//
//  RepasCommande.swift
//  ProjetRestoRapidoIOS
//
//  Created by Francis on 2016-03-09.
//  Copyright © 2016 Device. All rights reserved.
//

import Foundation
import UIKit

public class RepasCommande : Repas {
    
    var Commentaire : String
    var nbEtoiles : Int
    var cmdId : Int
    var cmdRepascmdID : Int
    
    init(_Id : Int, _Commentaires : String, _Etoiles : Int, _cmdRepas : Int, _cmd : Int) {
        
        Commentaire = _Commentaires
        var Trouve:Bool = true
        var i : Int = 0;
        nbEtoiles = _Etoiles
        cmdId = _cmd
        cmdRepascmdID = _cmdRepas
        while(Trouve || (MenuTableViewController.repas.count > i))
        {
            Trouve = MenuTableViewController.repas[i].id == _Id
            i++
        }
        var LeRepas : Repas = MenuTableViewController.repas[i]
        
        super.init(_Id: LeRepas.id, _Nom: LeRepas.nom, _Image: LeRepas.Image, _Prix: LeRepas.prix, _Description: LeRepas.description, _boBle: LeRepas.boBle, _boLait: LeRepas.boLait, _boOeuf: LeRepas.boOeuf, _boArachide: LeRepas.boArachide, _boSoja: LeRepas.boSoja, _boFruitCoque: LeRepas.boFruitCoque, _boPoisson: LeRepas.boPoisson, _boSesame: LeRepas.boSesame, _boCrustace: LeRepas.boCrustace, _boMollusque: LeRepas.boMollusque)
    }
}