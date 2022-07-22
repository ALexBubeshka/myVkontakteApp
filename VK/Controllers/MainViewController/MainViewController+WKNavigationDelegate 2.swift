//
//  MainViewController+WKNavigationDelegate.swift
//  VK
//
//  Created by Alexander Bubeshka on 12.07.22.
//

import UIKit
import WebKit

extension MainViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        decisionHandler(.allow)
        
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else { return }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String : String](), { partialResult, param in
              var dict = partialResult
              let key = param[0]
              let value = param[1]
              dict[key] = value
              return dict
            })
        guard
            let token = params["access_token"]
        else { return }
        
        Session.instance.token = token
        
        print(Session.instance.token)
          sendGetRequestFrindsList()
          sendGetRequestPhotoList()
          sendGetRequestGroupsList()
          sendGetRequestFindGroups()
     
        
     
//        Подскажите как сделалть переход без Segue? Ниже код котрый выдает критическую ошибку
//        navigationController?.pushViewController(MyFriendsController(), animated: true)
        
        
        performSegue(withIdentifier: "ToTabBarController", sender: nil)
    }
  
    func sendGetRequestFrindsList() {

    var components = URLComponents(string: "http://api.vk.com/method/friends.get")
        components?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = components?.url else { return }

        print (url)
        URLSession.shared.dataTask(with: url) { (data, _, _ ) in
            guard let data = data else { return }
            let someString = String(data: data, encoding: .utf8)
            print(someString ?? "no data")
        }.resume()
    }

    func sendGetRequestPhotoList() {

    var components = URLComponents(string: "http://api.vk.com/method/photos.get")
        components?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "album_id", value: "profile"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = components?.url else { return }

        print (url)
        URLSession.shared.dataTask(with: url) { (data, _, _ ) in
            guard let data = data else { return }
            let someString = String(data: data, encoding: .utf8)
            print(someString ?? "no data")
        }.resume()
    }
    func sendGetRequestGroupsList() {

    var components = URLComponents(string: "http://api.vk.com/method/groups.get")
        components?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = components?.url else { return }

        print (url)
        URLSession.shared.dataTask(with: url) { (data, _, _ ) in
            guard let data = data else { return }
            let someString = String(data: data, encoding: .utf8)
            print(someString ?? "no data")
        }.resume()
    }
    
    func sendGetRequestFindGroups() {

    var components = URLComponents(string: "http://api.vk.com/method/groups.search")
        components?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "q", value: "Music"),
            URLQueryItem(name: "count", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = components?.url else { return }
        
        print (url)
        URLSession.shared.dataTask(with: url) { (data, _, _ ) in
            guard let data = data else { return }
            let someString = String(data: data, encoding: .utf8)
            print(someString ?? "no data")
        }.resume()
    }
}


