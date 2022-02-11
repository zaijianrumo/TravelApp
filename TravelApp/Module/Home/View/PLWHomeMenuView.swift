//
//  PLWHomeMenuView.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/11.
//

import UIKit

//点击cell的回调
public typealias MenuDidClickedBlock = (_ currentIndex:Int) -> Void

class PLWHomeMenuView: UIView {

    
    var menuBlock:MenuDidClickedBlock?
    
    let margin: CGFloat = 5
    // 圆形图标布局
    private lazy var menusViewFlowLayout: UICollectionViewFlowLayout = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.minimumLineSpacing = 0
        collectionFlowLayout.minimumInteritemSpacing = 0
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: margin, left: 0, bottom: margin, right: 0)
        return collectionFlowLayout
    }()
    
      private lazy var colllectonView:UICollectionView = {

          let collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1), collectionViewLayout: self.menusViewFlowLayout)
          collectionView.isPagingEnabled = true
          collectionView.showsVerticalScrollIndicator = false
          collectionView.showsHorizontalScrollIndicator = false
          collectionView.delegate = self
          collectionView.dataSource = self
          collectionView.bounces = true
          collectionView.backgroundColor = UIColor.clear
          collectionView.bounces = false
          return collectionView
        
    }()
    
    override func layoutSubviews() {
         super.layoutSubviews()
        self.colllectonView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        self.menusViewFlowLayout.itemSize = CGSize(width: 75 * 1.1, height: self.bounds.size.height-10)
        self.menusViewFlowLayout.scrollDirection = .horizontal
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.colllectonView)
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.colllectonView.delegate = nil
        self.colllectonView.dataSource = nil
        
    }
    //数据源
    
       var menuArray:[Datum]!{
        didSet {
            if menuArray != nil {
                self.colllectonView.register(PLWHomeMenuCellCollectionViewCell.self, forCellWithReuseIdentifier: "withReuseIdentifier")
            }
            self.colllectonView.reloadData()
            self.layoutIfNeeded()
            
        }
        
        
    }
    
    
}
extension PLWHomeMenuView:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "withReuseIdentifier", for: indexPath) as! PLWHomeMenuCellCollectionViewCell
        let item:Datum = self.menuArray[indexPath.row]
        cell.setContent(imageUrl: item.iconUrl ?? "", title: item.name ?? "")
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.menuBlock?(indexPath.row)
    }
}
