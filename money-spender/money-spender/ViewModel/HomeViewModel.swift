//
//  HomeViewModel.swift
//  money-spender
//
//  Created by Marcin Rosół on 09/11/2020.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    
    func homeViewModel(_ viewModel: HomeViewModel,
                       totalBalance total: String,
                       monthlyChange monthly: String,
                       moneySpend spend: String)
    
    func homeViewModel(_ viewModel: HomeViewModel, addSpendController addController: AddSpendViewController)
}
class HomeViewModel {

    // MARK: - Properties
    weak var delegate: HomeViewModelDelegate?

    // MARK: - Methods
    
    @objc func addButtonTapped(){
        let addController = AddSpendViewController()
        self.delegate?.homeViewModel(self, addSpendController: addController)
        
    }
    
    @objc func changeWalletValue(){
        self.delegate?.homeViewModel(self,
                                     totalBalance: "-100,00 PLN",
                                     monthlyChange: "-50,00 PLN",
                                     moneySpend: "-30,00 PLN")
    }
}
