//
//  WorkOrderCellCollectionViewCell.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-07-26.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit

class WorkOrderCellCollectionViewCell: UICollectionViewCell {
    
    var workOrderNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    var workOrderDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Work Order Number:"
        return label
    
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var itemLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        addSubview(workOrderNumberLabel)
        addSubview(statusLabel)
        addSubview(itemLabel)
        addSubview(workOrderDetailLabel)
        addSubview(separatorView)
        setupLabels()
    }
    
    
    func setupLabels() {
        
        
        workOrderDetailLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        workOrderDetailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        workOrderDetailLabel.rightAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        workOrderDetailLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        
        workOrderNumberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        workOrderNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 15).isActive = true
        workOrderNumberLabel.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -50).isActive = true
        workOrderNumberLabel.topAnchor.constraint(equalTo: workOrderDetailLabel.bottomAnchor).isActive = true
        
        
        statusLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25).isActive = true
        statusLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    
        

        itemLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        itemLabel.leftAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        itemLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25).isActive = true
        itemLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor).isActive = true
        
        separatorView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1).isActive = true
        separatorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        

    }
    
    
}
