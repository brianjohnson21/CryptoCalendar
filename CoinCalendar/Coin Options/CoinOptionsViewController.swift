//
//  CoinOptionsViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/8/21.
//

import UIKit
import Lottie

protocol CoinOptionsViewControllerDelegate: class {
    func pinCoin(coinPinned: Coin)
    func unPinCoin()
}

class CoinOptionsViewController: UIViewController {
    
    weak var delegate: CoinOptionsViewControllerDelegate?
    var opacityLayer = UIView()
    var mainScrollView = UIScrollView()
    var wrapper = UIView()
    var mainContainer = UIView()
    var mainHeight: NSLayoutConstraint!
    var navView = UIView()
    var navTitleLabel = UILabel()
    var keyLine = UIView()
    var newChatOption = OptionsView()
    var newGroupOption = OptionsView()
    var newChannelOption = OptionsView()
    var shareOption = OptionsView()
    var successCheck = AnimationView()
    var addedToWatchListLabel = UILabel()
    let toastView = ToastNotificationView()
    
    var coin: Coin?
    
    var coinPrice = "1"
    var coinName = "Cardano"
    var coinSymbol = "ADA"
    
    var isPinnedCoin = false
    var isDismissing = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
        
        print("\(coinPrice) - \(coinName) - \(coinSymbol) - \(coin?.name) 🧠🧠🧠")
        
        
        
    }

}

//MARK: ACTIONS

extension CoinOptionsViewController {
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
    
    @objc func tappedAddToWatchlist() {
        lightImpactGenerator()
        UIView.animate(withDuration: 0.35) {
            self.newChatOption.alpha = 0
            self.newGroupOption.alpha = 0
            self.newChannelOption.alpha = 0
            self.shareOption.alpha = 0
        } completion: { (success) in            
            self.delegate?.pinCoin(coinPinned: self.coin!)
            self.successCheck.alpha = 1.0
            self.successCheck.play()
            UIView.animate(withDuration: 0.35) {
                self.addedToWatchListLabel.alpha = 1.0
            }
            self.perform(#selector(self.dimissVC), with: self, afterDelay: 1.5)
        }
    }
    
    @objc func removePinTapped() {
        lightImpactGenerator()
        UIView.animate(withDuration: 0.35) {
            self.newChatOption.alpha = 0
            self.newGroupOption.alpha = 0
            self.newChannelOption.alpha = 0
            self.shareOption.alpha = 0
        } completion: { (success) in
            self.delegate?.unPinCoin()
            self.successCheck.alpha = 1.0
            self.successCheck.play()
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
                //
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
            
            self.view.layoutIfNeeded()
        } completion: { (success) in
            self.showSetAlert()
        }
    }
    
    @objc func showSetAlert() {
        let eventOptionsVC =  SetAlertViewController()
        
        eventOptionsVC.coinPriceLabel.text = coinPrice
        eventOptionsVC.blockChainLabel.text = coinName
        eventOptionsVC.coinLabel.text = coinSymbol
        eventOptionsVC.coinImageView.image = UIImage(named: coinSymbol)
        
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

extension CoinOptionsViewController: UIScrollViewDelegate {
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

extension CoinOptionsViewController: PickerViewControllerDelegate {
    func didSetAlarm() {
        dimissVC()
    }
}

//MARK: SET ALERT DELEGATE

extension CoinOptionsViewController: SetAlertViewControllerDelegate {
    func doubleDismiss() {
        UIView.animate(withDuration: 0.35) {
            self.opacityLayer.alpha = 0
        }
    }
}
