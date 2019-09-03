//
//  User.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-29.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import Foundation

class User: NSObject {
    private var uid: String
    private var name: String
    private var plantCode: String
    private var email: String
    private var myWorkorders: [String]
    private var isLead: Bool?
    
    
    init(UID uid: String, Name name: String,Email email: String, IsLead isLead: Bool){
        self.uid = uid
        self.name = name
        self.email = email
        self.plantCode = ""
        self.myWorkorders = [String]()
        self.isLead = isLead
        super.init()
        
    }
    override init() {
        self.uid = ""
        self.name = ""
        self.plantCode = ""
        self.email = ""
        self.myWorkorders = [String]()
        self.isLead = false
        super.init()
    }
    
    public func getPlant() -> String{
        return self.plantCode
    }
    
    public func setPlant(Plant plant: String) {
        self.plantCode = plant
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func setName(Name name: String) {
        self.name = name
    }
    
    public func getEmail() -> String {
        return self.email
    }
    
    public func setEmail(Email email : String){
        self.email = email
    }
    
    public func getUid() -> String {
        return self.uid
    }
    
    public func setUid(String uid: String){
        self.uid = uid
    }
    
    public func getPlantCode() -> String {
        return self.plantCode
    }
    
    public func setPlantCode(PlantCode plantCode: String){
        self.plantCode = plantCode
    }
    
    public func getMyWorkOrders() -> [String] {
        return self.myWorkorders
    }
    
    public func setMyWorkOrders(MyWorkOrders myWorkOrders: [String]) {
        self.myWorkorders = myWorkOrders
    }
    
    public func getIslead() -> Bool{
        return self.isLead ?? false
    }
    
    public func setIsLead(isLead: Bool) {
        self.isLead = isLead
    }
    
    public func approveInspector(Inspector worker: User){
        // TODO
    }
    
    
}
