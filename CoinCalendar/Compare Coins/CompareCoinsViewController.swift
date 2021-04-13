//
//  CompareCoinsViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/11/21.
//

import UIKit

class CompareCoinsViewController: UIViewController {
    
    var compareContainer = CompareCoinsView()
    var compareHeight: NSLayoutConstraint!
    var compareBottom: NSLayoutConstraint!
    var downArrow = UIImageView()
    var dismissButton = UIButton()
    var topContainer = UIView()
    
    var compareFeedTableView = UITableView()
    var compareTableViewCell = "compareTableViewCell"
    
    var keyMetrics: [String] = ["Price", "Coin Health", "Coin Rank", "Market Cap", "Volume", "Morket Dominance", "Volatility", "24h Price Change", "Social Volume", "Bullish Sentiment", "Bearish Sentiment", "Twitter Volume", "Reddit Volume", "Youtube Volume"]
    
    var comparedCoins = [Coin]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCompareContainer()
        setupCompareTable()
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
    }

}

//MARK: ACTIONS

extension CompareCoinsViewController {
    
    @objc func animateViewsIn() {
        compareBottom.constant = 0
        compareHeight.constant = view.frame.height
        compareContainer.coinOneTop.constant = 82
        compareContainer.coinOneLeading.constant = 56
        compareContainer.coinTwoLeading.constant = 206
        UIView.animate(withDuration: 0.5) {
            self.compareContainer.shortNameOneLabel.alpha = 1.0
            self.compareContainer.shortNameTwoLabel.alpha = 1.0
            self.compareContainer.topContainer.alpha = 1.0
            self.compareFeedTableView.alpha = 1.0
            self.downArrow.alpha = 1.0
        } completion: { (success) in
            //
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.15, options: .curveEaseInOut) {
            self.view.layoutIfNeeded()
        } completion: { (success) in
            //
        }

        UIView.animate(withDuration: 0.25) {
            self.compareContainer.cancelImageView.alpha = 0
            self.compareContainer.coinOneShortNameLabel.alpha = 0
            self.compareContainer.coinTwoShortNameLabel.alpha = 0
        }

    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true) {
            //
        }
    }
    
}

//MARK: SCROLLVIEW DELEGATE

extension CompareCoinsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yAxis = scrollView.contentOffset.y// + notchOffset
        if yAxis <= 60 {
            let navShadow: Float = Float((0.3 * yAxis) / 60)
            compareContainer.topContainer.layer.shadowOpacity = navShadow
        } else {
            compareContainer.topContainer.layer.shadowOpacity = 0.3
        }
    }
}
