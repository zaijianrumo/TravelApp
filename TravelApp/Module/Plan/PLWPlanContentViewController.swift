//
//  PLWPlanContentViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/7.
//

import UIKit
import DNSPageView

class PLWPlanContentViewController: PLWBaseViewController {

    
    var index:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor
        // Do any additional setup after loading the view.
    }
    

}
extension PLWPlanContentViewController:PageEventHandleable {
    
    func titleViewDidSelectSameTitle() {
        print("重复点击了标题，index：\(index)")
    }
    
    // 当前 controller 滑动结束的时候调用
    func contentViewDidEndScroll() {
        print("contentView滑动结束，index：\(index)")
    }
    
    func contentViewDidDisappear() {
        print("我消失了，index：\(index)")
    }
    
}
