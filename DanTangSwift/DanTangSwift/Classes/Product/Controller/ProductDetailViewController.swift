//
//  ProductDetailViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/13.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var productModel : ProductModel? {
        didSet {
            topImagesView.model = productModel
        }
    }
    

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: view.height))
        scrollView.contentSize = CGSize(width: 0, height: 550 + view.height - 90 - 35)
        scrollView.delegate    = self
        return scrollView
    }()
    
    lazy var topImagesView: ProductTopView = {
        let topImagesView = ProductTopView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: 550))
        return topImagesView
    }()
    
    lazy var bottomView: ProductMainBottomView = {
        let bottomView = ProductMainBottomView(frame: CGRect(x: 0, y: topImagesView.frame.maxY, width: SSScreenW, height: view.height - 45 - 35 - 45))
        bottomView.model = productModel
        return bottomView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

}


//MARK: - 初始化
extension ProductDetailViewController {
    private func setUI() {
        self.title = "商品详情"
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(didClickShareBtn))
        view.addSubview(scrollView)
        scrollView.addSubview(topImagesView)
        scrollView.addSubview(bottomView)
    }
}

extension ProductDetailViewController : UIScrollViewDelegate {
    
}

//MARK: - 监听点击
extension ProductDetailViewController {
    @objc func didClickShareBtn() {
        print("点击了分享")
    }
}
