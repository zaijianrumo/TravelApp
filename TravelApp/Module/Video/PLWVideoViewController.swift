//
//  PLWVideoViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/10.
//

import UIKit
import SnapKit
import JXPopupView
class PLWVideoViewController: PLWBaseViewController {

    
    var sectionArr = ["高德地图定位","自定义popView","share分享"]
    
    lazy var tableView:UITableView = {
        
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.dataSource  =  self
        tableView.delegate = self
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        if #available(iOS 15, *){
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tableView
        
    }()
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        

    }
}
extension PLWVideoViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = sectionArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        
        switch indexPath.row {
        case 0:
            PLWLocationManger.shared.aSingleLocation()
            break
        case 1: //此处代码可封装.暂时无
            let layout:BaseAnimator.Layout = .center(.init(offsetY: 0, offsetX: 0, width: 200, height: 200))
            let animator = FadeInOutAnimator(layout: layout)
            let contentView = UIView()
            contentView.backgroundColor = UIColor.randomColor
            let containerView = UIApplication.shared.keyWindow!
            let popupView = PopupView.init(containerView:containerView, contentView: contentView, animator: animator)
            popupView.backgroundView.style = .blur
            popupView.backgroundView.blurEffectStyle = .dark
            popupView.backgroundView.color = UIColor.randomColor
            popupView.isDismissible  = true
            //- 展示popupView
            popupView.display(animated: true, completion: nil)
            contentView.popupView()?.dismiss(animated: true, completion: nil)
            break
        default: break
            
        }
        
    }
}
