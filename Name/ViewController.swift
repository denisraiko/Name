//
//  ViewController.swift
//  Name
//
//  Created by Denis Raiko on 20.01.25.
//

import UIKit

class ViewController: UIViewController {
    
    var firstName = "Denis"
    var secondName = "Raiko"
    
    var fullName: String {
        firstName + secondName
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        print(fullName)
        
    }


}

