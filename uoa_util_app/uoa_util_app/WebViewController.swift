//
//  WebViewController.swift
//  uoa_util_app
//
//  Created by 伊藤凌也 on 2019/03/04.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    let url: URL
    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ツールバーを生成する
        let toolbar = self.createToolbar()
        
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: toolbar.bottomAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = .lightGray
        toolbar.frame = .zero
        
        view.addSubview(toolbar)
        
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        toolbar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        toolbar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        toolbar.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let backButton = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(back))
        let forwardButton = UIBarButtonItem(title: ">", style: .plain, target: self, action: #selector(forward))
        let openWithSafari = UIBarButtonItem(title: "Safariで開く", style: .plain, target: self, action: #selector(safari))
        
        toolbar.items = [backButton, forwardButton, openWithSafari]
        
        return toolbar
    }
    
    // 戻るボタンの処理
    @IBAction func back() {
        self.webView.goBack()
    }
    
    // 進むボタンの処理
    @IBAction func forward() {
        self.webView.goForward()
    }
    
    // 再読み込みボタンの処理
    @IBAction func refresh() {
        self.webView.reload()
    }
    
    // safari で開く
    @IBAction func safari() {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
