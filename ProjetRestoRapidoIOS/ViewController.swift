//
//  ViewController.swift
//  ProjetRapidoRestoIOS
//
//  Created by Professeur on 2016-02-12.
//  Copyright (c) 2016 RestoRapido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtCourriel: UITextField!
    @IBOutlet weak var txtMdp: UITextField!
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnConnect(sender: AnyObject) {
        var Data: NSData? = nil //contient le data JSON
        
        if(txtCourriel.text != "" && txtMdp.text != ""){ //Validation de champ non vide au login
            Data = getJSON("https://www.googleapis.com/calendar/v3/calendars/calendarId") //si web à analyser
            if(Data != nil){ //validation du data reçus
                self.performSegueWithIdentifier("Menu", sender: nil) //affiche la page en Segue
            }
        }
    }
    
    
    //Pour obtenir le json
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }}

