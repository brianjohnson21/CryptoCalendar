//
//  FAQViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 5/2/21.
//

import UIKit

class FAQViewController: UIViewController {
    
    var navView = UIView()
    var navHeight: NSLayoutConstraint!
    var titleLabel = UILabel()
    var backContainer = UIView()
    var backImageView = UIImageView()
    var backButton = UIButton()
    var gamesGamersContainer = UIView()
    var ggCenterY: NSLayoutConstraint!
    var ggLeading: NSLayoutConstraint!
    var gamesLabel = UILabel()
    var gamesLeading: NSLayoutConstraint!
    
    var notchOffset: CGFloat = 44
    var backTop: CGFloat = 60
    var nvHeight: CGFloat = 183
    var nvMinimal: CGFloat = 90
    var collectionTop: CGFloat = 160
    
    var faqTableView = UITableView()
    var faqTableViewCell = "faqTableViewCell"
    var payHistoryHeaderView = "payHistoryHeaderView"
    var questions: [String] = [
        "Is cryptoGainz an exchange?",
        "How many traders can I follow?",
        "How much is the subscription?",
        "How do I get a refund?",
        "Are the trading experts credible?",
        "What happens if I make a trade based on the information given and I lose?",
        "How can I be sure that this information is credible?",
        "How up to date is the information in CryptoGainz?",
        "How often do traders update their portfolio’s?",
        "Can I interact with the traders?"
    ]
    var answers: [String] = [
        "No, CryptoGainz is not a trading exchange. Instead it is a hub for all crypto data, events and expert trading insights.",
        "Once subscribed you will have the opportunity to unlock three expert trader’s portfolios. There you will be able to see their personal crypto trades, the coins they are watching, and more.",
        "We offer multiple subscriptions that have different benefits and prices ranging from $9.99 - $29.99 a month. After the 30 day free trial has ended, you will be charged monthly based on the subscription tier you choose.",
        "Refunds are handled through and by Apple. We do not process or handle refunds.",
        "Yes. Every expert trader on our platform has been carefully vetted. You can see the credentials of each trader within their bio located on their profile page and even browse their social media profiles.",
        "CryptoGainz is not responsible for any trade you choose to partake in or not. We are not giving financial advice nor do we claim to be. You can read more about this in our terms and conditions here.",
        "All sources to the information we gather will be linked",
        "All our data and information is continuously updated everyday by our in-house team.",
        "Our expert traders update their portfolios at a minimum three times a week.",
        "There is no direct interaction with the traders as of now. We are working towards making it possible to interact in a future update."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        modifyConstraints()
        setupViews()
        setupNav()
        
        backButton.addTarget(self, action: #selector(dimissVC), for: .touchUpInside)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @objc func appMovedToForeround() {
        hideTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideTabBar()
        self.navigationController?.isNavigationBarHidden = true
        edgesForExtendedLayout = UIRectEdge.all
        extendedLayoutIncludesOpaqueBars = true
    }
    
}


//MARK: ACTIONS

extension FAQViewController {
    @objc func dimissVC() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: SCROLLVIEW DELEGATE

extension FAQViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yAxis = scrollView.contentOffset.y + notchOffset
        let startLeading: CGFloat = 24
        let endLeading: CGFloat = 50
        let nvHeightMax: CGFloat = 140
        let nvHeightMin: CGFloat = 100
        
        if yAxis <= 60 {
            
            let modifiedDiff = nvHeightMax - (((nvHeightMax - nvHeightMin) * yAxis) / 60)
            navHeight.constant = modifiedDiff
            
            let leadingConstant = (((endLeading - startLeading) * yAxis) / 60) + 24//((26 * yAxis)/60) + 40
            ggLeading.constant = leadingConstant
            
            ggCenterY.constant = 60 - yAxis
            
            let navShadow: Float = Float((0.18 * yAxis) / 60)
            navView.layer.shadowOpacity = navShadow
                                    
        } else {
            navHeight.constant = nvMinimal
            ggCenterY.constant = 0
            ggLeading.constant = endLeading
            navView.layer.shadowOpacity = 0.18
        }
    }
    
    
}
