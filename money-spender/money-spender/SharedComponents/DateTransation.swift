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
        let iconImageView = UIImageView()
        let icon = UIImage(systemName: "applelogo")
        iconImageView.image = icon
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return iconImageView
    }()

    lazy var datepicker :UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.date = Date()
        return datePicker
    }()
    
    lazy var dateField : UITextField = {
        let dateField = UITextField()
        dateField.inputView = datepicker
        dateField.inputAccessoryView = toolbar
        dateField.attributedPlaceholder = NSAttributedString(
            string: "Date",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.orange])
        return dateField
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
        
        addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
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

