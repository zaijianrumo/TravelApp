//
//  PLWHomeViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit
import FSPagerView
import SnapKit
import Kingfisher
import SwiftyFitsize

class PLWHomeViewController: PLWBaseViewController {


    var cussearchBar:PLWCustomSearchBar!
    
    var homeModel = HomeViewModel()
    
    private lazy var pagerView: FSPagerView = {
        let pagerView = FSPagerView()
        pagerView.delegate = self
        pagerView.dataSource  = self
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval =  3
        pagerView.itemSize = CGSize.init(width: SCREEN_WIDTH - 20, height: 140)
        pagerView.transformer = FSPagerViewTransformer(type: .zoomOut)
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "ShopBannerCell")
        return pagerView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.cussearchBar.adjustPosition()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    func setUI() {
        
        ///NOTE:轮播图
        view.addSubview(pagerView)
        let height:CGFloat = 160~
        pagerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(kStatusBarAndNavigationBarHeight+10)
            make.height.equalTo(height)
        }
        
        let leftItem = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuBtnClicked))
        let rightItem = UIBarButtonItem(image: UIImage(named: "microphone")?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(microphoneBtnClicked))
        self.cussearchBar = PLWCustomSearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.titleView = self.cussearchBar
        
        let meun:MenusModel = homeModel.sections[0] as! MenusModel
        let menuView = PLWHomeMenuView(frame: CGRect(x: 0, y: kStatusBarAndNavigationBarHeight + 15 + height, width: SCREEN_WIDTH, height: 80))
        menuView.menuArray = meun.data
        self.view.addSubview(menuView)
        menuView.menuBlock = {
            (index:Int) in
            print("点击了第\(index)item")
        }
        
        
    }
    
    @objc func menuBtnClicked() {}
    @objc func microphoneBtnClicked() {}

}
  



extension PLWHomeViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    // - FSPagerView Delegate
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 3
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ShopBannerCell", at: index)
        cell.imageView?.kf.setImage(with:URL(string: "https://img.lianzhixiu.com/uploads/allimg/202104/9999/db598b8b76.jpg"), placeholder: .none, options: .none, progressBlock: { receivedSize, totalSize in
            
        }, completionHandler: { image, error, cacheType, imageURL in
            
        })
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
      

    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
     
        
    }
    
    
}
