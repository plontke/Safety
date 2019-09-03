//
//  MenuViewController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-07-28.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UITableViewController {
    let cellId = "CellId"
    let headerId = "HeaderId"
    let menuOptions = ["Manage Plant", "Manage WorkOrders"]
    let menuOptionsLead = ["Manage Plant", "Manage Workorders"]
    var currentUserName: String?
    var currentUserEmail: String?
    
    
    
   
    
    override func viewDidLoad() {
        getCurrentUser()
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.register(MenuOptionHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
       
        
        
//        view.addSubview(tableView)
//        view.addSubview(backgroundView)
//        view.addSubview(nameLabel)
//        view.addSubview(emailLabel)
//        setupViews()
    }
    
    func getCurrentUser() {
        let userID = Auth.auth().currentUser?.uid
        let firestore = Firestore.firestore()
        firestore.collection("users").whereField("uid", isEqualTo: userID as Any).getDocuments(completion: { (querySnapshot, error) in
            if error != nil {
                print(error as Any)
            }else{
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    self.currentUserName = document["name"] as? String
                    self.currentUserEmail = document.get("email") as? String
                    print(self.currentUserName as Any)
                }
            }
            })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = menuOptions[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as? MenuOptionHeader
        header?.nameLabel.text = self.currentUserName
        
        self.tableView.reloadData()
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("manage Plant selected")
            NotificationCenter.default.post(name: Notification.Name("managePlantSelected"), object: nil)
        } else if indexPath.row == 1 {
            print("Manage workorder selected")
            NotificationCenter.default.post(name: Notification.Name("manageWorkordersSelected"), object: nil)
        }
    }
    
    

}

