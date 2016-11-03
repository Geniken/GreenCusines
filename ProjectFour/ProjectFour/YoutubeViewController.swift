//
//  YoutubeViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/31/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import Foundation
import UIKit
import Async

class YoutubeViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Async.background {
            
            let URL = NSURL(string: "https://www.youtube.com/user/danispies")
            
            self.webView.loadRequest(URLRequest(url:URL! as URL))
            
        }
    }
}
