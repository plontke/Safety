//
//  BarcodeGenerator.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-29.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit

class BarcodeGenerator {
    enum Descriptor: String {
        case code128 = "CICode128BarcodeGenerator"
        case pdf417 = "CIPDF417BarcodeGenerator"
        case aztec = "CIAztecCodeGenerator"
        case qr = "CIQRCodeGenerator"
    }
    
    class func generate(from string: String,
                        descriptor: Descriptor,
                        size: CGSize) -> CIImage? {
        let filterName = descriptor.rawValue
        
        guard let data = string.data(using: .ascii),
            let filter = CIFilter(name: filterName) else {
                return nil
        }
        
        filter.setValue(data, forKey: "inputMessage")
        
        guard let image = filter.outputImage else {
            return nil
        }
        
        let imageSize = image.extent.size
        
        let transform = CGAffineTransform(scaleX: size.width / imageSize.width,
                                          y: size.height / imageSize.height)
        let scaledImage = image.transformed(by: transform)
        
        return scaledImage
    }
    
}
