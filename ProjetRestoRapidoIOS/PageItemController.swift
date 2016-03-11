//
//  PageItemController.swift
//  Paging_Swift
//
//  Created by Olga Dalton on 26/10/14.
//  Copyright (c) 2014 swiftiostutorials.com. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {
    // MARK: - Variables
    var itemIndex: Int = 0
    
    var Repas : RepasCommande = RepasCommande( _Id: 0, _Commentaires: "bobobo", _Etoiles: 5, _cmdRepas: 1,
        _cmd: 1)
    
    var imageName: String = ""
    var nomRepas : String = ""
    
    var RateStar : Float = 1
    var Commentaire : String = ""
    
    var TabRetourData : [String] = []
    
    
    
    @IBOutlet weak var LblNom: UILabel!
    
    @IBOutlet weak var TxtCommentaire: UITextField!
    
    
    @IBOutlet weak var ImgRepas: UIImageView!
    
    @IBOutlet weak var LblEvaluation: UILabel!
    
    @IBOutlet weak var SliderEvaluation: UISlider!
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        LblNom.text = Repas.nom
        //ImgRepas.image = Repas.Image
        
        SliderEvaluation.value = RateStar
        TxtCommentaire.text = Commentaire
        
    }
    
    @IBAction func ChangeText(sender: AnyObject) {
        Commentaire = TxtCommentaire.text!
    }
    
    @IBAction func EnregistrerValeurs(sender: AnyObject) {
        
        let tab : [String] = [ String( Repas.id ) , String( RateStar ) , Commentaire ]
        
        TabRetourData = tab
        
    }
    
    @IBAction func ChangementValeur(sender: AnyObject) {
        
        let val = Int(roundf(SliderEvaluation.value))
        LblEvaluation.text = String(val)
        RateStar = Float(val)
        
    }
}
