//
//  WebViewController.swift
//  newsFeed
//
//  Created by Luan Silva on 16/06/17.
//  Copyright © 2017 Luan Silva. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
 
    
    @IBOutlet weak var progress: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!

    @IBOutlet weak var back: UIBarButtonItem!
    
    var url: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        progress.stopAnimating()
        webView.loadRequest(URLRequest(url: URL(string: url!)!))
        webView?.scalesPageToFit = true;
        
    }

    func webViewDidFinishLoad(webView : UIWebView) {
        progress.stopAnimating()
    }

}
