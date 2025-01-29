//
//  Helper.swift
//  Name
//
//  Created by Denis Raiko on 21.01.25.
//

import Foundation

class Helper {
    var users: [User] = []
    
    func addUser(_ user: User) {
        users.append(user)
    }
    
    func getUsers() -> [User] {
        return users
    }
}
