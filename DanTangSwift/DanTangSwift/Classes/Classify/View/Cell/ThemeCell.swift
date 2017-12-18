//
//  ThemeCell.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/14.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

protocol ThemeCellDelegate:NSObjectProtocol {
    func ThemeCellDidClickAllBtn();
    func ThemeCellDidClickCollectionViewCell(_ model : ClassThemeModel)
}

class ThemeCell: UITableViewCell {
    
    weak var delegate : ThemeCellDelegate?

    var dataArray : [ClassThemeModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    lazy var title_Label: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 5, width: 100, height: 35))
        titleLabel.font = kFont16
        titleLabel.text = "专题集合"
        titleLabel.textColor = UIColor.gray
        return titleLabel
    }()
    
    lazy var seeMoreBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("查看全部 >", for: .normal)
        btn.sizeToFit()
        btn.centerY = title_Label.centerY
        btn.x = SSScreenW - btn.width
        btn.setTitleColor(UIColor.gray, for: .normal)
        btn.titleLabel?.font = kFont13
        btn.addTarget(self, action: #selector(didClickSeeMoreBtn), for: .touchUpInside)
        return btn
    }()
    
    lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.itemSize = CGSize(width: 150, height: 80)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: title_Label.frame.maxY, width: SSScreenW, height: 100), collectionViewLayout: flow)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "ThemeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cell")
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


extension ThemeCell {
    private func setUI() {
        contentView.addSubview(title_Label)
        contentView.addSubview(seeMoreBtn)
        contentView.addSubview(collectionView)
        
    }
}

extension ThemeCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let number = dataArray?.count else {
            return 0
        }
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ThemeCollectionCell
        let model = dataArray?[indexPath.row]
        cell.imgURL = model?.banner_image_url
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = dataArray?[indexPath.row]
        delegate?.ThemeCellDidClickCollectionViewCell(model!)
    }
}

extension ThemeCell {
    @objc func didClickSeeMoreBtn() {
       delegate?.ThemeCellDidClickAllBtn()
    }
}
