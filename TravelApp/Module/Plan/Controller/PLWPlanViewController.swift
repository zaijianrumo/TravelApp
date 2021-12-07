//
//  PLWPlanViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit
import DNSPageView
import SwiftyFitsize
class PLWPlanViewController: PLWBaseViewController {

    private lazy var pageViewManager: PageViewManager = {
        // 创建 PageStyle，设置样式
        let style = PageStyle()
        style.isShowBottomLine = false
        style.isTitleViewScrollEnabled = false
        style.titleColor = UIColor.gray
        style.titleSelectedColor = UIColor.black
        style.titleViewBackgroundColor = UIColor.clear
        style.titleFont = UIFont.boldSystemFont(ofSize: 14)~

        // 设置标题内容
        let titles = ["同城","推荐"]

        var childViewControllers:[PLWPlanContentViewController] = []
        // 创建每一页对应的 controller
        for i in 0..<titles.count {
            let controller = PLWPlanContentViewController()
            controller.index = i
            childViewControllers.append(controller)
        }
        
        return PageViewManager(style: style, titles: titles, childViewControllers: childViewControllers)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 单独设置 titleView 的 frame
        navigationItem.titleView = pageViewManager.titleView
        pageViewManager.titleView.frame = CGRect(x: 0, y: 0, width: 180, height: 44)

        // 单独设置 contentView 的大小和位置，可以使用 autolayout 或者 frame
        let contentView = pageViewManager.contentView
        view.addSubview(pageViewManager.contentView)
        contentView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self.view.usnp.edges)
        }
        
        if #available(iOS 11, *) {
            contentView.collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }

    }


}
