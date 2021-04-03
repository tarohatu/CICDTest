//
//  UILabel+Attribute.swift
//  SampleProject
//
//  Created by Takuya Jimbo on 2021/03/31.
//  Copyright © 2021 Takuya Jimbo. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setAttribute(_ color: UIColor, size: CGFloat, range: NSRange) {
        let attributedText = NSMutableAttributedString(string: self.text!)
        attributedText.addAttributes([
            .foregroundColor: color,
            .font: UIFont.boldSystemFont(ofSize: size)
        ], range: range)
        self.attributedText = attributedText
    }
}
