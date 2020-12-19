//
//  SpendListViewController.swift
//  money-spender
//
//  Created by Marcin Rosół on 03/12/2020.
//

import UIKit

class TransactionListViewController: UIViewController {
    
    // MARK: - declaration
    
    let controllerViewModel = TransactionListViewModel()
    let transactionListView = TransactionListView()
    
    // MARK: - initial
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = transactionListView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controllerViewModel.requestData()
        controllerViewModel.setup(tableView: transactionListView.listComponent.tableView)
    }
    

}
