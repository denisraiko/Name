//
//  ViewController.swift
//  Name
//
//  Created by Denis Raiko on 20.01.25.
//

import UIKit

class ViewController: UIViewController {
    
   private  let person = Person()
    private let helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullName = person.fullName
        print(fullName)
        
        updateNumbers()
        
       
        
    }
    
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10))
        for number in helper.getNumbers() {
            print(number)
        }
    }


}

