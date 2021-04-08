//
//  InfoViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/6/21.
//

import UIKit

class InfoViewController: UIViewController {

    var opacityLayer = UIView()
    var mainScrollView = UIScrollView()
    var mainContainer = UIView()
    var navView = UIView()
    var navTitleLabel = UILabel()
    var keyLine = UIView()

    var mainFeedTableView = UITableView()
    var infoTableViewCell = "infoTableViewCell"
    
    var whiteGradient = UIImageView()
    var isDismissing = false
    
    var expos: [[String]] = [
        ["Coin Health", "The Coin Health Score is a combined measure of cryptocurrency indicators used to correlate and understand the overall health, quality and performance of a specific project. In short, it indicates how well a coin is doing.\n\nHow can it be used?\n\nThe Coin Health Score can be used as a signal when a project is entering a new territory, from very bearish to very bullish. Scores greater than 50 are generally bullish while scores less than 50 are generally bearish. Bottom line, the higher the score the better. The overall score combines the total score of the following four key performance indicators:\n\n• Price Score\n\n• Social Sentiment\n\n• Social Impact\n\n• Correlation Rank"],
        ["Price Score", "Price score (1-5) is a score we derive from industry standard technical information to give a coin some indication of positive or negative momentum."],
        ["Volatility", "Volatility looks at price fluctuations over time and uses a standard deviation of logarithmic returns to detect patterns."],
        ["Coin Rank", "Coin Rank measures a coin’s performance VS. all other coins that we actively support. In general it is a unique measurement that combines ALT coin price performance relative to Bitcoin and other social activity indicators across the entire crypto market. The lower the score the better! A coin can have a Coin Rank of 1 even in a bear market situation. This combined metric seeks to provide a broader view of the health and performance of altcoins.\n\nHow can it be used?\n\nCoin Rank looks at both financial metrics alongside community metrics and seeks to identify altcoins that outperform Bitcoin during specific timeframes. There’s four main factors that go into the Coin Rank:\n\n• Price Change\n\n• Trading Volume\n\n• Social Volume\n\n• Social Score"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setupViews()
        setupTableView()
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
        
    }

}

//MARK: ACTIONS

extension InfoViewController {
    @objc func animateViewsIn() {
        UIView.animate(withDuration: 0.35) {
            self.opacityLayer.alpha = 0.75
            self.mainContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            self.keyLine.transform = CGAffineTransform(translationX: 0, y: 0)
        } completion: { (success) in
            //
        }
    }
    
    
    @objc func dimissVC() {
        UIView.animate(withDuration: 0.28) {
            self.mainScrollView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.opacityLayer.alpha = 0
        } completion: { (success) in
            self.dismiss(animated: false) {
                //
            }
        }
    }
}

//MARK: SCROLLVIEW DELEGATE

extension InfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.tag == 1 {
            let yOffset = scrollView.contentOffset.y// + 44
            if yOffset > -44 {
                scrollView.setContentOffset(CGPoint(x: 0, y: -44), animated: false)
            }
            
            if yOffset < -85 {
                if !isDismissing {
                    dimissVC()
                    isDismissing = true
                }
            }
        }
        
        if scrollView.tag == 2 {
            let yAxis = scrollView.contentOffset.y// + notchOffset
            
            if yAxis <= 60 {
                let navShadow: Float = Float((0.3 * yAxis) / 60)
                navView.layer.shadowOpacity = navShadow
            } else {
                navView.layer.shadowOpacity = 0.3
            }
        }
    }
}
