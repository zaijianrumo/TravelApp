//
//  PLWMineViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit
import SnapKit
import MJRefresh
class PLWMineViewController: PLWBaseViewController {

    var shopViewModel = PLWShopVIewModel()
    
    // 圆形图标布局
    private lazy var menusViewFlowLayout: UICollectionViewFlowLayout = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.minimumLineSpacing = 1
        collectionFlowLayout.minimumInteritemSpacing = 1
        collectionFlowLayout.itemSize = CGSize(width: SCREEN_WIDTH / 2 - 1, height: 255)
        return collectionFlowLayout
    }()
    
    private lazy var colllectonView:UICollectionView = {
        
        let collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1), collectionViewLayout: self.menusViewFlowLayout)
        collectionView.register(PLWShopCollectionViewCell.self, forCellWithReuseIdentifier: PLWShopCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.darkModelColor
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.colllectonView)
        self.colllectonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        //上拉
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRereshing))
        self.colllectonView.mj_header = header
        //下拉
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRereshing))
        self.colllectonView.mj_footer  = footer
        
        self.colllectonView.mj_header?.beginRefreshing()
    
    }
    @objc  func headerRereshing() {
        self.page = 1
//         shopViewModel.fetchData()
        shopViewModel.loadBelowListData(page: self.page, collectionView: self.colllectonView) { (listArr) in
        }
    }
    @objc  func footerRereshing() {
        self.page += 1
        shopViewModel.loadBelowListData(page: self.page, collectionView: self.colllectonView){ (listArr) in
//            print("请求到的数据有\(listArr.count)条")
        }
    }
    
}
extension PLWMineViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopViewModel.belowList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PLWShopCollectionViewCell.identifier, for: indexPath) as! PLWShopCollectionViewCell
        cell.shopModel = shopViewModel.belowList[indexPath.row]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
