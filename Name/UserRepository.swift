//
//  UserRepository.swift
//  Name
//
//  Created by Denis Raiko on 30.01.25.
//

import Foundation

class UserRepository {
    let users: [User] = [
        User(login: "denis123", password: "pass123", personInfo: Person(firstName: "Denis", lastName: "Raiko")),
        User(login: "ann456", password: "pass456", personInfo: Person(firstName: "Ann", lastName: "Petrova")),
        User(login: "Kolya123", password: "123", personInfo: Person(firstName: "Kolya", lastName: "Ivanov")),
        User(login: "Ivan123", password: "234", personInfo: Person(firstName: "Ivan", lastName: "Nikitin"))
    ]
    
    func getUsers() -> [User] {
        return users
    }
}
