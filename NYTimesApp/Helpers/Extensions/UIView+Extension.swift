//
//  UIView+Extension.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import UIKit

extension UIView {
    func circular() {
        layer.cornerRadius = layer.bounds.height / 2.0
        layer.masksToBounds = true
    }
    
    func borderd() {
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
    }
}
