//
//  ClassifyDeitalViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/18.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ClassifyDeitalViewController: UIViewController {

    var dataArray : [ChannelsListModel] = [ChannelsListModel]()
    
    var typeID : Int?
    
    var type  : String? {
        didSet {
            self.title = type
            var loadType : String = ""
            if type == "专题合集" {
                loadType = "\(BaseURL)v1/collections/\(String(describing: typeID!))/posts?gender=1&generation=1&limit=20&offset=0"
            }else if type == "风格品类" {
                loadType = "\(BaseURL)v1/channels/\(String(describing: typeID!))/items?limit=20&offset=0"
            }
            
            loadDataInfo(loadType)
        }
    }
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "ItemsCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.rowHeight = 160
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }


}

extension ClassifyDeitalViewController {
    private func setUI() {
        view.addSubview(tableView)
    }
}

extension ClassifyDeitalViewController {
    private func loadDataInfo(_ url : String) {
        var dictArray : [[String : Any]]?
        
        NetwordTools.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse:Any) in
            guard let response = dataResponse as? [String : Any] else {return}
            guard let data = response["data"] as? [String : Any] else {return}
            if self.type == "专题合集" {
                guard let posts = data["posts"] as? [[String : Any]] else {return}
                dictArray = posts
            }else {
                guard let items = data["items"] as? [[String : Any]] else {return}
                dictArray = items
            }
            
            for dict in dictArray! {
                self.dataArray.append(ChannelsListModel.init(dict: dict))
            }
            
            self.tableView.reloadData()
        }
    }
}

extension ClassifyDeitalViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemsCell
        cell.model = dataArray[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = HomeDetailViewController()
        detailVC.itemModel = dataArray[indexPath.row]
        detailVC.title = "攻略详情"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

