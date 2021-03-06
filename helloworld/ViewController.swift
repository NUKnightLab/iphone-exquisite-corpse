//
//  ViewController.swift
//  helloworld
//
//  Created by Joe Germuska on 11/5/14.
//  Copyright (c) 2014 Joe Germuska. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    
    @IBOutlet var toolbar: UIView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    func webViewDidStartLoad(webView: UIWebView) {
        activityView.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityView.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        activityView.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView.hidesWhenStopped = true

        webView.delegate = self
        let requestURL = NSURL(string: "http://knightlab.northwestern.edu")
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(false, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func googleClicked(sender: AnyObject) {
        let requestURL = NSURL(string: "http://google.com")
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        self.view.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    @IBAction func nytClicked(sender: AnyObject) {
        let requestURL = NSURL(string: "http://nytimes.com")
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        self.view.backgroundColor = UIColor.magentaColor()
        
    }

    @IBAction func redditClicked(sender: AnyObject) {
        let requestURL = NSURL(string: "http://reddit.com")
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        self.view.backgroundColor = UIColor.greenColor()
        
    }
}

