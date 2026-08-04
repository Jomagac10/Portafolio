//
//  ExtensionUIView.swift
//  KonfioTest
//
//  Created by Jose Manuel Garcia Chavez on 25/04/25.
//

import UIKit

extension UIView {
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}

