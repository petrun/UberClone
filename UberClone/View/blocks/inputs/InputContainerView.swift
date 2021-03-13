//
//  InputContainerView.swift
//  UberClone
//
//  Created by andy on 13.03.2021.
//

import UIKit


class InputContainerView {
    
    private init() {}

    static func initFrom(iconName: String?, field: UIView, showSeparator: Bool = true) -> UIView {
        let view = UIView()
        var fieldLeftEqualTo = view.snp.left

        if let iconName = iconName {
            let image = UIImage(
                systemName: iconName,
                withConfiguration: UIImage.SymbolConfiguration(weight: .regular)
            )?.withTintColor(.white, renderingMode: .alwaysOriginal)

            let imageView = UIImageView()
            imageView.image = image
            imageView.alpha = 0.85
            view.addSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.centerY.equalTo(view)
                make.left.equalTo(view.snp.left).offset(8)
            }
            fieldLeftEqualTo = imageView.snp.right
        }

        view.addSubview(field)
        field.snp.makeConstraints { make in
            make.right.equalTo(view).offset(-8)
            make.left.equalTo(fieldLeftEqualTo).offset(8)
            make.centerY.equalTo(view)
        }

        if showSeparator {
            let separatorView = UIView()
            separatorView.backgroundColor = .lightGray
            view.addSubview(separatorView)
            separatorView.snp.makeConstraints { make in
                make.left.equalTo(view).offset(8)
                make.right.equalTo(view)
                make.bottom.equalTo(view)
                make.height.equalTo(0.75)
            }
        }

        view.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

        return view
    }

}
