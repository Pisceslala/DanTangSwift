//
//  ProductMainBottomView.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/13.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ProductMainBottomView: UIView {
    
    var model : ProductModel? {
        didSet(newValue) {
            guard let proID = model?.id else {return}
            loadWebDataByProductID(proID)
            loadCommentDataByProductID(proID)
        }
    }
    
    var commentArray : [CommentModel] = [CommentModel]()
    
    
    
    lazy var choseView: ProductBottomView = {[weak self] in
        let choseView = ProductBottomView.showProductBottomView()
        choseView?.frame = CGRect(x: 0, y: 0, width: SSScreenW, height: 35)
        choseView?.delegate = self
        return choseView!
    }()
    
    lazy var webView: UIWebView = {[weak self] in
        let webView = UIWebView(frame: CGRect(x: 0, y: choseView.frame.maxY, width: SSScreenW, height: (self?.height)! - 45))
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        webView.delegate = self
        return webView
    }()
    
    lazy var commectTableView: UITableView = {
        let tableView = UITableView(frame: webView.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        tableView.register(UINib.init(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = 64
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ProductMainBottomView {
    private func setUI() {
        self.addSubview(choseView)
        self.addSubview(webView)
        self.addSubview(commectTableView)
    }
}


extension ProductMainBottomView {
    private func loadWebDataByProductID(_ productId : Int) {
        let url = "\(BaseURL)v2/items/\(productId)"
        NetwordTools.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse : Any) in
            guard let response = dataResponse as? [String : Any] else {return}
            guard let data = response["data"] as? [String : Any] else {return}
            guard let urlStr = data["detail_html"] as? String else {return}
            self.webView.loadHTMLString(urlStr, baseURL: nil)
            
            guard let commentCount = data["comments_count"] as? Int else {return}
            let str = "评论(\(commentCount))"
            self.choseView.commentBtn!.setTitle(str, for: .normal)
        }
    }
    
    private func loadCommentDataByProductID(_ productId : Int) {
        let url = "\(BaseURL)v2/items/\(productId)/comments"
        NetwordTools.requestData(URLString: url, parameter: nil, method: .get) { (dataResponse : Any) in
            guard let response = dataResponse as? [String : Any] else {return}
            guard let data = response["data"] as? [String : Any] else {return}
            guard let comments = data["comments"] as? [[String : Any]] else {return}
            
            for dict in comments {
                self.commentArray.append(CommentModel.init(dict: dict))
            }
            
            self.commectTableView.reloadData()
        }
    }
}


extension ProductMainBottomView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentCell
        cell.model = commentArray[indexPath.row]
        return cell
    }
}

extension ProductMainBottomView : UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("加载成功")
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("加载失败")
    }
}

extension ProductMainBottomView : ProductBottomViewDelegate {
    func productBottomViewDidClickIntroduceBtn() {
        commectTableView.isHidden = true
        webView.isHidden = false
    }
    
    func productBottomViewDidClickcommentariesBtn() {
        webView.isHidden = true
        commectTableView.isHidden = false
    }
}
