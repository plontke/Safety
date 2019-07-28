//
//  Building.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-29.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import Foundation

class Building: NSObject {
    
    private var plant: Plant
    private var itemCodes: [String]
    private var buildingCode: String
    private var nickname: String
    
    init(Plant plant: Plant, BuildingCode buildingCode: String, Nickname nickname: String){
        self.plant = plant
        self.itemCodes = []
        self.buildingCode = buildingCode
        self.nickname = nickname
        super.init()
    }
    
    public func addItem(ItemCode itemCode: String){
        itemCodes.append(itemCode)
    }
    
    public func deleteItem(ItemCode itemCode: String ){
        if let index = itemCodes.firstIndex(of: itemCode){
            itemCodes.remove(at: index)
        }
    }
    
    public func getBuildingCode() -> String {
        return self.buildingCode
    }
    
    public func setBuildingCode(BuildingCode buildingCode: String){
        self.buildingCode = buildingCode
    }
    
    public func getNickname() -> String {
        return self.nickname
    }
    
    public func setNickname(aNickname nickname: String){
        self.nickname = nickname
    }

}
