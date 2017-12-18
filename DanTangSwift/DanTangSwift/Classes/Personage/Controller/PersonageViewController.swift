//
//  PersonageViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class PersonageViewController: UIViewController {

    lazy var topView: HeaderView = {
        let topView = HeaderView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: 220))
        return topView
    }()
    
    lazy var bttomView: ProductMainBottomView = {
        let bottomView = ProductMainBottomView(frame: CGRect(x: 0, y: topView.frame.maxY, width: SSScreenW, height: SSScreenH - topView.height))
        bottomView.choseView.introduceBtn.setTitle("收藏的商品", for: .normal)
        bottomView.choseView.commentBtn.setTitle("喜欢的专题", for: .normal)
        return bottomView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

}

extension PersonageViewController {
    private func setUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(topView)
        view.addSubview(bttomView)
    }
}
