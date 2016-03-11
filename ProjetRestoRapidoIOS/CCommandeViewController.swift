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

public class CCommandeViewController: UITableViewController
{
    @IBOutlet var tableCell: UITableView!
    
    
    public static var cmd = [CCommande]()
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        //charge les repas
        loadCommandes()
    }
    
    func parseJSON()-> JSON{
        let jsonData = NSData(contentsOfFile: "/Users/Prof/Downloads/TestCommandesPourIOs.txt") as NSData!
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
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "LinkRating") {
            let svc = segue.destinationViewController as! RepasCommandeController;
            
            let indexPath = tableCell.indexPathForSelectedRow!
            let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! CommandeTableViewCell
            
            svc.CmdID = currentCell.CmdId
        }
    }
    
    func loadCommandes()
    {
        
        if(CCommandeViewController.cmd.count == 0)
        {
            
            //var readableJSON = parseJSON()
            var lstRepas : [RepasCommande] = [RepasCommande]()
            
            
             lstRepas += [RepasCommande(_Id: 1, _Commentaires: "dedede", _Etoiles: 4, _cmdRepas: 1,_cmd: 1)]
            
            CCommandeViewController.cmd += [CCommande(_Id: 1, _status: 1, _Prix: 2.22, _PrixTaxe: 2.40, _Date: "3333/33/33", _lstRepas: lstRepas)]
            
            
            
         /*
      //      var coucou = readableJSON.count
            for(var i : Int = 0; i < readableJSON.count; i++)
            {
                lstRepas = [RepasCommande]()
                
                
        //        var coucou1 = readableJSON[i]
                
                for (var j : Int = 0; j < readableJSON[i][5].count; j++)
                {
                    
                    lstRepas += [RepasCommande(_Id: readableJSON[i][2][j][0].int!, _Commentaires: readableJSON[i][2][j][1].string!, _Etoiles: readableJSON[i][2][j][2].int!, _cmdRepas: readableJSON[i][2][j][3].int!,_cmd: readableJSON[i][0].int!)]
                    
                }
                
                
                
                
                
                CCommandeViewController.cmd += [CCommande(_Id: readableJSON[i][0].int!, _status: readableJSON[i][1].int!, _Prix: readableJSON[i][2].float!, _PrixTaxe: readableJSON[i][3].float!, _Date: String(readableJSON[i][4]), _lstRepas : lstRepas)]
            }

                */
        }
    }
    
    
    
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CCommandeViewController.cmd.count
    }
    
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "CommandeTableViewCell"
        
        let cell = tableCell.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CommandeTableViewCell
        
        let commande = CCommandeViewController.cmd[indexPath.row]
        
        cell.CmdId = commande.cmdId
        cell.lblDate.text = commande.cmdDate
        cell.lblPrix.text = String(commande.cmdPrix)
        cell.lblPrixTaxe.text = String(commande.cmdPrixTaxe)

        
        
        return cell
    }
}

