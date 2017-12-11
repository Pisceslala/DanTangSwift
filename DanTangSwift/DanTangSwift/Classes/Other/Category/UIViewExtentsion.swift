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
            return self.frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = x
            self.frame = frame
        }
    }
    
    public var y : CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = y
            self.frame = frame
        }
    }
    
    public var height : CGFloat {
        get {
            return self.frame.size.height
        }
        
        set {
            var frame = self.frame
            frame.size.height = height
            self.frame = frame
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        
        set {
            var frame = self.frame
            frame.size.width = width
            self.frame = frame
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        
        set {
            var center : CGPoint = self.center
            center.x = centerX
            self.center = center
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        
        set {
            var center : CGPoint = self.center
            center.y = centerY
            self.center = center
        }
    }  
}
