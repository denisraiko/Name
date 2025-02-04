//
//  UIView+Gradient.swift
//  Name
//
//  Created by Denis Raiko on 4.02.25.
//

import Foundation
import UIKit

extension UIView {
    
    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.opacity = 0.6
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        layer.insertSublayer(gradient, at: 0)
    }
}
