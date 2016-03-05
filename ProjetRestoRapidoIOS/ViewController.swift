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
    
    var Data: NSData? = nil
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnConnect(sender: AnyObject) {
        if(txtCourriel.text != "" && txtMdp.text != ""){
            Data = getJSON("https://www.googleapis.com/calendar/v3/calendars/calendarId")
            if(Data != nil){
                self.performSegueWithIdentifier("Menu", sender: nil)
            }
        }
    }
    
    
    //Pour obtenir le json
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }}

