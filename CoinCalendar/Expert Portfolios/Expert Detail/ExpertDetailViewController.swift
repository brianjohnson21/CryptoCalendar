//
//  ExpertDetailViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import UIKit

protocol ExpertDetailViewControllerDelegate: class {
    func updatedTrader(trader: Admin)
}

class ExpertDetailViewController: UIViewController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    var navView = UIView()
    var notchOffset: CGFloat = 44
    var dismissImageView = UIImageView()
    var dismissButton = UIButton()
    var expertImageView = UIImageView()
    var expertHeight: NSLayoutConstraint!
    var expertTop: NSLayoutConstraint!
    var userNameLabel = UILabel()
    var followUnfollow = FollowUnfollowView()
    var followUnfollowButton = UIButton()
    
    var mainFeedTableView = UITableView()
    var expertBioTableViewCell = "expertBioTableViewCell"
    var expertsCurrentCoinsTableViewCell = "expertsCurrentCoinsTableViewCell"
    var expertWatchlistTableViewCell = "expertWatchlistTableViewCell"
    var expertPostTableViewCell = "expertPostTableViewCell"
    var whiteGradient = UIImageView()
    
    var showingName = false
    
    //var watchListCoins: [[String]] = [["COMP", "Compound", "$500.50"], ["ETH", "Ethereum", "$2,200.00"]]
    
    var admin: Admin?
    
    var portfolios = [Portfolio]()
    var watchlistCoins = [Coin]()
    var posts = [Post]()
    
    weak var delegate: ExpertDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.view.layer.masksToBounds = true
        
        setupNav()
        setupTableView()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideTabBar()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        
        getPortfolios()
        getWatchlist()
        getPosts()
    }

    @objc func appMovedToForeround() {
        hideTabBar()
    }
    
    func getPortfolios() {
        guard let admin = self.admin else { return }
        API.sharedInstance.getPortfolios(admin: admin) { (success, portfolios, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let portfolios = portfolios else {
                print("error getting trader portfolios")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.portfolios = portfolios
                self?.mainFeedTableView.reloadData()
            }
        }
    }
    
    func getWatchlist() {
        guard let admin = self.admin else { return }
        API.sharedInstance.getAdminWatchlist(admin: admin) { (success, coins, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let coins = coins else {
                print("error getting trader watchlist")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.watchlistCoins = coins
                self?.mainFeedTableView.reloadData()
            }
        }
    }
    
    func getPosts() {
        guard let admin = self.admin else { return }
        API.sharedInstance.getAdminPosts(admin: admin) { (success, posts, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let posts = posts else {
                print("error getting trader posts")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.posts = posts
                self?.mainFeedTableView.reloadData()
            }
        }
    }

}

//MARK: ACTIONS

extension ExpertDetailViewController {
    @objc func followTapped() {
        guard var admin = self.admin else { return }
        if !admin.areSubscribed {
            self.admin?.areSubscribed = true
            admin.areSubscribed = true
            self.delegate?.updatedTrader(trader: admin)
            followUnfollow.followUser()
            API.sharedInstance.subscribeToAdmin(admin: admin) { (success, _, error) in
                guard error == nil else {
                    print(error!)
                    return
                }
                
                guard success else {
                    print("error subscribing to trader")
                    return
                }
            }
        } else {
            self.admin?.areSubscribed = false
            admin.areSubscribed = false
            self.delegate?.updatedTrader(trader: admin)
            followUnfollow.unFollowUser()
            API.sharedInstance.unsubscribeFromAdmin(admin: admin) { (success, _, error) in
                guard error == nil else {
                    print(error!)
                    return
                }
                
                guard success else {
                    print("error subscribing to trader")
                    return
                }
            }
        }
    }
    
    @objc func popVC() {
        lightImpactGenerator()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func showUserName() {
        UIView.animate(withDuration: 0.35) {
            self.userNameLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.userNameLabel.alpha = 1.0
        }
        showingName = true
    }
    
    @objc func hideUserName() {
        UIView.animate(withDuration: 0.35) {
            self.userNameLabel.transform = CGAffineTransform(translationX: 0, y: -50)
            self.userNameLabel.alpha = 0
        }
        showingName = false
    }
    
    @objc func didTapIG() {
        
        let screenName = "so.mexican"
        let appURL = URL(string: "instagram://user?username=\(screenName)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL)
        {
            application.open(appURL)
        }
        else
        {
            let webURL = URL(string: "https://instagram.com/\(screenName)")!
            application.open(webURL)
        }
    }
    
    @objc func didTapTwitter() {
        let screenName =  "NJMINISTRIESINC"
        let appURL = URL(string: "twitter://user?screen_name=\(screenName)")!
        let webURL = URL(string: "https://twitter.com/\(screenName)")!
        
        if UIApplication.shared.canOpenURL(appURL as URL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL)
            } else {
                UIApplication.shared.openURL(appURL)
            }
            } else {
                //redirect to safari because the user doesn't have Instagram
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(webURL)
                } else {
                    UIApplication.shared.openURL(webURL)
                }
            }
    }
}


//MARK: SCROLLVIEW DELEGATE

extension ExpertDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yAxis = scrollView.contentOffset.y// + notchOffset
        if yAxis <= 323 {
            let navShadow: Float = Float((0.3 * yAxis) / 323)
            navView.layer.shadowOpacity = navShadow
            
            let navAlpha: Float = Float((yAxis) / 323)
            navView.alpha = CGFloat(navAlpha)
            dismissImageView.alpha = CGFloat(navAlpha)
            
            if showingName {
                hideUserName()
            }
        } else {
            navView.layer.shadowOpacity = 0.3
            navView.alpha = 1.0
            dismissImageView.alpha = 1.0
            
        }
        
        if yAxis <= 372 {
            if showingName {
                hideUserName()
            }
        } else {
            if !showingName {
                showUserName()
            }
        }
        
        if yAxis > 0 {
            expertTop.constant = -yAxis
            expertHeight.constant = 428
        } else {
            expertTop.constant = 0
            expertHeight.constant = 428 + -yAxis
        }
        
    }
}

//MARK: CURRENT COIN DELEGATE

extension ExpertDetailViewController: ExpertsCurrentCoinsTableViewCellDelegate {
    func currentCoinsIno() {
        lightImpactGenerator()
        let subVC = InfoViewController()
        subVC.isLivePortfolio = true
        subVC.modalPresentationStyle = .overFullScreen
        self.present(subVC, animated: false, completion: nil)
    }
    
    @objc func didTapWatchlistInfo() {
        lightImpactGenerator()
        let subVC = InfoViewController()
        subVC.isLivePortfolio = false
        subVC.isWatchlist = true
        subVC.modalPresentationStyle = .overFullScreen
        self.present(subVC, animated: false, completion: nil)
    }
}
