//
//  Item.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-29.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    private var workOrderCodes: [String]
    private var buildingCode: String
    private var nickname: String
    private var itemCode: String
    private var latestDate: Date
    
    init(BuildingCode buildingCode: String, nickname: String, itemCode: String){
        self.buildingCode = buildingCode
        self.workOrderCodes = []
        self.itemCode = itemCode
        self.nickname = nickname
        self.latestDate = Date()
    }
    
    public func getBuildingCode() -> String {
        return self.buildingCode
    }
    
    public func setBuildingCode(buildingCode: String){
        self.buildingCode = buildingCode
    }
    
    public func getNickname() -> String {
        return self.nickname
    }
    
    public func setNickname(nickname: String){
        self.nickname = nickname
    }
    
    public func setItemCode(itemCode: String){
        self.itemCode = itemCode
    }
    
    public func getItemCode() -> String{
        return self.itemCode
    }
    
    public func addInspection(workOrderCode: String){
        self.workOrderCodes.append(workOrderCode)
    }
    
  
}
