//
//  ContainerViewController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-07-28.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import Firebase
class ContainerViewController: UIViewController {

    var menuController: UIViewController!
    var centerController: UIViewController!
    var centerController2: UIViewController!
    var isExpanded: Bool = false
    var currentUserName: String = ""
    var currentUser: User?
    var handle: AuthStateDidChangeListenerHandle?
    var managePlantSelected: Bool = false
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        checkLoggedIn()
        checkPlantCode()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleManagePlantSelected), name: Notification.Name("managePlantSelected"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(manageWorkordersSelected), name: Notification.Name("manageWorkordersSelected"), object: nil)
        configureHomeController()
        
      
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(self.handle!)
    }
    
    func checkLoggedIn() {
       self.handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
        if user == nil {    
            self.perform(#selector(self.handleLogout))
        }
       })
    }
    
    @objc
    func manageWorkordersSelected() {
        managePlantSelected = false
        handleMenuPress()
        
    }
    
    @objc
    func toggleManagePlantSelected() {
        managePlantSelected = true
        handleMenuPress()
    }
    
    
    func configureHomeController() {
        centerController = TabBarWorkordersController()
        centerController2 = PlantManagementTabBarViewController()
        
        view.addSubview(centerController.view)
        view.addSubview(centerController2.view)
        
        configureNavBarItems()
        addChild(centerController)
        addChild(centerController2)
        centerController.didMove(toParent: self)
        centerController2.didMove(toParent: self)
        centerController2.view.isHidden = true
    }
    
    func checkPlantCode() {
        let db = Firestore.firestore()
        db.collection("users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid as Any).getDocuments(completion: { (snapshot, error) in
            if error != nil{
                print("error")
                print(error ?? "error")
            } else{
                for document in snapshot!.documents {
                    self.currentUser = User(UID: (document.data()["uid"] as? String)!, Name: (document.data()["name"] as? String)!, Email: (document.data()["email"] as? String)!, IsLead: (document.data()["isLead"]! as! Bool))
                    self.currentUser?.setPlantCode(PlantCode: (document.data()["plantCode"] as? String)!)
                    self.currentUser?.setMyWorkOrders(MyWorkOrders: ((document.data()["myWorkorders"] as? [String])!))
                    self.currentUser?.setIsLead(isLead: (document.data()["isLead"] as? Bool)!)
                    print()
                }
            }
            print(self.currentUser?.getPlantCode() as Any)
            if self.currentUser?.getPlantCode() == nil {
                print("Plant Code is Nil")
                let editPlantCodeController = UINavigationController(rootViewController: EditUserPlant())
                self.present(editPlantCodeController, animated: true, completion: nil)
            } else if self.currentUser?.getPlantCode() == "" {
                print("Plant Code is Nil")
                let editPlantCodeController = UINavigationController(rootViewController: EditUserPlant())
                self.present(editPlantCodeController, animated: true, completion: nil)
            }
        })
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuViewController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("did add menu Controller")
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    func configureNavBarItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "verticalMenuButton"), style: .plain, target: self, action: #selector(handleMenuPress))
        
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
    
    func showMenuController(shouldExpand: Bool){
        print(shouldExpand)
        if shouldExpand {
            //show
            if !self.centerController.view.isHidden {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations:
                {
                    self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                    }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations:
                    {
                        self.centerController2.view.frame.origin.x = self.centerController.view.frame.width - 80
                }, completion: nil)
            }
            
        } else {
            
            //hide
            
            if !self.centerController.view.isHidden {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                     self.centerController.view.frame.origin.x = 0
                }, completion: { (_) in
                    if !self.managePlantSelected {
                        print(self.managePlantSelected)
                        self.centerController.view.isHidden = false
                        self.centerController2.view.isHidden = true
                    } else {
                        self.centerController2.view.isHidden = false
                        self.centerController.view.isHidden = true
                    }
                })
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                    self.centerController2.view.frame.origin.x = 0
                }, completion: { (_) in
                    if !self.managePlantSelected {
                        print(self.managePlantSelected)
                        self.centerController.view.isHidden = false
                        self.centerController2.view.isHidden = true
                    } else {
                        self.centerController2.view.isHidden = false
                        self.centerController.view.isHidden = true
                    }
                })
            }
                
        }
    }
    
    @objc func handleMenuPress() {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
    

}
