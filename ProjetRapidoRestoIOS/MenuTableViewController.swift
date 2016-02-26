//
//  MenuTableViewController.swift
//  ProjetRapidoRestoIOS
//
//  Created by Francis on 2016-02-26.
//  Copyright (c) 2016 RestoRapido. All rights reserved.
//

import Foundation
import UIKit

class MenuTableViewController : UITableViewController {
    
    var repas = [Repas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //charge les repas
        loadSimpleRepas()
    }
    
    func loadSimpleRepas(){
        
        let Repas1 = Repas(_Nom: "Spag",_Description: "Du spag criss",_Image: UIImage(named: "Spag")!)
        let Repas2 = Repas(_Nom: "Pizza", _Description: "Devine quoi? de la pizza criss",_Image: UIImage(named: "Pizza")!)
        let Repas3 = Repas(_Nom: "Morve", _Description: "Beurk",_Image: UIImage(named: "Morve")!)
        let Repas4 = Repas(_Nom: "dulci popo", _Description: "miam")
        
        repas += [Repas1,Repas2,Repas3,Repas4]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repas.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MenuTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MenuTableViewCell
        
        let repa = repas[indexPath.row]
        
        cell.LblTitre.text = repa.nom
        cell.TxtDescription.text = repa.description
        cell.ImgRepas.image = repa.Image
        
        
        return cell
    }
    
}
