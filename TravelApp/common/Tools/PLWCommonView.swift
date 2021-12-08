//
//  PLWCommonView.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/8.
//

import UIKit

extension UIView {
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    public var y: CGFloat {
          
          get {
              return self.frame.origin.y
          }
          set {
              var frame = self.frame
              frame.origin.y = newValue
              self.frame = frame
          }
      }
      /// 右边界的x值
      public var rightX: CGFloat{
          get{
              return self.x + self.width
          }
          set{
              var frame = self.frame
              frame.origin.x = newValue - frame.width
              self.frame = frame
          }
      }
      /// 下边界的y值
      public var bottomY: CGFloat{
          get{
              return self.y + self.height
          }
          set{
              var frame = self.frame
              frame.origin.y = newValue - frame.height
              self.frame = frame
          }
      }
      
      public var centerX : CGFloat{
          get{
              return self.center.x
          }
          set{
              self.center = CGPoint(x: newValue, y: self.center.y)
          }
      }
      
      public var centerY : CGFloat{
          get{
              return self.center.y
          }
          set{
              self.center = CGPoint(x: self.center.x, y: newValue)
          }
      }
      
      public var width: CGFloat{
          get{
              return self.frame.width
          }
          set{
              var r = self.frame
              r.size.width = newValue
              self.frame = r
          }
      }
      public var height: CGFloat{
          get{
              return self.frame.height
          }
          set{
              var r = self.frame
              r.size.height = newValue
              self.frame = r
          }
      }
      
      
      public var origin: CGPoint{
          get{
              return self.frame.origin
          }
          set{
              self.x = newValue.x
              self.y = newValue.y
          }
      }
      
      public var size: CGSize{
          get{
              return self.frame.size
          }
          set{
              self.width = newValue.width
              self.height = newValue.height
          }
      }
      
  }
