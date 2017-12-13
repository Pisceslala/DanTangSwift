//
//  ProductBottomView.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/13.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ProductBottomView: UIView {

    @IBOutlet weak var bottomLine: UIView!
    
    @IBOutlet weak var introduceBtn: UIButton!
    
    @IBOutlet weak var commentBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
    }
}

extension ProductBottomView {
    //MARK: - 图文详情
    @IBAction func Introduce(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.bottomLine.x = 0
        }
    }
    
    //MARK: - 评论
    @IBAction func commentaries(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            let btn = sender 
            
            self.bottomLine.x = btn.x
        }
    }
}

extension ProductBottomView {
    class func showProductBottomView() -> ProductBottomView? {
        let bundleView = Bundle.main.loadNibNamed("ProductBottomView", owner: nil, options: nil)
        guard let view = bundleView?.last as? ProductBottomView else {return nil}
        return view
    }
}
