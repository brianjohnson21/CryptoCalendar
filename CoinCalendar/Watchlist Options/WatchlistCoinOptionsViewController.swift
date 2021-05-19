//
//  WatchlistCoinOptionsViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 5/12/21.
//

import UIKit
import Lottie

protocol WatchlistCoinOptionsViewControllerDelegate: class {
    func removeFromWatchlist(coinPinned: Coin)
    func goToCoinDetail(coinToGo: Coin)
}

class WatchlistCoinOptionsViewController: UIViewController {
    
    weak var delegate: WatchlistCoinOptionsViewControllerDelegate?
    var opacityLayer = UIView()
    var mainScrollView = UIScrollView()
    var wrapper = UIView()
    var mainContainer = UIView()
    var mainHeight: NSLayoutConstraint!
    var navView = UIView()
    var navTitleLabel = UILabel()
    var keyLine = UIView()
    var watchlistOption = OptionsView()
    var compareOption = OptionsView()
    var newChatOption = OptionsView()
    var newGroupOption = OptionsView()
    var newChannelOption = OptionsView()
    var shareOption = OptionsView()
    var successCheck = AnimationView()
    var addedToWatchListLabel = UILabel()
    let toastView = ToastNotificationView()
    
    var coinContainer = UIView()
    var coinImageView = UIImageView()
    var blockChainLabel = UILabel()
    var coinLabel = UILabel()
    var arrowImageView = UIImageView()
    var seeMoreLabel = UILabel()
    var coinDivider = UIView()
    var coinDetailButton = UIButton()
    
    var coin: Coin?
    
    var coinPrice = "1"
    var coinName = "Cardano"
    var coinSymbol = "ADA"
    
    var isComparing = false
    var isPinnedCoin = false
    var isDismissing = false
    var goingToCoinDetail = false
    var isFromHome = false
    
    var inWatchlist = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
        //print("\(coinPrice) - \(coinName) - \(coinSymbol) - \(coin?.name) 🧠🧠🧠")
    }

}

//MARK: ACTIONS

extension WatchlistCoinOptionsViewController {
    @objc func coinDetailTapped() {
        lightImpactGenerator()
        goingToCoinDetail = true
        dimissVC()
    }
    
    @objc func didTapCompare() {
        lightImpactGenerator()
        isComparing = true
        dimissVC()
    }
    
    @objc func didTapAddtoCustom() {
        errorImpactGenerator()
        toastView.presentError(withMessage: "Coming in v1.1")
    }
    
    @objc func didTapShareWithFriends() {
        lightImpactGenerator()
        let text = "This is some text that I want to share."
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func tappedRemoveFromWatchlist() {
        lightImpactGenerator()
        UIView.animate(withDuration: 0.35) {
            self.newChatOption.alpha = 0
            self.newGroupOption.alpha = 0
            self.newChannelOption.alpha = 0
            self.compareOption.alpha = 0
            self.watchlistOption.alpha = 0
            self.shareOption.alpha = 0
            self.coinContainer.alpha = 0
        } completion: { (success) in
            self.delegate?.removeFromWatchlist(coinPinned: self.coin!)
            self.successCheck.alpha = 1.0
            self.successCheck.play()
            self.addedToWatchListLabel.text = "Add to watchlist!"
            UIView.animate(withDuration: 0.35) {
                self.addedToWatchListLabel.alpha = 1.0
            }
            self.perform(#selector(self.dimissVC), with: self, afterDelay: 1.5)
        }
    }
    
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
                if self.goingToCoinDetail {
                    self.delegate?.goToCoinDetail(coinToGo: self.coin!)
                }
            }
        }
    }
    
    @objc func didTapSetAlert() {
        lightImpactGenerator()
        mainHeight.constant = self.view.frame.height - 71
        UIView.animate(withDuration: 0.35) {
            self.newChatOption.alpha = 0
            self.newChatOption.transform = CGAffineTransform(translationX: -100, y: 0)
            
            self.newGroupOption.alpha = 0
            self.newGroupOption.transform = CGAffineTransform(translationX: -100, y: 0)
            
            self.newChannelOption.alpha = 0
            self.newChannelOption.transform = CGAffineTransform(translationX: -100, y: 0)
            
            self.shareOption.alpha = 0
            self.shareOption.transform = CGAffineTransform(translationX: -100, y: 0)
            
            self.compareOption.alpha = 0
            self.compareOption.transform = CGAffineTransform(translationX: -100, y: 0)
            
            self.watchlistOption.alpha = 0
            self.watchlistOption.transform = CGAffineTransform(translationX: -100, y: 0)
            
            self.coinContainer.alpha = 0
            self.coinContainer.transform = CGAffineTransform(translationX: -100, y: 0)
            
            self.view.layoutIfNeeded()
        } completion: { (success) in
            self.showSetAlert()
        }
    }
    
    @objc func showSetAlert() {
        let eventOptionsVC =  SetAlertViewController()
        //print("\(coinName) - 🥶🥶🥶")
        if let coinPrice = coin?.price {
            if coinPrice < 1.0 {
                eventOptionsVC.coinPriceLabel.text = "$\(coinPrice)"
            } else {
                let largeNumber = coinPrice.rounded(toPlaces: 2)
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
                if let formNumber = formattedNumber {
                    eventOptionsVC.coinPriceLabel.text = "$\(formNumber)"
                }
            }
        }
        eventOptionsVC.blockChainLabel.text = coin?.name
        if let coinSymbol = coin?.symbol {
            eventOptionsVC.coinLabel.text = coinSymbol
            eventOptionsVC.coinImageView.image = UIImage(named: "\(coinSymbol)")
            print("\(coinSymbol) - 🥶🥶🥶")
        }
        
        eventOptionsVC.isComingFromCoinOptions = true
        eventOptionsVC.delegate = self
        eventOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(eventOptionsVC, animated: false) {
            self.mainContainer.isHidden = true
            self.keyLine.isHidden = true
        }
    }
}

//MARK: SCROLLVIEW DELEGATE

extension WatchlistCoinOptionsViewController: UIScrollViewDelegate {
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
                
    }
}

//MARK: PICKER VC DELEGATE

extension WatchlistCoinOptionsViewController: PickerViewControllerDelegate {
    func didSetAlarm(date: Date) {
        dimissVC()
    }
}

//MARK: SET ALERT DELEGATE

extension WatchlistCoinOptionsViewController: SetAlertViewControllerDelegate {
    func doubleDismiss() {
        UIView.animate(withDuration: 0.35) {
            self.opacityLayer.alpha = 0
        }
    }
}
