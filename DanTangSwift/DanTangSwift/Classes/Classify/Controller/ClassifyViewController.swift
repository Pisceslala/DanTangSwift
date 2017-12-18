//
//  ClassifyViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ClassifyViewController: UIViewController {
    
    var ThemeDataArray : [ClassThemeModel] = [ClassThemeModel]()
    var StyleDataArray : [GroundModel] = [GroundModel]()
    var CategoryDataArray : [GroundModel] = [GroundModel]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: view.height), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ThemeCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.register(CategoryCell.classForCoder(), forCellReuseIdentifier: "CategoryCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadThemeData()
        loadStyleData()
    }
}


extension ClassifyViewController {
    private func setUI() {
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(didClickSearchBtn))
        view.addSubview(tableView)
    }
}

//MARK: - 请求数据
extension ClassifyViewController {
    //专题合集
    private func loadThemeData() {
        let url = "\(BaseURL)v1/collections?limit=20&offset=0"
        NetwordTools.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse : Any) in
            guard let response = dataResponse as? [String : Any] else {return}
            guard let data = response["data"] as? [String : Any] else {return}
            guard let collections = data["collections"] as? [[String : Any]] else {return}
            
            for dict in collections {
                self.ThemeDataArray.append(ClassThemeModel.init(dict: dict))
            }
            
            self.tableView.reloadData()
        }
    }
    
    //风格 与 品类
    private func loadStyleData() {
        let url = "http://api.dantangapp.com/v1/channel_groups/all?"
        NetwordTools.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse) in
            guard let respose = dataResponse as? [String : Any] else {return}
            guard let data = respose["data"] as? [String : Any] else {return}
            guard let grounds = data["channel_groups"] as? [[String : Any]] else {return}
            
            for (index, value) in grounds.enumerated() {
                if index == 0 {
                    let channels = value["channels"] as! [[String : Any]]
                    for dict in channels {
                        self.StyleDataArray.append(GroundModel.init(dict: dict))
                    }
                }else {
                    let channels = value["channels"] as! [[String : Any]]
                    for dict in channels {
                        self.CategoryDataArray.append(GroundModel.init(dict: dict))
                    }
                }
            }
            
            self.tableView.reloadData()
            
        }
    }
}

extension ClassifyViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ThemeCell
            cell.delegate = self
            cell.dataArray = ThemeDataArray
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.typeStr = "风格"
            cell.delegate = self
            cell.dataArray = StyleDataArray
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.typeStr = "品类"
            cell.delegate = self
            cell.dataArray = CategoryDataArray
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 140
        }else if indexPath.section == 1 {
            return 200
        }else {
            return 250
        }
    }
}

extension ClassifyViewController {
    @objc private func didClickSearchBtn() {
        print("点击搜索")
    }

}

extension ClassifyViewController : ThemeCellDelegate {
    func ThemeCellDidClickAllBtn() {
        let allVC = ClassifySeeAllViewController()
        navigationController?.pushViewController(allVC, animated: true)
    }
 
    func ThemeCellDidClickCollectionViewCell(_ model: ClassThemeModel) {
        let vc = ClassifyDeitalViewController()
        vc.typeID = model.id
        vc.type = "专题合集"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ClassifyViewController : CategoryCellDelegate {
    func CategoryCellDidClickCollectionViewCell(_ model: GroundModel) {
        let vc = ClassifyDeitalViewController()
        vc.typeID = model.id
        vc.type = "风格品类"
        navigationController?.pushViewController(vc, animated: true)
    }
}


