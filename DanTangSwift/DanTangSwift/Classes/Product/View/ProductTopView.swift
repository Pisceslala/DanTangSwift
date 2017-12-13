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
    
    var model : ProductModel? {
        didSet {
            scrollView.contentSize     = CGSize(width: CGFloat((model?.image_urls.count)!) * SSScreenW, height: 0)
            creatImageView()
            pageControll.numberOfPages = (model?.image_urls.count)!
            pageControll.centerX       = scrollView.centerX
            titleLabel.text = model?.name
            priceLabel.text = "¥\(String(describing: (model?.price)!))"
            detailLabel.text = model?.dec
        }
    }
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: 375))
        scrollView.delegate        = self
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    fileprivate lazy var pageControll: UIPageControl = {
        let pageControll = UIPageControl(frame: CGRect(x: 0, y: scrollView.height - 40, width: 100, height: 40))
        pageControll.currentPageIndicatorTintColor = UIColor.white
        pageControll.pageIndicatorTintColor        = UIColor.lightGray
        pageControll.contentMode                   = .center
        return pageControll
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 5, y: scrollView.frame.maxY + 5 , width: SSScreenW - 10, height: 30))
        titleLabel.textColor     = UIColor.black
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    fileprivate lazy var priceLabel: UILabel = {
        let priceLabel = UILabel(frame: CGRect(x: 5, y: titleLabel.frame.maxY + 5, width: SSScreenW - 10, height: 25))
        priceLabel.numberOfLines = 0
        priceLabel.font          = kFont16
        priceLabel.textColor     = rgba(245, 85, 83, 1)
        return priceLabel
    }()
    
    fileprivate lazy var detailLabel: UILabel = {
        let detaillabel = UILabel(frame: CGRect(x: 5, y: priceLabel.frame.maxY + 5, width: SSScreenW - 10, height: 60))
        detaillabel.numberOfLines = 0
        detaillabel.textColor     = rgba(0, 0, 0, 0.6)
        detaillabel.font          = kFont15
        return detaillabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK: - 初始化
extension ProductTopView {
    private func setUI() {
        self.addSubview(scrollView)
        self.addSubview(pageControll)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        self.addSubview(detailLabel)
    }
    
    private func creatImageView() {
        for (index,value) in (model?.image_urls.enumerated())! {
            let x = CGFloat(index) * SSScreenW
            let imageView = UIImageView(frame: CGRect(x: x, y: 0, width: SSScreenW, height: 375))
            imageView.kf.setImage(with: URL.init(string: value))
            scrollView.addSubview(imageView)
        }
    }
}


//MARK: - scrollDelegate
extension ProductTopView : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let pageNumb = offsetX / SSScreenW
        pageControll.currentPage = Int(pageNumb)
    }
}
