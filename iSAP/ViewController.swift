//
//  ViewController.swift
//  iSAP
//
//  Created by Tobias Erath on 29.04.17. 
//  Copyright © 2017 Tobias Erath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    
    var urlMain = ""
    var urlLogoImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlMain = UserDefaults.standard.object(forKey: "url_main") as! String
        urlLogoImage = UserDefaults.standard.object(forKey: "url_logo") as! String
        
        if !(urlMain.isEmpty) {
            let iSAPURL = URL(string: urlMain)
            let iSAPURLRequest = URLRequest(url: iSAPURL!)
            webView.loadRequest(iSAPURLRequest)
        }
        if !(urlLogoImage.isEmpty) {
            let urlLogoWeb = URL(string: urlLogoImage)
            let data = try? Data(contentsOf: urlLogoWeb!)
            if data != nil {
                logoImage.image = UIImage(data: data!)
                logoImage.contentMode = UIViewContentMode.scaleAspectFit
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        webView.goBack()
    }

    @IBAction func goHome(_ sender: Any) {        
        urlMain = UserDefaults.standard.object(forKey: "url_main") as! String
        if !(urlMain.isEmpty) {
            let iSAPURL = URL(string: urlMain)
            let iSAPURLRequest = URLRequest(url: iSAPURL!)
            webView.loadRequest(iSAPURLRequest)
        }
    }

    @IBAction func exitApp(_ sender: Any) {
                webView.removeFromSuperview()
        webView.loadRequest(URLRequest(url: URL(string: "about:blank")!))
//        if !(urlMain.isEmpty) {
            let iSAPURL = URL(string: urlMain)
            let iSAPURLRequest = URLRequest(url: iSAPURL!)
            webView.loadRequest(iSAPURLRequest)
//        }

    }
}

