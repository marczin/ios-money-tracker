//
//  CategoryEnum.swift
//  money-spender
//
//  Created by Marcin Rosół on 01/12/2020.
//

import UIKit

enum Category: Int {
    case food = 0
    case car = 1
    case groceries = 2
    
    static var count: Int { return Category.groceries.rawValue + 1 }
    
    var description: String {
            switch self {
            case .food: return "Food"
            case .car   : return "Car"
            case .groceries  : return "Groceries"
            }
        }
}
