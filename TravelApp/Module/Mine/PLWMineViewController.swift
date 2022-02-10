//
//  PLWMineViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit
import RxCocoa
import RxSwift
class PLWMineViewController: PLWBaseViewController {

    
    let peopleList = PeoPleListModel()
    let disposeBag1 = DisposeBag()
    
    lazy var myTableView: UITableView =  {
        let tableview = UITableView(frame: CGRect.zero, style: .plain)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "peoplecell")
        return tableview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { make in 
            make.edges.equalTo(self.view.usnp.edges)
        }
        
        peopleList.data.bind(to: self.myTableView.rx.items(cellIdentifier: "peoplecell")){
        _,model,cell in
//            cell.textLabel?.text = model.name
//            cell.detailTextLabel?.text = String(model.age)
        }.disposed(by: disposeBag1)
        
        self.myTableView.rx.modelSelected(People.self).subscribe { people in
            print("选择了\(people)")
        }.disposed(by: disposeBag1)

    }

}
