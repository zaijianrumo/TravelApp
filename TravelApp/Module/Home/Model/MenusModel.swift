//
//  MenusModel.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/10.
//

import UIKit
import Foundation

class MenusModel: HomeViewModelSection {
    var rowHeight: CGFloat
    var frame: CGRect
    var type: HomeViewModelSectionType {
        return .MENUS
    }
    var rowCount: Int {
        return 1
    }
    var data: [Datum]!
    
    init(data: [Datum]) {
        self.data = data
        self.frame = MenusModel.caculateFrame()
        self.rowHeight = self.frame.size.height
        
    }
    /// 根据模型计算 View frame
    class func caculateFrame() -> CGRect {
        let height: CGFloat = 100 * CGFloat(1.4)
        let width: CGFloat = CGFloat(SCREEN_WIDTH)
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    
    
    
}
