//
//  SpendListViewController.swift
//  money-spender
//
//  Created by Marcin Rosół on 03/12/2020.
//

import UIKit

class SpendListViewController: UIViewController {
    
    // MARK: - declaration
    
    let spendListView = SpendListView()
    
    // MARK: - initial
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = spendListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - functions
    
}
