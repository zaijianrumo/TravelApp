//
//  PLWHomeViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit

import SnapKit
import Kingfisher
import SwiftyFitsize

class PLWHomeViewController: PLWBaseViewController {


    var cussearchBar:PLWCustomSearchBar!
    
    var homeModel = HomeViewModel()

    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.register(ScrollBannerCell.self, forCellReuseIdentifier: ScrollBannerCell.identifier)
        tableView.register(CircleMenusCell.self, forCellReuseIdentifier: CircleMenusCell.identifier)
        return tableView
    }()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.cussearchBar.adjustPosition()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
       
    }
    
    func setUI() {
        
        let leftItem = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuBtnClicked))
        let rightItem = UIBarButtonItem(image: UIImage(named: "microphone")?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(microphoneBtnClicked))
        self.cussearchBar = PLWCustomSearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.titleView = self.cussearchBar
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.bottom.equalTo(-kTabbarHeight)
            make.top.equalTo(kStatusBarAndNavigationBarHeight)
        }
        
        
    }
    
    @objc func menuBtnClicked() {}
    
    @objc func microphoneBtnClicked() {}

}
  

extension PLWHomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ScrollBannerCell.identifier, for: indexPath) as! ScrollBannerCell
            return cell
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CircleMenusCell.identifier, for: indexPath) as! CircleMenusCell
            return cell
        }
 
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 140
        }else {
            return 80
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

    
}




