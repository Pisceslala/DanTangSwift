//
//  CategoryCollectionViewCell.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/14.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit
import Kingfisher
class CategoryCollectionViewCell: UICollectionViewCell {

    var model : GroundModel? {
        didSet {
            iconImageView.kf.setImage(with: URL.init(string: model?.icon_url ?? ""))
            nameLabel.text = model?.name ?? ""
        }
    }
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = iconImageView.width / 2
    }

}
