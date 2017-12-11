//
//  NetwordTools.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit
import Alamofire

enum methodType {
    case get
    case post
}

class NetwordTools: NSObject {
    func requestNetwordData(URLString : String, method : methodType, parameter : [String : Any]? , finishCallBack : @escaping (_ response : Any) -> ()) {
        
        let requestMethod = method == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URLString, method: requestMethod, parameters: parameter).responseJSON { (dataResponse) in
            guard let result = dataResponse.result.value else {
                return
            }
            
            finishCallBack(result)
        }
    }
}
