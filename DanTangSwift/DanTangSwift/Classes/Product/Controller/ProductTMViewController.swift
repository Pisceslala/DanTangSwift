//
//  ProductTMViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/14.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class ProductTMViewController: UIViewController {
    
    var TMURL : String? {
        didSet {
            view.addSubview(webView)
            
            let URl = URL.init(string: (TMURL)!)
            
            webView.loadRequest(URLRequest(url: URl!))

        }
    }
    
    
    lazy var webView: UIWebView = {[weak self] in
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: SSScreenW, height: view.height))
        webView.dataDetectorTypes = .all
        webView.scalesPageToFit = true
        webView.delegate = self
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

extension ProductTMViewController : UIWebViewDelegate {
    
}
