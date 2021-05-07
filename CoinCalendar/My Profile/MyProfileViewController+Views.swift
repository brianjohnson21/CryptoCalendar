//
//  MyProfileViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import Foundation
import UIKit
import Lottie

extension MyProfileViewController {
    
    func modifyConstraints() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            piDimensions = 100
            logoTop = 30
            versionBottom = -17
            headerHeight = 180
            
        case .iphone78() :
            piDimensions = 100
            logoTop = 30
            versionBottom = -17
            headerHeight = 180
            
        case .iphone78Plus() :
            piDimensions = 130
            logoTop = 30
            versionBottom = -17
            headerHeight = 180
            
        case .iphone11Max() :
            piDimensions = 130
            logoTop = 48
            versionBottom = -34
            
        case .iphone12AndPro() :
            piDimensions = 115
            logoTop = 48
            
        case .iphone12ProMax() :
            piDimensions = 130
            logoTop = 48
            
        default:
            piDimensions = 120
            logoTop = 48
            nvHeight = 130
            versionBottom = -34
        }
    }
    
    func setupViews() {
        
        opacityLayer.backgroundColor = .black
        opacityLayer.alpha = 0
        opacityLayer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(opacityLayer)
        opacityLayer.fillSuperview()
        
        mainScrollView.tag = 2
        mainScrollView.delegate = self
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.1)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        
        containerView.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        containerView.backgroundColor = .white
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        purpBackground.backgroundColor = UIColor.clear
        purpBackground.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(purpBackground)
        purpBackground.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        purpBackground.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        purpBackground.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        purpBackground.heightAnchor.constraint(equalToConstant: nvHeight).isActive = true
        
        downArrowImageView.image = UIImage(named: "downArrowWhite")
        downArrowImageView.setImageColor(color: .black)
        downArrowImageView.contentMode = .scaleAspectFill
        downArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        purpBackground.addSubview(downArrowImageView)
        downArrowImageView.leadingAnchor.constraint(equalTo: purpBackground.leadingAnchor, constant: 22).isActive = true
        downArrowImageView.topAnchor.constraint(equalTo: purpBackground.topAnchor, constant: 60).isActive = true
        downArrowImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        downArrowImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        dismissButton.backgroundColor = .clear
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        purpBackground.addSubview(dismissButton)
        dismissButton.leadingAnchor.constraint(equalTo: purpBackground.leadingAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: purpBackground.bottomAnchor).isActive = true
        dismissButton.topAnchor.constraint(equalTo: purpBackground.topAnchor).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: downArrowImageView.trailingAnchor, constant: 15).isActive = true
        
        settingsImageView.image = UIImage(named: "settings2")
        settingsImageView.setImageColor(color: .black)
        settingsImageView.contentMode = .scaleAspectFill
        settingsImageView.translatesAutoresizingMaskIntoConstraints = false
        purpBackground.addSubview(settingsImageView)
        settingsImageView.trailingAnchor.constraint(equalTo: purpBackground.trailingAnchor, constant: -26).isActive = true
        settingsImageView.centerYAnchor.constraint(equalTo: downArrowImageView.centerYAnchor, constant: 0).isActive = true
        settingsImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        settingsImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        settingsButton.backgroundColor = .clear
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(settingsButton)
        settingsButton.topAnchor.constraint(equalTo: purpBackground.topAnchor).isActive = true
        settingsButton.trailingAnchor.constraint(equalTo: purpBackground.trailingAnchor).isActive = true
        settingsButton.leadingAnchor.constraint(equalTo: settingsImageView.leadingAnchor, constant: -10).isActive = true
        settingsButton.bottomAnchor.constraint(equalTo: settingsImageView.bottomAnchor, constant: 10).isActive = true
        
//        if let imageUrl = User.current.profilePhotoUrl {
//            profileImageView.kf.setImage(with: URL(string: imageUrl), placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
//                if (image != nil) {
//                    self.profileImageView.image = image
//                    self.loadingLottie.stop()
//                    self.loadingLottie.isHidden = true
//                } else {
//                    self.profileImageView.image = UIImage.init(named: "profileImagePH2")
//                    self.loadingLottie.stop()
//                    self.loadingLottie.isHidden = true
//                }
//            })
//        if let imageUrl = User.current.profilePhotoUrl {
//            profileImageView.kf.setImage(with: URL(string: imageUrl))
//        } else {
//            self.profileImageView.image = UIImage.init(named: "profileImagePH2")
//        }
        
        self.profileImageView.image = UIImage.init(named: "profileImagePH")
        self.loadingLottie.stop()
        self.loadingLottie.isHidden = true
        
        profileImageView.backgroundColor = UIColor(red: 42/255, green: 42/255, blue: 42/255, alpha: 1.0)
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = piDimensions/2
        profileImageView.layer.masksToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        profileCenterY = profileImageView.centerYAnchor.constraint(equalTo: purpBackground.bottomAnchor, constant: 30)//centerYAnchor.constraint(equalTo: purpBackground.bottomAnchor)
        profileCenterY.isActive = true
        profileHeight = profileImageView.heightAnchor.constraint(equalToConstant: piDimensions)
        profileHeight.isActive = true
        profileWidth = profileImageView.widthAnchor.constraint(equalToConstant: piDimensions)
        profileWidth.isActive = true
        
        userNameLabel.text = User.current.email//"Evan Robertson" //User.current.name
        //print("\(User.current.email) - 🤬🤬🤬")
        userNameLabel.textColor = .keyEventHeadlineColorModeLight
        userNameLabel.textAlignment = .center
        userNameLabel.font = .sofiaSemiBold(ofSize: 19)
        userNameLabel.numberOfLines = 0
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(userNameLabel)
        userNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nameTop = userNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20)//userNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: nameDist)
        nameTop.isActive = true
        
        gamesPlayedLabel.text = "0 Subscriptions"//"\(User.current.squadUps.count) squad ups"
        gamesPlayedLabel.textColor = UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.6)
        gamesPlayedLabel.textAlignment = .center
        gamesPlayedLabel.font = .sofiaMedium(ofSize: 15)
        gamesPlayedLabel.numberOfLines = 0
        gamesPlayedLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(gamesPlayedLabel)
        gamesPlayedLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        gamesPlayedLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 11).isActive = true

    }
    
    func setupLoadingIndicator() {
        let checkAnimation = Animation.named("tripleSpinner")
        loadingLottie.isUserInteractionEnabled = false
        loadingLottie.alpha = 1.0
        loadingLottie.loopMode = .loop
        loadingLottie.animation = checkAnimation
        loadingLottie.contentMode = .scaleAspectFill
        loadingLottie.backgroundColor = .clear
        loadingLottie.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.addSubview(loadingLottie)
        loadingLottie.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        loadingLottie.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        loadingLottie.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loadingLottie.widthAnchor.constraint(equalToConstant: 50).isActive = true
        loadingLottie.play()
        //print("😀😀😀 - \(loadingLottie.logHierarchyKeypaths()) - 😀😀😀")
    
        var i = 0
        let loadingLayers = ["Shape Layer 1.Ellipse 1.Stroke 1.Color", "Shape Layer 2.Ellipse 1.Stroke 1.Color", "Shape Layer 3.Ellipse 1.Stroke 1.Color"]
        for layer in 1...loadingLayers.count {
            let keyPath = AnimationKeypath(keypath: "\(loadingLayers[layer - 1])")
            if i == 0 {
                let colorProvider = ColorValueProvider(UIColor.white.withAlphaComponent(1.0).lottieColorValue)
                loadingLottie.setValueProvider(colorProvider, keypath: keyPath)
            } else if i == 1 {
                let colorProvider = ColorValueProvider(UIColor.white.withAlphaComponent(0.8).lottieColorValue)
                loadingLottie.setValueProvider(colorProvider, keypath: keyPath)
            } else {
                let colorProvider = ColorValueProvider(UIColor.white.withAlphaComponent(0.6).lottieColorValue)
                loadingLottie.setValueProvider(colorProvider, keypath: keyPath)
            }
            i += 1
        }
    }
    
    func setupTableView() {
        
        mainFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        mainFeedTableView.isScrollEnabled = false
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.isScrollEnabled = false
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(MyProfileTableViewCell.self, forCellReuseIdentifier: myProfileTableViewCell)
        mainFeedTableView.allowsSelection = true
        mainFeedTableView.allowsMultipleSelection = false
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        mainFeedTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        mainFeedTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        
    }
    
    func setupButtons() {
        payHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        squadUpHistoryContainer.addSubview(payHistoryButton)
        payHistoryButton.fillSuperview()
    }
    
    func setupVersionAndSocial() {
        
        versionLabel.text = "Version 1.0"
        versionLabel.textAlignment = .center
        versionLabel.textColor = UIColor.coinBaseBlue.withAlphaComponent(0.7)
        versionLabel.font = .sofiaRegular(ofSize: 15)
        versionLabel.numberOfLines = 0
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(versionLabel)
        versionLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        versionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: versionBottom).isActive = true
        
        twitterButton.adjustsImageWhenHighlighted = false
        //twitterButton.setBackgroundImage(UIImage(named: "twitter1"), for: .normal)
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(twitterButton)
        twitterButton.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -41).isActive = true
        twitterButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        twitterButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        twitterImageView.image = UIImage(named: "twitter1")
        twitterImageView.setImageColor(color: .coinBaseBlue)
        twitterImageView.contentMode = .scaleAspectFill
        twitterImageView.translatesAutoresizingMaskIntoConstraints = false
        twitterButton.addSubview(twitterImageView)
        twitterImageView.fillSuperview()
        
        faceBookButton.adjustsImageWhenHighlighted = false
        //faceBookButton.setBackgroundImage(UIImage(named: "facebook1"), for: .normal)
        faceBookButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(faceBookButton)
        faceBookButton.centerYAnchor.constraint(equalTo: twitterButton.centerYAnchor, constant: 0).isActive = true
        faceBookButton.trailingAnchor.constraint(equalTo: twitterButton.leadingAnchor, constant: -75).isActive = true
        faceBookButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        faceBookButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        faceBookImageView.image = UIImage(named: "facebook1")
        faceBookImageView.setImageColor(color: .coinBaseBlue)
        faceBookImageView.contentMode = .scaleAspectFill
        faceBookImageView.translatesAutoresizingMaskIntoConstraints = false
        faceBookButton.addSubview(faceBookImageView)
        faceBookImageView.fillSuperview()
        
        instagramButton.adjustsImageWhenHighlighted = false
        instagramButton.setBackgroundImage(UIImage(named: "instagram1"), for: .normal)
        instagramButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(instagramButton)
        instagramButton.centerYAnchor.constraint(equalTo: twitterButton.centerYAnchor, constant: 0).isActive = true
        instagramButton.leadingAnchor.constraint(equalTo: twitterButton.trailingAnchor, constant: 75).isActive = true
        instagramButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        instagramButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        instagramImageView.image = UIImage(named: "instagram1")
        instagramImageView.setImageColor(color: .coinBaseBlue)
        instagramImageView.contentMode = .scaleAspectFill
        instagramImageView.translatesAutoresizingMaskIntoConstraints = false
        instagramButton.addSubview(instagramImageView)
        instagramImageView.fillSuperview()
        
    }
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myProfileTableViewCell, for: indexPath) as! MyProfileTableViewCell
        cell.settingsLabel.text = settingTitle[indexPath.row]
        cell.settingsIcon.image = UIImage(named: settingImage[indexPath.row])
        cell.settingsIcon.setImageColor(color: .coinBaseBlue)
        cell.contentView.backgroundColor = .clear
        
        cell.profileButton.isUserInteractionEnabled = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            goToMyAlerts()
        case 1:
            goToInviteContacts()
        case 2:
            //goToInviteContacts()
            goToFAQ()
        case 3:
            goToInviteContacts()
        case 4:
            purchaseHistoryTapped()
        case 5:
            goToPayHistory()
        case 6:
            print("Nothing here yet")
        case 7:
            settingsTapped()
        default:
            print("Nothing here yet")
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    
}


