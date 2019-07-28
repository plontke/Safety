//
//  CreateWorkOrderView.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-07-27.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit

class CreateWorkOrderView: UIView {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create New Work Order"
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: label.font.fontName, size: 35)
        return label
    }()
    
    let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter the Piece of Equipments Name"
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: label.font.fontName, size: 20)
        return label
    }()
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        
        return view
    }()
    
    let itemNicknameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Equipment Nickname"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        self.addSubview(titleLabel)
        self.addSubview(inputsContainerView)
        self.addSubview(itemNicknameField)
        self.addSubview(secondTitleLabel)
        setupSubviews()
    }
    
    
    func setupSubviews() {
        setupTitleLabel()
        setupSecondaryTitleLabel()
        setupInputsContainerView()
        setupItemField()
    }
    
    
    func setupInputsContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func setupSecondaryTitleLabel() {
        secondTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        secondTitleLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35).isActive = true
        secondTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        secondTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    func setupTitleLabel() {
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 45).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    func setupItemField() {
        itemNicknameField.topAnchor.constraint(equalTo: self.inputsContainerView.topAnchor).isActive = true
        itemNicknameField.bottomAnchor.constraint(equalTo: self.inputsContainerView.topAnchor, constant: 50).isActive = true
        itemNicknameField.leftAnchor.constraint(equalTo: self.inputsContainerView.leftAnchor, constant: 6).isActive = true
        itemNicknameField.rightAnchor.constraint(equalTo: self.inputsContainerView.rightAnchor).isActive = true
    }
    
   
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
 
}
