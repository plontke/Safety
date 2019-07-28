//
//  Plant.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-29.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//



class Plant {
    private var lead: Lead;
    private var workers: [User]
    private var buildings: [Building]
    private var plantCode: String
    
    init(theLead lead: Lead, thePlantCode plantCode: String ){
        self.lead = lead
        self.plantCode = plantCode
        self.workers = []
        self.buildings = []
        
    }
    
    public func setLead(theLead lead: Lead){
        self.lead = lead
    }
    
    public func getLead() -> Lead {
        return self.lead
    }
    
    public func addWorkers(aWorker worker: User){
        workers.append(worker)
    }
    
    public func deleteInspector(oldInspector inspector: User){
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
