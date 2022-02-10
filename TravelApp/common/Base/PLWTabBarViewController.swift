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
        
        childController.navigationItem.title = title;
        
        childController.tabBarItem.title  = title
        
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        
        childController.tabBarItem.image = UIImage(systemName: normalImg)
                
        childController.tabBarItem.selectedImage = UIImage(systemName: normalImg)?.withRenderingMode(.alwaysOriginal)

        let nav = PLWNavViewController(rootViewController: childController)
        
        addChild(nav)
        
    }
    
 
  
}
