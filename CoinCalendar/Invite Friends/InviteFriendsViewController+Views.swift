//
//  InviteFriendsViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/16/21.
//

import Foundation
import UIKit
import Lottie

extension InviteFriendsViewController {
    
    func setupHeader() {
        topGradientImageView.layer.zPosition = 10
        topGradientImageView.backgroundColor = .mainFeedBackgroundColorModeLight
        topGradientImageView.image = UIImage(named: "purpGradientLeft")
        topGradientImageView.contentMode = .scaleAspectFill
        topGradientImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topGradientImageView)
        topGradientImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        topGradientImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        topGradientImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        topGradientImageView.heightAnchor.constraint(equalToConstant: 228).isActive = true
        
        backArrowImageView.image = UIImage(named: "arrow-left")
        backArrowImageView.setImageColor(color: .black)
        backArrowImageView.contentMode = .scaleAspectFill
        backArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        topGradientImageView.addSubview(backArrowImageView)
        backArrowImageView.leadingAnchor.constraint(equalTo: topGradientImageView.leadingAnchor, constant: 24).isActive = true
        backArrowImageView.topAnchor.constraint(equalTo: topGradientImageView.topAnchor, constant: 60).isActive = true
        backArrowImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        backArrowImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        backButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: backArrowImageView.bottomAnchor, constant: 20).isActive = true
        backButton.trailingAnchor.constraint(equalTo: backArrowImageView.trailingAnchor, constant: 20).isActive = true
        
        emojiLabel.text = "💰🤑💸"
        emojiLabel.textAlignment = .left
        emojiLabel.textColor = .white
        emojiLabel.font = .sofiaSemiBold(ofSize: 17)
        emojiLabel.numberOfLines = 0
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        topGradientImageView.addSubview(emojiLabel)
        emojiLabel.centerXAnchor.constraint(equalTo: topGradientImageView.centerXAnchor, constant: 0).isActive = true
        emojiLabel.centerYAnchor.constraint(equalTo: backArrowImageView.centerYAnchor, constant: 0).isActive = true
        
        messageLabel.setupLineHeight(myText: "Invite 3 friends and get\na code for 50% off!", myLineSpacing: 4)
        messageLabel.textAlignment = .center
        messageLabel.textColor = .keyEventHeadlineColorModeLight
        messageLabel.font = .sofiaSemiBold(ofSize: 17)
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        topGradientImageView.addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 23).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: topGradientImageView.centerXAnchor, constant: 0).isActive = true
        
        let detailText = "Your friends will also get a\ncode when they sign up!"
        detailLabel.setupLineHeight(myText: detailText, myLineSpacing: 5)
        detailLabel.textAlignment = .center
        detailLabel.textColor = UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.6)
        detailLabel.font = .sofiaRegular(ofSize: 13)
        detailLabel.numberOfLines = 0
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        topGradientImageView.addSubview(detailLabel)
        detailLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 12).isActive = true
        detailLabel.centerXAnchor.constraint(equalTo: topGradientImageView.centerXAnchor, constant: 0).isActive = true
        
        //timeRemainingRing.addGestureRecognizer(tappedProgress)
        timeRemainingRing.isUserInteractionEnabled = true
        timeRemainingRing.innerRingColor = UIColor.coinBaseBlue
        timeRemainingRing.outerRingColor = UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.4)
        timeRemainingRing.startAngle = -90
        timeRemainingRing.minValue = 0
        timeRemainingRing.maxValue = CGFloat(invitesRequired)
        timeRemainingRing.shouldShowValueText = false
        timeRemainingRing.outerRingWidth = 1.5
        timeRemainingRing.innerRingWidth = 1.5
        timeRemainingRing.innerRingSpacing = -3.25
        timeRemainingRing.innerCapStyle = .round
        timeRemainingRing.outerCapStyle = .round
        timeRemainingRing.translatesAutoresizingMaskIntoConstraints = false
        topGradientImageView.addSubview(timeRemainingRing)
        timeRemainingRing.trailingAnchor.constraint(equalTo: topGradientImageView.trailingAnchor, constant: -24).isActive = true
        timeRemainingRing.centerYAnchor.constraint(equalTo: backArrowImageView.centerYAnchor, constant: 0).isActive = true
        timeRemainingRing.heightAnchor.constraint(equalToConstant: 43).isActive = true
        timeRemainingRing.widthAnchor.constraint(equalToConstant: 43).isActive = true
        
        timeRemainingLabel.text = "\(sentInvites)/\(invitesRequired)"
        timeRemainingLabel.textAlignment = .center
        timeRemainingLabel.textColor = UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.8)
        timeRemainingLabel.font = .sofiaMedium(ofSize: 15)
        timeRemainingLabel.numberOfLines = 0
        timeRemainingLabel.translatesAutoresizingMaskIntoConstraints = false
        topGradientImageView.addSubview(timeRemainingLabel)
        timeRemainingLabel.centerXAnchor.constraint(equalTo: timeRemainingRing.centerXAnchor).isActive = true
        timeRemainingLabel.centerYAnchor.constraint(equalTo: timeRemainingRing.centerYAnchor).isActive = true
        
        timeRemainingRing.startProgress(to: CGFloat(sentInvites), duration: 2.0)
    }
    
    func setupTableView() {
        var tableInset: CGFloat = 80
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            tableInset = 80
        case .iphone78() :
            tableInset = 80
        case .iphone78Plus() :
            tableInset = 110
        default:
            tableInset = 250
        }
        
        tableView.sectionIndexColor = UIColor.coinBaseBlue.withAlphaComponent(0.6)
        tableView.backgroundColor = .mainFeedBackgroundColorModeLight
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: "contactsCell")
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.contentInset = .zero
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tableInset, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: topGradientImageView.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        loadingView.backgroundColor = .mainFeedBackgroundColorModeLight
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loadingView)
        loadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        loadingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        loadingView.topAnchor.constraint(equalTo: topGradientImageView.bottomAnchor, constant: 0).isActive = true
        
        let arrowAnimation = Animation.named("loading_Peach")
        loadingLottie.isUserInteractionEnabled = false
        loadingLottie.alpha = 1.0
        loadingLottie.animation = arrowAnimation
        loadingLottie.loopMode = .loop
        loadingLottie.contentMode = .scaleAspectFill
        loadingLottie.backgroundColor = .clear
        loadingLottie.translatesAutoresizingMaskIntoConstraints = false
        loadingLottie.play()
        loadingView.addSubview(loadingLottie)
        loadingLottie.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        loadingLottie.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor, constant: -30).isActive = true
        loadingLottie.heightAnchor.constraint(equalToConstant: 80).isActive = true
        loadingLottie.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let loadingLayers = ["シェイプレイヤー 8.楕円形 1.線 1.Color", "シェイプレイヤー 9.楕円形 1.線 1.Color"]
        
        for layer in 1...loadingLayers.count {
            let keyPath = AnimationKeypath(keypath: "\(loadingLayers[layer - 1])")
            if layer == 1 {
                let colorProvider = ColorValueProvider(UIColor.coinBaseBlue.lottieColorValue)
                loadingLottie.setValueProvider(colorProvider, keypath: keyPath)
            } else {
                //                let colorProvider = ColorValueProvider(UIColor.clear.lottieColorValue)
                //                loadingLottie.setValueProvider(colorProvider, keypath: keyPath)
            }
        }
        
        //unlockedRewardView.reqDetailLabel.setupLineHeight(myText: "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor incididunt ut.", myLineSpacing: 4)
        unlockedRewardView.layer.zPosition = 11
        unlockedRewardView.isHidden = true
        unlockedRewardView.reqTitleLabel.text = "Congratulations 🎉"
        unlockedRewardView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(unlockedRewardView)
        unlockedRewardView.fillSuperview()
        
    }
    
}

