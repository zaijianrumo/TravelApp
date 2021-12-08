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
import RxSwift
import RxCocoa
import RxRelay
class PLWHomeViewController: PLWBaseViewController {

    public let disposeBag = DisposeBag()
    
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
//        view.addSubview(pagerView)
//
//        let height:CGFloat = 240~
//        pagerView.snp.makeConstraints { make in
//            make.left.top.right.equalToSuperview()
//            make.height.equalTo(height)
//        }
        let nameLable = UILabel()
        nameLable.font = UIFont.systemFont(ofSize: 14)
        nameLable.textColor = UIColor.black
        view.addSubview(nameLable)
        nameLable.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        let  button = UIButton(type: .custom)
        button.setTitle("点我啊", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.frame = CGRect(x: 100, y: 200, width: 130, height: 50)
        self.view.addSubview(button)
        button.rx.tap.subscribe { _ in
            print("安安点击")
        }.disposed(by: disposeBag)

        
       let textField = UITextField()
        textField.frame = CGRect(x: 100, y: 300, width: 130, height: 50)
        textField.backgroundColor = UIColor.red
       view.addSubview(textField)
        textField.rx.text.subscribe { (event:Event<String?>) in
            print(event.element!!)
        }.disposed(by: disposeBag)
        
        
        ///数据绑定
        textField.rx.text.bind(to: nameLable.rx.text).disposed(by: disposeBag)
        
//        //kvo
        nameLable.rx.observe(String.self, "text").subscribe { str in
            self.title = str
        }.disposed(by: disposeBag)
        //UIScrollView的滚动
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 100, height: 400)
        scrollView.rx.contentOffset.subscribe { (point: CGPoint) in
            
        }.disposed(by: disposeBag)

        
        

        
        
        
        
        
        
        
//
    }

}




extension PLWHomeViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    // - FSPagerView Delegate
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 3
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ShopBannerCell", at: index)
        cell.imageView?.kf.setImage(with:URL(string: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F53%2F0a%2Fda%2F530adad966630fce548cd408237ff200.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641433634&t=ce7df98cdf7b977ede4083210f4865b2"), placeholder: .none, options: .none, progressBlock: { receivedSize, totalSize in
            
        }, completionHandler: { image, error, cacheType, imageURL in
            
        })
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
      

    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
     
        
    }
    
    
}
