//
//  CategoryEnum.swift
//  money-spender
//
//  Created by Marcin Rosół on 01/12/2020.
//

import UIKit

enum Category: Int {
    case Food = 0
    case Car = 1
    case Groceries = 2
    
    static var count: Int { return Category.Groceries.rawValue + 1 }
    
    var description: String {
            switch self {
            case .Food: return "Food"
            case .Car   : return "Car"
            case .Groceries  : return "Groceries"
            }
        }
}
