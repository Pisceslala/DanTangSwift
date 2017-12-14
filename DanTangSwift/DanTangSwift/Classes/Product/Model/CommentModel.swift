//
//  CommentModel.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/13.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class CommentModel: NSObject {
    @objc var content : String = ""
    @objc var created_at : Int = 0
    @objc var avatar_url : String = ""
    @objc var nickname : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "user" {
            guard let value = value as? [String : Any] else {return}
            avatar_url = value["avatar_url"] as! String
            nickname = value["nickname"] as! String
        }
    }
}
