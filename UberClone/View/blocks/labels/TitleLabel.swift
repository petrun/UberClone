//
//  TitleLabel.swift
//  UberClone
//
//  Created by andy on 13.03.2021.
//

import UIKit

class TitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)

        font = UIFont(name: "Avenir-Light", size: 36)
        textColor = UIColor(white: 1, alpha: 0.8)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
