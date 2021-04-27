//
//  MyProfileViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import UIKit
import Lottie

class MyProfileViewController: UIViewController {
    
    var opacityLayer = UIView()
    var mainScrollView = UIScrollView()
    var containerView = UIView()
    
    var headerHeight: CGFloat = 290
    var purpBackground = UIView()
    var profileImageView = UIImageView()
    var profileCenterY: NSLayoutConstraint!
    var profileWidth: NSLayoutConstraint!
    var profileHeight: NSLayoutConstraint!
    var whiteLogo = UIImageView()
    var downArrowImageView = UIImageView()
    var dismissButton = UIButton()
    var userNameLabel = UILabel()
    var gamesPlayedLabel = UILabel()
    var editProfileContainer = UIView()
    var squadUpHistoryContainer = UIView()
    var settingsContainer = UIView()
    var shareContainer = UIView()
    var settingsImageView = UIImageView()
    var settingsButton = UIButton()
    var loadingLottie = AnimationView()
    
    var versionLabel = UILabel()
    var faceBookButton = UIButton()
    var faceBookImageView = UIImageView()
    var twitterButton = UIButton()
    var twitterImageView = UIImageView()
    var instagramButton = UIButton()
    var instagramImageView = UIImageView()
    
    var buttonsBottom: CGFloat = -42
    var versionBottom: CGFloat = -34
    
    var profileImgCenterY: NSLayoutConstraint!
    var proHeight: NSLayoutConstraint!
    var proWidth: NSLayoutConstraint!
    var nameTop: NSLayoutConstraint!
    var nvHeight: CGFloat = 138
    var nameDist: CGFloat = 181
    var factorNotch = true
    var infoTop: NSLayoutConstraint!
    var infoDist: CGFloat = 221
    var multiplier: CGFloat = 1.0
    
    var mainFeedTableView = UITableView()
    var myProfileTableViewCell = "myProfileTableViewCell"
    var settingTitle: [String] = ["My alerts", "Invite your friends", "FAQ", "Terms of Service"]
    var settingImage: [String] = ["bell", "share", "help-circle", "termsIcon"]
    
    var piDimensions: CGFloat = 100
    var logoTop: CGFloat = 48
    
    var isDismissing = false
    
    var payHistoryButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear//UIColor(red: 31/255, green: 31/255, blue: 31/255, alpha: 1.0)
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        self.tabBarController?.tabBar.clipsToBounds = true
        
        edgesForExtendedLayout = UIRectEdge.all
        extendedLayoutIncludesOpaqueBars = true
        
        modifyConstraints()
        setupTableView()
        setupViews()
        setupLoadingIndicator()
        setupVersionAndSocial()
        
        settingsButton.addTarget(self, action: #selector(settingsTapped), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showTabBar()
        //gamesPlayedLabel.isHidden = true
        gamesPlayedLabel.isHidden = true
        gamesPlayedLabel.text = "Joined April 2021"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}

//MARK: ACTIONS

extension MyProfileViewController {
    @objc func animateViewsIn() {
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
            self.opacityLayer.alpha = 0.75
            self.containerView.transform = CGAffineTransform(translationX: 0, y: 0)
            //self.keyLine.transform = CGAffineTransform(translationX: 0, y: 0)
        } completion: { (success) in
            //
        }
    }
    
    @objc func goToInviteContacts() {
        lightImpactGenerator()
        let inviteFriendsVC = InviteFriendsViewController()
        self.navigationController?.pushViewController(inviteFriendsVC, animated: true)
    }
    
    @objc func goToMyAlerts() {
        lightImpactGenerator()
        let sortFilterVC = MyAlertsViewController()
        self.navigationController?.pushViewController(sortFilterVC, animated: true)
    }
    
    @objc func goToProfileLink() {
//        let profileLinkVC = MyProfileLinkViewController()
//        profileLinkVC.modalPresentationStyle = .overFullScreen
//        self.present(profileLinkVC, animated: false, completion: nil)
    }
    /*
    @objc func dismissVC() {
        lightImpactGenerator()
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    */
    
    @objc func dismissVC() {
        UIView.animate(withDuration: 0.25) {
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.opacityLayer.alpha = 0
        } completion: { (success) in
            self.dismiss(animated: false) {
                //
            }
        }
    }
    
    @objc func goToEditProfile() {
//        let editProfileVC = EditProfileViewController()
//        //editProfileVC.editTitleLabel.text = "Edit your profile"
//        self.navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
    @objc func goToPaywall() {
//        lightImpactGenerator()
//        let paymentSettingsVC = PaymentSettingsViewController()
//        self.navigationController?.pushViewController(paymentSettingsVC, animated: true)
    }
    
    @objc func settingsTapped() {
//        let settingsVC = SettingsViewController()
//        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    @objc func purchaseHistoryTapped() {
//        let purchaseHistoryVC = PurchaseViewController()
//        self.navigationController?.pushViewController(purchaseHistoryVC, animated: true)
    }
    
    @objc func goToPayHistory() {
//        let payHistoryVC = PayHistoryViewController()
//        self.navigationController?.pushViewController(payHistoryVC, animated: true)
    }
    
}

//MARK: SCROLLVIEW DELEGATE

extension MyProfileViewController: UIScrollViewDelegate {
    /*
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var topDist: CGFloat = 44
        if !factorNotch {
            topDist = 20
        }
        
        let yAxis = scrollView.contentOffset.y + topDist
        print("\(yAxis)")
        if yAxis >= 0 && yAxis <= 44 {
            nameTop.constant = nameDist - yAxis
            infoTop.constant = infoDist - yAxis
            profileImgCenterY.constant = -yAxis
            proHeight.constant = piDimensions - (yAxis * multiplier)
            proWidth.constant = piDimensions - (yAxis * multiplier)
            profileImageView.layer.cornerRadius = (piDimensions - (yAxis * multiplier)) / 2
        } else if yAxis >= 0 {
            nameTop.constant = nameDist - yAxis
            infoTop.constant = infoDist - yAxis
        
        }
    }
    */
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yAxis = scrollView.contentOffset.y + 44
        //print("\(yAxis)")
        if yAxis > 0 && yAxis < 60 {
            print("\(yAxis) - 😰😰😰")
            profileCenterY.constant = -yAxis
            let updatedDim = piDimensions - (yAxis / 2)
            profileWidth.constant = updatedDim
            profileHeight.constant = updatedDim
            profileImageView.layer.cornerRadius = (updatedDim) / 2
            let labelAlpha = (60 - yAxis) / 60
            userNameLabel.alpha = labelAlpha
            gamesPlayedLabel.alpha = labelAlpha
        } else if yAxis >= 60 {
            userNameLabel.alpha = 0
            gamesPlayedLabel.alpha = 0
        }
        
        if scrollView.tag == 2 {
            let yOffset = scrollView.contentOffset.y// + 44
            if yOffset > -44 {
                scrollView.setContentOffset(CGPoint(x: 0, y: -44), animated: false)
            }
            
            if yOffset < -85 {
                if !isDismissing {
                    dismissVC()
                    isDismissing = true
                }
            }
        }
    }
}

