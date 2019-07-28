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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        let image = UIImage(ciImage: BarcodeGenerator.generate(from: self.selectedCode, descriptor: .qr, size: CGSize(width: 100, height: 100))!)
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        share(image: image)
    }
    
    func share(image: UIImage){
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        present(vc, animated: true, completion: nil)
    }
    
}
