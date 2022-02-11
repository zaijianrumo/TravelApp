//
//  HomeViewModel.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/10.
//

import UIKit
import Foundation
import Alamofire


protocol HomeViewModelDelegate:NSObject {
    func onFetchComplete()
    func onFetchFailed(with reason: String)
    
}

// 首页 ViewModel

class HomeViewModel: NSObject {
    var sections = [HomeViewModelSection]();
    weak var delegate: HomeViewModelDelegate?
    
    override init() {
        super.init()
        fetchData()
    }
    
    //获取圆形数据
    func fetchData() {
        do {
            if let bundlePath = Bundle.main.path(forResource: "mockdata2", ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let menuData = try JSONDecoder().decode(Menus.self, from: jsonData)
                let data: [Datum] = menuData.data
                self.sections.insert(MenusModel(data: data), at: 0)
                self.delegate?.onFetchComplete()
            } else {
                self.delegate?.onFetchFailed(with:"++++++++++++ 解析圆形按钮数据失败 ++++++++++++")
    
            }
        } catch let err {
            print(err)
            self.delegate?.onFetchFailed(with: err.localizedDescription)
    
        }
        
    }
}
