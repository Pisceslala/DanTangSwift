//
//  TitileView.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/12.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

protocol TitleViewDelegate : NSObjectProtocol {
    func titleViewDidClickTitleBtn(index : Int)
}

class TitileView: UIView {

    weak var delegate  : TitleViewDelegate?

    var selectBtn : UIButton = UIButton()
    
    var lineView  : UIView = UIView()
   
    var titleArray : [ChannelsModel] = [ChannelsModel]() {
        didSet {
            //创建按钮
            configViews()
        }
    }
}

//MARK: - 初始化按钮
extension TitileView {
    private func configViews() {
        self.addSubview(lineView)
        let w = SSScreenW / CGFloat(titleArray.count)
        for (index, value) in titleArray.enumerated() {
            let x = CGFloat(index) * w
            
            let btn = UIButton(frame: CGRect(x: x, y: 0, width: w, height: self.height - 2))
            
            btn.tag = index
            
            btn.setTitle(value.name, for: .normal)
            
            btn.setTitleColor(UIColor.gray, for: .normal)
            
            btn.setTitleColor(rgba(245, 80, 83, 1), for: .disabled)
            
            btn.addTarget(self, action: #selector(didClickTitleBtn(btn:)), for: .touchUpInside)
            
            btn.titleLabel?.font = kFont14
            
            self.addSubview(btn)
            
            if index == 0 {
                btn.isEnabled = false
                
                selectBtn = btn
                
                btn.titleLabel?.sizeToFit()
                
                lineView.frame = CGRect(x: 0, y: btn.height - 2, width: (btn.titleLabel?.width)!, height: 2)
                
                lineView.backgroundColor = UIColor.red
                
                lineView.centerX = btn.centerX
            }
        }
    }
}

//MARK: - 监听点击
extension TitileView {
    @objc func didClickTitleBtn(btn : UIButton) {
        btn.isEnabled = false
        selectBtn.isEnabled = true
        selectBtn = btn
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.88, initialSpringVelocity: 0.55, options: .curveEaseOut, animations: {
            self.lineView.centerX = btn.centerX
        }, completion: nil)
        
        delegate?.titleViewDidClickTitleBtn(index: btn.tag)
        
    }
}
