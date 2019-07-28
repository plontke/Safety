//
//  Lead.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-29.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

class Lead: User {
    
    override init(UID uid: String, Name name: String,Email email: String) {
        super.init(UID: uid, Name: name, Email: email )
    }
    
    public func getPlantCode() -> String {
        // TODO
        return ""
    }
    
    public func approveInspector(Inspector worker: User){
        // TODO
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
