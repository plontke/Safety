//
//  ViewController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-08-11.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import Firebase

class EditUserPlant: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    public var plants = [String]()
    private var listener : ListenerRegistration?
    private var listener2 : ListenerRegistration?
    private var selectedPlantCode : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = EditUserPlantView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        NotificationCenter.default.addObserver(self, selector: #selector(addListeners), name: NSNotification.Name("attachPlantListener"), object: nil)
        checkRequests()
        EditUserPlantView.plantTableView.delegate = self
        EditUserPlantView.plantTableView.dataSource = self
        EditUserPlantView.plantTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.listener?.remove()
        self.listener2?.remove()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc
    func addListeners() {
         self.listener = Firestore.firestore().collection("plants").addSnapshotListener( { querySnapshot, error in
            if let error = error {
                print("error retrieving collection : \(error)")
            } else {
                self.plants = [String]()
                for document in querySnapshot!.documents {
                    print(document.data())
                    if !self.plants.contains(document.data()["plantCode"] as! String){
                        self.plants.append(document.data()["plantCode"] as! String)
                    }
                    
                
                }
                print(self.plants)
                EditUserPlantView.plantTableView.reloadData()
                
            }
         })
        self.listener2 = Firestore.firestore().collection("requests").whereField("requestor", isEqualTo: Auth.auth().currentUser?.uid as Any).addSnapshotListener({ (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                snapshot?.documentChanges.forEach({ (diff) in
                    if diff.type == .removed {
                        Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).getDocument(completion: { (snapshot, error) in
                            if error != nil {
                                print(error?.localizedDescription)
                            } else {
                                let plantCode = snapshot?.data()!["plantCode"]
                                if (plantCode as! String == "") {
                                    NotificationCenter.default.post(name: NSNotification.Name("requestHasBeenCancelled"), object: nil)
                                } else {
                                    self.dismiss(animated: true, completion: nil)
                                }
                            }
                        })
                
                        
                    }
                })
            }
        })
    }
    
    
    @objc
    func handleCancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    
    @objc
    func handleSecondRegisterPressed() {
        print("Registering Plant")
        NotificationCenter.default.post(name: NSNotification.Name("RegisteringPlant"), object: nil)
        
        guard  EditUserPlantView.companyTextField.text != "", EditUserPlantView.plantNameTextField.text != "" else {
            print("Incorrect Information")
            return
        }
        let plant = Plant(theLead: Auth.auth().currentUser?.uid ?? "blah", theNickname: EditUserPlantView.plantNameTextField.text ?? "blah", theCompany: EditUserPlantView.companyTextField.text ?? "blah")
        print(plant.getplantCode())
        
        let currentUserRef = Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid)
        
        currentUserRef.updateData(["plantCode": plant.getplantCode(), "isLead": true])
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func handleSecondSelectPressed()  {
        guard let text = selectedPlantCode else {
            print("No selected index")
            return
        }
        var username = ""
        Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).getDocument { (document, error) in
            if error != nil {
                print(error as Any)
                return
            } else {
                print(document?.data()!["name"])
                username = document?.data()!["name"] as? String ?? "blah"
                let request = Request(Requestor: Auth.auth().currentUser!.uid, Plant: text, Username: username )
                request.sendRequest()
                NotificationCenter.default.post(name: Notification.Name("requestSent"), object: nil)
            }
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EditUserPlantView.plantTableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = plants[indexPath.row]
        return cell!
    }
    
    func checkRequests() {
        Firestore.firestore().collection("requests").whereField("requestor", isEqualTo: Auth.auth().currentUser?.uid as Any).getDocuments(completion: { (querySnapshot, error) in
            if error != nil {
                print(error as Any)
            } else {
                for _ in querySnapshot!.documents {
                    NotificationCenter.default.post(name: Notification.Name("requestSent"), object: nil)
                }
            }
        })
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlantCode = plants[indexPath.row]
    }
    
    @objc
    func cancelRequest() {
        let docQuery = Firestore.firestore().collection("requests").whereField("requestor", isEqualTo: Auth.auth().currentUser?.uid as Any)
        docQuery.getDocuments(completion: { (querySnapshot, error) in
            if error != nil {
                print(error as Any)
            }else {
                for document in querySnapshot!.documents {
                    document.reference.delete()
                }
                NotificationCenter.default.post(name: NSNotification.Name("requestHasBeenCancelled"), object: nil)
            }
            })
    }
    
    

}
    
    
    
    

