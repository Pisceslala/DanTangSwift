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
        let barHeight = (navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: view.height))
        scrollView.contentSize = CGSize(width: 0, height: 545 + view.height - barHeight - 35)
        return scrollView
    }()
    
    lazy var topImagesView: ProductTopView = {
        let topImagesView = ProductTopView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: 545))
        return topImagesView
    }()
    
    lazy var bottomView: ProductMainBottomView = {
        let barHeight = (navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        let bottomView = ProductMainBottomView(frame: CGRect(x: 0, y: topImagesView.frame.maxY, width: SSScreenW, height: view.height - barHeight - 35))
        bottomView.model = productModel
        return bottomView
    }()
    
    lazy var toolBar: ProductToolsView = {
        let toolBar = ProductToolsView.showProductToolsView()
        toolBar?.frame = CGRect(x: 0, y: SSScreenH - 45, width: SSScreenW, height: 45)
        toolBar?.delegate = self
        return toolBar!
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
        view.addSubview(toolBar)
    }
}

extension ProductDetailViewController : ProductToolsViewDelegate {
    func productToolsViewDidClickLikeBtn() {
        
    }
    
    func productToolsViewDidClickGotoTinCatBtn() {
        let TMVC = ProductTMViewController()
        TMVC.TMURL = self.productModel?.purchase_url
        navigationController?.pushViewController(TMVC, animated: true)
    }
}

//MARK: - 监听点击
extension ProductDetailViewController {
    @objc func didClickShareBtn() {
        print("点击了分享")
    }
}
