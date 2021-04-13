//
//  CoinOptionsViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/8/21.
//

import Foundation
import UIKit
import Lottie

extension CoinOptionsViewController {
    
    func setupViews() {
        opacityLayer.backgroundColor = .black
        opacityLayer.alpha = 0
        opacityLayer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(opacityLayer)
        opacityLayer.fillSuperview()
        
        mainScrollView.tag = 1
        mainScrollView.delegate = self
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.backgroundColor = .clear
        mainScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.1)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        
        wrapper.backgroundColor = .clear
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(wrapper)
        wrapper.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 0).isActive = true
        wrapper.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 0).isActive = true
        wrapper.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        wrapper.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        mainContainer.backgroundColor = .white
        mainContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainContainer.layer.cornerRadius = 15
        mainContainer.layer.masksToBounds = true
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        wrapper.addSubview(mainContainer)
        mainContainer.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor, constant: 0).isActive = true
        mainContainer.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 0).isActive = true
        mainContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        mainHeight = mainContainer.heightAnchor.constraint(equalToConstant: 460)
        mainHeight.isActive = true
        mainContainer.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        
        keyLine.backgroundColor = .white
        keyLine.layer.cornerRadius = 4/2
        keyLine.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(keyLine)
        keyLine.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor).isActive = true
        keyLine.bottomAnchor.constraint(equalTo: mainContainer.topAnchor, constant: -6).isActive = true
        keyLine.widthAnchor.constraint(equalToConstant: 34).isActive = true
        keyLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
        keyLine.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        
        let dismissButton = UIButton()
        dismissButton.backgroundColor = .clear
        dismissButton.addTarget(self, action: #selector(dimissVC), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        wrapper.addSubview(dismissButton)
        dismissButton.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor).isActive = true
        dismissButton.topAnchor.constraint(equalTo: wrapper.topAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: keyLine.topAnchor).isActive = true
        
        coinContainer.backgroundColor = .white
        coinContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(coinContainer)
        coinContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor).isActive = true
        coinContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor).isActive = true
        coinContainer.topAnchor.constraint(equalTo: mainContainer.topAnchor).isActive = true
        coinContainer.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        if let coinSymbol = coin?.symbol {
            coinImageView.image = UIImage(named: "\(coinSymbol)")
            coinLabel.text = coinSymbol
        }
        coinImageView.contentMode = .scaleAspectFill
        coinImageView.layer.cornerRadius = 36/2
        coinImageView.layer.masksToBounds = true
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        coinContainer.addSubview(coinImageView)
        coinImageView.leadingAnchor.constraint(equalTo: coinContainer.leadingAnchor, constant: 18).isActive = true
        coinImageView.centerYAnchor.constraint(equalTo: coinContainer.centerYAnchor, constant: 0).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
        if let coinName = coin?.name {
            blockChainLabel.text = coinName
        }
        blockChainLabel.textAlignment = .left
        blockChainLabel.textColor = .black
        blockChainLabel.font = .sofiaMedium(ofSize: 18)
        blockChainLabel.numberOfLines = 0
        blockChainLabel.translatesAutoresizingMaskIntoConstraints = false
        coinContainer.addSubview(blockChainLabel)
        blockChainLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 6).isActive = true
        blockChainLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor, constant: 2).isActive = true
                
        coinLabel.textAlignment = .left
        coinLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        coinLabel.font = .sofiaRegular(ofSize: 14)
        coinLabel.numberOfLines = 0
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        coinContainer.addSubview(coinLabel)
        coinLabel.leadingAnchor.constraint(equalTo: blockChainLabel.leadingAnchor, constant: 0).isActive = true
        coinLabel.topAnchor.constraint(equalTo: blockChainLabel.bottomAnchor, constant: 2).isActive = true
        
        arrowImageView.transform = view.transform.rotated(by: .pi)
        arrowImageView.image = UIImage(named: "backWhiteArrow")
        arrowImageView.setImageColor(color: .black)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        coinContainer.addSubview(arrowImageView)
        arrowImageView.trailingAnchor.constraint(equalTo: coinContainer.trailingAnchor, constant: -16).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: coinContainer.centerYAnchor, constant: 0).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        seeMoreLabel.text = "See More"
        seeMoreLabel.textAlignment = .left
        seeMoreLabel.textColor = .keyEventHeadlineColorModeLight
        seeMoreLabel.font = .sofiaMedium(ofSize: 14)
        seeMoreLabel.numberOfLines = 0
        seeMoreLabel.translatesAutoresizingMaskIntoConstraints = false
        coinContainer.addSubview(seeMoreLabel)
        seeMoreLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -2).isActive = true
        seeMoreLabel.centerYAnchor.constraint(equalTo: arrowImageView.centerYAnchor, constant: 0).isActive = true
        
        coinDivider.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        coinDivider.translatesAutoresizingMaskIntoConstraints = false
        coinContainer.addSubview(coinDivider)
        coinDivider.leadingAnchor.constraint(equalTo: coinContainer.leadingAnchor).isActive = true
        coinDivider.trailingAnchor.constraint(equalTo: coinContainer.trailingAnchor).isActive = true
        coinDivider.bottomAnchor.constraint(equalTo: coinContainer.bottomAnchor).isActive = true
        coinDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        coinDetailButton.addTarget(self, action: #selector(coinDetailTapped), for: .touchUpInside)
        coinDetailButton.backgroundColor = .clear
        coinDetailButton.translatesAutoresizingMaskIntoConstraints = false
        coinContainer.addSubview(coinDetailButton)
        coinDetailButton.fillSuperview()
                
        //
        if isPinnedCoin {
            newChatOption.optionButton.addTarget(self, action: #selector(removePinTapped), for: .touchUpInside)
        } else {
            newChatOption.optionButton.addTarget(self, action: #selector(tappedAddToWatchlist), for: .touchUpInside)
        }
        newChatOption.iconImageView.image = isPinnedCoin ? UIImage(named: "unpinCoin") : UIImage(named: "pinCoin")
        newChatOption.iconImageView.setImageColor(color: .coinBaseBlue)
        newChatOption.optionTitleLabel.text = isPinnedCoin ? "Remove Pin" : "Pin Coin"
        newChatOption.optionDetailLabel.text = isPinnedCoin ? "Remove coin from the top of the list" : "Keep this at the top of the list"
        newChatOption.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(newChatOption)
        newChatOption.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        newChatOption.topAnchor.constraint(equalTo: coinContainer.bottomAnchor, constant: 14).isActive = true
        newChatOption.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        newChatOption.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        compareOption.optionButton.addTarget(self, action: #selector(didTapCompare), for: .touchUpInside)
        compareOption.iconImageView.image = UIImage(named: "compareCircles")
        compareOption.iconImageView.setImageColor(color: .coinBaseBlue)
        compareOption.optionTitleLabel.text = "Compare"
        compareOption.optionDetailLabel.text = "Compare this coin to another"
        compareOption.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(compareOption)
        compareOption.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        compareOption.topAnchor.constraint(equalTo: newChatOption.bottomAnchor, constant: 0).isActive = true
        compareOption.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        compareOption.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        newGroupOption.optionButton.addTarget(self, action: #selector(didTapSetAlert), for: .touchUpInside)
        newGroupOption.iconImageView.image = UIImage(named: "bell")
        newGroupOption.iconImageView.setImageColor(color: .coinBaseBlue)
        newGroupOption.optionTitleLabel.text = "Set Price Alert"
        newGroupOption.optionDetailLabel.text = "Get an alert when a certain price is hit"
        newGroupOption.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(newGroupOption)
        newGroupOption.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        newGroupOption.topAnchor.constraint(equalTo: compareOption.bottomAnchor, constant: 0).isActive = true
        newGroupOption.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        newGroupOption.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        shareOption.optionButton.addTarget(self, action: #selector(didTapShareWithFriends), for: .touchUpInside)
        shareOption.iconImageView.image = UIImage(named: "share")
        shareOption.iconImageView.setImageColor(color: .coinBaseBlue)
        shareOption.optionTitleLabel.text = "Share with Friends"
        shareOption.optionDetailLabel.text = "Give your friends a tip"
        shareOption.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(shareOption)
        shareOption.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        shareOption.topAnchor.constraint(equalTo: newGroupOption.bottomAnchor, constant: 0).isActive = true
        shareOption.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        shareOption.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        let checkAnimation = Animation.named("successCheck")
        successCheck.isUserInteractionEnabled = false
        successCheck.alpha = 0
        successCheck.loopMode = .playOnce
        successCheck.animation = checkAnimation
        successCheck.contentMode = .scaleAspectFill
        successCheck.backgroundColor = .clear
        successCheck.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(successCheck)
        successCheck.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor, constant: -50).isActive = true
        successCheck.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor).isActive = true
        successCheck.heightAnchor.constraint(equalToConstant: 100).isActive = true
        successCheck.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //successCheck.play()
        
        addedToWatchListLabel.alpha = 0
        addedToWatchListLabel.text = isPinnedCoin ? "Pin is removed!" : "Coin is pinned!"
        addedToWatchListLabel.textAlignment = .center
        addedToWatchListLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        addedToWatchListLabel.font = .sofiaRegular(ofSize: 20)
        addedToWatchListLabel.numberOfLines = 0
        addedToWatchListLabel.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(addedToWatchListLabel)
        addedToWatchListLabel.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor, constant: 0).isActive = true
        addedToWatchListLabel.topAnchor.constraint(equalTo: successCheck.bottomAnchor, constant: 5).isActive = true
        
        //print("😀😀😀 - \(successCheck.logHierarchyKeypaths()) - 😀😀😀")
    
        var i = 0
        let loadingLayers = ["ring 2.Oval 2.Stroke 1.Color", "ring 3.Oval 2.Stroke 1.Color", "boom.Oval 2 Copy.Fill 1.Color", "check.Group 1.Stroke 1.Color", "check 2.Group 1.Stroke 1.Color", "check 3.Group 1.Stroke 1.Color", "ring.Oval 2.Stroke 1.Color", "ring 2.Oval 2.Stroke 1.Color", "ring 3.Oval 2.Stroke 1.Color"]
        for layer in 1...loadingLayers.count {

            let keyPath = AnimationKeypath(keypath: "\(loadingLayers[layer - 1])")

            if i == 1 {
                let colorProvider = ColorValueProvider(UIColor.coinBaseBlue.withAlphaComponent(0.4).lottieColorValue)
                successCheck.setValueProvider(colorProvider, keypath: keyPath)
            } else {
                let colorProvider = ColorValueProvider(UIColor.coinBaseBlue.lottieColorValue)
                successCheck.setValueProvider(colorProvider, keypath: keyPath)
            }
            i += 1
        }
                
    }
    
}
