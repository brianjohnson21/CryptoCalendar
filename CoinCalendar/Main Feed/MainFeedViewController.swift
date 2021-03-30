//
//  MainFeedViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit
import Segmentio

class MainFeedViewController: UIViewController {
    
    let launchTransition = LaunchTransitionView()
    var transitionView = UIView()
    
    //Nav
    var navView = UIView()
    var notchOffset: CGFloat = 44
    var segmentContainer = UIView()
    var segmentioControl: Segmentio!
    
    var userProfileImageContainer = UIView()
    var userProfileImageView = UIImageView()
    var userGreetingLabel = UILabel()
    var userNameLabel = UILabel()
    var calendarImageView = UIImageView()
    var sortImageView = UIImageView()
    var sortButton = UIButton()
    
    var mainFeedTableView = UITableView()
    var mainFeedCardTableViewCell = "mainFeedCardTableViewCell"
    
    var fromSignUp = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        //Call Views
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
        
        perform(#selector(showSubscriptionVC), with: self, afterDelay: 2.0)
        
    }
    
    @objc func appMovedToForeround() {
        hideTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        hideTabBar()
    }
    
}

//MARK: ACTIONS

extension MainFeedViewController {
    @objc func doTransitionViewThing() {        
        self.launchTransition.animateViewsAway()
    }
    
    @objc func showSubscriptionVC() {
        let subVC = SubscriptionViewController()
        subVC.modalPresentationStyle = .overFullScreen
        self.present(subVC, animated: true, completion: nil)
    }
    
    @objc func didTapSortFilter() {
        lightImpactGenerator()
        let sortFilterVC = SortFilterViewController()
        sortFilterVC.modalPresentationStyle = .overFullScreen
        self.present(sortFilterVC, animated: false) {
            //
        }
    }
}

//MARK: LAUNCH DELEGATE

extension MainFeedViewController: LaunchTransitionViewDelegate {
    func didFinishLaunchAnimation() {
        //Did finish
    }
}
