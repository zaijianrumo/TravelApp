//
//  PLWColor.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/11.
//

import UIKit

extension UIColor {
    //UIView 背景颜色
    public class var darkModelColor:UIColor {
        if #available(iOS 13.0, *) {
            return UIColor {
                (trainCollection) -> UIColor in
                if trainCollection.userInterfaceStyle == .dark {
                    return .systemBackground
                }else {
                    return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
                }
            }
        }else {
            return .systemBackground
        }  
    }
    /// circel menu color
    public class var dragonBallColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor{ (trainCollection) -> UIColor in
                if trainCollection.userInterfaceStyle == .dark {
                    return UIColor(red: 214/255, green: 56/255, blue: 57/255, alpha: 1)
                } else {
                    return UIColor(red: 253/255, green: 79/255, blue: 79/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 253/255, green: 79/255, blue: 79/255, alpha: 1)
        }
    }
}
