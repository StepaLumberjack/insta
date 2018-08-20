//
//  AuthenticationViewController.swift
//  instagram-client-geekbrains
//
//  Created by Aleksandr Zhuravlev on 18/08/2018.
//  Copyright © 2018 Aleksandr Zhuravlev. All rights reserved.
//

import UIKit
import WebKit

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    weak var delegate: AuthenticationViewControllerDelegate?
    
    let clientId = "60a4de17aef34f1bb025eefe796cbfce"
    let redirectURI = "https://instagram.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.instagram.com/oauth/authorize/?client_id=\(clientId)&redirect_uri=\(redirectURI)&response_type=token")
        
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 15.0)
        webView.navigationDelegate = self
        removeCache()
        webView.load(request)
    }
    
    func removeCache() {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { (records) in
            for record in records {
                dataStore.removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
            }
        }
    }
    
}


extension AuthenticationViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let urlString =  navigationAction.request.url?.absoluteString else {
            decisionHandler(.allow)
            return
        }
        
        guard urlString.range(of: "#access_token") != nil else {
            decisionHandler(.allow)
            return
        }
        
        let accessToken = urlString.components(separatedBy: "#access_token=").last!
        self.delegate?.authenticationViewController(self, authorizedWith: accessToken)
        
        decisionHandler(.cancel)

    }
}
