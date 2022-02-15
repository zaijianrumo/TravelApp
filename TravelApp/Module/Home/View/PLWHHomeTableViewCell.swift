//
//  PLWHHomeTableViewCell.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/11.
//

import UIKit
import FSPagerView
import Kingfisher

class BaseViewCell:UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

///NOTE:轮播图
class ScrollBannerCell:BaseViewCell {
    class var identifier:String {
        return String(describing:self)
    }
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.pagerView)
        self.pagerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ScrollBannerCell: FSPagerViewDelegate, FSPagerViewDataSource {
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
///NOTE:Memu

class  CircleMenusCell:BaseViewCell {
    
    class var identifier:String {
        return String(describing:self)
    } 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let meun:MenusModel = HomeViewModel().sections[0] as! MenusModel
        let menuView = PLWHomeMenuView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 80))
        menuView.menuArray = meun.data
        self.contentView.addSubview(menuView)
        menuView.menuBlock = {
            (index:Int) in
            print("点击了第\(index)item")
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
