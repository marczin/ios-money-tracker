//
//  TransactionListViewModel.swift
//  money-spender
//
//  Created by Marcin Rosół on 19/12/2020.
//

import UIKit

class TransactionListViewModel: NSObject {
    
    // MARK: - properties
    var array : [Transaction] = [Transaction]()
    var viewModels:[TransactionCellViewModel] = [TransactionCellViewModel]()
    var transactionService = TransactionService()
    
    // MARK: - functions
    func requestData(){
        array = transactionService.getData()
        viewModels = array.map({TransactionCellViewModel(transaction: $0)})
    }
    
    func setup(tableView: UITableView){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionCellComponent.self,
                                                       forCellReuseIdentifier: String(describing: TransactionCellComponent.self))
    }
}

extension TransactionListViewModel : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
            1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionCellComponent.self),
                                                       for: indexPath) as? TransactionCellComponent else { return UITableViewCell.init() }
        cell.transactionViewModel =  viewModels[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
