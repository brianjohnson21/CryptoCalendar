//
//  MyAlertsViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import UIKit

class MyAlertsViewController: UIViewController {

    var mainScrollView = UIScrollView()
    var scrollSize: CGFloat = 1.6
    var backContainer = UIView()
    var backImageView = UIImageView()
    var backButton = UIButton()
    var navView = UIView()
    var navHeight: NSLayoutConstraint!
    var editTitleLabel = UILabel()
    var titleLeading: NSLayoutConstraint!
    var gradientView = UIImageView()
    var gamesGamersContainer = UIView()
    var gamesLabel = UILabel()
    var gamesLeading: NSLayoutConstraint!
    var ggCenterY: NSLayoutConstraint!
    var ggLeading: NSLayoutConstraint!
    
    var yCGPoint: CGFloat = 153
    var notchOffset: CGFloat = 44
    var backTop: CGFloat = 60
    var nvHeight: CGFloat = 183
    var finalHeight: CGFloat = 107
    var nameOffset: CGFloat = 153//285
    var scrollOffset: CGFloat = 467
    var endOffset: CGFloat = 477
    var discordOffset: CGFloat = 491
    var navHght: CGFloat = 183
    var piDimensions: CGFloat = 92
    var photoContainerHeight: CGFloat = 148
    var nvMinimal: CGFloat = 90
    var collectionTop: CGFloat = 160
    
    var mainFeedTableView = UITableView()
    var myAlertsTableViewCell = "myAlertsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        modifyConstraints()
        setupTableView()
        setupNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideTabBar()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
    }

}

//MARK: ACTIONS

extension MyAlertsViewController {
    @objc func didTapGoBack() {
        lightImpactGenerator()
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: SCROLLVIEW DELEGATE

extension MyAlertsViewController: UIScrollViewDelegate {
    
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
