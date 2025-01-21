//
//  ViewController.swift
//  Name
//
//  Created by Denis Raiko on 20.01.25.
//

import UIKit

class ViewController: UIViewController {
    
    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullName = person.fullName

        print(fullName)
        
    }


}

