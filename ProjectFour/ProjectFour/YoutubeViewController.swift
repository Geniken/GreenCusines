//
//  YoutubeViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/31/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import Foundation
import UIKit

class YoutubeViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let URL = NSURL(string: "https://www.youtube.com/user/danispies")
    
    webView.loadRequest(URLRequest(url:URL! as URL))
    
    }
}
