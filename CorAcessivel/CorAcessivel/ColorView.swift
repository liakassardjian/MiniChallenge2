//
//  ColorView.swift
//  CorAcessivel
//
//  Created by Felipe Kaça Petersen on 17/04/19.
//  Copyright © 2019 Felipe Kaça Petersen. All rights reserved.
//

import Foundation
import UIKit

class ColorView: UIView {
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.bounds.height / 2
//        self.drawShadow()
    }
    
    func drawShadow() {
        let size = self.frame.size
        self.clipsToBounds = true
        let layer: CALayer = CALayer()
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.position = CGPoint(x: size.width / 2, y: -size.height / 2 + 0.5)
        layer.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
//        self.shadowLayer = layer
        
        self.layer.addSublayer(layer)
        
    }
    
}
