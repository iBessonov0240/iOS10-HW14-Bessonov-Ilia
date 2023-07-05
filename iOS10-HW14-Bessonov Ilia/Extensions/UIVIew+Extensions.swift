//
//  UIVIew+Extensions.swift
//  iOS10-HW14-Bessonov Ilia
//
//  Created by i0240 on 05.07.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}
