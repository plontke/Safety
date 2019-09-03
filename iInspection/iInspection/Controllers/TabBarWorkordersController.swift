//
//  TabBarControllerViewController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-28.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import Firebase

class TabBarWorkordersController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = .white
        
        configureHomeControllers()
    }
   
    
    func configureHomeControllers(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        let homeController = MyWorkOrders(collectionViewLayout: layout)
        let homeNavController = UINavigationController(rootViewController: homeController)
        homeNavController.title = "My Work Orders"
        viewControllers = [homeNavController]
    }
    
    
}
