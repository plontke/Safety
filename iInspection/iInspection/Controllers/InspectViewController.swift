//
//  InspectViewController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-28.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit

class InspectViewController: UIViewController {
    var selectedCode: String = ""
    
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        view.addSubview(label)
        label.text = self.selectedCode
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 400).isActive = true
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
        // Do any additional setup after loading the view.
    }
    
}
