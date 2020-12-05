//
//  BalanceComponent.swift
//  money-spender
//
//  Created by Marcin Rosół on 05/12/2020.
//

import UIKit

class BalanceComponent: UIView {
    
    // MARK: - declaration
    
    let totalBalanceLabel: UILabel = {
        let totalBalanceLabel = UILabel()
        totalBalanceLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3843137255, alpha: 1)
        return totalBalanceLabel
    }()
    let totalLabel : UILabel = {
        let totalLabel = UILabel()
        totalLabel.text = "Total Balance"
        totalLabel.textColor = .white
        return totalLabel
    }()

    let monthlyChangeLabel: UILabel = {
        let monthlyChangeLabel = UILabel()
        monthlyChangeLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3843137255, alpha: 1)
        return monthlyChangeLabel
    }()
    let monthlyLabel: UILabel = {
        let monthlyLabel = UILabel()
        monthlyLabel.text = "Monthly Change"
        monthlyLabel.textColor = .white
        return monthlyLabel
    }()
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        doLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - functions
    
    func doLayout(){
        backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1803921569, blue: 0.1882352941, alpha: 1)
        layer.cornerRadius = 8
        
        addSubview(totalBalanceLabel)
        totalBalanceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        addSubview(monthlyChangeLabel)
        monthlyChangeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        addSubview(totalLabel)
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(totalBalanceLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        addSubview(monthlyLabel)
        monthlyLabel.snp.makeConstraints { make in
            make.top.equalTo(monthlyChangeLabel.snp.bottom).offset(2)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
