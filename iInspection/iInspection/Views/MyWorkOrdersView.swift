//
//  MyWorkOrdersView.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-07-28.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit

class MyWorkOrdersView: UICollectionView {

    override init() {
        
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
        super.init()
        
        
    }

}
