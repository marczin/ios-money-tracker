//
//  HomeViewModel.swift
//  money-spender
//
//  Created by Marcin Rosół on 09/11/2020.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    
    func homeViewModel(_ viewModel: HomeViewModel, addSpendController addController: AddSpendViewController)
    
    func homeViewModel(_ viewModel: HomeViewModel, total: String, monthly: String, spend: String)
}

class HomeViewModel  {

    // MARK: - Properties
    weak var delegate: HomeViewModelDelegate?
    
    

    // MARK: - Methods
    
    @objc func addButtonTapped(){
        let addController = AddSpendViewController()
        delegate?.homeViewModel(self, addSpendController: addController)
    }
    
    func viewDidLoadAction(){
        delegate?.homeViewModel(self, total: "50 pln", monthly: "60 pln", spend: "70 PLN")
    }
}
