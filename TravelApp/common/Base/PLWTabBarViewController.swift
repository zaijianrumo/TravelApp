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
        
        let appearance = UITabBarAppearance()
        //tabBar背景颜色
        appearance.backgroundColor = UIColor.white
        
        //tabBaritem title选中状态颜色
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.gray]
        //tabBaritem title未选中状态颜色
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = appearance
      
        } else {
        }
        self.tabBar.standardAppearance = appearance
       

 
        let home = PLWHomeViewController()
        addChild(home, title: "云村", normalImg: "music.note.list", selectImg: "music.note.list.fill")
        
        let plan = PLWPlanViewController()
        addChild(plan, title: "计划", normalImg: "bolt.heart", selectImg: "bolt.heart.fill")
        
        let video = PLWVideoViewController()
        addChild(video, title: "视频", normalImg: "video", selectImg: "video.fill")
             
        let mine = PLWMineViewController()
        addChild(mine, title: "我的", normalImg: "book", selectImg: "book.fill")
 
    }
    
    func addChild(_ childController: UIViewController,title:String,normalImg:String,selectImg:String) {
        
        let nav = PLWNavViewController(rootViewController: childController)
        
        childController.navigationItem.title = title;
        
        childController.tabBarItem.title  = title
        
        childController.tabBarItem.image = UIImage(systemName: normalImg)
                
        childController.tabBarItem.selectedImage = UIImage(systemName: normalImg)?.withRenderingMode(.alwaysOriginal)
        
        addChild(nav)
        
    }
    
 
  
}
