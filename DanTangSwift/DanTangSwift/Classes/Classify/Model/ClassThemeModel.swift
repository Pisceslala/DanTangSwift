//
//  ClassThemeModel.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/14.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ClassThemeModel: NSObject {
    @objc var banner_image_url : String = ""
    @objc var cover_image_url : String = ""
    @objc var subtitle : String = ""
    @objc var title : String = ""
    @objc var id : Int = 0
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
