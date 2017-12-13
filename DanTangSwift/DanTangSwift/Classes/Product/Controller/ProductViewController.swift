//
//  ProductViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    var productArray : [ProductModel] = [ProductModel]()

    lazy var collectionView: UICollectionView = {[weak self] in
        let barHeight = (navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        let Height    = SSScreenH - (tabBarController?.tabBar.frame.size.height)!
        let flow      = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: Int(SSScreenW) / 2 - 10, height: 268)
        flow.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: Height), collectionViewLayout: flow)
        collectionView.contentInset  = UIEdgeInsetsMake(5, 5, 0, 5)
        collectionView.delegate      = self
        collectionView.dataSource    = self
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.register(UINib.init(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "productCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.groupTableViewBackground
        view.addSubview(collectionView)
        loadProductData()
    }

}

//MARK: - 数据源
extension ProductViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
        cell.model = productArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = ProductDetailViewController()
        detailVC.productModel = productArray[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - 数据请求
extension ProductViewController {
    func loadProductData() {
        let url = "\(BaseURL)v2/items?generation=2&gender=1&limit=20&offset=0"
        NetwordTools.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse : Any) in
            guard let response = dataResponse as? [String : Any] else {return}
            guard let data = response["data"] as? [String : Any] else {return}
            guard let items = data["items"] as? [[String : Any]] else {return}
            
            for (_, value) in items.enumerated() {
                self.productArray.append(ProductModel.init(dict: value["data"] as! [String : Any]))
            }
            
            self.collectionView.reloadData()
        }
    }
}
