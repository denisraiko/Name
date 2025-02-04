//
//  Button.swift
//  Name
//
//  Created by Denis Raiko on 3.02.25.
//

import Foundation
import UIKit

class Button: UIButton {
    
    var isShadow = true
    
    init(buttonName: String, color: UIColor, isShadow: Bool) {
        super.init(frame: .zero)
        setupButton(buttonName: buttonName, color: color, isShadow: isShadow)
        if isShadow {
            setupShadow()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}

// MARK: - Setup Layout

extension Button {
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor),
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - Setup View

extension Button {
    private func setupButton(buttonName: String, color: UIColor, isShadow: Bool) {
        setTitle(buttonName, for: .normal)
        backgroundColor = color
        frame = CGRect(x: 100, y: 150, width: 150, height: 50)
        layer.cornerRadius = 15
    }
    
    private func setupShadow() {
        layer.cornerRadius = 15
        layer.shadowRadius = 15
        layer.borderColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowOpacity = 0.7
    }
}
