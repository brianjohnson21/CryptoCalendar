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
    
    var selectedPost: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        //Call Views
        setupNav()
        setupTableView()
        setupLoadingIndicator()
        
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 1)
                
        perform(#selector(animateCells), with: self, afterDelay: 0.25)
        
    }
    
    @objc func appMovedToForeround() {
        //hideTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
            }
        }
    }
    
}

//MARK: ACTIONS

extension EventFeedViewController {
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

extension EventFeedViewController: EventOptionsViewControllerDelegate {
    func addToWatchlistClicked() {
        guard let post = self.selectedPost else { return }
        User.addPostToWatchlist(post: post)
    }
    
    func setAlertClicked(date: Date) {
        
    }
    
    
}
