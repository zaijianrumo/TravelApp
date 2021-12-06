//
//  PLWTabBarViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit

class PLWTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
        
        
        let home = PLWHomeViewController()
        addChild(home, title: "首页", normalImg: "", selectImg: "")
        
        let plan = PLWPlanViewController()
        addChild(plan, title: "计划", normalImg: "", selectImg: "")
        
        let mine = PLWMineViewController()
        addChild(mine, title: "我的", normalImg: "", selectImg: "")
 
    }
    
    func addChild(_ childController: UIViewController,title:String,normalImg:String,selectImg:String) {
        
        let nav = PLWNavViewController(rootViewController: childController)
        nav.tabBarItem.title = title
        childController.title = title;
        childController.tabBarItem.image = UIImage(named: normalImg)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: normalImg)?.withRenderingMode(.alwaysOriginal)
        addChild(nav)
        
    }
    
 
  
}
