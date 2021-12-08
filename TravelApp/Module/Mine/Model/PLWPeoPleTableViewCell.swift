//
//  PLWPeoPleTableViewCell.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/8.
//

import UIKit

class PLWPeoPleTableViewCell: UITableViewCell {

    public var nameLable = UILabel()
    
    public  var ageLab = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addUI() {
     
        nameLable.font = UIFont.systemFont(ofSize: 14)
        nameLable.textColor = UIColor.black
        contentView.addSubview(nameLable)
        nameLable.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
     
        ageLab.font = UIFont.systemFont(ofSize: 14)
        ageLab.textColor = UIColor.black
        contentView.addSubview(ageLab)
        ageLab.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(nameLable.snp_right).offset(10)
        }
 
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
