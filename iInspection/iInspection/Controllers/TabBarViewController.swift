//
//  TabBarControllerViewController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-28.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import Firebase

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }else {
            print(Auth.auth().currentUser?.uid ?? "12345")
        }
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        let homeController = MyWorkOrders(collectionViewLayout: layout)
        let homeNavController = UINavigationController(rootViewController: homeController)
        homeNavController.title = "My Work Orders"
        
        
        viewControllers = [homeNavController]
        
    }
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        }   catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }
}
