//
//  PLWShopVIewModel.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/15.
//

import UIKit
import SwiftyJSON
import HandyJSON
import MJRefresh

class PLWShopVIewModel: NSObject {
    
    // 成功数据的回调 JSON 字符串
    typealias successCallback = (([GoodsModel]) -> Void)
    
     var slidesList: [SlidesModel]?// 穿插的广告数据
     var categoryList: [CategoryModel]?// category数据
     var advertesPictureModel = AdvertesPictureModel() //客服数据
     var shopInfoModle = ShopInfoModel() // 周年庆图片model
     var zhouActivityList: [AdvertesPictureModel]? // 周年庆活动
     var recommendList: [RecommendModel]? // 推荐商品
     var fenModelList : [AdvertesPictureModel] = [] // 三个分组的数据
     var fenModle = AdvertesPictureModel() // 周年庆图片model
    var belowList = [GoodsModel]() //底部列表数据
    
    override init() {
        super.init()
        fetchData()
    }
    func fetchData()->(Void){
        
        
        let paramet = ["lon":"116.47118377685547","lat":"39.91233444213867"]
        //首页列表数据
        NetWorkRequest(.homeGoodsList(parameters:paramet), completion: {
            (jsonString) in
            //轮播图数据
            if let slidesList = JSONDeserializer<SlidesModel>.deserializeModelArrayFrom(json: jsonString["data"]["slides"].description) {
                self.slidesList = slidesList as? [SlidesModel]
            }
            //分类数据
            if let categoryList = JSONDeserializer<CategoryModel>.deserializeModelArrayFrom(json: jsonString["data"]["category"].description) {
                self.categoryList = categoryList as? [CategoryModel]
            }
            //客服数据
            if let advertesPicureModel = JSONDeserializer<AdvertesPictureModel>.deserializeFrom(json: jsonString["data"]["advertesPicture"].description) {
                self.advertesPictureModel = advertesPicureModel
            }
            //周年庆model
            if let shopInfoModel = JSONDeserializer<ShopInfoModel>.deserializeFrom(json: jsonString["data"]["shopInfo"].description){
                self.shopInfoModle = shopInfoModel
            }
            //周年庆活动数据
            var zhouList : [JSON] = []
            zhouList.append(jsonString["data"]["saoma"])
            zhouList.append(jsonString["data"]["integralMallPic"])
            zhouList.append(jsonString["data"]["newUser"])
            if let zhouActivityList = JSONDeserializer<AdvertesPictureModel>.deserializeModelArrayFrom(json: zhouList.description) {
                self.zhouActivityList = zhouActivityList as? [AdvertesPictureModel]
            }
  
        }, failed: {
             (error)in
            print("error码:\(error)")
        }, errorResult: {
            print("网络异常")
            
        })
        
    }
    //列表数据
    func loadBelowListData(page:Int,collectionView:UICollectionView,completion: @escaping successCallback) {
        NetWorkRequest(.homePageBelowConten(parameters: ["page":page])) { (json) in
            
            print("请求到的数据:\(json)")
            if page == 1 {
                self.belowList.removeAll()
            }
            //当前页没有20条数据 则没有下一页
            if json["data"].count == 0 || json["data"].count < 20  {
                collectionView.mj_header?.endRefreshing()
                collectionView.mj_footer?.endRefreshingWithNoMoreData()
            }
            //底部列表数据
            if let belowList = JSONDeserializer<GoodsModel>.deserializeModelArrayFrom(json: json["data"].description) {
                self.belowList +=  belowList as? [GoodsModel] ?? []
            }
            UIView.performWithoutAnimation {
                collectionView.reloadData()
                collectionView.mj_header?.endRefreshing()
                collectionView.mj_footer?.endRefreshing()
            }
            completion(self.belowList)
        } failed: { (error) in
            print("服务器返回code不为0000啦~\(error)")
        } errorResult: {
            print("网络异常")
        }
    }
    
}
