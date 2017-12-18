//
//  HeaderView.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/18.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: 220))
        imageView.image = UIImage.init(named: "Me_ProfileBackground")
        return imageView
    }()
    
    lazy var settingBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 5, y: 15, width: 44, height: 44))
        btn.setImage(UIImage.init(named: "Me_settings_20x20_"), for: .normal)
        return btn
    }()

    lazy var messageBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: SSScreenW - 44, y: 15, width: 44, height: 44))
        btn.setImage(UIImage.init(named: "Me_message_20x20_"), for: .normal)
        return btn
    }()
    
    lazy var iconBtn: UIButton = {
        let icon = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        icon.center = self.bgImageView.center
        icon.setImage(UIImage.init(named: "Me_AvatarPlaceholder_75x75_"), for: .normal)
        icon.layer.masksToBounds = true
        icon.layer.cornerRadius = icon.width / 2
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeaderView {
    private func setUI() {
        self.addSubview(bgImageView)
        self.addSubview(settingBtn)
        self.addSubview(messageBtn)
        self.addSubview(iconBtn)
    }
}
