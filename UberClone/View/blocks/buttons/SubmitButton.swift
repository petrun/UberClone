//
//  SubmitButton.swift
//  UberClone
//
//  Created by andy on 13.03.2021.
//

import UIKit

class SubmitButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        backgroundColor = UI.mainBlueTint
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
