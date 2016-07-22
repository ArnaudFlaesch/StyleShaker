//
//  ShoppingListController.swift
//  StyleShaker
//
//  Created by Arnaud on 12/06/16.
//  Copyright © 2016 esgi. All rights reserved.
//

import UIKit

class ShoppingListController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var webView: UIWebView!
    var googleShoppingUrl: String = "https://www.google.fr/search?output=search&tbm=shop&q="
    var productTitle:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.delegate = self;
        
        googleShoppingUrl = googleShoppingUrl+productTitle
        let urlQuery:String = googleShoppingUrl.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        let request: NSURLRequest = NSURLRequest(URL: (NSURL(string: urlQuery))!)
        self.webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}