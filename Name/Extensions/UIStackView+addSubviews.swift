//
//  UIStackView+addSubviews.swift
//  Name
//
//  Created by Denis Raiko on 4.02.25.
//

import Foundation
import UIKit

extension UIStackView {
    func addSubview(views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
