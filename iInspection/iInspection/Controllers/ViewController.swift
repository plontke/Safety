//
//  ViewController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-21.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }else {
            print(Auth.auth().currentUser?.uid)
        }
    
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

