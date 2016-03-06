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

class MenuTableViewController : UITableViewController {
    
    var repas = [Repas]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //charge les repas
        loadSimpleRepas()
    }
    
    func parseJSON()-> JSON{
        let jsonData = NSData(contentsOfFile: "/Users/device/Downloads/tarlouse2.txt") as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        /*Pour la version avec url
        var readableJSON : JSON = nil
        let url = NSURL(string: "azure")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if error == nil{
                var readableJSON = JSON(data: data!)
                NSLog("\(readableJSON)")
        
            }
            else
            {
                print("error")
            }
        }*/
        /*task.resume()*/
        
        return readableJSON
    }
    
    func loadSimpleRepas(){
        var readableJSON = parseJSON()
        
        for(var i : Int = 0; i < readableJSON.count ; i++)
        {
            repas += [Repas(_Id: readableJSON[i][0].int!, _Nom: readableJSON[i][1].string!, _Prix: readableJSON[i][2].float!, _Description: readableJSON[i][3].string!, _boBle: readableJSON[i][4].bool!, _boLait: readableJSON[i][5].bool!, _boOeuf: readableJSON[i][6].bool!, _boArachide: readableJSON[i][7].bool!, _boSoja: readableJSON[i][8].bool!, _boFruitCoque: readableJSON[i][9].bool!, _boPoisson: readableJSON[i][9].bool!, _boSesame: readableJSON[i][10].bool!, _boCrustace: readableJSON[i][11].bool!, _boMollusque: readableJSON[i][12].bool!, _Image: UIImage(named: "Spag")!)]
        }
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
