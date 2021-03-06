//
//  MenuTableViewController.swift
//  ProjetRapidoRestoIOS
//
//  Created by Francis on 2016-02-26.
//  Copyright (c) 2016 RestoRapido. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

public class MenuTableViewController : UITableViewController {
    @IBOutlet var lstRepas: UITableView!
    
    public static var repas = [Repas]()

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //charge les repas
        loadSimpleRepas()
    }
    
    //Pour obtenir le json
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "linkMenuDetails") {
            let svc = segue.destinationViewController as! DetailsRepasViewController;
            
            let indexPath = lstRepas.indexPathForSelectedRow!
            let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! MenuTableViewCell
            
            svc.toPass = currentCell.id
        }
    }
    
    func parseJSON()-> JSON{
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
        
        var jsonData: NSData? = nil //contient le data JSON
        jsonData = getJSON("https://projetrestorapidoc.azurewebsites.net/api/ApiRepas/" + alergie)
        let readableJSON = JSON(data:jsonData!, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        return readableJSON
    }
    
    func loadSimpleRepas(){
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
    }
}
