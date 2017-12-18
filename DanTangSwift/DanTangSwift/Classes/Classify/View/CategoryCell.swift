//
//  CategoryCell.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/14.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    var dataArray : [GroundModel]? {
        didSet {
           
            collectionView.reloadData()
        }
    }
    
    
    var typeStr : String? {
        didSet {
            title_Label.text = typeStr
            if typeStr == "风格" {
                collectionView.height = 135
            }else {
                collectionView.height = 215
            }
        }
    }
    
    
    lazy var title_Label: UILabel = {
        let title  = UILabel(frame: CGRect(x: 10, y: 5, width: 100, height: 35))
        title.font = kFont16
        title.textColor = UIColor.gray
        return title
    }()

    lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: 60, height: 80)
        flow.minimumInteritemSpacing = 20
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: title_Label.frame.maxY, width: SSScreenW, height: self.height), collectionViewLayout: flow)
        collectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib.init(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryCell {
    private func setUI() {
        contentView.addSubview(title_Label)
        contentView.addSubview(collectionView)
    }
}


extension CategoryCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
        cell.model = dataArray?[indexPath.row]
        return cell
    }
}
