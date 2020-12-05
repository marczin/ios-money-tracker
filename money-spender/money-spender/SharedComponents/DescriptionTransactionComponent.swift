//
//  DescriptionTransaction.swift
//  money-spender
//
//  Created by Marcin Rosół on 23/11/2020.
//

import UIKit

final class DescriptionTransactionComponent: UIView {
    
    //MARK: - declaration
    lazy var descriptionField: UITextField = {
        let descriptionField = UITextField()
        descriptionField.sizeToFit()
        descriptionField.inputAccessoryView = toolbar
        descriptionField.attributedPlaceholder = NSAttributedString(
            string: "Description",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.orange])
        return descriptionField
    }()
    
    let barButtonItem = UIBarButtonItem()
    
    lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.setItems([barButtonItem], animated: false)
        toolbar.sizeToFit()
        toolbar.barStyle = .default
        return toolbar
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
