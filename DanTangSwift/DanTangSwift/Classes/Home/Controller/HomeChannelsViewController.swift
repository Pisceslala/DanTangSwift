//
//  HomeChannelsViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/12.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class HomeChannelsViewController: UIViewController {

    var dataArray : [ChannelsListModel] = [ChannelsListModel]()
    var nextURL   : String?
    
    
    var titleID : Int = 0 {
        didSet {
            loadHomeDataByTitleId(titleID)
        }
    }
    

    lazy var tableView: UITableView = {[weak self] in
        let barHeight = (navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height + 36
        let Height    = SSScreenH - barHeight - (tabBarController?.tabBar.frame.size.height)!
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: Height), style: .plain)
        tableView.separatorStyle = .none
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.rowHeight  = 160
        tableView.register(UINib.init(nibName: "ItemsCell", bundle: nil), forCellReuseIdentifier: "itemCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}

//MARK: - 数据源
extension HomeChannelsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for:indexPath) as! ItemsCell
        
        cell.model = self.dataArray[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = HomeDetailViewController()
        detailVC.itemModel = dataArray[indexPath.row]
        detailVC.title = "攻略详情"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - 数据请求
extension HomeChannelsViewController {
    private func loadHomeDataByTitleId(_ typeID: Int) {
        let url = "\(BaseURL)v1/channels/\(typeID)/items?gender=1&generation=1&limit=20&offset=0"
        NetwordTools.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse:Any) in
            
            guard let response = dataResponse as? [String : Any] else {return}
            guard let data     = response["data"] as? [String : Any] else {return}
            guard let items    = data["items"] as? [[String : Any]] else {return}

            self.nextURL = data["next_url"] as? String
            
            for dict in items {
                self.dataArray.append(ChannelsListModel.init(dict: dict))
            }
            
            self.tableView.reloadData()
            
        }
    }
}
