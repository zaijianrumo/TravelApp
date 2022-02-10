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
public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

public var isFullScreen: Bool {
    if #available(iOS 11, *) {
          guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
              return false
          }
          if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
              print(unwrapedWindow.safeAreaInsets)
              return true
          }
    }
    return false
}
public let kStatusBarHeight : CGFloat = isFullScreen ? 44 : 20
public let kNavigationBarHeight : CGFloat =  44
public let kStatusBarAndNavigationBarHeight : CGFloat = isFullScreen ? 88 : 64
public let kBottomSafeMargin : CGFloat = isFullScreen ? 34 : 0
public let kTabbarHeight : CGFloat = isFullScreen ? 49 + 34 : 49
// MARK: ========= 屏幕适配 ==========
public let  kScaleX : Float = Float(SCREEN_WIDTH / 375.0)
public let  kScaleY : Float = Float(SCREEN_HEIGHT / 667.0)
///适配后的宽度
public func AdaptedWidth(_ w : Float) -> Float {
    return ceilf(w * kScaleX)
}
///适配后的高度
public func AdaptedHeight(_ h : Float) -> Float {
    return ceilf(h * kScaleY)
}


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
