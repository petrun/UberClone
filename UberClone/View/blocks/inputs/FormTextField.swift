//
//  FormTextField.swift
//  UberClone
//
//  Created by andy on 13.03.2021.
//

import UIKit

class FormTextField {

    private init() {}

    static func initFrom(placeholder: String, isSecureTextEntry: Bool = false) -> UITextField {
        let textField = UITextField()

        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.isSecureTextEntry = isSecureTextEntry

        return textField
    }

}
