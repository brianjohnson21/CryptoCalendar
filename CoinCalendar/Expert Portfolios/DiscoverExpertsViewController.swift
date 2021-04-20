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
    
    var traders: [[String]] = [["Thomas Jones", "5 coins", "tempHeadShot"], ["Felix He", "5 coins", "spotlightTwo"], ["John Horne", "5 coins", "spotlightOne"], ["Erick Sandoval", "5 coins", "spotlightFour"]]
    let roiLabel = UILabel()
    //var spotlightExperts: [[String]] = [["spotlightOne", "John Horne"], ["spotlightTwo", "Clive Miller"], ["tempHeadShot", "Jason Estrada"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        //let notificationCenter = NotificationCenter.default
        //notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        //Call Views
        setupNav()
        setupTableView()
        //setupLoadingIndicator()
        //setupEmptyState()
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 1)
                
        //perform(#selector(animateCells), with: self, afterDelay: 0.25)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        showTabBar()
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
        roiLabel.text = duration
    }
    
    
}
