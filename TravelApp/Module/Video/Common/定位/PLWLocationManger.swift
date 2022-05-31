//
//  PLWLocationManger.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/17.
//

import UIKit

import AMapLocationKit
import AMapFoundationKit
import CoreLocation

class PLWLocationManger: NSObject,AMapLocationManagerDelegate {
    
   //单列
    static let shared = PLWLocationManger()
    
    private let locationManger = AMapLocationManager()
   
    private  override init() {
        
        super.init()
        
        locationManger.delegate = self
        
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManger.locationTimeout = 10
        
        locationManger.desiredAccuracy  = 100
        
        locationManger.pausesLocationUpdatesAutomatically = false
    
        locationManger.reGeocodeTimeout = 10
        
    }
    //MARK: - 单次定位
    func aSingleLocation()->Void {
        
        locationManger.requestLocation(withReGeocode: false, completionBlock: {(location: CLLocation?, reGeocode: AMapLocationReGeocode?, error: Error?) in
                    
            if let error = error {
                let error = error as NSError
                
                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
                    return
                }
                else if error.code == AMapLocationErrorCode.reGeocodeFailed.rawValue
                    || error.code == AMapLocationErrorCode.timeOut.rawValue
                    || error.code == AMapLocationErrorCode.cannotFindHost.rawValue
                    || error.code == AMapLocationErrorCode.badURL.rawValue
                    || error.code == AMapLocationErrorCode.notConnectedToInternet.rawValue
                    || error.code == AMapLocationErrorCode.cannotConnectToHost.rawValue {
                    
                    //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
                }
            
            }else {
                //没有错误：location有返回值，regeocode是否有返回值取决于是否进行逆地理操作，进行annotation的添加
                print("经纬度信息\(String(describing: location?.coordinate.latitude))")
                print("经纬度信息\(String(describing: location?.coordinate.longitude))")
                print("详细地址\(String(describing: reGeocode?.formattedAddress ?? ""))")
            }
        }
        )
    }
    //MARK: - AMapLocationManagerDelegate
    func amapLocationManager(_ manager: AMapLocationManager!, doRequireLocationAuth locationManager: CLLocationManager!) {
        locationManager.requestAlwaysAuthorization()
        
    }

}
