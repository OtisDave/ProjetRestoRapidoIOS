//
//  PageItemController.swift
//  Paging_Swift
//
//  Created by Olga Dalton on 26/10/14.
//  Copyright (c) 2014 swiftiostutorials.com. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {
    
    // MARK: - Variables
    var itemIndex: Int = 0
    var imageName: String = ""
    var nomRepas : String = ""
    var RateStar : Int = 1
        
        {
        
        didSet {
            
            
        }
    }
    
    
    @IBOutlet weak var LblNom: UILabel!
    
    @IBOutlet weak var TxtCommentaire: UITextField!
    
    @IBOutlet weak var ImgRepas: UIImageView!
    
    @IBOutlet weak var Star1: UIView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        LblNom.text = nomRepas
    }
}
