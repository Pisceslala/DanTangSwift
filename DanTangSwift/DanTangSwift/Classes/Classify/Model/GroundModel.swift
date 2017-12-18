//
//  GroundModel.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/14.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class GroundModel: NSObject {
    @objc var icon_url : String = ""
    @objc var group_id : Int = 0
    @objc var id : Int = 0
    @objc var items_count : Int = 0
    @objc var name : String = ""
    @objc var order : Int = 0
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
