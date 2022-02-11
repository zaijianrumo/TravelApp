//
//  PLWHomeMenuCellCollectionViewCell.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/11.
//

import UIKit
import SnapKit
import Kingfisher

class PLWHomeMenuCellCollectionViewCell: UICollectionViewCell {
    
    lazy var menuLayer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkModelColor
        return view
    }()
    
    lazy var menuIcon:UIImageView = {
        let menuIcon = UIImageView()
        menuIcon.tintColor = UIColor.dragonBallColor
        return menuIcon
    }()
    
    lazy var menuTitle:UILabel = {
        let menuTitle = UILabel()
        menuTitle.textColor = UIColor.black
        menuTitle.textAlignment = .center
        menuTitle.font = UIFont.boldSystemFont(ofSize: 13)
        return menuTitle
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(self.menuLayer)
        self.menuLayer.addSubview(self.menuIcon)
        self.contentView.addSubview(self.menuTitle)
  
        self.menuLayer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(self.frame.size.width * 0.6)
        }
        self.menuIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(self.frame.size.width * 0.6)
        }
        self.menuTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        // 设置菜单圆角
        self.menuLayer.layer.cornerRadius = self.frame.size.width * 0.6 * 0.5
    }
    func setContent(imageUrl:String,title:String) {
        
        let cache = KingfisherManager.shared.cache
        let imgModify = RenderingModeImageModifier(renderingMode: .alwaysTemplate)
        let optionsInfo = [KingfisherOptionsInfoItem.imageModifier(imgModify),KingfisherOptionsInfoItem.targetCache(cache)]
        
        self.menuIcon.kf.setImage(with: URL(string: imageUrl), placeholder:nil, options: optionsInfo) { receivedSize, totalSize in
        
        } completionHandler: { image, error, cacheType, imageURL in
        
        }
        self.menuTitle.text = title
        
    }
    
    
    
}
