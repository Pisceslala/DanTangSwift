//
//  ProductModel.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/12.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ProductModel: NSObject {
    @objc var cover_image_url : String = ""
    @objc var favorites_count : Int = 0
    @objc var id              : Int = 0
    @objc var image_urls      : [String] = [String]()
    @objc var name            : String = ""
    @objc var price           : String = ""
    @objc var purchase_url    : String = ""
    @objc var url             : String = ""

    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
