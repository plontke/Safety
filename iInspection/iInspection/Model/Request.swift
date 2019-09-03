//
//  Request.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-08-26.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import Firebase

class Request: NSObject {
    
    private var requestor : String
    private var plant : String
    private var username : String
    
    init(Requestor requestor: String, Plant plant: String, Username username: String){
        self.requestor = requestor
        self.plant = plant
        self.username = username
        super.init()
    }

    public func getRequestor() -> String {
        return self.requestor
    }
    
    public func getPlant() -> String {
        return self.plant
    }
    
    public func getUsername() -> String {
        return self.username
    }
    
    public func sendRequest(){
        Firestore.firestore().collection("requests").document().setData(
            ["requestor" : self.requestor,
             "plantCode": self.plant,
             "username": self.username])
        print("Request Sent")
    
    }
    
    
    public func acceptRequest() {
        Firestore.firestore().collection("users").document(self.requestor).updateData(["plantCode" : self.plant])
        print("Users plantCode Updated")
        Firestore.firestore().collection("plants").document(self.plant).updateData(["workers" : FieldValue.arrayUnion([self.requestor])])
        print("User added to workers")
        Firestore.firestore().collection("requests").whereField("requestor", isEqualTo: self.requestor).getDocuments { (querySnapshot, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                for document in querySnapshot!.documents {
                    document.reference.delete()
                }
            }
        }
        
    }
    
    public func denyRequest() {
        Firestore.firestore().collection("requests").whereField("requestor", isEqualTo: self.requestor).getDocuments { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                for document in snapshot!.documents {
                    document.reference.delete()
                }
            }
        }
    }
    
    
    
}
