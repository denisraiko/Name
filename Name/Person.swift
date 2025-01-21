//
//  Person.swift
//  Name
//
//  Created by Denis Raiko on 21.01.25.
//

import Foundation

class Person {
    var firstName = "Denis"
    var secondName = "Raiko"
    
    var fullName: String {
        firstName + secondName
    }
}
