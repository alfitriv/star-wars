//
//  PWAViewController.swift
//  MayTheForce
//
//  Created by Vania Radmila Alfitri on 17/01/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit
import WebKit

class PWAViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.loadHTMLString("<!DOCTYPE html><html><body><h1>My First Heading</h1><p>My first paragraph.</p></body></html>", baseURL: nil)
    }
}

extension PWAViewController: WKNavigationDelegate {
    
    
    
}
