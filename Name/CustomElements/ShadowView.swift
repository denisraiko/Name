//
//  ShadowView.swift
//  Name
//
//  Created by Denis Raiko on 3.02.25.
//

import Foundation
import UIKit

class ShadowView: UIView {
    
    private let imageView = UIImageView()
    
    init(imageName: String) {
        super.init(frame: .zero)
        setupView()
        setupImageView(imageName)
        setupLayout()
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

extension ShadowView {
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - Setup View

extension ShadowView {
    private func setupImageView(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
    }
    
    private func setupView() {
        layer.cornerRadius = 20
        layer.backgroundColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
    }
}

