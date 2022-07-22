//
//  MainViewController.swift
//  VK
//
//  Created by Alexander Bubeshka on 22.05.22.
//
import UIKit
import WebKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!

    
    override func viewDidLoad() {
        
        webview.navigationDelegate = self
        
        super.viewDidLoad()

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8216394"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value:"https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        guard let url = urlComponents.url else { return }
        print(url)
        let request = URLRequest(url: url)
        
        webview.load(request)
    }
}

