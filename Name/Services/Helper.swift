//
//  Helper.swift
//  Name
//
//  Created by Denis Raiko on 21.01.25.
//

import Foundation

protocol NumberManageable {
    func addUser(_ user: User)
    func addUsers(_ users: [User])
    func getUsers() -> [User]
    
    func addNumber(_ number: Int)
    func getNumbers() -> [Int]
    func getRandomNumber() -> Int
}

class Helper: NumberManageable {
    private var users: [User] = []
    private var number: [Int] = []
    
    func addUser(_ user: User) {
        self.users.append(user)
    }
    
    func addUsers(_ users: [User]) {
        self.users.append(contentsOf: users)
    }
    
    func getUsers() -> [User] {
        return users
    }
    
    func addNumber(_ number: Int) {
        self.number.append(number)
    }
    
    func getNumbers() -> [Int] {
        return number
    }
    
    func getRandomNumber() -> Int {
        number.randomElement() ?? 0
    }
}
