//
//  PeopleViewModel.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/8.
//

import Foundation
import RxSwift
struct PeoPleListModel {
    
    let data = Observable.just([
     People(name: "张三", age: 19),
     People(name: "李四", age: 25),
     People(name: "王五", age: 40),
     People(name: "小毛", age: 90)
    ])
    
    
    
}
