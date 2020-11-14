//
//  AddSpendController.swift
//  money-spender
//
//  Created by Marcin Rosół on 12/11/2020.
//

import UIKit

class AddSpendViewController: UIViewController {
    
    // MARK: - properties
    
    let addSpendView = AddSpendView()
    
    // MARK: - Inits
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Methods
    override func loadView() {
        view = addSpendView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
