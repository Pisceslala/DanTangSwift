//
//  HomeViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var selectedBtn = UIButton()
   
    lazy var titleArray : [channelsModel] = [channelsModel]()
    
    lazy var titleView: UIView = {
        let barHeight = (navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        let titleView = UIView(frame: CGRect(x: 0, y: barHeight, width: SSScreenW, height: 36))
        titleView.backgroundColor = UIColor.init(red: 240.0 / 250.0, green: 240.0 / 250.0, blue: 240.0 / 250.0, alpha: 1)
        return titleView
    }()

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configTitleButton()
        loadTitleViewInfo()
    }
}

//MARK: - 初始化
extension HomeViewController {
    private func configView() {
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(didClickSearchBtn))
        view.addSubview(titleView)
        
    }
    
    private func configTitleButton() {
        
        let w = SSScreenW / CGFloat(titleArray.count)
        let h = titleView.height - 2
        for (index,value) in titleArray.enumerated() {
            let x : CGFloat = CGFloat(index) * w
            let titleBtn    = UIButton(frame: CGRect(x: x, y: 0, width: w, height: h))
            titleBtn.tag    = index
            titleBtn.setTitle(value.name, for: .normal)
            titleBtn.setTitleColor(UIColor.gray, for: .normal)
            titleBtn.setTitleColor(UIColor.init(red: 245.0/255, green: 80.0/255, blue: 83.0/255, alpha: 1), for: .disabled)
            titleBtn.titleLabel?.textAlignment = .center
            titleBtn.titleLabel?.font = kFont14
            titleBtn.addTarget(self, action: #selector(didClickTitleBtn(titleBtn:)), for: .touchUpInside)
            titleView.addSubview(titleBtn)
            if index == 0 {
                titleBtn.isEnabled = false
                self.selectedBtn   = titleBtn
            }
        }
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
                self.titleArray.append(channelsModel(dict: dict))
            }
            
            //创建按钮
            self.configTitleButton()
        }
    }
}

//MARK: - 监听点击
extension HomeViewController {
    @objc private func didClickSearchBtn() {
        print("didClickBtn")
    }
    
    @objc private func didClickTitleBtn(titleBtn : UIButton) {
        titleBtn.isEnabled = false
        self.selectedBtn.isEnabled = true
        self.selectedBtn = titleBtn
    }
}



