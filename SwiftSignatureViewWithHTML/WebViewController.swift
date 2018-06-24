//
//  WebViewController.swift
//  SwiftSignatureView_Example
//
//  Created by Zion Perez on 6/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var wkWebView: WKWebView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let html = getHTML(from: "index.html")
        wkWebView.loadHTMLString(html, baseURL: Bundle.main.bundleURL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getHTML(from fileName: String) -> String {
        
        guard let htmlFile = Bundle.main.url(forResource: fileName, withExtension: nil)
            else { fatalError("Error locating HTML file.") }
        
        guard let htmlContent = try? String(contentsOf: htmlFile)
            else { fatalError("Error getting HTML file content.") }
        
        // create base64-encoded string of the image        
        if let image = image, let base64String = UIImagePNGRepresentation(image)?.base64EncodedString() {
            return htmlContent.replacingOccurrences(of: "{{BASE64_STRING}}", with: base64String)
        } else {
            print("Error creating PNG representation.")
            return htmlContent
        }
    }
}
