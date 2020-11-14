//
//  AddSpendView.swift
//  money-spender
//
//  Created by Marcin Rosół on 12/11/2020.
//

import UIKit

class AddSpendView: UIView {

    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        doLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - function
    fileprivate func doLayout(){
        backgroundColor = .red
    }

}
