//
//  DetailsRepasViewController.swift
//  ProjetRestoRapidoIOS
//
//  Created by Device on 2016-03-08.
//  Copyright © 2016 Device. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

public class DetailsRepasViewController : UIViewController {
    @IBOutlet weak var lblCote: UILabel!
    @IBOutlet weak var txtdescription: UITextView!
    @IBOutlet weak var lblqte: UILabel!
    @IBOutlet weak var lblprix: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var topBar: UINavigationBar!
    var toPass:Int = 0
    
    //Pour obtenir le json
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "Swipping:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "Swipping:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        for(var i : Int = 0; i < MenuTableViewController.repas.count; i++)
        {
            if(MenuTableViewController.repas[i].id == toPass)
            {
                toPass = i
            }
        }
        
        Afficher()
    }
    
    @IBAction func sliding(sender: AnyObject) {
        lblqte.text = String(Int((sender as! UISlider).value))
    }
    
    @IBAction func Swipping(sender: UISwipeGestureRecognizer) {
        if let swipeGesture = sender as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                toPass = (toPass + 1) % MenuTableViewController.repas.count
                Afficher()
            case UISwipeGestureRecognizerDirection.Left:
                toPass = (toPass - 1 + MenuTableViewController.repas.count) % MenuTableViewController.repas.count
                Afficher()
            default:
                break
            }
        }
    }
    
    @IBAction func btnAjouter(sender: AnyObject) {
    }
    
    func Afficher()
    {
        topBar.topItem!.title = MenuTableViewController.repas[toPass].nom
        lblprix.text = String(MenuTableViewController.repas[toPass].prix)
        txtdescription.text = MenuTableViewController.repas[toPass].description
        image.image = MenuTableViewController.repas[toPass].Image
        
        var alergie : String = ""
        
        if((ViewController.user?.Ble) != nil){ alergie += "1"}else{alergie += "0"}
        if((ViewController.user?.Lait) != nil){ alergie += "1"}else{alergie += "0"}
        if((ViewController.user?.Oeuf) != nil){ alergie += "1"}else{alergie += "0"}
        if((ViewController.user?.Arachide) != nil){ alergie += "1"}else{alergie += "0"}
        if((ViewController.user?.Soja) != nil){ alergie += "1"}else{alergie += "0"}
        if((ViewController.user?.Coque) != nil){ alergie += "1"}else{alergie += "0"}
        if((ViewController.user?.Poisson) != nil){ alergie += "1"}else{alergie += "0"}
        if((ViewController.user?.Sesame) != nil){ alergie += "1"}else{alergie += "0"}
        if((ViewController.user?.Crustace) != nil){ alergie += "1"}else{alergie += "0"}
        if((ViewController.user?.Molusque) != nil){ alergie += "1"}else{alergie += "0"}
        
        var cote : Int = 0
        var nbcote : Int = 0
        var jsonData: NSData? = nil //contient le data JSON
        jsonData = getJSON("https://projetrestorapidoc.azurewebsites.net/api/CmdRepas/" + alergie)
        let readableJSON = JSON(data:jsonData!, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        for (var i : Int = 0; i < readableJSON.count; i++)
        {
            if(readableJSON[i][4].int == MenuTableViewController.repas[toPass].id)
            {
                cote += readableJSON[i][3].int!
                nbcote += 1
            }
        }
        lblCote.text = "Cote sur 5: " + String(cote/nbcote)
    
        
    }
    
    @IBAction func AjouterPanierClick(sender: AnyObject) {
        var temp : Int = -1
        for (var i : Int = 0; i < PanierController.panier.count; i++) {
            if (PanierController.panier[i].id == MenuTableViewController.repas[toPass].id) {
                temp = i
            }
        }
        
        if (temp == -1) {
            PanierController.panier += [RepasPanier(_Id: MenuTableViewController.repas[toPass].id, _Nom: MenuTableViewController.repas[toPass].nom, _Image: MenuTableViewController.repas[toPass].Image, _Prix: MenuTableViewController.repas[toPass].prix, _Description: MenuTableViewController.repas[toPass].description, _boBle: MenuTableViewController.repas[toPass].boBle, _boLait: MenuTableViewController.repas[toPass].boLait, _boOeuf: MenuTableViewController.repas[toPass].boOeuf, _boArachide: MenuTableViewController.repas[toPass].boArachide, _boSoja: MenuTableViewController.repas[toPass].boSoja, _boFruitCoque: MenuTableViewController.repas[toPass].boFruitCoque, _boPoisson: MenuTableViewController.repas[toPass].boPoisson, _boSesame: MenuTableViewController.repas[toPass].boSesame, _boCrustace: MenuTableViewController.repas[toPass].boCrustace, _boMollusque: MenuTableViewController.repas[toPass].boMollusque, _qte: Int(lblqte.text!)!)]
        }
        else {
            PanierController.panier[temp].Qte += Int(lblqte.text!)!
        }
    }
}