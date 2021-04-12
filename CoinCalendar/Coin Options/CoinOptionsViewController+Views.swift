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
        mainHeight = mainContainer.heightAnchor.constraint(equalToConstant: 400)
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
        newChatOption.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 14).isActive = true
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
