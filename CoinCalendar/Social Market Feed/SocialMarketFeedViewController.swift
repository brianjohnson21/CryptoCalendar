//
//  SocialMarketFeedViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/3/21.
//

import UIKit
import Segmentio
class SocialMarketFeedViewController: UIViewController {

    //Nav
    var navView = UIView()
    var profileContainer = UIView()
    var notchOffset: CGFloat = 44
    var segmentContainer = UIView()
    var segmentContentContainer = UIView()
    var segmentioControl: Segmentio!
    
    var userProfileImageContainer = UIView()
    var userProfileImageView = UIImageView()
    var userGreetingLabel = UILabel()
    var userNameLabel = UILabel()
    var profileButton = UIButton()
    var calendarImageView = UIImageView()
    var sortImageView = UIImageView()
    var sortButton = UIButton()
    var infoButton = UIButton()
    
    var mainFeedContainer = UIScrollView()
    var dataHeadersScrollView = UIScrollView()
    var mainFeedTableView = UITableView()
    var socialMarketFeedTableViewCell = "socialMarketFeedTableViewCell"
    
    var coinContainer = FilterOptionView()
    var coinLabel = UILabel()
    
    var coinHealthContainer = FilterOptionView()
    var coinHealthLabel = UILabel()
    
    var priceScoreContainer = FilterOptionView()
    var priceScoreLabel = UILabel()
    
    var volatilityContainer = FilterOptionView()
    var volatilityLabel = UILabel()
    
    var coinRankContainer = FilterOptionView()
    var coinRankLabel = UILabel()
    
    var coinIconFeedContainer = UIView()
    var coinIconFeedTableView = UITableView()
    var coinIconFeedTableViewCell = "coinIconFeedTableViewCell"
    
    var blueGradient = UIImageView()
    var whiteGradient = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        //Call Views
        setupNav()
        setupCoinTable()
        setupTableView()
        
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 3)
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
}

//MARK: ACTIONS

extension SocialMarketFeedViewController {
    @objc func showMoreInfo() {
        lightImpactGenerator()
        let subVC = InfoViewController()
        subVC.modalPresentationStyle = .overFullScreen
        self.present(subVC, animated: false, completion: nil)
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
    
    @objc func didSelectCoinHeahlt(sender: UIButton) {
        lightImpactGenerator()
        switch sender.tag {
        case 1:
            coinHealthContainer.didSelectOption()
            priceScoreContainer.desSelectOption()
            volatilityContainer.desSelectOption()
            coinRankContainer.desSelectOption()
        case 2:
            coinHealthContainer.desSelectOption()
            priceScoreContainer.didSelectOption()
            volatilityContainer.desSelectOption()
            coinRankContainer.desSelectOption()
        case 3:
            coinHealthContainer.desSelectOption()
            priceScoreContainer.desSelectOption()
            volatilityContainer.didSelectOption()
            coinRankContainer.desSelectOption()
        default:
            coinHealthContainer.desSelectOption()
            priceScoreContainer.desSelectOption()
            volatilityContainer.desSelectOption()
            coinRankContainer.didSelectOption()
        }
        
        
        //print("did this 🥶🥶🥶")
        
    }
}

//MARK: SCROLLVIEW DELEGATE

extension SocialMarketFeedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                
        if scrollView.tag == 1 {
//            let yOffset = scrollView.contentOffset.y// + 44
//            if yOffset > -44 {
//                scrollView.setContentOffset(CGPoint(x: 0, y: -44), animated: false)
//            }
//            print("\(yOffset) - 🤷‍♂️🤷‍♂️🤷‍♂️")
            
            let xOffset = scrollView.contentOffset.x
            //print("\(xOffset) - 🤢🤢🤢")
            dataHeadersScrollView.contentOffset.x = xOffset
        }
        
        if scrollView.tag == 2 {
            print("Ass")
            let yOffset = scrollView.contentOffset.y
            coinIconFeedTableView.contentOffset.y = yOffset
        }
        
        if scrollView.tag == 4 {
            print("Ass")
            let yOffset = scrollView.contentOffset.y
            mainFeedTableView.contentOffset.y = yOffset
        }
        
        if scrollView.tag == 3 {
            let xOffset = scrollView.contentOffset.x
            print("\(xOffset) - 😇😇😇")
            mainFeedContainer.contentOffset.x = xOffset
        }
        
    }
}
