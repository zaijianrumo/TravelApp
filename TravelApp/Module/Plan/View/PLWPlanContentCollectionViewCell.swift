//
//  PLWPlanContentCollectionViewCell.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/7.
//

import UIKit

class PLWPlanContentCollectionViewCell: UICollectionViewCell {
   
    lazy var coverImg:UIImageView = {
        let coverImg = UIImageView()
        return coverImg
    }()
    
    lazy var headIcon:UIImageView = {
        
        let headIcon = UIImageView()
        return headIcon
    }()
    lazy var nickNameLab:UILabel = {
        let nickNameLab = UILabel()
        nickNameLab.textColor = UIColor.black
        nickNameLab.font = UIFont.systemFont(ofSize: 15)
        return nickNameLab
    }()
    lazy var desLab: UILabel = {
        let desLab = UILabel()
        desLab.textColor
        = UIColor.gray
        desLab.font = UIFont.systemFont(ofSize: 15)
        return desLab
        
    }()
     
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.contentView.addSubview(self.coverImg)
        self.coverImg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.contentView.addSubview(self.headIcon)
        self.headIcon.snp.makeConstraints { make in
            make.width.height.equalTo(44)
            make.left.top.equalTo(self.contentView).offset(10)
        }
        
        self.contentView.addSubview(self.nickNameLab)
        self.nickNameLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.headIcon)
            make.left.equalTo(self.headIcon.snp_right).offset(10)
        }
        
        self.contentView.addSubview(self.desLab)
        self.desLab.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
