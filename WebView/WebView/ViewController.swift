//
//  ViewController.swift
//  WebView
//
//  Created by Wang, Zewen on 2018-03-04.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//
import UIKit
import WebKit
class ViewController: UIViewController,  WKUIDelegate, WKNavigationDelegate {
    let urlString = "https://www.google.com"
    // The protocol has to be https
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        // make url(String Type) to URL, and make URL to URLRequest
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        //open the web page within this app
        webView.load(request)
        
        //open web page in safari
        //UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        
     
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //SVProgressHUD.show()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async{
           // SVProgressHUD.dismiss()
        }
    }

}

