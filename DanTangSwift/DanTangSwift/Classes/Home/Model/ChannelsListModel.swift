//
//  ChannelsListModel.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/12.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ChannelsListModel: NSObject {
    @objc var content_url     : String = ""
    @objc var cover_image_url : String = ""
    @objc var id              : Int    = 0
    @objc var likes_count     : Int    = 0
    @objc var short_title     : String = ""
    @objc var status          : Int    = 0
    @objc var title           : String = ""
    @objc var type            : String = ""
    @objc var url             : String = ""

    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
