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
    
    var coinsSelected: [String] = []
    var coins: [[String]] = [["Cardano", "ADA"],
                             ["Theta Fuel", "TFUEL"],
                             ["Bitcoin", "BTC"],
                             ["Polkadot", "DOT"],
                             ["SushiSwap", "SUSHI"],
                             ["Ethereum", "ETH"],
                             ["Chainlink", "LINK"],
                             ["Enjin", "ENJ"],
                             ["Litecoin", "LTC"],
                             ["Uniswap", "UNI"],
                             ["XRP", "XRP"],
                             ["Cardano", "ADA"],
                             ["Theta Fuel", "TFUEL"],
                             ["Bitcoin", "BTC"],
                             ["Polkadot", "DOT"],
                             ["SushiSwap", "SUSHI"],
                             ["Ethereum", "ETH"],
                             ["Chainlink", "LINK"],
                             ["Enjin", "ENJ"],
                             ["Litecoin", "LTC"],
                             ["Uniswap", "UNI"],
                             ["XRP", "XRP"],
                             ["Cardano", "ADA"],
                             ["Theta Fuel", "TFUEL"],
                             ["Bitcoin", "BTC"],
                             ["Polkadot", "DOT"],
                             ["SushiSwap", "SUSHI"],
                             ["Ethereum", "ETH"],
                             ["Chainlink", "LINK"],
                             ["Enjin", "ENJ"],
                             ["Litecoin", "LTC"],
                             ["Uniswap", "UNI"],
                             ["XRP", "XRP"]
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
        continueButton.showLoader()
        
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
        case .iphone11() :
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
        //shrinkAnimation(viewToAnimate: photoImageView, delay: 0.1)
        shrinkAnimation(viewToAnimate: detailLabel, delay: 0.1)
        shrinkAnimation(viewToAnimate: titleLabel, delay: 0.2)
        shrinkAnimation(viewToAnimate: continueButton.continueLabel, delay: 0.3)
        shrinkAnimation(viewToAnimate: continueButton.spinner, delay: 0.3)
        continueButton.spinner.stopAnimating()
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
        print("did this 💀💀💀")
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
