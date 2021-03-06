//
//  PickCryptoViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/31/21.
//

import UIKit
import ViewAnimator

class PickCryptoViewController: UIViewController {

    var navView = UIView()
    var navHeight: NSLayoutConstraint!
    var titleLabel = UILabel()
    var detailLabel = UILabel()
    var continueButton = ContinueButton()
    var continueBottom: NSLayoutConstraint!
    var continueWidth: NSLayoutConstraint!
    var continueHeight: NSLayoutConstraint!
    var whiteGradient = UIImageView()
    
    var globalContactListCollectionViewFlowLayout = UICollectionViewFlowLayout()
    var globalContactListCollectionView: UICollectionView!
    var pickCryptoCollectionViewCell = "pickCryptoCollectionViewCell"
    
    var fromSignUp = UserDefaults()
    
    var termsPrivacyLabel = UILabel()
    var termsOfUseLink = "https://www.cryptogainz.xyz/terms-of-use"
    var privacyLink = "https://www.cryptogainz.xyz/privacy-policy"
    var termsButton = UIButton()
    var privacyButton = UIButton()
    
    var coinsSelected: [String] = []    
//    var coins: [[String]] = [["Bitcoin", "BTC"],
//                             ["Ethereum", "ETH"],
//                             ["Binance Coin", "BNB"],
//                             ["Dogecoin", "DOGE"],
//                             ["Tether", "USDT"],
//                             ["Cardano", "ADA"],
//                             ["XRP", "XRP"],
//                             ["Polkadot", "DOT"],
//                             ["Bitcoin Cash", "BCH"],
//                             ["Litecoin", "LTC"],
//                             ["Chainlink", "LINK"],
//                             ["Uniswap", "UNI"],
//                             ["Stellar", "XLM"],
//                             ["VeChain", "VET"],
//                             ["EOS", "EOS"],
//                             ["Ethereum Classic", "ETC"],
//                             ["PancakeSwap", "CAKE"],
//                             ["THETA", "THETA"],
//                             ["TRON", "TRX"],
//                             ["Filecoin", "FIL"],
//                             ["Wrapped Bitcoin", "WBTC"],
//                             ["Monero", "XMR"],
//                             ["Neo", "NEO"],
//                             ["Bitcoin SV", "BSV"],
//                             ["IOTA", "MIOTA"],
//                             ["Polygon", "MATIC"],
//                             ["Avalanche", "AVAX"],
//                             ["Chiliz", "CHZ"]
//    ]
    
    var coins: [[String]] = [
        ["Bitcoin", "BTC"],
        ["Ethereum", "ETH"],
        ["Binance Coin", "BNB"],
        ["Dogecoin", "DOGE"],
        ["Cardano", "ADA"],
        ["Tether", "USDT"],
        ["XRP", "XRP"],
        //["Int Comp", "ICP"],
        ["Polkadot", "DOT"],
        ["Bitcoin Cash", "BCH"],
        ["Litecoin", "LTC"],
        ["Uniswap", "UNI"],
        ["Chainlink", "LINK"],
        ["Stellar", "XLM"],
        ["USD Coin", "USDC"],
        ["VeChain", "VET"],
        ["Shiba Inu", "SHIB"],
        ["Theta", "THETA"],
        ["Ethereum Classic", "ETC"],
        ["EOS", "EOS"],
        ["Solana", "SOL"],
        ["TRON", "TRX"],
        ["Filecoin", "FIL"],
        ["Wrapped BTC", "WBTC"],
        ["Neo", "NEO"],
        ["Monero", "XRM"],
        ["Binance USD", "BUSD"],
        ["Bitcoin SV", "BSV"],
        ["Huobi Token", "HT"],
        ["Terra", "LUNA"],
        ["Aave", "AAVE"],
        ["Pancake", "CAKE"],
        ["IOTA", "MIOTA"],
        ["Maker", "MKR"],
        ["Polygon", "MATIC"],
        ["FTX Token", "FTT"],
        ["Tezos", "XTZ"],
        ["Cosmos", "ATOM"],
        //["Klaytn", "KLAY"],
        ["Avalanche", "AVAX"],
        ["Dai", "DAI"],
        ["BitTorrent", "BTT"],
        ["Compound", "COMP"],
        ["Algorand", "ALGO"],
        //["Crypto.com Coin", "CRO"],
        ["Dash", "DASH"],
        ["Zcash", "ZEC"],
        ["Kusama", "KSM"],
        //["UNUS SED LEO", "LEO"],
        ["Waves", "WAVES"],
        ["NEM", "XEM"],
        //["yearn.finance", "YFI"],
        ["Elrond", "EGLD"],
        //["Bitcoin BEP2", "BTCB"],
        //["Revain", "REV"],
        ["Decred", "DCR"],
        //["Telcoin", "TEL"],
        ["Chiliz", "CHZ"],
        ["Qtum", "QTUM"],
        ["THORChain", "RUNE"]
    ]
    
    var circleCenter: CGFloat = -375
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNav()
        setupGlobalCollectionView()
        
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
        perform(#selector(animateCells), with: self, afterDelay: 0.35)
    }

}

//MARK: ACTIONS

extension PickCryptoViewController {
    @objc func didTapViewSource(sender: UIButton) {
        let eventSourceVC = EventSourceWebViewController()
        
        if sender.tag == 1 {
            eventSourceVC.urlString = termsOfUseLink
        } else {
            eventSourceVC.urlString = privacyLink
        }
        //print("\(resource) - ????????????")
        
        self.present(eventSourceVC, animated: true) {
            //
        }
    }
    
    @objc func animateViewsIn() {
        showView(viewToAnimate: titleLabel, delay: 0.1)
        showView(viewToAnimate: detailLabel, delay: 0.25)
        showView(viewToAnimate: whiteGradient, delay: 0.1)
    }
    
    @objc func showView(viewToAnimate: UIView, delay: Double) {
        UIView.animate(withDuration: 0.35, delay: delay, options: []) {
            viewToAnimate.alpha = 1.0
            viewToAnimate.transform = CGAffineTransform(translationX: 0, y: 0)
        } completion: { (success) in
            //
        }
    }
    
    @objc func animateCells() {
        globalContactListCollectionView.alpha = 1.0
        let fromAnimation = AnimationType.vector(CGVector(dx: 0, dy: 75))
        let zoomAnimation = AnimationType.zoom(scale: 1.0)
        UIView.animate(views: globalContactListCollectionView.visibleCells,
                       animations: [zoomAnimation, fromAnimation],
                       initialAlpha: 0, finalAlpha: 1.0, duration: 0.35)
        //finishedLoading = true
    }
    
    @objc func continueClicked() {
        //continueButton.showLoader()
        continueButton.spinner.isHidden = true        
        User.current.watchlist = self.coinsSelected
        
        API.sharedInstance.updateUser(user: User.current) { (success, user, error) in
            guard error == nil else {
                print(error!)
                DispatchQueue.main.async { [weak self] in
                    self?.continueButton.didCancelLoader()
                }
                return
            }
            guard success, let user = user else {
                print("failed updating user")
                DispatchQueue.main.async { [weak self] in
                    self?.continueButton.didCancelLoader()
                }
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                User.current = user
                User.saveCurrentUser()
                
                self?.shrinkTransition()
            }
        }
    }
    
    @objc func shrinkTransition() {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        switch screenHeight {
        case .iphone5() :
            circleCenter = -375
        case .iphone78() :
            circleCenter = -302
        case .iphone78Plus() :
            circleCenter = -337
        case .iphone11Max() :
            circleCenter = -416
        
        //Iphone 12
        case .iphone12AndPro() :
            circleCenter = -390
        case .iphone12ProMax() :
            circleCenter = -431
            
        default:
            circleCenter = -375
        }
        
        continueButton.isUserInteractionEnabled = false
        termsButton.isHidden = true
        privacyButton.isHidden = true
        //shrinkAnimation(viewToAnimate: photoImageView, delay: 0.1)
        shrinkAnimation(viewToAnimate: detailLabel, delay: 0.1)
        shrinkAnimation(viewToAnimate: titleLabel, delay: 0.2)
        shrinkAnimation(viewToAnimate: continueButton.continueLabel, delay: 0.3)
        shrinkAnimation(viewToAnimate: continueButton.spinner, delay: 0.3)
        shrinkAnimation(viewToAnimate: termsPrivacyLabel, delay: 0.3)
        continueButton.spinner.stopAnimating()
        continueButton.spinner.alpha = 0
        continueButton.spinner.isHidden = true
        
        continueWidth.constant = 63
        //delegate.didCompleteNowFadeMusic()
        UIView.animate(withDuration: 0.35, delay: 0.35, options: [], animations: {
            self.globalContactListCollectionView.alpha = 0
            self.continueButton.layer.cornerRadius = 63/2
            self.navView.alpha = 0
            self.view.layoutIfNeeded()
        }) { (success) in
            self.continueBottom.constant = self.circleCenter - 15 //-375
            UIView.animate(withDuration: 0.5, delay: 0.15, options: [], animations: {
                self.view.layoutIfNeeded()
            }) { (success) in
                self.continueBottom.constant = self.circleCenter + 7 //-375
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.layoutIfNeeded()
                }) { (success) in
                    self.continueBottom.constant = self.circleCenter
                    UIView.animate(withDuration: 0.25, animations: {
                        self.view.layoutIfNeeded()
                    }) { (success) in
                        UIView.animate(withDuration: 0.8, delay: 0.2, options: [], animations: {
                            self.continueButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        }) { (success) in
                            UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                                self.continueButton.transform = CGAffineTransform(scaleX: 50, y:  50)
                            }) { (success) in
                                self.goToHome()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func goToHome() {
        fromSignUp.set(true, forKey: "comingFromSignUp")
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MyTabBarController") as! MyTabBarController
        let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = vc
        print("did this ????????????")
    }
    
    @objc func shrinkAnimation(viewToAnimate: UIView, delay: Double) {
        UIView.animate(withDuration: 0.35, delay: delay, options: [], animations: {
            viewToAnimate.alpha = 0
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        }) { (success) in }
    }
    
}

//MARK: SCROLLVIEW DELEGATE

extension PickCryptoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yAxis = scrollView.contentOffset.y// + notchOffset
        if yAxis <= 60 {
            let navShadow: Float = Float((0.3 * yAxis) / 60)
            navView.layer.shadowOpacity = navShadow
        } else {
            navView.layer.shadowOpacity = 0.3
        }
    }
}
