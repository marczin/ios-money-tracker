//
//  SpendListView.swift
//  money-spender
//
//  Created by Marcin Rosół on 03/12/2020.
//

import UIKit

class SpendListView: UIView {
    
    
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
        backgroundColor = .red
    }
}
