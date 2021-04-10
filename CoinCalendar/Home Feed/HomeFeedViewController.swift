//
//  HomeFeedViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/1/21.
//

import UIKit
import Lottie
import SuperBadges

class HomeFeedViewController: UIViewController {
    
    let launchTransition = LaunchTransitionView()
    var transitionView = UIView()
    
    //Nav
    var navView = UIView()
    var notchOffset: CGFloat = 44
    
    var userProfileImageContainer = UIView()
    var userProfileImageView = UIImageView()
    var userGreetingLabel = UILabel()
    var userNameLabel = UILabel()
    var profileButton = UIButton()
    var calendarImageView = UIImageView()
    var sortImageView = UIImageView()
    var sortButton = UIButton()
    
    var fromSignUp = UserDefaults()
    
    var mainFeedTableView = UITableView()
    var homeFeedCoinsTableViewCell = "homeFeedCoinsTableViewCell"
    var homeFeedCoinOfDayTableViewCell = "homeFeedCoinOfDayTableViewCell"
    
    var sections: [String] = ["Biggest Gainers (24h)", "", "Bullish Sentiment", "Trending on Social (24h)", "Healthiest Coins (24h)"]
    
    var coin: Coin?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight//UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
        
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
        
        //self.tabBarController?.addDotAtTabBarItemIndex(index: 0, radius: 4, color : .red)
        self.tabBarController?.addDotAtTabBarItemIndex(index: 1, radius: 4, color : .red)
        self.tabBarController?.addDotAtTabBarItemIndex(index: 2, radius: 4, color : .red)
        self.tabBarController?.addDotAtTabBarItemIndex(index: 3, radius: 4, color : .red)
        self.tabBarController?.addDotAtTabBarItemIndex(index: 4, radius: 4, color : .red)
        
        
        //self.tabBarController?.tabBarItem.badgeValue = "●"
        //self.tabBarController?.tabBarItem.badgeColor = .clear
        //self.tabBarController?.tabBarItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor.rawValue: .red], for: .normal)
        //self.tabBarController?.tabBarItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor.rawValue: .red], for: .normal)
        
        //perform(#selector(showSubscriptionVC), with: self, afterDelay: 2.0)
        
        getCoinOfDay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
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
        let subVC = SubscriptionViewController()
        subVC.modalPresentationStyle = .overFullScreen
        self.present(subVC, animated: true, completion: nil)
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
}

//MARK: LAUNCH DELEGATE

extension HomeFeedViewController: LaunchTransitionViewDelegate {
    func didFinishLaunchAnimation() {
        //Did finish
        //perform(#selector(showSubscriptionVC), with: self, afterDelay: 1.0)
        //perform(#selector(showWelcome), with: self, afterDelay: 1.0)
    }
}
