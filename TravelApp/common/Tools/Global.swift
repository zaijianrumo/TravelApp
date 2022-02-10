//
//  Global.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

extension UIColor {
    static var randomColor: UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256))/255.0, green: CGFloat(arc4random_uniform(256))/255.0, blue: CGFloat(arc4random_uniform(256))/255.0, alpha: 1.0)
    }
}
public let KScree_width = UIScreen.main.bounds.size.width
public let KScree_height = UIScreen.main.bounds.size.height




//MARK: SnapKit
extension ConstraintView {
    
    var usnp: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
}

// MARK: ========= app所需要的三方key ==========
public struct APPConfigKey {
    ///高德APPKEY
    static  let amapServicesAppKey: NSString = "774fcb6acd37b5c2c301396fafcc60c9"
    
}
