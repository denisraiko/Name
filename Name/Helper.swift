//
//  Helper.swift
//  Name
//
//  Created by Denis Raiko on 21.01.25.
//

import Foundation

protocol helperProtocol {
    var numbers: [Int] { get }
    
    func addNumber(_ number: Int)
    func getNumbers() -> [Int]
}

public class Helper: helperProtocol {
    var numbers: [Int] = []
    
    func addNumber(_ number: Int) {
        numbers.append(number)
    }
    
    func getNumbers() -> [Int] {
        numbers
    }
}
