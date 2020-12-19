//
//  LoadViewController.swift
//  money-spender
//
//  Created by Marcin Rosół on 12/11/2020.
//

import UIKit

class LoadViewController: UITabBarController {

    let homeController = HomeViewController()
    let spendListViewController = TransactionListViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeController.tabBarItem.image = #imageLiteral(resourceName: "home")
        homeController.title = "Home"
        
        spendListViewController.tabBarItem.image = #imageLiteral(resourceName: "add")
        spendListViewController.title = "All spends"
        
        let controllers: [UINavigationController] = [homeController, spendListViewController].map({
            let navController = UINavigationController(rootViewController: $0)
            navController.setNavigationBarHidden(true, animated: false)
            return navController
        })
        
        setViewControllers(controllers, animated: false)
        modalPresentationStyle = .fullScreen
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    

}
