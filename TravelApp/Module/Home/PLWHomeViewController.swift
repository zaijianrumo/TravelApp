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


    private lazy var pagerView: FSPagerView = {
        let pagerView = FSPagerView()
        pagerView.delegate = self
        pagerView.dataSource  = self
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval =  3
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "ShopBannerCell")
        return pagerView
    }()
    
 
    override func viewDidLoad() {
 
        super.viewDidLoad()
        view.addSubview(pagerView)

        let height:CGFloat = 240~
        pagerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(88)
            make.height.equalTo(height)
        }
    
    }

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
