//
//  DiscoverExpertsViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import Foundation
import UIKit
import Lottie

extension DiscoverExpertsViewController {
    
    func setupNav() {
        
        navView.isUserInteractionEnabled = true
        navView.backgroundColor = .navColorModeLight
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOffset = CGSize(width: 0, height: 2)
        navView.layer.shadowOpacity = 0
        navView.layer.shadowRadius = 4
        navView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navView)
        navView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 96).isActive = true
        
        userProfileImageContainer.isHidden = true
        userProfileImageContainer.backgroundColor = .clear
        userProfileImageContainer.layer.shadowColor = UIColor.black.cgColor
        userProfileImageContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        userProfileImageContainer.layer.shadowOpacity = 0.1
        userProfileImageContainer.layer.shadowRadius = 4
        userProfileImageContainer.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(userProfileImageContainer)
        userProfileImageContainer.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 18).isActive = true
        userProfileImageContainer.topAnchor.constraint(equalTo: navView.topAnchor, constant: 45).isActive = true
        userProfileImageContainer.heightAnchor.constraint(equalToConstant: 39).isActive = true
        userProfileImageContainer.widthAnchor.constraint(equalToConstant: 39).isActive = true
        
        if let imageUrl = User.current.profilePhotoUrl {
            userProfileImageView.kf.setImage(with: URL(string: imageUrl))
        } else {
            userProfileImageView.image = UIImage.init(named: "profileImagePH")
            userProfileImageView.backgroundColor = UIColor(red: 42/255, green: 42/255, blue: 42/255, alpha: 1.0)
        }
        userProfileImageView.layer.cornerRadius = 39/2
        userProfileImageView.layer.masksToBounds = true
        userProfileImageView.contentMode = .scaleAspectFill
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileImageContainer.addSubview(userProfileImageView)
        userProfileImageView.fillSuperview()
        
        titleLabel.text = "Expert Portfolios"
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        titleLabel.font = .sofiaBold(ofSize: 24)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: userProfileImageContainer.leadingAnchor, constant: 0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 2).isActive = true
        
        /*
         userGreetingLabel.text = "Good morning,"
         userGreetingLabel.textAlignment = .left
         userGreetingLabel.textColor = UIColor.black.withAlphaComponent(0.3)
         userGreetingLabel.font = .sofiaRegular(ofSize: 12)
         userGreetingLabel.numberOfLines = 0
         userGreetingLabel.translatesAutoresizingMaskIntoConstraints = false
         navView.addSubview(userGreetingLabel)
         userGreetingLabel.leadingAnchor.constraint(equalTo: userProfileImageContainer.trailingAnchor, constant: 6).isActive = true
         userGreetingLabel.topAnchor.constraint(equalTo: userProfileImageContainer.topAnchor, constant: 5).isActive = true
         
         userNameLabel.text = User.current.name
         userNameLabel.textAlignment = .left
         userNameLabel.textColor = .black
         userNameLabel.font = .sofiaSemiBold(ofSize: 12)
         userNameLabel.numberOfLines = 0
         userNameLabel.translatesAutoresizingMaskIntoConstraints = false
         navView.addSubview(userNameLabel)
         userNameLabel.leadingAnchor.constraint(equalTo: userGreetingLabel.leadingAnchor, constant: 0).isActive = true
         userNameLabel.topAnchor.constraint(equalTo: userGreetingLabel.bottomAnchor, constant: 3).isActive = true
         */
        
        calendarImageView.image = UIImage(named: "avatar")
        calendarImageView.contentMode = .scaleAspectFit
        calendarImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(calendarImageView)
        calendarImageView.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -18).isActive = true
        calendarImageView.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        calendarImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        calendarImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
                
        infoButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        infoButton.backgroundColor = .clear
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(infoButton)
        infoButton.leadingAnchor.constraint(equalTo: calendarImageView.leadingAnchor, constant: -5).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        infoButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
        
        let separatorLine = UIView()
        separatorLine.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(separatorLine)
        separatorLine.leadingAnchor.constraint(equalTo: navView.leadingAnchor).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: navView.trailingAnchor).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -0.1).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupTableView() {
        mainFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(DiscoverSpotlightTableViewCell.self, forCellReuseIdentifier: discoverSpotlightTableViewCell)
        mainFeedTableView.register(ExpertsTopCoinsTableViewCell.self, forCellReuseIdentifier: expertsTopCoinsTableViewCell)
        mainFeedTableView.register(TopTradersTableViewCell.self, forCellReuseIdentifier: topTradersTableViewCell)
        mainFeedTableView.allowsMultipleSelection = false
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainFeedTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainFeedTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
    }
    
    func setupLoadingIndicator() {
        
        loadingContainer.isHidden = true
        loadingContainer.alpha = 0
        loadingContainer.backgroundColor = .white
        loadingContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loadingContainer)
        loadingContainer.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        loadingContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        loadingContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        loadingContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let checkAnimation = Animation.named("loadingBlocks")
        loadingLottie.isUserInteractionEnabled = false
        loadingLottie.alpha = 1.0
        loadingLottie.loopMode = .loop
        loadingLottie.animation = checkAnimation
        loadingLottie.contentMode = .scaleAspectFill
        loadingLottie.backgroundColor = .clear
        loadingLottie.translatesAutoresizingMaskIntoConstraints = false
        loadingContainer.addSubview(loadingLottie)
        loadingLottie.centerYAnchor.constraint(equalTo: loadingContainer.centerYAnchor, constant: -75).isActive = true
        loadingLottie.centerXAnchor.constraint(equalTo: loadingContainer.centerXAnchor).isActive = true
        loadingLottie.heightAnchor.constraint(equalToConstant: 80).isActive = true
        loadingLottie.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let loadingLabel = UILabel()
        loadingLabel.text = "Updating the feed..."
        loadingLabel.textAlignment = .center
        loadingLabel.font = .sofiaMedium(ofSize: 11)
        loadingLabel.textColor = .keyEventDetailColorModeLight
        loadingLabel.numberOfLines = 0
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingContainer.addSubview(loadingLabel)
        loadingLabel.centerXAnchor.constraint(equalTo: loadingContainer.centerXAnchor).isActive = true
        loadingLabel.topAnchor.constraint(equalTo: loadingLottie.bottomAnchor, constant: 15).isActive = true
        
        //print("😀😀😀 - \(loadingLottie.logHierarchyKeypaths()) - 😀😀😀")
        /*
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
        */
    }
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension DiscoverExpertsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            //print("\(traders.count) - 💦💦💦")
            return traders.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: discoverSpotlightTableViewCell, for: indexPath) as! DiscoverSpotlightTableViewCell
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: expertsTopCoinsTableViewCell, for: indexPath) as! ExpertsTopCoinsTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: topTradersTableViewCell, for: indexPath) as! TopTradersTableViewCell
            cell.traderImageView.image = UIImage(named: traders[indexPath.row][2])
            cell.traderNameLabel.text = traders[indexPath.row][0]
            cell.traderCoinsLabel.text = traders[indexPath.row][1]
            cell.returnPercentLabel.text = "252%"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 420
        } else if indexPath.section == 1 {
            return 223
        } else {
            return 79
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        let titleLabel = UILabel()
        titleLabel.text = "Top Traders"
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.font = .sofiaSemiBold(ofSize: 15)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 23).isActive = true
        titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 12).isActive = true
                
        roiLabel.text = "30 Day ROI"
        roiLabel.textAlignment = .right
        roiLabel.textColor = .coinBaseBlue
        roiLabel.font = .sofiaBold(ofSize: 12)
        roiLabel.numberOfLines = 0
        roiLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(roiLabel)
        roiLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -23).isActive = true
        roiLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0).isActive = true
        
        if section != 2 {
            titleLabel.isHidden = true
            roiLabel.isHidden = true
        } else {
            titleLabel.isHidden = false
            roiLabel.isHidden = false
        }
        
        let roiButton = UIButton()
        roiButton.addTarget(self, action: #selector(roiTapped), for: .touchUpInside)
        roiButton.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(roiButton)
        roiButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        roiButton.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        roiButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        roiButton.leadingAnchor.constraint(equalTo: roiLabel.leadingAnchor, constant: -20).isActive = true
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 54
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expertsVC = ExpertDetailViewController()
        self.navigationController?.pushViewController(expertsVC, animated: true)
    }
    
}
