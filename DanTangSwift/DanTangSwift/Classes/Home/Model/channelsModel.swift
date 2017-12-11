//
//  channelsModel.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class channelsModel: NSObject {
    @objc var name : String = ""
    @objc var ID   : Int = 0
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "id" {
            setValue(value, forUndefinedKey: "ID")
        }
    }
}
