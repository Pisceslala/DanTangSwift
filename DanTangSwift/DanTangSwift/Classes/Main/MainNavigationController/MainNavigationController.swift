//
//  MainNavigationController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        
        self.interactivePopGestureRecognizer?.delegate = self
        
    }

}

//MARK: - 监听点击
extension MainNavigationController {
    @objc func didClickBackBtn() {
        popViewController(animated: true)
    }
}

//MARK: - 初始化
extension MainNavigationController {
    func configView() {
        navigationBar.barTintColor = UIColor.init(red: 245.0/255, green: 80.0/255, blue: 83.0/255, alpha: 1)
        navigationBar.tintColor = UIColor.white
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(didClickBackBtn))
        }
        super.pushViewController(viewController, animated: true)
    }
}

//MARK: - 解决自定义导航控制器时返回手势失效
extension MainNavigationController : UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.childViewControllers.count > 1
    }
}


