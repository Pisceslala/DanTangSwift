//
//  UIViewExtentsion.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    public var x : CGFloat {
        get {
            return frame.origin.x
        }
        
        set(newVal) {
            var newFrame : CGRect = frame
            newFrame.origin.x = newVal
            frame = newFrame
        }
    }
    
    public var y : CGFloat {
        get {
            return frame.origin.y
        }
        
        set(newVal) {
            var newFrame : CGRect = frame
            newFrame.origin.y = y
            frame = newFrame
        }
    }
    
    public var height : CGFloat {
        get {
            return frame.size.height
        }
        
        set(newVal) {
            var newFrame : CGRect = frame
            newFrame.size.height = newVal
            frame = newFrame
        }
    }
    
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        
        set(newVal) {
            var newFrame : CGRect = frame
            newFrame.size.width = newVal
            frame = newFrame
        }
    }
    
    public var centerX: CGFloat {
        get {
            return center.x
        }
        
        set(newVal) {
            var newCenter : CGPoint = center
            newCenter.x = newVal
            center = newCenter
        }
    }
    
    public var centerY: CGFloat {
        get {
            return center.y
        }
        
        set(newVal) {
            var newCenter : CGPoint = center
            newCenter.y = newVal
            center = newCenter
        }
    }  
}
