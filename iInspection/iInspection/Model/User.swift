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
    private var plant: Plant?
    private var email: String
    
    
    init(UID uid: String, Name name: String,Email email: String){
        self.uid = uid
        self.name = name
        self.email = email
        super.init()
        
    }
    
    public func getPlant() -> Plant{
        return self.plant!
    }
    
    public func setPlant(Plant plant: Plant) {
        self.plant = plant
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
    
    
}
