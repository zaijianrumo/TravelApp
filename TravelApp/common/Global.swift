//
//  Global.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import Foundation
import UIKit

extension UIColor {
    static var randomColor: UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256))/255.0, green: CGFloat(arc4random_uniform(256))/255.0, blue: CGFloat(arc4random_uniform(256))/255.0, alpha: 1.0)
    }
}
