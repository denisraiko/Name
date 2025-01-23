//
//  Person.swift
//  Name
//
//  Created by Denis Raiko on 21.01.25.
//

import Foundation

protocol personProtocol {
    var people: [String] { get }
    func addPeople(_ people: [String])
    func getPeople() -> [String]

}

public class Person: personProtocol {
    var people: [String] = []
    
    func addPeople(_ people: [String]) {
        self.people.append(contentsOf: people)
    }
    
    func getPeople() -> [String] {
        self.people
    }
    
    
    
}
