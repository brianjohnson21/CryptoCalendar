//
//  DiscoverExpertsViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import UIKit
import Lottie

class DiscoverExpertsViewController: UIViewController {
    
    var loadingContainer = UIView()
    var loadingLottie = AnimationView()
    
    var navView = UIView()
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
    
    var mainFeedTableView = UITableView()
    var discoverSpotlightTableViewCell = "discoverSpotlightTableViewCell"
    var expertsTopCoinsTableViewCell = "expertsTopCoinsTableViewCell"
    var topTradersTableViewCell = "topTradersTableViewCell"
    
    var traders: [[String]] = [["Thomas Jones", "5 coins", "tempHeadShot", "252"],
                               ["Clive Miller", "8 coins", "spotlightTwo", "198"],
                               ["John Horne", "7 coins", "spotlightOne", "172"],
                               ["Erick Sandoval", "5 coins", "spotlightFour", "145"],                               
                               ["Cindy Wui", "9 coins", "temp2", "192"],
                               ["Jeff Moroney", "7 coins", "temp3", "128"],
                               ["Raj Patel", "11 coins", "temp4", "102"],
                               ["Jermaine Lewis", "4 coins", "temp5", "83"],
                               ["Ash Malik", "8 coins", "temp6", "278"],
                               ["Chris Blake", "5 coins", "temp7", "50"],
    ]
    
    var roiSelected = "30 Day ROI"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        //Call Views
        setupNav()
        setupTableView()
        //setupLoadingIndicator()
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 1)
                
        //perform(#selector(animateCells), with: self, afterDelay: 0.25)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .darkContent
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        showTabBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }

}

//MARK: SPOTLIGHT DELEGATE

extension DiscoverExpertsViewController: DiscoverSpotlightTableViewCellDelegate {
    func didSelectExpertFromSpotlight() {
        lightImpactGenerator()
        let expertsVC = ExpertDetailViewController()
        self.navigationController?.pushViewController(expertsVC, animated: true)
    }
}

//MARK: ACTIONS

extension DiscoverExpertsViewController {
    @objc func roiTapped() {
        let timePickerVC = TimePickerViewController()
        timePickerVC.modalPresentationStyle = .overFullScreen
        timePickerVC.delegate = self
        self.present(timePickerVC, animated: false) {
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

//MARK" TIME PICKER DELEGATE

extension DiscoverExpertsViewController: TimePickerViewControllerDelegate {
    func didPickDuration(duration: String) {
        roiSelected = duration
        traders.shuffle()
        mainFeedTableView.reloadSections([2], with: .automatic)
    }
    
    
}
