//
//  PlantManagementTabBarViewController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-08-27.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit

class PlantManagementTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = .white
        
        configureHomeControllers()
        // Do any additional setup after loading the view.
    }
    
    
    
    func configureHomeControllers() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        let homeController =  ManageEmployeesTableViewController()
        let homeNavController = UINavigationController(rootViewController: homeController)
        homeNavController.title = "Manage Requests"
        viewControllers = [homeNavController]
    }

}
