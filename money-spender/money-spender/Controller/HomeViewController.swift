//
//  HomeViewController.swift
//  money-spender
//
//  Created by Marcin Rosół on 08/11/2020.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties

    let homeView = HomeView()
    
    lazy var homeViewModel: HomeViewModel = {
       let homeViewModel = HomeViewModel()
        homeViewModel.delegate = self
        return homeViewModel
    }()
    
    // MARK: - Inits
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Methods
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.addTransactionButton.addTarget(homeViewModel, action: #selector(homeViewModel.addButtonTapped), for: .touchUpInside)
        homeViewModel.changeWalletValue()
    }

}

extension HomeViewController: HomeViewModelDelegate {
    func homeViewModel(_ viewModel: HomeViewModel, totalBalance total: String, monthlyChange monthly: String, moneySpend spend: String) {
        self.homeView.totalBalanceLabel.text = total
        self.homeView.monthlyChangeLabel.text = monthly
        self.homeView.moneySpendLabel.text = spend
    }
    func homeViewModel(_ viewModel: HomeViewModel, addSpendController addController: AddSpendViewController) {
        present(addController, animated: true)
    }
}
