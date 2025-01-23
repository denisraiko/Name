//
//  Helper.swift
//  Name
//
//  Created by Denis Raiko on 21.01.25.
//

import Foundation

class Helper {
    private var numbers: [Int] = []
    
    func addNumber(_ number: Int) {
        numbers.append(number)
    }
    
    func getNumbers() -> [Int] {
        numbers
    }
}
