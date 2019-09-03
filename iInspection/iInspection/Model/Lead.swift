//
//  Lead.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-29.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

class Lead: User {
    
    override init(UID uid: String, Name name: String,Email email: String, IsLead isLead: Bool) {
        super.init(UID: uid, Name: name, Email: email, IsLead: isLead)
    }
    

    
    public func isLead() -> Bool {
        return true
    }
    
    public func deleteWorker(Worker worker: User){
        //TODO
    }
    
    
    public func approveWorkOrder(WorkOrder workorder: Workorder){
        //TODO
    }
    

}
