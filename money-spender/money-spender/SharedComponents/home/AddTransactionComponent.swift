//
//  AddTransactionComponent.swift
//  money-spender
//
//  Created by Marcin Rosół on 03/12/2020.
//

import UIKit
import SnapKit

class AddTransactionComponent: UIView {
    
    // MARK: - declaration
    let lastSpendLabel: UILabel = {
       let lastSpendlabel = UILabel()
        lastSpendlabel.text = "Last spend"
        lastSpendlabel.textColor = .white
        return lastSpendlabel
    }()
    
    let moneySpendLabel: UILabel = {
        let moneySpendLabel = UILabel()
        moneySpendLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3843137255, alpha: 1)
        return moneySpendLabel
    }()
    
    let addTransactionButton: UIButton = {
        let addTransactionButton = UIButton(type: .system)
        addTransactionButton.layer.cornerRadius = 20
        addTransactionButton.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.7647058824, blue: 0.5490196078, alpha: 1)
        addTransactionButton.clipsToBounds = true
        addTransactionButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addTransactionButton.tintColor = .white
        return addTransactionButton
    }()
    
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        doLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func doLayout() {
        layer.cornerRadius = 8
        backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1803921569, blue: 0.1882352941, alpha: 1)
        
        addSubview(addTransactionButton)
        addTransactionButton.snp.makeConstraints{ make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        addSubview(lastSpendLabel)
        lastSpendLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        addSubview(moneySpendLabel)
        moneySpendLabel.snp.makeConstraints { make in
            make.top.equalTo(lastSpendLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-10)
        }
 
    }
}
