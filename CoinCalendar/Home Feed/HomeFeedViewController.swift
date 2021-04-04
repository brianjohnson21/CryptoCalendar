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
    
    var fromSignUp = UserDefaults()
    
    var mainFeedTableView = UITableView()
    var homeFeedCoinsTableViewCell = "homeFeedCoinsTableViewCell"
    var homeFeedCoinOfDayTableViewCell = "homeFeedCoinOfDayTableViewCell"
    
    var sections: [String] = ["Biggest Gainers (24h)", "", "Bullish Sentiment", "Trending on Social (24h)", "Healthiest Coins (24h)"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        setupNav()
        setupTableView()
        
        if fromSignUp.bool(forKey: "comingFromSignUp") {
            print("is from sign up")
            setupLaunchTransition()
            launchTransition.instaMallLogo.isHidden = true
            launchTransition.topHalf.backgroundColor = .themePurple
            launchTransition.bottomHalf.backgroundColor = .themePurple
            fromSignUp.set(false, forKey: "comingFromSignUp")
        } else {
            setupLaunchTransition()
            print("is not from sign up")
        }
        
        doTransitionViewThing()
        
        //self.tabBarController?.addDotAtTabBarItemIndex(index: 0, radius: 4, color : .red)
        self.tabBarController?.addDotAtTabBarItemIndex(index: 1, radius: 4, color : .red)
        self.tabBarController?.addDotAtTabBarItemIndex(index: 2, radius: 4, color : .red)
        self.tabBarController?.addDotAtTabBarItemIndex(index: 3, radius: 4, color : .red)
        self.tabBarController?.addDotAtTabBarItemIndex(index: 4, radius: 4, color : .red)
        
        
        //self.tabBarController?.tabBarItem.badgeValue = "●"
        //self.tabBarController?.tabBarItem.badgeColor = .clear
        //self.tabBarController?.tabBarItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor.rawValue: .red], for: .normal)
        //self.tabBarController?.tabBarItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor.rawValue: .red], for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
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
}

//MARK: LAUNCH DELEGATE

extension HomeFeedViewController: LaunchTransitionViewDelegate {
    func didFinishLaunchAnimation() {
        //Did finish
    }
}
