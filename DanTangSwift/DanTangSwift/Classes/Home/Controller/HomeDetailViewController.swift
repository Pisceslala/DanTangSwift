//
//  HomeDetailViewController.swift
//  DanTangSwift
//
//  Created by Pisces on 2017/12/12.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class HomeDetailViewController: UIViewController {
    
    var itemModel : ChannelsListModel? {
        didSet {
            view.addSubview(webView)
            loadWebData((itemModel?.content_url)!)
        }
    }
    
    
    lazy var webView : UIWebView = {
        let webView = UIWebView(frame: view.bounds)
        webView.delegate = self
        webView.scalesPageToFit   = true
        webView.dataDetectorTypes = .all
        webView.backgroundColor   = UIColor.white
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }

}


extension HomeDetailViewController : UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("加载中...")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("加载成功")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("加载失败")
    }
}

extension HomeDetailViewController {
    private func loadWebData(_ url : String) {
        let request = URLRequest(url: URL.init(string: url)!)
        webView.loadRequest(request)
    }
}
