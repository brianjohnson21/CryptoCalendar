//
//  EventFeedViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit
import Segmentio
import Lottie
import ViewAnimator

class EventFeedViewController: UIViewController {
    
    let launchTransition = LaunchTransitionView()
    var transitionView = UIView()
    var loadingContainer = UIView()
    var loadingLottie = AnimationView()
    
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
    var bellImageView = UIImageView()
    
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
        setupLoadingIndicator()
        
//        if fromSignUp.bool(forKey: "comingFromSignUp") {
//            print("is from sign up")
//            setupLaunchTransition()
//            launchTransition.instaMallLogo.isHidden = true
//            launchTransition.topHalf.backgroundColor = .themePurple
//            launchTransition.bottomHalf.backgroundColor = .themePurple
//            fromSignUp.set(false, forKey: "comingFromSignUp")
//        } else {
//            setupLaunchTransition()
//            print("is not from sign up")
//        }
        
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 1)
        
        //doTransitionViewThing()
        
        perform(#selector(animateCells), with: self, afterDelay: 0.25)
        //perform(#selector(showSubscriptionVC), with: self, afterDelay: 2.0)
        
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
    
    @objc func animateCells() {
        mainFeedTableView.alpha = 1.0
        let fromAnimation = AnimationType.vector(CGVector(dx: 0, dy: 100))
        let zoomAnimation = AnimationType.zoom(scale: 1.0)
        UIView.animate(views: mainFeedTableView.visibleCells,
                       animations: [zoomAnimation, fromAnimation],
                       initialAlpha: 0, finalAlpha: 1.0, duration: 0.5)
        //finishedLoading = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
}

//MARK: ACTIONS

extension EventFeedViewController {
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
        sortFilterVC.delegate = self
        sortFilterVC.modalPresentationStyle = .overFullScreen
        self.present(sortFilterVC, animated: false) {
            //
        }
        
//        let sortFilterVC = PickCryptoViewController()
//        sortFilterVC.modalPresentationStyle = .overFullScreen
//        self.present(sortFilterVC, animated: false) {
//            //
//        }
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

extension EventFeedViewController: LaunchTransitionViewDelegate {
    func didFinishLaunchAnimation() {
        //Did finish
    }
}

//MARK: LAUNCH DELEGATE

extension EventFeedViewController: SortFilterViewControllerDelegate {
    func didUpdateFilter() {
        mainFeedTableView.alpha = 0
        loadingLottie.play()
        loadingContainer.alpha = 1.0
        loadingContainer.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 2.0, options: []) {
            self.loadingContainer.alpha = 0
        } completion: { (success) in
            self.loadingContainer.isHidden = true
            self.loadingLottie.stop()
            self.animateCells()
        }

        
    }
}
