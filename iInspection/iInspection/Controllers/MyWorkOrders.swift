//
//  ViewController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-21.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import Firebase


class MyWorkOrders: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    let headerID = "headerId"
    let footerID = "footerId"
    var myWorkOrders = [Workorder]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 63).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48).isActive = true
        
        collectionView.register(WorkOrderCellCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
        
       
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myWorkOrders.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WorkOrderCellCollectionViewCell
        cell.workOrderNumberLabel.text = String(myWorkOrders[indexPath.row].getWorkOrderNumber())
        cell.statusLabel.text = myWorkOrders[indexPath.row].getStatus()
        cell.itemLabel.text = myWorkOrders[indexPath.row].getItem().getNickname()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
            header.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
            
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
            
            button.setTitle("Create Work Order" , for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            header.addSubview(button)
            button.leftAnchor.constraint(equalTo: header.leftAnchor).isActive = true
            button.rightAnchor.constraint(equalTo: header.rightAnchor).isActive = true
            button.topAnchor.constraint(equalTo: header.topAnchor).isActive = true
            button.bottomAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
            button.addTarget(self, action: #selector(createWorkOrder), for: .touchUpInside)
            return header
        
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
            footer.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
            return footer
        }
        
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    @objc func createWorkOrder() {
        let createWorkOrderViewController = CreateWorkOrderController()
        present(createWorkOrderViewController, animated: true, completion: nil)
    }
        
}

