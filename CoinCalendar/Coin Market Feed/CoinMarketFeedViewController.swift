//
//  CoinMarketFeedViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/3/21.
//

import UIKit
import Segmentio
import Lottie

class CoinMarketFeedViewController: UIViewController {
    
    var loadingContainer = UIView()
    var loadingLottie = AnimationView()
    
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
    var titleLabel = UILabel()
    
    var mainFeedContainer = UIScrollView()
    var dataHeadersScrollView = UIScrollView()
    var mainFeedTableView = UITableView()
    var coinMarketFeedTableViewCell = "coinMarketFeedTableViewCell"
    
    var coinContainer = FilterOptionView()
    var coinHealthContainer = FilterOptionView()
    var priceScoreContainer = FilterOptionView()
    var volatilityContainer = FilterOptionView()
    var coinRankContainer = FilterOptionView()
    
    var marketCapContainer = FilterOptionView()
    var percentChangeContainer = FilterOptionView()
    var volumeContainer = FilterOptionView()
        
    var coinIconFeedContainer = UIView()
    var coinIconFeedTableView = UITableView()
    var coinIconFeedTableViewCell = "coinIconFeedTableViewCell"
    
    var blueGradient = UIImageView()
    var whiteGradient = UIImageView()
    
    var coins = [Coin]()
    var pinnedCoins = [Coin]()
    var comparedCoins = [Coin]()
    
    var pinContainer = UIView()
    var pinHeight: NSLayoutConstraint!
    var pinScrollView = UIScrollView()
    var collectionDivider = UIView()
    var globalContactListCollectionViewFlowLayout = UICollectionViewFlowLayout()
    var globalContactListCollectionView: UICollectionView!
    var pinnedCoinCollectionViewCell = "pinnedCoinCollectionViewCell"
    
    var pinnedCoinImageView = UIImageView()
    var pinnedCoinHealthContainer = UIView()
    var pinnedCoinRankContainer = UIView()
    var pinnedVolatilityContainer = UIView()
    var pinnedVolatilityGraphImageView = UIImageView()
    var pinnedPriceContainer = UIView()
    
    var firstPinnedCoinView = PinnedCoinView()
    
    var compareContainer = CompareCoinsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        //Call Views
        setupNav()
        setupCoinTable()
        setupTableView()
        setupPinScrollView()
        //setupPinCollectionView()
        setupCompareContainer()
        setupLoadingIndicator()
        
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 2)
        
        getCoins()
        
        //let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        //self.mainFeedTableView.addGestureRecognizer(longPressRecognizer)
    }
        
    @objc func appMovedToForeround() {
        showTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .darkContent
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        showTabBar()
        //hideTabBar()
        //setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    func getCoins() {
        API.sharedInstance.getCoins { (success, coins, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let coins = coins else {
                print("error getting coins")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.coins = coins
                self?.mainFeedTableView.reloadData()
                //self?.globalContactListCollectionView.reloadData()
                self?.coinIconFeedTableView.reloadData()
                self?.perform(#selector(self?.hideLoader), with: self, afterDelay: 0.1)
            }
        }
    }
}



//MARK: ACTIONS

extension CoinMarketFeedViewController {
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            let touchPoint = longPressGestureRecognizer.location(in: mainFeedTableView)
            if let indexPath = mainFeedTableView.indexPathForRow(at: touchPoint) {
                heavyImpactGenerator()
                //print("\(indexPath.row) - 🤑🤑🤑")
                
                let eventOptionsVC =  CoinOptionsViewController()
                eventOptionsVC.delegate = self
                
                eventOptionsVC.coin = coins[indexPath.row]
                
                let coin = coins[indexPath.row]
                if let coinPrice = coin.price {
                    eventOptionsVC.coinPrice = "$\(coinPrice.rounded(toPlaces: 2))"
                }
                
                if let coinName = coin.name {
                    eventOptionsVC.coinName = coinName
                }
                
                if let coinSymbol = coin.symbol {
                    eventOptionsVC.coinSymbol = coinSymbol
                }
                        
                eventOptionsVC.modalPresentationStyle = .overFullScreen
                self.present(eventOptionsVC, animated: false, completion: nil)
            }
        }
    }
    
    @objc func hideCompareCoin() {
        lightImpactGenerator()
        UIView.animate(withDuration: 0.35) {
            self.compareContainer.transform = CGAffineTransform(translationX: 0, y: 100)
        } completion: { (success) in
            self.comparedCoins.removeAll()
        }

    }
    
    @objc func goToAlerts() {
        lightImpactGenerator()
        let sortFilterVC = MyAlertsViewController()
        self.navigationController?.pushViewController(sortFilterVC, animated: true)
    }
    
    @objc func hideLoader() {
        UIView.animateKeyframes(withDuration: 0.35, delay: 0.2, options: []) {
            self.loadingContainer.alpha = 0
        } completion: { (success) in
            self.loadingLottie.stop()
            self.loadingContainer.isHidden = true
        }
    }
    
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
    
    @objc func didSelectCoinHeahlth(sender: UIButton) {
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
    }
    
    @objc func removePinnedCoin() {
        lightImpactGenerator()
        let eventOptionsVC =  CoinOptionsViewController()
        eventOptionsVC.delegate = self
        eventOptionsVC.isPinnedCoin = true
        eventOptionsVC.coin = pinnedCoins[0]
        let coin = pinnedCoins[0]//coins[indexPath.row]
        if let coinPrice = coin.price {
            eventOptionsVC.coinPrice = "$\(coinPrice.rounded(toPlaces: 2))"
        }
        
        if let coinName = coin.name {
            eventOptionsVC.coinName = coinName
        }
        
        if let coinSymbol = coin.symbol {
            eventOptionsVC.coinSymbol = coinSymbol
        }
                
        eventOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(eventOptionsVC, animated: false, completion: nil)
        
    }
    
    func suffixNumber(number:Double) -> String {

        var num:Double = number//.doubleValue;
        let sign = ((num < 0) ? "-" : "" );

        num = fabs(num);

        if (num < 1000.0){
            return "\(sign)\(num)"// as NSString;
        }

        let exp:Int = Int(log10(num) / 3.0 ); //log10(1000));

        let units:[String] = ["K ","M ","B ","T ","P ","E ®"];

        let roundedNum:Double = round(10 * num / pow(1000.0,Double(exp))) / 10;

        return "\(sign)\(roundedNum)\(units[exp-1])"
    }
    
}

//MARK: SCROLLVIEW DELEGATE

extension CoinMarketFeedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                
        //mainFeedContainer.tag = 0
        if scrollView.tag == 0 {
            let xOffset = scrollView.contentOffset.x
            dataHeadersScrollView.contentOffset.x = xOffset
            firstPinnedCoinView.pinScrollView.contentOffset.x = xOffset
        }
        
        //coinIconFeedTableView.tag = 1
        if scrollView.tag == 1 {
            let yOffset = scrollView.contentOffset.y
            mainFeedTableView.contentOffset.y = yOffset
        }
        
        //mainFeedTableView.tag = 2
        if scrollView.tag == 2 {
            let yOffset = scrollView.contentOffset.y
            coinIconFeedTableView.contentOffset.y = yOffset
        }
        
        //dataHeadersScrollView.tag = 3
        if scrollView.tag == 3 {
            let xOffset = scrollView.contentOffset.x
            mainFeedContainer.contentOffset.x = xOffset
            firstPinnedCoinView.pinScrollView.contentOffset.x = xOffset
        }
        
        //Pinned ScrollView
        if scrollView.tag == 4 {
            let xOffset = scrollView.contentOffset.x
            mainFeedContainer.contentOffset.x = xOffset
            dataHeadersScrollView.contentOffset.x = xOffset
        }
        
    }
}

//MARK: COIN OPTIONS DELEGATE

extension CoinMarketFeedViewController: CoinOptionsViewControllerDelegate {
    func goToCoinDetail(coinToGo: Coin) {
        let eventOptionsVC =  CoinDetailsViewController()
        eventOptionsVC.coin = coinToGo
        self.navigationController?.pushViewController(eventOptionsVC, animated: true)        
    }
    
    func compareTapped(coinCompare: Coin) {
        comparedCoins.append(coinCompare)
        compareContainer.isHidden = false
        
        if comparedCoins.count > 1 {
            if let coinSymbol = coinCompare.symbol {
                compareContainer.coinTwoImageView.image = UIImage(named: coinSymbol)
                compareContainer.coinTwoShortNameLabel.text = coinSymbol
                perform(#selector(presentCompareVC), with: self, afterDelay: 0.75)
            }
        } else {
            if let coinSymbol = coinCompare.symbol {
                compareContainer.coinOneImageView.image = UIImage(named: coinSymbol)
                compareContainer.coinOneShortNameLabel.text = coinSymbol
            }
            
//            UIView.animate(withDuration: 0.35) {
//                self.compareContainer.transform = CGAffineTransform(translationX: 0, y: 0)
//            }
            UIView.animate(withDuration: 0.35, delay: 0.5, options: []) {
                self.compareContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            } completion: { (success) in
                //
            }

        }
    }
    
    @objc func presentCompareVC() {
        let compareVC = CompareCoinsViewController()
        compareVC.comparedCoins = comparedCoins
        compareVC.modalPresentationStyle = .overFullScreen
        self.present(compareVC, animated: false) {
            self.compareContainer.isHidden = true
            self.compareContainer.transform = CGAffineTransform(translationX: 0, y: 100)
            self.comparedCoins.removeAll()
            self.compareContainer.resetCoins()
        }
    }
    
    func unPinCoin() {
        pinHeight.constant = 0
        UIView.animate(withDuration: 0.35, delay: 0, options: []) {
            self.collectionDivider.alpha = 0
            self.view.layoutIfNeeded()
        } completion: { (success) in
            self.pinnedCoins.removeAll()
        }
    }
    
    func pinCoin(coinPinned: Coin) {
        //print("\(coinPinned) - 😅😅😅")
        pinnedCoins.removeAll()
        pinnedCoins.append(coinPinned)
//        if pinnedCoins.count == 1 {
            pinHeight.constant = 58
//        } else {
//            pinHeight.constant = 58 * 2
//        }
                
        UIView.animate(withDuration: 0.35, delay: 0.75, options: []) {
            self.collectionDivider.alpha = 1.0
            self.view.layoutIfNeeded()
        } completion: { (success) in
            //
        }
        

        if let coinSymbol = pinnedCoins[pinnedCoins.count - 1].symbol {
            firstPinnedCoinView.pinnedCoinImageView.image = UIImage(named: coinSymbol)
        }

        if let coinHealth = pinnedCoins[pinnedCoins.count - 1].healthScore {
            firstPinnedCoinView.createPinnedLabel(label: firstPinnedCoinView.coinHealthLabel, string: "\(coinHealth)", cointainer: firstPinnedCoinView.pinnedCoinHealthContainer)
        }
        
        if let altRank = pinnedCoins[pinnedCoins.count - 1].altRank {
            firstPinnedCoinView.createPinnedLabel(label: firstPinnedCoinView.coinRankLabel, string: "\(altRank)", cointainer: firstPinnedCoinView.pinnedCoinRankContainer)
        }
        
        if let priceScore = pinnedCoins[pinnedCoins.count - 1].priceScore {
            firstPinnedCoinView.createPinnedLabel(label: firstPinnedCoinView.priceScoreLabel, string: "\(priceScore)", cointainer: firstPinnedCoinView.pinnedPriceContainer)
        }
        
        if let volatility = pinnedCoins[pinnedCoins.count - 1].volatility {
            
            if volatility < 0.025 {
                firstPinnedCoinView.pinnedVolatilityGraphImageView.image = UIImage(named: "lowVolatiity")
            } else if volatility < 0.05 {
                firstPinnedCoinView.pinnedVolatilityGraphImageView.image = UIImage(named: "medVolatiity")
            } else if volatility < 0.075 {
                firstPinnedCoinView.pinnedVolatilityGraphImageView.image = UIImage(named: "highVolatiity")
            } else {
                firstPinnedCoinView.pinnedVolatilityGraphImageView.image = UIImage(named: "veryHighVolatiity")
            }
        }
         
        
    }
    
}
