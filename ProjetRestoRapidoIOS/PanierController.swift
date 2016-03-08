//
//  PanierController.swift
//  ProjetRapidoRestoIOS
//
//  Created by Francis on 2016-02-26.
//  Copyright (c) 2016 RestoRapido. All rights reserved.
//

import Foundation
import UIKit

public class PanierController : UITableViewController {
    public static var panier = [RepasPanier]()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*func loadSimpleRepas(){
        if(MenuTableViewController.repas.count == 0)
        {
            var readableJSON = parseJSON()
            
            for(var i : Int = 0; i < readableJSON.count ; i++)
            {
                var base64String = readableJSON[i][2].stringValue
                var imageString = base64String as NSString
                //base64 string to NSData
                let decodedData = NSData(base64EncodedString: imageString as String, options: NSDataBase64DecodingOptions(rawValue: 0))
                
                //NSData to UIImage
                var decodedImage = UIImage(data: decodedData!)
                if(decodedImage == nil)
                {
                    decodedImage = UIImage(named: "images")
                }
                
                MenuTableViewController.repas += [Repas(_Id: readableJSON[i][0].int!, _Nom: readableJSON[i][1].string!, _Image: decodedImage!, _Prix: readableJSON[i][3].float!, _Description: readableJSON[i][4].string!, _boBle: readableJSON[i][5].bool!, _boLait: readableJSON[i][6].bool!, _boOeuf: readableJSON[i][7].bool!, _boArachide: readableJSON[i][8].bool!, _boSoja: readableJSON[i][9].bool!, _boFruitCoque: readableJSON[i][10].bool!, _boPoisson: readableJSON[i][11].bool!, _boSesame: readableJSON[i][12].bool!, _boCrustace: readableJSON[i][13].bool!, _boMollusque: readableJSON[i][14].bool!)]
            }
            
        }
    }
    
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuTableViewController.repas.count
    }
    
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MenuTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MenuTableViewCell
        
        let repa = MenuTableViewController.repas[indexPath.row]
        
        cell.id = repa.id
        cell.LblTitre.text = repa.nom
        cell.TxtDescription.text = repa.description
        cell.ImgRepas.image = repa.Image
        
        
        return cell
    }*/
}