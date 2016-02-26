//
//  Repas.swift
//  ProjetRapidoRestoIOS
//
//  Created by Francis on 2016-02-26.
//  Copyright (c) 2016 RestoRapido. All rights reserved.
//

import Foundation
import UIKit

class Repas {
    
     var nom : String = ""
     var description : String = ""
    var Image : UIImage = UIImage()
    
    init(_Nom : String, _Description : String, _Image : UIImage){
        nom = _Nom
        description = _Description
        Image = _Image
    }
    
    init(_Nom : String, _Description : String){
        nom = _Nom
        description = _Description
        Image = UIImage(named: "assiette")!
    }
    
}