//
//  SpendListView.swift
//  money-spender
//
//  Created by Marcin Rosół on 03/12/2020.
//

import UIKit

class TransactionListView: UIView {
    
    // MARK: - declarations
    
    let listComponent = ListComponent()
    
    // MARK: - initial
    init() {
        super.init(frame: .zero)
        doLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - function
    
    func doLayout() {
        addSubview(listComponent)
        listComponent.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
