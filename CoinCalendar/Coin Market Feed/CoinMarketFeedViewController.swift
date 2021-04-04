//
//  CoinMarketFeedViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/3/21.
//

import UIKit
import Segmentio

class CoinMarketFeedViewController: UIViewController {
    
    //Nav
    var navView = UIView()
    var notchOffset: CGFloat = 44
    var segmentContainer = UIView()
    var segmentioControl: Segmentio!
    
    var userProfileImageContainer = UIView()
    var userProfileImageView = UIImageView()
    var userGreetingLabel = UILabel()
    var userNameLabel = UILabel()
    var profileButton = UIButton()
    var calendarImageView = UIImageView()
    var sortImageView = UIImageView()
    var sortButton = UIButton()
    
    var mainFeedContainer = UIView()
    var mainFeedTableView = UITableView()
    var coinMarketFeedTableViewCell = "coinMarketFeedTableViewCell"
    
    var coinContainer = UIView()
    var coinLabel = UILabel()
    
    var coinHealthContainer = UIView()
    var coinHealthLabel = UILabel()
    
    var priceScoreContainer = UIView()
    var priceScoreLabel = UILabel()
    
    var volatilityContainer = UIView()
    var volatilityLabel = UILabel()
    
    var coinRankContainer = UIView()
    var coinRankLabel = UILabel()
    
    var coinIconFeedContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        //Call Views
        setupNav()
        //setupCoinTable()
        setupTableView()
        
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 2)
    }
        
    @objc func appMovedToForeround() {
        //hideTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        //hideTabBar()
    }
}

//MARK: ACTIONS

extension CoinMarketFeedViewController {
    
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
