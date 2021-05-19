//
//  HomeFeedViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/1/21.
//

import UIKit
import Lottie
import SuperBadges
import SwiftyStoreKit
import Disk

class HomeFeedViewController: UIViewController {
    
    let launchTransition = LaunchTransitionView()
    var transitionView = UIView()
    
    //Nav
    var navView = UIView()
    var notchOffset: CGFloat = 44
    var navHeight: CGFloat = 96
    
    var userProfileImageContainer = UIView()
    var userProfileImageView = UIImageView()
    var userGreetingLabel = UILabel()
    var userNameLabel = UILabel()
    var profileButton = UIButton()
    var calendarImageView = UIImageView()
    var sortImageView = UIImageView()
    var sortButton = UIButton()
    var titleLabel = UILabel()
    
    var fromSignUp = UserDefaults()
    var viewedDiscoverExperts = UserDefaults()
    var viewedMarketData = UserDefaults()
    var viewedEvents = UserDefaults()
    var viewedWatchlist = UserDefaults()
    
    var mainFeedTableView = UITableView()
    var homeFeedCoinsTableViewCell = "homeFeedCoinsTableViewCell"
    var homeFeedCoinOfDayTableViewCell = "homeFeedCoinOfDayTableViewCell"
    
    var sections: [String] = ["Biggest Gainers (24h)", "", "Bullish Sentiment", "Trending on Social (24h)", "Healthiest Coins (24h)"]
    
    var coins = [Coin]()
    var coin: Coin?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight//UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
        
        modifyConstraints()
        setupNav()
        setupTableView()
        setupLaunchTransition()
        
        if fromSignUp.bool(forKey: "comingFromSignUp") {
            print("is from sign up")
            launchTransition.instaMallLogo.isHidden = true
            launchTransition.topHalf.backgroundColor = .coinBaseBlue
            launchTransition.bottomHalf.backgroundColor = .coinBaseBlue
            launchTransition.cometsLayer.isHidden = true
            launchTransition.moonImageView.isHidden = true
            launchTransition.rocketImageView.isHidden = true
            launchTransition.transitionDelay = 0.25
            fromSignUp.set(false, forKey: "comingFromSignUp")
        } else {
            //setupLaunchTransition()
            print("is not from sign up")
            //fromSignUp.set(true, forKey: "comingFromSignUp")
        }
        
        print("\(fromSignUp.bool(forKey: "comingFromSignUp")) - 😇😇😇")
        
        //doTransitionViewThing()
        
        //perform(#selector(showSubscriptionVC), with: self, afterDelay: 4.0)
        //showSubscriptionVC()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in
            if let error = error {
                print("D'oh: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    center.delegate = appDelegate.notificationDelegate
                    let openAction = UNNotificationAction(identifier: "OpenNotification", title: NSLocalizedString("Abrir", comment: ""), options: UNNotificationActionOptions.foreground)
                    let deafultCategory = UNNotificationCategory(identifier: "CustomSamplePush", actions: [openAction], intentIdentifiers: [], options: [])
                    center.setNotificationCategories(Set([deafultCategory]))
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        
        getCoins()
        getCoinOfDay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .darkContent
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        showTabBar()
        checkForTabDots()
    }
    
    func checkForTabDots() {
        if viewedDiscoverExperts.bool(forKey: "viewedDiscoverExperts") {
            self.tabBarController?.removeDotAtTabBarItemIndex(index: 1)
        } else {
            self.tabBarController?.addDotAtTabBarItemIndex(index: 1, radius: 4, color : .red)
        }
        
        if viewedMarketData.bool(forKey: "viewedMarketData") {
            self.tabBarController?.removeDotAtTabBarItemIndex(index: 2)
        } else {
            self.tabBarController?.addDotAtTabBarItemIndex(index: 2, radius: 4, color : .red)
        }
        
        if viewedEvents.bool(forKey: "viewedEvents") {
            self.tabBarController?.removeDotAtTabBarItemIndex(index: 3)
        } else {
            self.tabBarController?.addDotAtTabBarItemIndex(index: 3, radius: 4, color : .red)
        }
        
        if viewedWatchlist.bool(forKey: "viewedWatchlist") {
            self.tabBarController?.removeDotAtTabBarItemIndex(index: 4)
        } else {
            self.tabBarController?.addDotAtTabBarItemIndex(index: 4, radius: 4, color : .red)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    func getCoins() {
        API.sharedInstance.getCoins { (success, coins, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let coins = coins else {
                print("error getting coins")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.coins = coins
                self?.mainFeedTableView.reloadData()
            }
        }
    }
    
    func getCoinOfDay() {
        API.sharedInstance.getCoinOfDay { (success, coin, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let coin = coin else {
                print("error getting coin of day")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.coin = coin
                self?.mainFeedTableView.reloadData()
            }
        }
    }

}

//MARK: ACTIONS

extension HomeFeedViewController {
    @objc func doTransitionViewThing() {
        self.launchTransition.animateViewsAway()
    }
    
    @objc func showSubscriptionVC() {
        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: "b9f30628cfbb42019b73fa6546d3b652")
        SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = "CryptoGainz_Sub1"
                // Verify the purchase of a Subscription
                let purchaseResult = SwiftyStoreKit.verifySubscription(
                    ofType: .autoRenewable, // or .nonRenewing (see below)
                    productId: productId,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(let expiryDate, let items):
                    print("\(productId) is valid until \(expiryDate)\n\(items)\n")
                    User.authorized = true
//                        MAPI.registerUser(user: UserSignup(), completionHandler: { (success, user, error) in
//                            guard error == nil else {
//                                print(error!)
//                                return
//                            }
//                            guard success, let user = user else {
//                                print("error")
//                                return
//                            }
//
//                            User.current = user
//                            User.saveCurrentUser()
//                        })
                case .expired(let expiryDate, let items):
                    print("\(productId) is expired since \(expiryDate)\n\(items)\n")
                    DispatchQueue.main.async {
                        let subVC = SubscriptionViewController()
                        subVC.modalPresentationStyle = .overFullScreen
                        self.present(subVC, animated: true, completion: nil)
                    }
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                    DispatchQueue.main.async {
                        let subVC = SubscriptionViewController()
                        subVC.modalPresentationStyle = .overFullScreen
                        self.present(subVC, animated: true, completion: nil)
                    }
                }
                
            case .error(let error):
                print("Receipt verification failed: \(error)")
                DispatchQueue.main.async {
                    let subVC = SubscriptionViewController()
                    subVC.modalPresentationStyle = .overFullScreen
                    self.present(subVC, animated: true, completion: nil)
                }
            }
        }
    }
    
    @objc func goToProfile() {
        lightImpactGenerator()
        let VC1 = MyProfileViewController()
        let navController = UINavigationController(rootViewController: VC1)
        navController.modalPresentationStyle = .overFullScreen
        self.present(navController, animated: false, completion: nil)
    }
    
    @objc func showWelcome() {
        let subVC = WelcomeViewController()
        subVC.modalPresentationStyle = .overFullScreen
        self.present(subVC, animated: false, completion: nil)
    }
    
    @objc func goToAlerts() {
        lightImpactGenerator()
        let sortFilterVC = MyAlertsViewController()
        self.navigationController?.pushViewController(sortFilterVC, animated: true)
    }
}

//MARK: LAUNCH DELEGATE

extension HomeFeedViewController: LaunchTransitionViewDelegate {
    func didFinishLaunchAnimation() {
        //Did finish
        //perform(#selector(showSubscriptionVC), with: self, afterDelay: 1.0)
        //perform(#selector(showWelcome), with: self, afterDelay: 1.0)
    }
}

//MARK: COIN OPTION DELEGATE

extension HomeFeedViewController: CoinOptionsViewControllerDelegate {
    func addToWatchlist(coinPinned: Coin) {
        Coin.addSubscriptionToCache(coin: coinPinned)
        
        if User.current.watchlist == nil || (User.current.watchlist?.count ?? 0) == 0 {
            User.current.watchlist = [coinPinned.symbol ?? ""]
        } else {
            if !(User.current.watchlist?.contains(coinPinned.symbol ?? "") ?? false) {
                User.current.watchlist?.append(coinPinned.symbol ?? "")
            }
        }
        
        API.sharedInstance.updateUser(user: User.current) { (success, user, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard success, let user = user else {
                print("failed updating user")
                return
            }
            
            DispatchQueue.main.async {
                User.current = user
                User.saveCurrentUser()
            }
        }
    }
    
    func removeFromWatchlist(coinPinned: Coin) {
        Coin.removeSubscriptionToCache(coin: coinPinned)
        
        User.current.watchlist?.removeAll(where: {$0 == coinPinned.symbol ?? ""})
        
        API.sharedInstance.updateUser(user: User.current) { (success, user, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard success, let user = user else {
                print("failed updating user")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                User.current = user
                User.saveCurrentUser()
            }
        }
    }
    
    func pinCoin(coinPinned: Coin) {
        //
    }
    
    func unPinCoin() {
        //
    }
    
    func compareTapped(coinCompare: Coin) {
        //
    }
    
    func goToCoinDetail(coinToGo: Coin) {
        let eventOptionsVC =  CoinDetailsViewController()
        eventOptionsVC.coin = coinToGo
        self.navigationController?.pushViewController(eventOptionsVC, animated: true) 
    }
}

//MARK: HOME FEED COINS CELL DELEGATE

extension HomeFeedViewController: HomeFeedCoinsTableViewCellDelegate {
    func didTapOnCoin(coinTapped: Coin) {
        lightImpactGenerator()
        let eventOptionsVC =  CoinOptionsViewController()
        eventOptionsVC.isFromHome = true
        eventOptionsVC.coin = coinTapped
        do {
            let usercoins = try Disk.retrieve("usercoins", from: .caches, as: [Coin].self)
            eventOptionsVC.inWatchlist = usercoins.contains(coinTapped)
        } catch {
            
        }
        eventOptionsVC.delegate = self
        
        eventOptionsVC.blockChainLabel.text = coinTapped.name
        if let coinSymbol = coinTapped.symbol {
            eventOptionsVC.coinImageView.image = UIImage(named: "\(coinSymbol)")
            eventOptionsVC.coinLabel.text = coinSymbol
        }
        
        eventOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(eventOptionsVC, animated: false, completion: nil)
    }
}
