//
//  ViewController.swift
//  Name
//
//  Created by Denis Raiko on 20.01.25.
//

import UIKit

class ViewController: UIViewController {
    
    private let helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUsers()
    }
    
    private func updateUsers() {
        helper.addUser(User(login: "denis123", password: "pass123", personInfo: Person(firstName: "Denis", lastName: "Raiko")))
        helper.addUser(User(login: "ann456", password: "pass456", personInfo: Person(firstName: "Ann", lastName: "Petrova")))
        
        for user in helper.getUsers() {
            print("\(user.personInfo.firstName) \(user.personInfo.lastName)")
        }
    }
}

