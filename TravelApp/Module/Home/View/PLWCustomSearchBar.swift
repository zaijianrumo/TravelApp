//
//  PLWCustomSearchBar.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/10.
//

import UIKit

class PLWCustomSearchBar: UISearchBar {

    override init(frame:CGRect) {
        super.init(frame: frame)
        self.searchTextField.placeholder = "周杰伦"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func adjustPosition() {
        var frame: CGRect
        frame = self.searchTextField.frame
        
        //获取 placeholder 大小
        let r = self.searchTextField.placeholderRect(forBounds: self.searchTextField.bounds)
        let offset = UIOffset(horizontal: (frame.size.width - r.width - 40)/2, vertical: 0)
        self.setPositionAdjustment(offset, for: .search)
        
        
    }
    
}
