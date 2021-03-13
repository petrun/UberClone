//
//  AttributedButton.swift
//  UberClone
//
//  Created by andy on 13.03.2021.
//

import UIKit

class AttributedButton {

    private init() {}

    static func initFrom(attributes: [(title: String, color: UIColor)]) -> UIButton {
        let button = UIButton()
        guard let firstAttribute = attributes.first else { return button }
        let attributedTitle = NSMutableAttributedString(string: firstAttribute.title, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: firstAttribute.color
        ])

        if attributes.count == 1 {
            return button
        }

        for index in 1..<attributes.count {
            let attribute = attributes[index]
            attributedTitle.append(NSAttributedString(string: attribute.title, attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: attribute.color
            ]))
        }

        button.setAttributedTitle(attributedTitle, for: .normal)

        return button
    }

}
