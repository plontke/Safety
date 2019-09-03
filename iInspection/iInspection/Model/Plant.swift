//
//  Plant.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-29.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import Firebase

class Plant : NSObject{
    private var leadCode: String;
    private var workers: [String]
    private var buildings: [Building]
    private var plantCode: String
    private var nickName: String
    private var company: String
    
    
   init(theLead lead: String, theNickname nickname: String, theCompany company: String){
        self.nickName = nickname
        self.company = company
        self.leadCode = lead
        self.workers = [lead]
        self.buildings = []
        self.plantCode = company + "," + nickName
        super.init()
        uploadData()
    
    }
    
    public func uploadData() {
        let db = Firestore.firestore()
        db.collection("plants").document(self.plantCode).setData([
            "nickName": self.nickName,
            "company" : self.company,
            "leadCode" :self.leadCode,
            "workers" : self.workers,
            "buildings" : self.buildings,
            "plantCode" : self.plantCode])
    }
    
    public func setLead(theLead lead: String){
        self.leadCode = lead
    }
    
    public func getLead() -> String {
        return self.leadCode
    }
    
    public func addWorkers(aWorker worker: String){
        workers.append(worker)
    }
    
    public func deleteInspector(oldInspector inspector: String){
        if let index = self.workers.firstIndex(of: inspector){
            workers.remove(at: index)
        }
    }
    
    public func addBuilding(aBuilding building: Building){
        buildings.append(building)
    }
    
    public func getplantCode() -> String {
        return self.plantCode
    }
    
    public func setPlantCode(plantCode aPlantCode: String){
        self.plantCode = aPlantCode
    }
    
}
