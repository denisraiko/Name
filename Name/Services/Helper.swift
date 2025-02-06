//
//  Helper.swift
//  Name
//
//  Created by Denis Raiko on 21.01.25.
//

import Foundation

class Helper {
    private var users: [User] = []
    
    func addUser(_ user: User) {
        self.users.append(user)
    }
    
    func addUsers(_ users: [User]) {
        self.users.append(contentsOf: users)
    }
    
    func getUsers() -> [User] {
        return users
    }
    
    
    private var number: [Int] = []
    
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
