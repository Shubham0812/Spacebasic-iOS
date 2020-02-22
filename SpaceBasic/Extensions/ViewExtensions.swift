//
//  ViewExtensions.swift
//  SpaceBasic
//
//  Created by Shubham Singh on 22/02/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
