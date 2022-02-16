//
//  PLWShopCollectionViewCell.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/15.
//

import UIKit
import SnapKit
import Kingfisher
class PLWShopCollectionViewCell: UICollectionViewCell {
    
    
    //封面
    lazy var coverImage:UIImageView = {
        let coverImg = UIImageView()
        return coverImg
    }()
    
    //标题
    lazy var title:UILabel = {
        let title = UILabel()
        title.numberOfLines  = 1
        title.textColor = UIColor.black
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.textAlignment = .left
        title.text = ""
        return title
    }()
    
    //原价
    lazy var origianPrice:UILabel = {
        let title = UILabel()
        title.textColor = UIColor.black.withAlphaComponent(0.8)
        title.font = UIFont.systemFont(ofSize: 12)
        title.textAlignment = .left
        title.text = ""
        return title
    }()
    
    //现价
    lazy var newPrice:UILabel = {
        let title = UILabel()
        title.textColor = UIColor.red
        title.font = UIFont.systemFont(ofSize: 15)
        title.textAlignment = .left
        title.text = ""
        return title
    }()
    
    var shopModel:GoodsModel? {
        didSet {
            guard let shopModel = shopModel else {
                return
            }
            self.coverImage.kf.setImage(with: URL(string: shopModel.image!))
            
            self.title.text = shopModel.name
            
            self.newPrice.text = "￥" + String(shopModel.mallPrice!)
            
            let price:String = "￥" + String(shopModel.price!)
            
               let priceString = NSMutableAttributedString.init(string: price)
            priceString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber.init(value: 1), range: NSRange(location: 0, length: priceString.length))
            self.origianPrice.attributedText = priceString
        }

    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.backgroundColor
        = UIColor.white
        self.contentView.addSubview(self.coverImage)
        self.contentView.addSubview(self.title)
        self.contentView.addSubview(self.newPrice)
        self.contentView.addSubview(self.origianPrice)
        
        self.coverImage.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(self.contentView.frame.size.width)
        }
        self.title.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview()
            make.top.equalTo(self.coverImage.snp_bottom).offset(10)
        }
        self.newPrice.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.top.equalTo(self.title.snp_bottom).offset(5)
        }
        self.origianPrice.snp.makeConstraints { make in
            make.left.equalTo(self.newPrice.snp_right).offset(5)
            make.centerY.equalTo(self.newPrice)
        }

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    class var identifier:String {
        return String(describing:self)
    }
  
    
}
