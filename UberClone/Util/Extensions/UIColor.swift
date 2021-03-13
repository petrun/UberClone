//
//  UIColor.swift
//  UberClone
//
//  Created by andy on 12.03.2021.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}
