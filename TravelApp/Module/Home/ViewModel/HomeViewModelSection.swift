//
//  HomeViewModelSection.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/10.
//

import UIKit
import Foundation

//数据模型继承此协议

protocol HomeViewModelSection {
    var type: HomeViewModelSectionType {get}
    var rowCount: Int {get}
    var rowHeight: CGFloat {get}
    var frame: CGRect{get set}
}
extension HomeViewModelSection {
    var rowCount:Int {
        return 1
    }
}

