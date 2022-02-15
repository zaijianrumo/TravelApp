//
//  PLWShopModel.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/15.
//

import UIKit
import HandyJSON

//轮播图数据
struct SlidesModel : HandyJSON {
    var urlType:Int = 0
    var goodsId: String?
    var image: String?
}

//category 商品分类
struct CategoryModel: HandyJSON {
    var image: String?
    var mallCategoryName:String?
    var mallCategoryId: String?
    var bxMallSubDto: [CategorySmallModel]?
}
// category 商品分类里面的小类
class CategorySmallModel:HandyJSON {
    var mallSubName: String?
    var mallSubId: String?  // CategorySubId
    var mallCategoryId: String?
    var comments: String?
    var isSelect: Bool?
    required init(){}
}

// 客服 model && 周年庆活动 && 分组数据
struct AdvertesPictureModel: HandyJSON{
    var TO_PLACE: String?
    var PICTURE_ADDRESS: String?
    var urlType: Int = 0
    var goods_array: [GoodsModel]?
}
// 商品信息
struct GoodsModel: HandyJSON {
    var goodsId: String?
    var image: String?
    var name: String?
    var price: String?
    var mallPrice: String?

    var goodsSerialNumber: String?
    var shopId: String?
    var oriPrice: String?
    var comPic: String?
    var image1: String?
    var goodsName: String?
    var state: Int = 0
    var amount: String?
    var presentPrice: String?
    var goodsDetail: String?
}

// 周年庆 model
struct ShopInfoModel: HandyJSON{
    var SHOP_CODE: String?
    var SHOP_NAME: String?
    var leaderImage: String?
    var leaderPhone: String?

}
// 推荐商品
struct RecommendModel: HandyJSON{
    var gift_coupons_offline: String?
    var mallPrice: String?
    var goodsName: String?
    var image: String?
    var price: String?
    var goodsId: String?
}
