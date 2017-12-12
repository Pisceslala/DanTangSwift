//
//  HomeViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
   
    lazy var titleArray : [ChannelsModel] = [ChannelsModel]()
    
    lazy var titleView: TitileView = {[weak self] in
        let barHeight = (navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        let titleView = TitileView(frame: CGRect(x: 0, y: barHeight, width: SSScreenW, height: 36))
        titleView.backgroundColor  = rgba(240, 240, 240, 1)
        titleView.delegate = self
        return titleView
    }()
    
    lazy var scrollView: UIScrollView = {[weak self] in
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: titleView.frame.maxY, width: SSScreenW, height: SSScreenH - titleView.frame.maxY - (tabBarController?.tabBar.frame.size.height)!))
        scrollView.contentSize = CGSize(width: Int(SSScreenW) * titleArray.count, height: 0)
        scrollView.delegate = self;
        scrollView.isPagingEnabled = true
        return scrollView
    }()

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView() //初始化
        
        loadTitleViewInfo() //获取title数据
    }
}



//MARK: - 初始化
extension HomeViewController {
    private func configView() {
        view.backgroundColor = UIColor.white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(didClickSearchBtn))
        
        view.addSubview(titleView)
    }
}



//MARK: - 网络请求
extension HomeViewController {
    
    private func loadTitleViewInfo() {
        
        let url = BaseURL + TitleURL
        
        NetwordTools.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse) in
            guard let response = dataResponse as? [String : Any] else {return}
            guard let data     = response["data"] as? [String : Any] else {return}
            guard let channels = data["channels"] as? [[String : Any]] else {return}
            
            for dict in channels {
                self.titleArray.append(ChannelsModel(dict: dict))
            }
            
            self.titleView.titleArray = self.titleArray
            
            for (_, value) in self.titleArray.enumerated() {
                self.addChildVCByModel(value)
            }
            
            self.view.addSubview(self.scrollView)
            
            self.scrollViewDidEndScrollingAnimation(self.scrollView)
        }
    }
}



//MARK: - 监听滚动(加载页面)
extension HomeViewController : UIScrollViewDelegate {
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let index : Int = Int(scrollView.contentOffset.x) / Int(SSScreenW)
        let willShowVC : HomeChannelsViewController = self.childViewControllers[index] as! HomeChannelsViewController;
        if willShowVC.isViewLoaded {
            return
        }
        willShowVC.view.x = CGFloat(index * Int(SSScreenW));
        willShowVC.view.y = 0;
        willShowVC.view.height = self.view.height;
        scrollView.addSubview(willShowVC.view)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(self.scrollView)
        let index : Int = Int(scrollView.contentOffset.x) / Int(SSScreenW)
        let btn = titleView.subviews[index + 1] as! UIButton
        titleView.didClickTitleBtn(btn: btn)
    }
    
}



//MARK: - 添加子控制器
extension HomeViewController {
    private func addChildVCByModel(_ model : ChannelsModel) {
        let homeChannelVC     = HomeChannelsViewController()
        homeChannelVC.titleID = model.id
        self.addChildViewController(homeChannelVC)
    }
}



//MARK: - 监听点击
extension HomeViewController : TitleViewDelegate {
    @objc private func didClickSearchBtn() {
        print("didClickBtn")
    }
    
    func titleViewDidClickTitleBtn(index : Int) {
        var offset = self.scrollView.contentOffset
        offset.x   = CGFloat(index) * SSScreenW
        self.scrollView.setContentOffset(offset, animated: true)
    }
}



