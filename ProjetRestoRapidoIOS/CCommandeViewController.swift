//
//  CCommandeViewController.swift
//  ProjetRestoRapidoIOS
//
//  Created by Professeur on 2016-03-10.
//  Copyright © 2016 Device. All rights reserved.
//

import SwiftyJSON
import Foundation
import UIKit

public class CCommandeViewController: UIViewController
{
    
    @IBOutlet weak var TableCommande: UITableView!
    public static var cmd = [CCommande]()
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        //charge les repas
        loadCommandes()
    }
    
    func parseJSON()-> JSON{
        let jsonData = NSData(contentsOfFile: "/Users/Prof/Downloads/avecpick.txt") as NSData!
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
    
    
    func loadCommandes()
    {
        
        if(CCommandeViewController.cmd.count == 0)
        {
            
            var readableJSON = parseJSON()
            var lstRepas : [RepasCommande]
            for(var i : Int = 0; i < readableJSON.count ; i++)
            {
                lstRepas = [RepasCommande]()
                
                for (var j : Int = 0; i < readableJSON[i][5].count; j++)
                {
                    
                    lstRepas += [RepasCommande(_Id: readableJSON[i][5][j][0].int!, _Commentaires: readableJSON[i][5][j][1].string!, _Etoiles: readableJSON[i][5][j][2].int!, _cmdRepas: readableJSON[i][5][j][3].int!,_cmd: readableJSON[i][0].int!)]
                    
                }
                
                
                
                
                
                CCommandeViewController.cmd += [CCommande(_Id: readableJSON[i][0].int!, _status: readableJSON[i][1].int!, _Prix: readableJSON[i][2].float!, _PrixTaxe: readableJSON[i][3].float!, _Date: String(readableJSON[i][4]), _lstRepas : lstRepas)]
            }
        }
    }
}

