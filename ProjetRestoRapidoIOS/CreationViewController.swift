//
//  CreationViewController.swift
//  ProjetRestoRapidoIOS
//
//  Created by Device on 2016-03-08.
//  Copyright © 2016 Device. All rights reserved.
//

import Foundation
import UIKit


class CreationViewController : UIViewController {
    
    
    @IBOutlet weak var txtPrenom: UITextField!
    @IBOutlet weak var txtNom: UITextField!
    @IBOutlet weak var txtCourriel: UITextField!
    @IBOutlet weak var txtMdp: UITextField!
    
    
    @IBOutlet weak var swiBle: UISwitch!
    @IBOutlet weak var swiCoque: UISwitch!
    @IBOutlet weak var swiLait: UISwitch!
    @IBOutlet weak var swiPoisson: UISwitch!
    @IBOutlet weak var swiOeuf: UISwitch!
    @IBOutlet weak var swiSesame: UISwitch!
    @IBOutlet weak var swiArachide: UISwitch!
    @IBOutlet weak var swiCrustace: UISwitch!
    @IBOutlet weak var swiSoja: UISwitch!
    @IBOutlet weak var swiMollusque: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    @IBAction func btnCreerClick(sender: AnyObject) {
    }
}
