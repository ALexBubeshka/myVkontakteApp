//
//  MainViewController.swift
//  VK
//
//  Created by Alexander Bubeshka on 22.05.22.
//
import UIKit
import WebKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var vkImage: UIImageView!
    @IBOutlet weak var vkLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var buttonEnter: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
   
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

//        Подскажите как сделалть переход без Segue? Ниже код котрый выдает критическую ошибку
        
    //    navigationController?.pushViewController(MyFriendsController(), animated: true)
        

       performSegue(withIdentifier: "ToTabBarController", sender: nil)
    }
  
}

  func sendGetRequestFrindsList() {

  var components = URLComponents(string: "http://api.vk.com/method/friends.get")
      components?.queryItems = [
          URLQueryItem(name: "access_token", value: Session.instance.token),
          URLQueryItem(name: "fields", value: "nickname"),
          URLQueryItem(name: "order", value: "name"),
          URLQueryItem(name: "v", value: "5.131")
      ]

      guard let url = components?.url else { return }

      print (url)

      URLSession.shared.dataTask(with: url) { (data, _, _ ) in
          guard let data = data else { return }

          do {
              let decoder = JSONDecoder()
              let model = try decoder.decode(GetFriendsResponse.self, from: data)
              print(model)
          } catch {
              print(error)
          }
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

      URLSession.shared.dataTask(with: url) { (data, _, _ ) in
          guard let data = data else { return }

          do {
              let decoder = JSONDecoder()
              let model = try decoder.decode(GetPhotoResponse.self, from: data)
              print(model)

          } catch {
              print(error)
          }
      }.resume()
  
 }
  func sendGetRequestGroupsList() {

  var components = URLComponents(string: "http://api.vk.com/method/groups.get")
      components?.queryItems = [
          URLQueryItem(name: "access_token", value: Session.instance.token),
          URLQueryItem(name: "extended", value: "1"),
          URLQueryItem(name: "v", value: "5.131")
      ]

      guard let url = components?.url else { return }

      print (url)
      URLSession.shared.dataTask(with: url) { (data, _, _ ) in
          guard let data = data else { return }
        
          do {
              let decoder = JSONDecoder()
              let model = try decoder.decode(GetGroupsResponse.self, from: data)
              print(model)

          } catch {
              print(error)
          }
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
          
          do {
              let decoder = JSONDecoder()
              let model = try decoder.decode(GetGroupsResponse.self, from: data)
              print(model)

          } catch {
              print(error)
          }
          
          let someString = String(data: data, encoding: .utf8)
          print(someString ?? "no data")
      }.resume()
}
