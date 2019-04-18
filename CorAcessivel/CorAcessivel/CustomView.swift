//
//  CustomView.swift
//  CorAcessivel
//
//  Created by Felipe Kaça Petersen on 18/04/19.
//  Copyright © 2019 Felipe Kaça Petersen. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}
