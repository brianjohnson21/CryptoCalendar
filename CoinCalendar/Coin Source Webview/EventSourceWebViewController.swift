//
//  EventSourceWebViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/13/21.
//

import UIKit
import WebKit

class EventSourceWebViewController: UIViewController, WKNavigationDelegate {
    
    var navView = UIView()
    var webViewContainer = UIView()
    var webView: WKWebView!
    var dismissButton = UIButton()
    var dismissArrow = UIImageView()
    var urlString = "https://www.google.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
                        
        let url = URL(string: urlString)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
                
        dismissButton.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        dismissButton.layer.borderWidth = 1
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        dismissButton.backgroundColor = .white
        dismissButton.layer.cornerRadius = 60/2
        dismissButton.layer.masksToBounds = true
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dismissButton)
        dismissButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        dismissArrow.isUserInteractionEnabled = false
        dismissArrow.image = UIImage(named: "downArrowWhite")
        dismissArrow.setImageColor(color: .coinBaseBlue)
        dismissArrow.contentMode = .scaleAspectFill
        dismissArrow.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.addSubview(dismissArrow)
        dismissArrow.centerXAnchor.constraint(equalTo: dismissButton.centerXAnchor).isActive = true
        dismissArrow.centerYAnchor.constraint(equalTo: dismissButton.centerYAnchor).isActive = true
        dismissArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dismissArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }

}
