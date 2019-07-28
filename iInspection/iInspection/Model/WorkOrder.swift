//
//  WorkOrder.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-07-26.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import Foundation
import Firebase


public class Workorder: NSObject {
    
    enum Status: String{
        case Created
        case Approved
        case Cancelled
        case Finished
    }
    
    private var workOrderNumber: Int
    private var item: Item
    private var labourCost: Float
    private var partsCost: Float
    private var estimatedCost: Float
    private var status: Status
    private var orignator: User
    private var notes: String
    
    
    
    init(Item item: Item, EstimatedCost estCost: Float, Originator originator: User, Notes notes: String) {
        self.workOrderNumber = 0
        self.item = item
        self.estimatedCost = estCost
        self.labourCost = 0
        self.partsCost = 0
        self.status = Status.Created
        self.orignator = originator
        self.notes = notes
        super.init()
        setWorkOrderNumber()
    }
    
    init(Item item: Item, EstimatedCost estCost: Float, WorkorderNumber workOrderNumber: Int, Originator originator: User, Notes notes: String, Status status: Status ){
        self.workOrderNumber = workOrderNumber
        self.item = item
        self.estimatedCost = estCost
        self.labourCost = 0
        self.partsCost = 0
        self.status = status
        self.orignator = originator
        self.notes = notes
    }
    
    private func setWorkOrderNumber(){
        FirebaseApp.configure()
        let db = Firestore.firestore()
        let largestWO = db.collection("workOrders").order(by: "WOnumber").limit(to: 1)
        largestWO.getDocuments(completion: {(snapshot, error) in
            if error != nil{
                print(error ?? "error")
                return
            } else {
                for document in (snapshot?.documents)!{
                    print(document)
                    let largestNumber = document.data()["workOrderNumber"] as? Int
                    self.workOrderNumber = largestNumber ?? 1
                    print(largestNumber ?? 12)
                }
                if (snapshot?.documents.count ?? 0 < 1) {
                    self.workOrderNumber = 1
                }
            }
            })
    }
    
    public func getWorkOrderNumber() -> Int{
        return workOrderNumber
    }
    
    
    public func getStatus() -> String {
        return self.status.rawValue
    }
    
    func getItem() -> Item {
        return self.item
    }
}
