//
//  CommentCell.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/14.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit
import Kingfisher
class CommentCell: UITableViewCell {
    
    @IBOutlet weak var IconImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var text_label: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        IconImageView.layer.masksToBounds = true
        IconImageView.layer.cornerRadius = IconImageView.height / CGFloat(2)
    }

    var model : CommentModel? {
        didSet {
            guard let model = model else {return}
            IconImageView.kf.setImage(with: URL.init(string: model.avatar_url))
            nameLabel.text = model.nickname
            text_label.text = model.content
            timeLabel.text = dateWithtimeStamp(model.created_at)
        }
    }
}

extension CommentCell {
    private func dateWithtimeStamp(_ timeStr : Int) -> String {
        let timeStr = Double(timeStr)
        let fmt = DateFormatter.init()
        fmt.dateStyle = .short
        fmt.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let date = Date.init(timeIntervalSince1970: timeStr)
        return fmt.string(from: date)
    }
}
