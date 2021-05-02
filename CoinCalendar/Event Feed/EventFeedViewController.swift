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
    
    var allEventsEmptyState = EmptyStateView()
    var watchListEmptyState = EmptyStateView()
    var newEventsEmptyState = EmptyStateView()
    var importantEmptyState = EmptyStateView()
    
    let launchTransition = LaunchTransitionView()
    var transitionView = UIView()
    var loadingContainer = UIView()
    var loadingLottie = AnimationView()
    
    //Nav
    var navView = UIView()
    var navHeight: CGFloat = 136
    var notchOffset: CGFloat = 44
    var segmentContainer = UIView()
    var segmentioControl: Segmentio!
    var titleLabel = UILabel()
    
    var userProfileImageContainer = UIView()
    var userProfileImageView = UIImageView()
    var userGreetingLabel = UILabel()
    var userNameLabel = UILabel()
    var profileButton = UIButton()
    var calendarImageView = UIImageView()
    var sortImageView = UIImageView()
    var sortButton = UIButton()
    var bellImageView = UIImageView()
    var infoImageView = UIImageView()
    var infoButton = UIButton()
    var alertsButton = UIButton()
    
    var mainFeedTableView = UITableView()
    var mainFeedCardTableViewCell = "mainFeedCardTableViewCell"
    
    var fromSignUp = UserDefaults()
    
    var posts = [Post]()
    var importantPosts = [Post]()
    var newPosts = [Post]()
    var watchlistPosts: [Post] {
        return User.current.watchlistPosts
    }
    
    var selectedSourceLink: String = "http://www.apple.com"
    
    var selectedPost: Post?
    var filteredCoins = [String]()
    
    var showAllList = true
    var showImportantList = true
    var showWatchList = true
    var showNewlist = true
    var selectedSegment: Int = 0
    
    var isInitialLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        //Call Views
        modifyConstraints()
        setupNav()
        setupTableView()
        setupLoadingIndicator()
        setupEmptyState()
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 3)
                
        //perform(#selector(animateCells), with: self, afterDelay: 0.25)
        
    }
    
    @objc func appMovedToForeround() {
        //hideTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .darkContent
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        showTabBar()
        
        getPosts()
    }
    
    @objc func animateCells() {
        mainFeedTableView.alpha = 1.0
        let fromAnimation = AnimationType.vector(CGVector(dx: 0, dy: 100))
        let zoomAnimation = AnimationType.zoom(scale: 1.0)
        UIView.animate(views: mainFeedTableView.visibleCells,
                       animations: [zoomAnimation, fromAnimation],
                       initialAlpha: 0, finalAlpha: 1.0, duration: 0.5)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    func getPosts() {
        API.sharedInstance.getPosts { (success, posts, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let posts = posts else {
                print("error getting posts")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.posts = posts
                self?.importantPosts = posts.filter({$0.isImportant ?? false})
                self?.newPosts = posts.filter({($0.postDate ?? Date()) > Date().addingTimeInterval(-86400)})
                self?.mainFeedTableView.reloadData()
                //self?.perform(#selector(self?.animateCells), with: self, afterDelay: 0.25)
                if self?.isInitialLoad == true {
                    self?.perform(#selector(self?.hideLoader), with: self, afterDelay: 0.1)
                    self?.isInitialLoad = false
                }
            }
        }
    }
    
}

//MARK: ACTIONS

extension EventFeedViewController {
    @objc func hideLoader() {
        UIView.animateKeyframes(withDuration: 0.35, delay: 0.2, options: []) {
            self.loadingContainer.alpha = 0
        } completion: { (success) in
            self.loadingLottie.stop()
            self.loadingContainer.isHidden = true
            self.perform(#selector(self.animateCells), with: self, afterDelay: 0.25)
        }
    }
    
    @objc func goToAlerts() {
        lightImpactGenerator()
        let sortFilterVC = MyAlertsViewController()
        self.navigationController?.pushViewController(sortFilterVC, animated: true)
    }
    
    @objc func showMoreInfo() {
        lightImpactGenerator()
        let subVC = EventFeedInfoViewController()
        subVC.modalPresentationStyle = .overFullScreen
        self.present(subVC, animated: false, completion: nil)
    }
    
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
        sortFilterVC.coinsSelected = filteredCoins
        sortFilterVC.originalCoins = filteredCoins
        sortFilterVC.originalAmount = filteredCoins.count
        sortFilterVC.delegate = self
        sortFilterVC.modalPresentationStyle = .overFullScreen
        self.present(sortFilterVC, animated: false) {
            //
        }
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
    func didUpdateFilter(coins: [String]) {
        self.filteredCoins = coins
        //newEventsEmptyState.alpha = 0
        //watchListEmptyState.alpha = 0
        allEventsEmptyState.hidViews()
        newEventsEmptyState.hidViews()
        newEventsEmptyState.hidViews()
        watchListEmptyState.hidViews()
        mainFeedTableView.alpha = 0
        loadingLottie.play()
        loadingContainer.alpha = 1.0
        loadingContainer.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 2.0, options: []) {
            self.loadingContainer.alpha = 0
        } completion: { (success) in
            self.loadingContainer.isHidden = true
            self.loadingLottie.stop()
            self.mainFeedTableView.reloadData()
            self.animateCells()
            
            //showAllList
            if self.showAllList && self.selectedSegment == 0 {
                self.allEventsEmptyState.showViews()
            }
            
            if self.showImportantList && self.selectedSegment == 1 {
                self.watchListEmptyState.showViews()
            }
            
            if self.showNewlist && self.selectedSegment == 2 {
                self.newEventsEmptyState.showViews()
            }
            
            if self.showWatchList && self.selectedSegment == 3 {
                self.watchListEmptyState.showViews()
            }
            
        }

        
    }
}

extension EventFeedViewController: EventOptionsViewControllerDelegate {
    func removeFromWatchlist() {
        //Dylan, remove post from watch list here
        //self.selectedPost remove this bish
        print("did this remove")
    }
    
    func didTapViewSource() {
        let eventSourceVC = EventSourceWebViewController()
        if let resource = selectedPost?.resourceLink {
            eventSourceVC.urlString = resource
            //print("\(resource) - 🎯🎯🎯")
        }
        self.present(eventSourceVC, animated: true) {
            //
        }
    }
    
    func addToWatchlistClicked() {
        guard let post = self.selectedPost else { return }
        User.addPostToWatchlist(post: post)
    }
    
    func setAlertClicked(date: Date) {
        
    }
    
    
}

