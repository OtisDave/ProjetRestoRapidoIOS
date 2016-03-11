//
//  PanierController.swift
//  ProjetRapidoRestoIOS
//
//  Created by Francis on 2016-02-26.
//  Copyright (c) 2016 RestoRapido. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

public class PanierController : UITableViewController {
    @IBOutlet weak var cmdSupprimer: UIButton!
    @IBOutlet var lstRepasPanier: UITableView!
    @IBOutlet weak var lblPrixTotal: UILabel!
    //@IBOutlet var lstRepasPanier: UITableView!
    //@IBOutlet weak var cmdSupprimer: UIBarButtonItem!
    //@IBOutlet weak var lblPrixTotal: UILabel!
    public static var panier = [RepasPanier]()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        var PrixTotal : Float = 0.0
        for (var i : Int = 0; i < PanierController.panier.count; i++)
        {
            PrixTotal += PanierController.panier[i].prix * Float(PanierController.panier[i].Qte)
        }
        
        lblPrixTotal.text = "Prix Total: " + String(PrixTotal)
        
        cmdSupprimer.enabled = false
    }
    
    /*@IBAction func SupprimerClick(sender: AnyObject) {
        let indexPath = lstRepasPanier.indexPathForSelectedRow!
        let currentCell = lstRepasPanier.cellForRowAtIndexPath(indexPath)! as! PanierTableViewCell
        
        for (var i : Int = 0; i < PanierController.panier.count; i++)
        {
            if (currentCell.id == PanierController.panier[i].id)
            {
                PanierController.panier.removeAtIndex(i)
            }
        }
        
        lstRepasPanier.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        viewDidLoad()
    }*/
    
    /*@IBAction func PayerClick(sender: AnyObject) {
        
    }*/
    
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PanierController.panier.count
    }
    
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PanierTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PanierTableViewCell
        
        let repasPanier = PanierController.panier[indexPath.row]
        
        cell.id = repasPanier.id
        cell.imgRepas.image = repasPanier.Image
        cell.lblQte.text = String(repasPanier.Qte)
        cell.lblPrix.text = String(repasPanier.prix)
        cell.lblNom.text = repasPanier.nom
        
        return cell
    }
}