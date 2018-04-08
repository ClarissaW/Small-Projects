//
//  ViewController.swift
//  Open PDF
//
//  Created by Wang, Zewen on 2018-04-08.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var openPDFButtonPressed: UIButton!
    
    
    @IBAction func openButtonPressed(_ sender: Any) {
        webView.isHidden = false
    
        if let url = Bundle.main.url(forResource: "SwiftLanguage", withExtension: "pdf"){
            webView.load(URLRequest(url: url))
        }
    }

}
