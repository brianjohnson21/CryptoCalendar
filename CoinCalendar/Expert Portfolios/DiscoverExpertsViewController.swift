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
    var navHeight: CGFloat = 96
    
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
    var spotlightHeight: CGFloat = 420
    var viewedDiscoverExperts = UserDefaults()
    
    var mainFeedTableView = UITableView()
    var discoverSpotlightTableViewCell = "discoverSpotlightTableViewCell"
    var expertsTopCoinsTableViewCell = "expertsTopCoinsTableViewCell"
    var topTradersTableViewCell = "topTradersTableViewCell"
    
//    var traders: [[String]] = [["Thomas Jones", "5 coins", "tempHeadShot", "252"],
//                               ["Clive Miller", "8 coins", "spotlightTwo", "198"],
//                               ["John Horne", "7 coins", "spotlightOne", "172"],
//                               ["Erick Sandoval", "5 coins", "spotlightFour", "145"],
//                               ["Cindy Wui", "9 coins", "temp2", "192"],
//                               ["Jeff Moroney", "7 coins", "temp3", "128"],
//                               ["Raj Patel", "11 coins", "temp4", "102"],
//                               ["Jermaine Lewis", "4 coins", "temp5", "83"],
//                               ["Ash Malik", "8 coins", "temp6", "278"],
//                               ["Chris Blake", "5 coins", "temp7", "50"],
//    ]
    var traders = [Admin]()
    
    var roiSelected = "30 Day ROI"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainFeedBackgroundColorModeLight
        
        //Call Views
        modifyConstraints()
        setupNav()
        setupTableView()
        //setupLoadingIndicator()
        
        self.tabBarController?.removeDotAtTabBarItemIndex(index: 1)
        if viewedDiscoverExperts.bool(forKey: "viewedDiscoverExperts") {
            print("not first time here")
        } else {
            print("first time here")
            viewedDiscoverExperts.set(true, forKey: "viewedDiscoverExperts")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .darkContent
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
        showTabBar()
               
        //print("\(viewedDiscoverExperts.bool(forKey: "viewedDiscoverExperts")) - ❄️❄️❄️")
        
        getTraders()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
    
    func getTraders() {
        API.sharedInstance.getAdmins { (success, admins, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success, let admins = admins else {
                print("error getting traders")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.traders = admins
                self?.mainFeedTableView.reloadData()
            }
        }
    }

}

//MARK: SPOTLIGHT DELEGATE

extension DiscoverExpertsViewController: DiscoverSpotlightTableViewCellDelegate {
    func didSelectExpertFromSpotlight(expert: Admin) {
        lightImpactGenerator()
        let expertsVC = ExpertDetailViewController()
        expertsVC.admin = expert
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
