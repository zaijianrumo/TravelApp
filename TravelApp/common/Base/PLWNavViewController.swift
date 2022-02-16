//
//  PLWNavViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit

class PLWNavViewController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white
        self.navigationBar.standardAppearance = appearance;
        self.navigationBar.scrollEdgeAppearance = appearance;

     
      
        
        // Do any additional setup after loading the view.
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    

}
