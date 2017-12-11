//
//  HomeViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }

}

//MARK: - 初始化
extension HomeViewController {
    func configView() {
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(didClickSearchBtn))
    }
}

//MARK: - 监听点击
extension HomeViewController {
    @objc func didClickSearchBtn() {
        print("didClickBtn")
    }
}
