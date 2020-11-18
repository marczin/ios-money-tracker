//
//  DateTransation.swift
//  money-spender
//
//  Created by Marcin Rosół on 14/11/2020.
//

import UIKit

final class DateTransation: UIView {


    //MARK: - declaration
    let iconImage: UIImageView = {
        let iconImage = UIImageView()
        let icon = UIImage(systemName: "applelogo")
        iconImage.image = icon
        return iconImage
    }()

    let datepicker = UIDatePicker()
    
    lazy var dateField : UITextField = {
        let dateField = UITextField()
        dateField.inputView = datepicker
        dateField.attributedPlaceholder = NSAttributedString(
            string: "Date",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.orange])
        return dateField
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
        
        addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        addSubview(dateField)
        dateField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(iconImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

