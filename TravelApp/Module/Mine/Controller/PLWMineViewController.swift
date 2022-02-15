//
//  PLWMineViewController.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit
import SwiftyJSON
import HandyJSON

class PLWMineViewController: PLWBaseViewController {

    private var slidesList: [SlidesModel]?// 穿插的广告数据
    private var categoryList: [CategoryModel]?// category数据
    private var advertesPictureModel = AdvertesPictureModel() //客服数据
    private var shopInfoModle = ShopInfoModel() // 周年庆图片model
    private var zhouActivityList: [AdvertesPictureModel]? // 周年庆活动
    private var recommendList: [RecommendModel]? // 推荐商品
    private var fenModelList : [AdvertesPictureModel] = [] // 三个分组的数据
    private var fenModle = AdvertesPictureModel() // 周年庆图片model
    private var belowList: [GoodsModel]? //底部列表数据

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let paramet = ["lon":"116.47118377685547","lat":"39.91233444213867"]
        //首页列表数据
        NetWorkRequest(.homeGoodsList(parameters:paramet), completion: {
            (jsonString) in
            //轮播图数据
            if let slidesList = JSONDeserializer<SlidesModel>.deserializeModelArrayFrom(json: jsonString["data"]["slides"].description) {
                self.slidesList = slidesList as? [SlidesModel]
            }
            print("轮播图数据:\(String(describing: self.slidesList))")
            for sliModel in self.slidesList! {
                print(sliModel.image!)
            }
  
        }, failed: {
             (error)in
            print("error码:\(error)")
            
        }, errorResult: {
            
            
        })

    }

}
