//
//  WatchlistViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/21/21.
//

import UIKit
import Disk

class WatchlistViewController: UIViewController {
    
    var navView = UIView()
    var navHeight: CGFloat = 96
    var notchOffset: CGFloat = 44
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
    var viewedWatchlist = UserDefaults()
    
    var mainFeedTableView = UITableView()
    var watchlistCoinsTableViewCell = "watchlistCoinsTableViewCell"
    var watchlistExpertTableViewCell = "watchlistExpertTableViewCell"
    
//    var myCoins: [[String]] = [["ADA", "Cardano", "$1.40", "+15.75%"], ["BNB", "Binance Coin", "$585.15", "+4.89%"], ["LTC", "Litecoin", "$271.06", "+11.21%"], ["BTC", "Bitcoin", "$56,228.45", "+2.65%"], ["XRP", "XRP", "$1.37", "+10.65%"]]
    var myCoins = [Coin]()
    
//    var expertCoins: [[String]] = [["BTC", "Bitcoin", "$18,450.19", "$57,857.11", "2.24%", "30"], ["TFUEL", "Theta Fuel", "$0.012", "$0.309", "9.53%", "15"], ["ADA", "Cardano", "$1.40", "$1.35", "10.24%", "20"], ["UNI", "Uniswap", "$26.98", "$32.10", "7.49%", "10"], ["ENJ", "Enjin Coin", "$1.42", "$2.60", "17.56%", "15"]]
    
    var traders = [AdminCoin]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        
        //Call Views
        modifyConstraints()
        setupNav()
        setupTableView()
        //setupLoadingIndicator()
                
        //perform(#selector(animateCells), with: self, afterDelay: 0.25)
        
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 4)
        if viewedWatchlist.bool(forKey: "viewedWatchlist") {
            print("not first time here")
        } else {
            print("first time here")
            viewedWatchlist.set(true, forKey: "viewedWatchlist")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .darkContent
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        showTabBar()
        
        loadCoinWatchlist()
        loadExpertWatchlist()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
    
    func loadCoinWatchlist() {
        API.sharedInstance.getCoins(coins: User.current.watchlist ?? [], completionHandler: { (success, coins, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let coins = coins else {
                print("error getting coins")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.myCoins = coins
                self?.mainFeedTableView.reloadData()
            }
        })
    }
    
    func loadExpertWatchlist() {
        API.sharedInstance.getAdminCoins(completionHandler: { (success, traders, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let traders = traders else {
                print("error getting traders")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.traders = traders
                self?.mainFeedTableView.reloadData()
            }
        })
    }

}

//MARK: ACTIONS

extension WatchlistViewController {
    @objc func goToProfile() {
        lightImpactGenerator()
        let VC1 = MyProfileViewController()
        let navController = UINavigationController(rootViewController: VC1)
        navController.modalPresentationStyle = .overFullScreen
        self.present(navController, animated: false, completion: nil)
    }
}
