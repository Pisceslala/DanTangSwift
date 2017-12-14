//
//  ProductToolsView.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/14.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

protocol ProductToolsViewDelegate : NSObjectProtocol {
    func productToolsViewDidClickLikeBtn()
    func productToolsViewDidClickGotoTinCatBtn()
}

class ProductToolsView: UIView {

    weak var delegate : ProductToolsViewDelegate?
    
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var GotoTinCatBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeBtn.layer.masksToBounds = true
        likeBtn.layer.cornerRadius  = likeBtn.width * CGFloat(0.18)
        likeBtn.layer.borderColor   = rgba(245, 80, 83, 1).cgColor
        likeBtn.layer.borderWidth   = 1
        
        GotoTinCatBtn.layer.masksToBounds = true
        GotoTinCatBtn.layer.cornerRadius  = 18
    }
}

extension ProductToolsView {
    class func showProductToolsView() -> ProductToolsView? {
        let bundle = Bundle.main.loadNibNamed("ProductToolsView", owner: nil, options: nil)
        guard let view = bundle?.last as? ProductToolsView else {
            return nil
        }
        return view
    }
}

extension ProductToolsView {
    @IBAction func didClickLikeBtn(_ sender: UIButton) {
        delegate?.productToolsViewDidClickLikeBtn()
    }
    
    @IBAction func didClickGotoTinCatBrn(_ sender: UIButton) {
        delegate?.productToolsViewDidClickGotoTinCatBtn()
    }
}
