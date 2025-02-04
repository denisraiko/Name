//
//  UIView+addSubviews.swift
//  Name
//
//  Created by Denis Raiko on 4.02.25.
//

import Foundation
import UIKit

extension UIView {
    func addViews(views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
