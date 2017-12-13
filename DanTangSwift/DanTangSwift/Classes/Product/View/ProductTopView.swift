//
//  ProductTopView.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/13.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit
import Kingfisher

class ProductTopView: UIView {
    
    var imageArray : [String]? {
        didSet {
            scrollView.contentSize = CGSize(width: CGFloat((imageArray?.count)!) * SSScreenW, height: 0)
            creatImageView()
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: 375))
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProductTopView {
    private func setUI() {
        self.addSubview(scrollView)
    }
    
    private func creatImageView() {
        for (index,value) in (imageArray?.enumerated())! {
            let x = CGFloat(index) * SSScreenW
            let imageView = UIImageView(frame: CGRect(x: x, y: 0, width: SSScreenW, height: 375))
            imageView.kf.setImage(with: URL.init(string: value))
            scrollView.addSubview(imageView)
        }
    }
}

extension ProductTopView : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
