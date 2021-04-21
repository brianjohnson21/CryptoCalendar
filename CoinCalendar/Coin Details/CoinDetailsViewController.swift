//
//  CoinDetailsViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/12/21.
//

import UIKit

class CoinDetailsViewController: UIViewController {
    
    var coin: Coin?
    
    var navView = UIView()
    var dismissImageView = UIImageView()
    var dismissButton = UIButton()
    
    var coinImageView = UIImageView()
    var coinShowing = false
    var blockChainLabel = UILabel()
    var coinLabel = UILabel()
    
    var mainFeedTableView = UITableView()
    var coinDetailCoinTableViewCell = "coinDetailCoinTableViewCell"
    var coinDetailStatTableViewCell = "coinDetailStatTableViewCell"
    var mainFeedCardTableViewCell = "mainFeedCardTableViewCell"
    
    var sections: [String] = ["", "Market Stats", "Key Stats", "Social Stats", "Upcoming Events"]
    
    var marketStats: [String] = ["Current Price", "Market Cap", "Volume", "Market Dominance"]
    var keyStats: [String] = ["Health Score", "Coin Rank", "Correlation Rank"]
    var socialStats: [String] = ["Social Volume", "Social Engagement", "Social Contributors", "Social Dominance", "Average Sentiment", "Bullish Sentiment", "Bearish Sentiment", "Shared Links", "Twitter Volume", "Reddit Volume", "Medium Volume", "Youtube Volume", "News Volume", "Spam Volume"]
    
    var events: [String] = ["Event One", "Event Two"]
    
    var whiteGradient = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNav()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .darkContent
        hideTabBar()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
    }
}

//MARK: SCROLLVIEW DELEGATE

extension CoinDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yAxis = scrollView.contentOffset.y// + notchOffset
        if yAxis <= 60 {
            let navShadow: Float = Float((0.3 * yAxis) / 60)
            navView.layer.shadowOpacity = navShadow
        } else {
            navView.layer.shadowOpacity = 0.3
        }
        print("\(yAxis) - 👍👍👍")
        
        
        if yAxis > 80 {
            if !coinShowing {
                showCoin()
                coinShowing = true
            }
        } else {
            if coinShowing {
                hideCoin()
                coinShowing = false
            }
        }
    }
    
    
    @objc func showCoin() {
        UIView.animate(withDuration: 0.2) {
            self.coinImageView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            self.coinImageView.alpha = 1.0
        } completion: { (sucess) in
            UIView.animate(withDuration: 0.1) {
                self.coinImageView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            } completion: { (success) in
                UIView.animate(withDuration: 0.1) {
                    self.coinImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }

        }
    }
    
    @objc func hideCoin() {
        UIView.animate(withDuration: 0.2) {
            self.coinImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            self.coinImageView.alpha = 0
        } completion: { (sucess) in
            //
        }
    }
    
    @objc func popVC() {
        lightImpactGenerator()
        self.navigationController?.popViewController(animated: true)
    }
    
}
