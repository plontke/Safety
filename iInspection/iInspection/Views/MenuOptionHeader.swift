//
//  MenuOptionHeader.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-08-04.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit

class MenuOptionHeader: UITableViewHeaderFooterView {
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: label.font.fontName, size: 25)
        label.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        label.textColor = .white
        
        label.insetsLayoutMarginsFromSafeArea = true
        return label
    }()
    
    let plantLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: label.font.fontName, size: 25)
        label.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        label.textColor = .white
        label.insetsLayoutMarginsFromSafeArea = true
        return label
    }()
    
    let emailLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.text = "Brian.plontke@tourmaline.com"
        label.textColor = .white
        return label
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(nameLabel)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView?.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
