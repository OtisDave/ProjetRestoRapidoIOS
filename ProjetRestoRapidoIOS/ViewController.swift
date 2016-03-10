//
//  ViewController.swift
//  ProjetRapidoRestoIOS
//
//  Created by Professeur on 2016-02-12.
//  Copyright (c) 2016 RestoRapido. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

  
    static var user : Utilisateurs? = nil
    
    
    @IBAction func btnInviteClick(sender: AnyObject) {
        
          ViewController.user = Utilisateurs(_Id: -1 , _Type: "Client", _Prenom: "", _Nom: "", _Usager: "Guest", _ble: false, _lait: false, _Oeuf: false, _Arachide: false, _Soja: false, _Coque: false, _Poisson: false, _Sesame: false, _Crustace: false, _Molusque: false)
        
   
        self.performSegueWithIdentifier("Menu", sender: nil) //affiche la page en Segue
  
        
    }
    
    
    @IBOutlet weak var txtCourriel: UITextField!
    @IBOutlet weak var txtMdp: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnConnect(sender: AnyObject) {
        var Data: NSData? = nil //contient le data JSON
        
        if(txtCourriel.text != "" && txtMdp.text != ""){ //Validation de champ non vide au login
            Data = getJSON("https://demo7680848.mockable.io/Login") //si web à analyser
            if(Data != nil){ //validation du data reçus
                let readableJSON = JSON(data: Data!, options: NSJSONReadingOptions.MutableContainers, error: nil)
                
            
                //création du user
                  ViewController.user = Utilisateurs(_Id: readableJSON.arrayObject![0] as! Int , _Type: readableJSON.arrayObject![1] as! NSString as String, _Prenom: readableJSON.arrayObject![2] as! NSString as String, _Nom: readableJSON.arrayObject![3] as! NSString as String, _Usager: readableJSON.arrayObject![4] as! NSString as String, _ble: readableJSON.arrayObject![5] as! Bool, _lait: readableJSON.arrayObject![6] as! Bool, _Oeuf: readableJSON.arrayObject![7] as! Bool, _Arachide: readableJSON.arrayObject![8] as! Bool, _Soja: readableJSON.arrayObject![9] as! Bool, _Coque: readableJSON.arrayObject![10] as! Bool, _Poisson: readableJSON.arrayObject![11] as! Bool, _Sesame: readableJSON.arrayObject![12] as! Bool, _Crustace: readableJSON.arrayObject![13] as! Bool, _Molusque: readableJSON.arrayObject![14] as! Bool)
                

                self.performSegueWithIdentifier("Menu", sender: nil) //affiche la page en Segue
            }
        }
    }
    
    //Pour obtenir le json
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    
}

