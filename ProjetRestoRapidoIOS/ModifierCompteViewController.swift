//
//  ModifierCompteViewController.swift
//  ProjetRestoRapidoIOS
//
//  Created by Professeur on 2016-03-10.
//  Copyright © 2016 Device. All rights reserved.
//

import UIKit
import SwiftyJSON

class ModifierCompteViewController: UIViewController {
    @IBOutlet weak var switchSoja: UISwitch!
    @IBOutlet weak var switchMollusque: UISwitch!
    @IBOutlet weak var switchCrustace: UISwitch!
    @IBOutlet weak var switchSesame: UISwitch!
    @IBOutlet weak var switchPoisson: UISwitch!
    @IBOutlet weak var switchCoque: UISwitch!

    @IBOutlet weak var switchArachide: UISwitch!
    @IBOutlet weak var switchOeuf: UISwitch!
    @IBOutlet weak var switchLait: UISwitch!
    @IBOutlet weak var switchBle: UISwitch!
    @IBOutlet weak var txtLogin: UITextField!
    @IBAction func btnDeconnectClick(sender: AnyObject) {
        
        txtAlert.text = ""
        
        ViewController.user = nil
        
        self.performSegueWithIdentifier("Login", sender: nil) //affiche la page en Segue
        
    }
    @IBOutlet weak var txtAlert: UITextView!
    
 
    @IBAction func ModifierClick(sender: AnyObject) {
        
        let nametemp = ViewController.user?.Usager
        
        if (ViewController.user?.Usager == "Guest")
        {
            txtAlert.text = "Vous êtes connectez en tant qu'invité. Veuillez vous créer un comptre pour modifier vos préférences."
        }
        else{
            if (txtLogin.hasText()){
            var Data: NSData? = nil //contient le data JSON
            
                Data = getJSON("https://demo7680848.mockable.io/Modifier") //si web à analyser
            if(Data != nil){ //validation du data reçus
                let readableJSON = JSON(data: Data!, options: NSJSONReadingOptions.MutableContainers, error: nil)
                
                
                ViewController.user?.Usager = readableJSON.arrayObject![0] as! String
                
                ViewController.user?.Ble = readableJSON.arrayObject![1] as! Bool
                
                ViewController.user?.Lait = readableJSON.arrayObject![2] as! Bool
                
                ViewController.user?.Oeuf = readableJSON.arrayObject![3] as! Bool
                
                ViewController.user?.Arachide = readableJSON.arrayObject![4] as! Bool
                
                ViewController.user?.Soja = readableJSON.arrayObject![5] as! Bool
                
                ViewController.user?.Coque = readableJSON.arrayObject![6] as! Bool
                
                ViewController.user?.Poisson = readableJSON.arrayObject![7] as! Bool
                
                ViewController.user?.Sesame = readableJSON.arrayObject![8] as! Bool
                
                ViewController.user?.Crustace = readableJSON.arrayObject![9] as! Bool
                
                ViewController.user?.Molusque = readableJSON.arrayObject![10] as! Bool
                
                txtAlert.text = "Préférences enregistrées"
                
                self.viewDidLoad()
                
                }
            }
            else{
                txtAlert.text = "Veuillez entrer votre nouveau nom !"
            }
            
            if (nametemp == ViewController.user?.Usager)
            {
                txtAlert.text = "Vos alergies ont été sauvegardées, mais le nom d'usager existe déjà !"
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txtLogin.text = ViewController.user?.Usager
        
        switchBle.setOn((ViewController.user?.Ble)!, animated: true)
        
        switchLait.setOn((ViewController.user?.Lait)!, animated: true)
        
        switchOeuf.setOn((ViewController.user?.Oeuf)!, animated: true)
        
        switchArachide.setOn((ViewController.user?.Arachide)!, animated: true)
        
        switchSoja.setOn((ViewController.user?.Soja)!, animated: true)
        
        switchCoque.setOn((ViewController.user?.Coque)!, animated: true)
        
        switchPoisson.setOn((ViewController.user?.Poisson)!, animated: true)
        
    
        switchSesame.setOn((ViewController.user?.Sesame)!, animated: true)
        
        switchCrustace.setOn((ViewController.user?.Crustace)!, animated: true)
        
        switchMollusque.setOn((ViewController.user?.Molusque)!, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Pour obtenir le json
        func getJSON(urlToRequest: String) -> NSData{
            return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
        }
    
}