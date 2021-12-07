//
//  PLWPlanContentViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/7.
//

import UIKit
import DNSPageView
import SwiftyFitsize
class PLWPlanContentViewController: PLWBaseViewController {
    
    var index:Int = 0
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: KScree_width/2, height:230~)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collection = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(PLWPlanContentCollectionViewCell.self, forCellWithReuseIdentifier: "PLWPlanContentCollectionViewCell")
    
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }

}

extension PLWPlanContentViewController:UICollectionViewDelegate {
    
}
extension PLWPlanContentViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:PLWPlanContentCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PLWPlanContentCollectionViewCell", for: indexPath) as! PLWPlanContentCollectionViewCell
        cell.backgroundColor = UIColor.randomColor
        return cell
    }
    
    
}



extension PLWPlanContentViewController:PageEventHandleable {
    
    func titleViewDidSelectSameTitle() {
        print("重复点击了标题，index：\(index)")
    }
    
    // 当前 controller 滑动结束的时候调用
    func contentViewDidEndScroll() {
        print("contentView滑动结束，index：\(index)")
    }
    
    func contentViewDidDisappear() {
        print("我消失了，index：\(index)")
    }
    
}
