//
//  DetailsRepasViewController.swift
//  ProjetRestoRapidoIOS
//
//  Created by Device on 2016-03-08.
//  Copyright © 2016 Device. All rights reserved.
//

import Foundation
import UIKit

public class DetailsRepasViewController : UIViewController {
    @IBOutlet weak var txtdescription: UITextView!
    @IBOutlet weak var lblqte: UILabel!
    @IBOutlet weak var lblprix: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var topBar: UINavigationBar!
    var toPass:Int = 0
    
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
    }
    
    @IBAction func AjouterPanierClick(sender: AnyObject) {
        var temp : Int = -1
        for (var i : Int = 0; i < PanierController.panier.count; i++) {
            if (PanierController.panier[i].id == toPass) {
                temp = i
            }
        }
        
        if (temp != -1) {
            PanierController.panier += [RepasPanier(_Id: MenuTableViewController.repas[temp].id, _Nom: MenuTableViewController.repas[temp].nom, _Image: MenuTableViewController.repas[temp].Image, _Prix: MenuTableViewController.repas[temp].prix, _Description: MenuTableViewController.repas[temp].description, _boBle: MenuTableViewController.repas[temp].boBle, _boLait: MenuTableViewController.repas[temp].boLait, _boOeuf: MenuTableViewController.repas[temp].boOeuf, _boArachide: MenuTableViewController.repas[temp].boArachide, _boSoja: MenuTableViewController.repas[temp].boSoja, _boFruitCoque: MenuTableViewController.repas[temp].boFruitCoque, _boPoisson: MenuTableViewController.repas[temp].boPoisson, _boSesame: MenuTableViewController.repas[temp].boSesame, _boCrustace: MenuTableViewController.repas[temp].boCrustace, _boMollusque: MenuTableViewController.repas[temp].boMollusque, _qte: Int(lblqte.text!)!)]
        }
        else {
            PanierController.panier[temp].Qte += Int(lblqte.text!)!
        }
    }
}