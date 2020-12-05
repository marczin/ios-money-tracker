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

    let addTransactionComponent = AddTransactionComponent()
    let balanceComponent = BalanceComponent()

    let walletContentView = UIView()

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
        addSubview(balanceComponent)
        
        balanceComponent.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(30)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            
            
        }
    }

    private func doWalletViewLayout() {

        addSubview(walletContentView)
        walletContentView.snp.makeConstraints { make in
            make.top.equalTo(balanceComponent.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        walletContentView.addSubview(addTransactionComponent)
        addTransactionComponent.snp.makeConstraints { make in
            make.centerY.equalTo(walletContentView)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
    }
}
