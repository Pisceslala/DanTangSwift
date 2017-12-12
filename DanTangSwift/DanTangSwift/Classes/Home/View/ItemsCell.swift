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
        self.layer.masksToBounds = true
        self.layer.cornerRadius  = 8
    }

    override var frame: CGRect {
        didSet {
            var newFrame = frame
            newFrame.size.width  -= 20
            newFrame.origin.x    += 10
            newFrame.size.height -= 10
            newFrame.origin.y    += 10
            super.frame = newFrame
        }
    }
}


extension ItemsCell {
    @IBAction func didClickLikeBtn(_ sender: Any) {
        let likeBtn = sender as! UIButton
        
        likeBtn.isSelected = !likeBtn.isSelected
        
    }
}
