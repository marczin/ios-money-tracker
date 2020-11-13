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
        totalBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalBalanceLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3843137255, alpha: 1)
        return totalBalanceLabel
    }()
    let totalLabel = UILabel()

    let monthlyChangeLabel: UILabel = {
        let monthlyChangeLabel = UILabel()
        monthlyChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        monthlyChangeLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3843137255, alpha: 1)
        return monthlyChangeLabel
    }()
    let monthlyLabel = UILabel()

    let contentView_ = UIView()
    let walletView = UIView()

    let walletLabel = UILabel()
    let addTransactionButton: UIButton = {
        let addTransactionButton = UIButton(type: .system)
        addTransactionButton.translatesAutoresizingMaskIntoConstraints = false
        addTransactionButton.layer.cornerRadius = 20 //0.5 * addTransactionButton.bounds.size.width
        addTransactionButton.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.7647058824, blue: 0.5490196078, alpha: 1)
        addTransactionButton.clipsToBounds = true
        addTransactionButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addTransactionButton.tintColor = .white
        return addTransactionButton
    }()

    let moneySpendLabel: UILabel = {
        let moneySpendLabel = UILabel()
        moneySpendLabel.translatesAutoresizingMaskIntoConstraints = false
        moneySpendLabel.textColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3843137255, alpha: 1)
        //moneySpendLabel.text = "- 15,50 PLN"
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
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(balanceView)
        balanceView.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1803921569, blue: 0.1882352941, alpha: 1)
        balanceView.layer.cornerRadius = 8

        balanceView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(30)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        balanceView.addSubview(totalBalanceLabel)
        //totalBalanceLabel.text = "-50,00 PLN"
        totalBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceView.snp.top).offset(16)
            make.leading.equalTo(balanceView.snp.leading).offset(16)
        }

        balanceView.addSubview(monthlyChangeLabel)
        //monthlyChangeLabel.text = "-50,00 PLN"

        monthlyChangeLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceView.snp.top).offset(16)
            make.trailing.equalTo(balanceView.snp.trailing).offset(-16)
        }

        balanceView.addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.text = "Total Balance"
        totalLabel.textColor = .white
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(totalBalanceLabel.snp.bottom).offset(2)
            make.leading.equalTo(balanceView.snp.leading).offset(16)
            make.bottom.equalTo(balanceView.snp.bottom).offset(-16)
        }

        balanceView.addSubview(monthlyLabel)
        monthlyLabel.translatesAutoresizingMaskIntoConstraints = false
        monthlyLabel.text = "Monthly Change"
        monthlyLabel.textColor = .white

        monthlyLabel.snp.makeConstraints { make in
            make.top.equalTo(monthlyChangeLabel.snp.bottom).offset(2)
            make.trailing.equalTo(balanceView.snp.trailing).offset(-16)
            make.bottom.equalTo(balanceView.snp.bottom).offset(-16)
        }
    }

    private func doWalletViewLayout() {

        contentView_.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView_)

        contentView_.snp.makeConstraints { make in
            make.top.equalTo(balanceView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        walletView.translatesAutoresizingMaskIntoConstraints = false
        walletView.layer.cornerRadius = 8
        contentView_.addSubview(walletView)
        walletView.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1803921569, blue: 0.1882352941, alpha: 1)
        
        walletView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView_)
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

        walletLabel.translatesAutoresizingMaskIntoConstraints = false
        walletLabel.text = "Wallet"
        walletLabel.textColor = .white
        walletView.addSubview(walletLabel)

        walletLabel.snp.makeConstraints { make in
            make.top.equalTo(walletView.snp.top).offset(16)
            make.leading.equalTo(walletView.snp.leading).offset(16)
        }

        walletView.addSubview(moneySpendLabel)
        
        moneySpendLabel.snp.makeConstraints { make in
            make.top.equalTo(walletLabel.snp.bottom).offset(10)
            make.leading.equalTo(walletView.snp.leading).offset(16)
            make.bottom.equalTo(walletView.snp.bottom).offset(-10)
        }


    }


}
