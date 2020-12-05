//
//  AddTransactionHeader.swift
//  money-spender
//
//  Created by Marcin Rosół on 14/11/2020.
//

import UIKit

final class AddTransactionHeaderComponent: UIView {
    
    let addLabel: UILabel = {
        let addLabel = UILabel()
        addLabel.textAlignment = .center
        let textString = "Add expense"
        let attributed = NSMutableAttributedString(string: textString)
        attributed.addAttribute(.kern,
            value: NSNumber(value: 2),
            range: NSRange(location: 0, length: textString.count))
        addLabel.attributedText = attributed
        addLabel.font = .systemFont(ofSize: 20)
        addLabel.textColor = .white
        return addLabel
    }()

    let priceField: UITextField = {
        let priceField = UITextField()
        priceField.attributedPlaceholder = NSAttributedString(
            string: "0 PLN",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        priceField.textColor = UIColor.white
        priceField.textAlignment = .right
        priceField.keyboardType = .decimalPad
        return priceField
    }()

    let categoryPicker = UIPickerView()

    lazy var categoryField: UITextField = {
        let categoryField = UITextField()
        categoryField.inputView = categoryPicker
        categoryField.textColor = .white
        categoryField.tintColor = .white
        categoryField.attributedPlaceholder = NSAttributedString(
            string: "Category",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return categoryField
    }()

    // MARK: - initial
    init() {
        super.init(frame: .zero)
        doLayout()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    fileprivate func doLayout() {
        backgroundColor = #colorLiteral(red: 1, green: 0.662745098, blue: 0.01176470588, alpha: 1)
        tintColor = .white
        addSubview(addLabel)
        addLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        addSubview(priceField)
        priceField.snp.makeConstraints { make in
            make.top.equalTo(addLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }

        addSubview(categoryField)
        categoryField.snp.makeConstraints { make in
            make.top.equalTo(addLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }

    }
}
