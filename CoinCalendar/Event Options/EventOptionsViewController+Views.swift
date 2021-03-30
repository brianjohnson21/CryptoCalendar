//
//  EventOptionsViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import Foundation
import UIKit

extension EventOptionsViewController {
    
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
        mainContainer.heightAnchor.constraint(equalToConstant: 400).isActive = true
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
                
        //
        
        newChatOption.iconImageView.image = UIImage(named: "eye")
        newChatOption.optionTitleLabel.text = "Add to Watchlist"
        newChatOption.optionDetailLabel.text = "Lorem ipsum dolor"
        newChatOption.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(newChatOption)
        newChatOption.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        newChatOption.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 14).isActive = true
        newChatOption.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        newChatOption.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        newGroupOption.optionButton.addTarget(self, action: #selector(didTapSetAlert), for: .touchUpInside)
        newGroupOption.iconImageView.image = UIImage(named: "bell")
        newGroupOption.optionTitleLabel.text = "Set Alert"
        newGroupOption.optionDetailLabel.text = "Lorem ipsum dolor"
        newGroupOption.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(newGroupOption)
        newGroupOption.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        newGroupOption.topAnchor.constraint(equalTo: newChatOption.bottomAnchor, constant: 0).isActive = true
        newGroupOption.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        newGroupOption.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        //newChannelOption.optionButton.addTarget(self, action: #selector(didSelectNewChannel), for: .touchUpInside)
        newChannelOption.iconImageView.image = UIImage(named: "list")
        newChannelOption.optionTitleLabel.text = "Add to Custom List"
        newChannelOption.optionDetailLabel.text = "Lorem ipsum dolor"
        newChannelOption.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(newChannelOption)
        newChannelOption.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        newChannelOption.topAnchor.constraint(equalTo: newGroupOption.bottomAnchor, constant: 0).isActive = true
        newChannelOption.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        newChannelOption.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        shareOption.iconImageView.image = UIImage(named: "share")
        shareOption.optionTitleLabel.text = "Share with Friends"
        shareOption.optionDetailLabel.text = "Lorem ipsum dolor"
        shareOption.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(shareOption)
        shareOption.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        shareOption.topAnchor.constraint(equalTo: newChannelOption.bottomAnchor, constant: 0).isActive = true
        shareOption.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        shareOption.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        
    }
}
