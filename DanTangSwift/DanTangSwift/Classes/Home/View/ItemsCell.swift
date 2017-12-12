//
//  ItemsCell.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/12.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit
import Kingfisher
class ItemsCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var title_Lable: UILabel!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    var model : ChannelsListModel? {
        didSet {
            bgImageView.kf.setImage(with: URL.init(string: (model?.cover_image_url)!))
            title_Lable.text = model?.title ?? ""
            likeBtn.setTitle(String(describing: (model?.likes_count)!), for: .normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

 
    @IBAction func didClickLikeBtn(_ sender: Any) {
        
    }
}


extension ItemsCell {
    
}
