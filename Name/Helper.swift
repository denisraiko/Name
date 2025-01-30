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
        self.users.append(user)
    }
    
    func addUsers(_ users: [User]) {
        self.users.append(contentsOf: users)
    }
    
    func getUsers() -> [User] {
        return users
    }
}
