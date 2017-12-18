//
//  ThemeCollectionCell.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/14.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit
import Kingfisher
class ThemeCollectionCell: UICollectionViewCell {

    var imgURL : String? {
        didSet {
            iconImageView.kf.setImage(with: URL.init(string: imgURL!))
        }
    }
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 8
    }

}
