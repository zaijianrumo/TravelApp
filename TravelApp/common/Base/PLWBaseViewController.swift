//
//  PLWBaseViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit
import MJRefresh
class PLWBaseViewController: UIViewController {

    
    //页码
    var page:Int = 1
    
    //MARK: - 刷新
    var header = MJRefreshNormalHeader()
    var footer = MJRefreshBackNormalFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBackground
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
