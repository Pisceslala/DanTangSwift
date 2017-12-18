//
//  SeeAllCell.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/18.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit
import Kingfisher
class SeeAllCell: UITableViewCell {

    @IBOutlet weak var title_Label: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var bgImageView: UIImageView!
   
    var model : ClassThemeModel? {
        didSet {
            bgImageView.kf.setImage(with: URL.init(string: (model?.cover_image_url)!))
            title_Label.text = model?.title ?? ""
            subTitle.text = model?.subtitle ?? ""
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.cornerRadius = 8
    }

   
    
}
