//
//  LoadViewController.swift
//  money-spender
//
//  Created by Marcin Rosół on 12/11/2020.
//

import UIKit

class LoadViewController: UITabBarController {

    let homeController = HomeViewController()
    let addSpendController = AddSpendViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeController.tabBarItem.image = #imageLiteral(resourceName: "home")
        homeController.title = "Home"
        
        addSpendController.tabBarItem.image = #imageLiteral(resourceName: "add")
        addSpendController.title = "Add"
        let controllers: [UINavigationController] = [homeController,addSpendController].map({
            let navController = UINavigationController(rootViewController: $0)
            navController.setNavigationBarHidden(true, animated: false)
            return navController
        })
        
        setViewControllers(controllers, animated: false)
        modalPresentationStyle = .fullScreen
    }
    

}
