//
//  MainTabBarController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configChildVC()
        
    }
    
}

//MARK: - 初始化
extension MainTabBarController {
    func configChildVC() {
        self.tabBar.tintColor = UIColor.red
        
        AddOtherChildViewController(childVC: HomeViewController(),
                                    title: "首页",
                                    imageName: "TabBar_home_23x23_",
                                    selectImageName: "TabBar_home_23x23_selected")
        
        AddOtherChildViewController(childVC: ProductViewController(),
                                    title: "单品",
                                    imageName: "TabBar_gift_23x23_",
                                    selectImageName: "TabBar_gift_23x23_selected")
        
        AddOtherChildViewController(childVC: ClassifyViewController(), title: "分类",
                                    imageName: "TabBar_category_23x23_",
                                    selectImageName: "TabBar_category_23x23_selected")
        
        AddOtherChildViewController(childVC: PersonageViewController(),
                                    title: "个人",
                                    imageName: "TabBar_me_boy_23x23_",
                                    selectImageName: "TabBar_me_boy_23x23_selected")
    }
}

//MARK: - 添加子控制器
extension MainTabBarController {
    private func AddOtherChildViewController(childVC : UIViewController, title : String, imageName : String, selectImageName : String ) {
        
        childVC.title = title
        childVC.tabBarItem.image = UIImage.init(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectImageName)
        let nav : MainNavigationController = MainNavigationController(rootViewController: childVC)
        self.addChildViewController(nav)
        
    }
}

