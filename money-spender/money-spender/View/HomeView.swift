//
//  HomeView.swift
//  money-spender
//
//  Created by Marcin Rosół on 08/11/2020.
//

import UIKit
import SnapKit

class HomeView: UIView {
    // MARK: - Properties

    let balanceView = UIView()

    let totalBalanceLabel: UILabel = {
        let totalBalanceLabel = UILabel()
        totalBalanceLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3843137255, alpha: 1)
        return totalBalanceLabel
    }()
    let totalLabel = UILabel()

    let monthlyChangeLabel: UILabel = {
        let monthlyChangeLabel = UILabel()
        monthlyChangeLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3843137255, alpha: 1)
        return monthlyChangeLabel
    }()
    let monthlyLabel = UILabel()

    let walletContentView = UIView()
    let walletView = UIView()

    let lastSpendLabel = UILabel()
    let addTransactionButton: UIButton = {
        let addTransactionButton = UIButton(type: .system)
        addTransactionButton.layer.cornerRadius = 20
        addTransactionButton.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.7647058824, blue: 0.5490196078, alpha: 1)
        addTransactionButton.clipsToBounds = true
        addTransactionButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addTransactionButton.tintColor = .white
        return addTransactionButton
    }()

    let moneySpendLabel: UILabel = {
        let moneySpendLabel = UILabel()
        moneySpendLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3843137255, alpha: 1)
        return moneySpendLabel
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
        backgroundColor = .systemBackground
        doBalanceView()
        doWalletViewLayout()
    }

    private func doBalanceView() {
        addSubview(balanceView)
        balanceView.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1803921569, blue: 0.1882352941, alpha: 1)
        balanceView.layer.cornerRadius = 8

        balanceView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(30)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        balanceView.addSubview(totalBalanceLabel)
        totalBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceView.snp.top).offset(16)
            make.leading.equalTo(balanceView.snp.leading).offset(16)
        }

        balanceView.addSubview(monthlyChangeLabel)

        monthlyChangeLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceView.snp.top).offset(16)
            make.trailing.equalTo(balanceView.snp.trailing).offset(-16)
        }

        balanceView.addSubview(totalLabel)
        totalLabel.text = "Total Balance"
        totalLabel.textColor = .white
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(totalBalanceLabel.snp.bottom).offset(2)
            make.leading.equalTo(balanceView.snp.leading).offset(16)
            make.bottom.equalTo(balanceView.snp.bottom).offset(-16)
        }

        balanceView.addSubview(monthlyLabel)
        monthlyLabel.text = "Monthly Change"
        monthlyLabel.textColor = .white

        monthlyLabel.snp.makeConstraints { make in
            make.top.equalTo(monthlyChangeLabel.snp.bottom).offset(2)
            make.trailing.equalTo(balanceView.snp.trailing).offset(-16)
            make.bottom.equalTo(balanceView.snp.bottom).offset(-16)
        }
    }

    private func doWalletViewLayout() {

        addSubview(walletContentView)

        walletContentView.snp.makeConstraints { make in
            make.top.equalTo(balanceView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        walletView.layer.cornerRadius = 8
        walletContentView.addSubview(walletView)
        walletView.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1803921569, blue: 0.1882352941, alpha: 1)
        
        walletView.snp.makeConstraints { make in
            make.centerY.equalTo(walletContentView)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        walletView.addSubview(addTransactionButton)

        addTransactionButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.top.equalTo(walletView.snp.top).offset(16)
            make.trailing.equalTo(walletView.snp.trailing).offset(-16)
        }

        lastSpendLabel.text = "Last spend"
        lastSpendLabel.textColor = .white
        walletView.addSubview(lastSpendLabel)

        lastSpendLabel.snp.makeConstraints { make in
            make.top.equalTo(walletView.snp.top).offset(16)
            make.leading.equalTo(walletView.snp.leading).offset(16)
        }

        walletView.addSubview(moneySpendLabel)
        moneySpendLabel.snp.makeConstraints { make in
            make.top.equalTo(lastSpendLabel.snp.bottom).offset(10)
            make.leading.equalTo(walletView.snp.leading).offset(16)
            make.bottom.equalTo(walletView.snp.bottom).offset(-10)
        }
    }
}
