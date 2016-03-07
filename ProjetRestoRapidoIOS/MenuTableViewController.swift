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
        let jsonData = NSData(contentsOfFile: "/Users/device/Downloads/avecpick.txt") as NSData!
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
            
            repas += [Repas(_Id: readableJSON[i][0].int!, _Nom: readableJSON[i][1].string!, _Image: decodedImage!, _Prix: readableJSON[i][3].float!, _Description: readableJSON[i][4].string!, _boBle: readableJSON[i][5].bool!, _boLait: readableJSON[i][6].bool!, _boOeuf: readableJSON[i][7].bool!, _boArachide: readableJSON[i][8].bool!, _boSoja: readableJSON[i][9].bool!, _boFruitCoque: readableJSON[i][10].bool!, _boPoisson: readableJSON[i][11].bool!, _boSesame: readableJSON[i][12].bool!, _boCrustace: readableJSON[i][13].bool!, _boMollusque: readableJSON[i][14].bool!)]
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
