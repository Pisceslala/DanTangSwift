//
//  ClassifySeeAllViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/18.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ClassifySeeAllViewController: UIViewController {
    
    var dataArray : [ClassThemeModel] = [ClassThemeModel]()
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "SeeAllCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadDataInfo()
    }

}

extension ClassifySeeAllViewController {
    private func setUI() {
        view.addSubview(tableView)
    }
}

extension ClassifySeeAllViewController {
    private func loadDataInfo() {
        let url = "\(BaseURL)v1/collections?limit=20&offset=0"
        NetwordTools.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse : Any) in
            guard let response = dataResponse as? [String : Any] else {return}
            guard let data = response["data"] as? [String : Any] else {return}
            guard let collections = data["collections"] as? [[String : Any]] else {return}
            
            for dict in collections {
                self.dataArray.append(ClassThemeModel.init(dict: dict))
            }
            
            self.tableView.reloadData()
        }
    }
}

extension ClassifySeeAllViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SeeAllCell
        cell.model = dataArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataArray[indexPath.row]
        let vc = ClassifyDeitalViewController()
        vc.typeID = model.id
        vc.type = "专题合集"
        navigationController?.pushViewController(vc, animated: true)
    }
}
