//
//  Transaction.swift
//  money-spender
//
//  Created by Marcin Rosół on 13/11/2020.
//

import UIKit

struct Transaction: Codable {
    var category: String
    var date: Date
    var income: Float
    var description: String
}
