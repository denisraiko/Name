//
//  ViewController.swift
//  Name
//
//  Created by Denis Raiko on 20.01.25.
//

import UIKit

class ViewController: UIViewController {
    
    private let helper = Helper()
    private let people = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateNumbers()
        updatePeople()
       
        
    }
    
    private func updateNumbers() {
        self.helper.addNumber(Int.random(in: 1...10))
        
        for number in helper.getNumbers() {
            print(number)
        }
    }
    
    private func updatePeople() {
        self.people.addPeople(["Denis", "Ann"])
        
        for people in people.getPeople() {
            print(people)
        }
        
    }


}

