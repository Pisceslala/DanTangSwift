//
//  ProductCell.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/12.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit
import Kingfisher
class ProductCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    var model : ProductModel? {
        didSet {
            productImageView.kf.setImage(with: URL.init(string: (model?.cover_image_url)!))
            productTitle.text = model?.name ?? "商品item"
            productPriceLabel.text = model?.price ?? "0.0"
            likeBtn.setTitle(String(describing: model?.favorites_count), for: .normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
