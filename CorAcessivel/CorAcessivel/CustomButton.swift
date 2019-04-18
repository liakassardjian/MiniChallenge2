//
//  CustomButton.swift
//  CorAcessivel
//
//  Created by Felipe Kaça Petersen on 18/04/19.
//  Copyright © 2019 Felipe Kaça Petersen. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}

class CustomScroll: UIScrollView {
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}
