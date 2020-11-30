//
//  DescriptionTransaction.swift
//  money-spender
//
//  Created by Marcin Rosół on 23/11/2020.
//

import UIKit

final class DescriptionTransaction: UIView {
    
    //MARK: - declaration
    let descriptionField: UITextField = {
        let descriptionField = UITextField()
        descriptionField.sizeToFit()
        descriptionField.attributedPlaceholder = NSAttributedString(
            string: "Description",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.orange])
        return descriptionField
    }()
    
    // MARK: - initial

    init() {
        super.init(frame: .zero)
        doLayout()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK: - functions
    fileprivate func doLayout() {
        addSubview(descriptionField)
        descriptionField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
        }
    }
}
