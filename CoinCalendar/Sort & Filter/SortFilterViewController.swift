//
//  SortFilterViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/29/21.
//

import UIKit

protocol SortFilterViewControllerDelegate: class {
    func didUpdateFilter(coins: [String])
}

class SortFilterViewController: UIViewController {
    
    weak var delegate: SortFilterViewControllerDelegate?
    var opacityLayer = UIView()
    var mainScrollView = UIScrollView()
    var mainContainer = UIView()
    var navView = UIView()
    var navTitleLabel = UILabel()
    var keyLine = UIView()

    var mainFeedTableView = UITableView()
    var sortCoinTableViewCell = "sortCoinTableViewCell"
    
    var whiteGradient = UIImageView()
    var resetButton = UIButton()
    var resetBottom: NSLayoutConstraint!
    
    var coinsSelected: [String] = []
    var coins: [[String]] = [["Cardano", "ADA"],
                             ["Theta Fuel", "TFUEL"],
                             ["Bitcoin", "BTC"],
                             ["Polkadot", "DOT"],
                             ["SushiSwap", "SUSHI"],
                             ["Ethereum", "ETH"],
                             ["Chainlink", "LINK"],
                             ["Enjin", "ENJ"],
                             ["Ethereum", "ETH"],
                             ["Litecoin", "LTC"],
                             ["Uniswap", "UNI"],
                             ["XRP", "XRP"]
    ]
    
    var originalAmount: Int = 0
    
    var isDismissing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTableView()
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
    }

}

//MARK: ACTIONS

extension SortFilterViewController {
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
        
        if originalAmount != coinsSelected.count {
            delegate?.didUpdateFilter(coins: coinsSelected)
        }
        
        UIView.animate(withDuration: 0.28) {
            self.mainScrollView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.opacityLayer.alpha = 0
        } completion: { (success) in
            self.dismiss(animated: false) {
                //
            }
        }
    }
    
    @objc func showHideResetButton(showReset: Bool) {
        if showReset {
            resetBottom.constant = -25
        } else {
            resetBottom.constant = 100
        }
        
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func didTapReset() {
        lightImpactGenerator()
        for filterCell in 0...coins.count - 1 {
            let indexPath = IndexPath(row: filterCell, section: 0)
            let cell = mainFeedTableView.cellForRow(at: indexPath) as! SortCoinTableViewCell
            cell.deactivateFilter()
        }
        
        coinsSelected.removeAll()
        mainFeedTableView.reloadData()
        showHideResetButton(showReset: false)
    }
}

//MARK: SCROLLVIEW DELEGATE

extension SortFilterViewController: UIScrollViewDelegate {
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
