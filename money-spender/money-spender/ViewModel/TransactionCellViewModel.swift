//
//  TransactionCellModelView.swift
//  money-spender
//
//  Created by Marcin Rosół on 19/12/2020.
//

import UIKit

struct TransactionCellViewModel {
    
    let price: Float
    let category: String
    let date: Date
    let backgroundColor: UIColor
    
    init(transaction: Transaction) {
        price = transaction.income
        category = transaction.category
        date = transaction.date
        
        backgroundColor = price > 10 ? .black : .red
    }
}
