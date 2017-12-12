//
//  constFile.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import Foundation
import UIKit
/** Size*/
let SSScreenW : CGFloat = UIScreen.main.bounds.size.width
let SSScreenH : CGFloat = UIScreen.main.bounds.size.height

/** Font*/
let kFont12 = UIFont.systemFont(ofSize: 12)
let kFont13 = UIFont.systemFont(ofSize: 13)
let kFont14 = UIFont.systemFont(ofSize: 14)
let kFont15 = UIFont.systemFont(ofSize: 15)
let kFont16 = UIFont.systemFont(ofSize: 16)
let kFont17 = UIFont.systemFont(ofSize: 17)
let kFont18 = UIFont.systemFont(ofSize: 18)
let kFont19 = UIFont.systemFont(ofSize: 19)
let kFont20 = UIFont.systemFont(ofSize: 20)

/** URL*/
let BaseURL  : String = "http://api.dantangapp.com/"
let TitleURL : String = "v2/channels/preset?gender=1&generation=1"



/** RGBA*/
func rgba(_ red: CGFloat,_ green: CGFloat,_ blue: CGFloat,_ alpha : CGFloat) -> UIColor {
    return UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
}

