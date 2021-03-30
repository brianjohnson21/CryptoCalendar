//
//  SplashViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import Foundation
import UIKit

extension SplashViewController {
    
    func setupViews() {
        
        mainContainer.backgroundColor = .red
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainContainer)
        mainContainer.fillSuperview()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.9
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        iconsBGImageView.image = UIImage(named: "iphoneXSplashBG")
        iconsBGImageView.contentMode = .scaleAspectFill
        iconsBGImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iconsBGImageView)
        iconsBGImageView.fillSuperview()
        
        getStartedButton.backgroundColor = .themePurple
        getStartedButton.layer.cornerRadius = 63/2
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(getStartedButton)
        getStartedLeading = getStartedButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: view.frame.width)
        getStartedLeading.isActive = true
        getStartedButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -72).isActive = true
        getStartedButton.widthAnchor.constraint(equalToConstant: 252).isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        
        getStartedLabel.text = "GET STARTED"
        getStartedLabel.textAlignment = .left
        getStartedLabel.textColor = .white
        getStartedLabel.font = .sofiaSemiBold(ofSize: 17)
        getStartedLabel.numberOfLines = 0
        getStartedLabel.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addSubview(getStartedLabel)
        getStartedLabel.leadingAnchor.constraint(equalTo: getStartedButton.leadingAnchor, constant: 33).isActive = true
        getStartedLabel.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor, constant: 0).isActive = true
        
        getStartedButton.addTarget(self, action: #selector(didTapGetStarted), for: .touchUpInside)
        getStartedArrowImageView.image = UIImage(named: "getStartedArrow")
        getStartedArrowImageView.contentMode = .scaleAspectFill
        getStartedArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addSubview(getStartedArrowImageView)
        getStartedArrowImageView.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor).isActive = true
        getStartedArrowImageView.trailingAnchor.constraint(equalTo: getStartedButton.trailingAnchor, constant: -14).isActive = true
        getStartedArrowImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        getStartedArrowImageView.widthAnchor.constraint(equalToConstant: 62).isActive = true
        
        cryptoLabel.alpha = 0
        cryptoLabel.transform = CGAffineTransform(translationX: 0, y: 50)
        cryptoLabel.text = "Crypto"
        cryptoLabel.textAlignment = .left
        cryptoLabel.textColor = .keyEventHeadlineColorModeLight
        cryptoLabel.font = .sofiaSemiBold(ofSize: 50)
        cryptoLabel.numberOfLines = 0
        cryptoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cryptoLabel)
        cryptoLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 29).isActive = true
        cryptoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 153).isActive = true
        
        calendarLabel.alpha = 0
        calendarLabel.transform = CGAffineTransform(translationX: 0, y: 50)
        calendarLabel.text = "Calendar"
        calendarLabel.textAlignment = .left
        calendarLabel.textColor = .keyEventHeadlineColorModeLight
        calendarLabel.font = .sofiaSemiBold(ofSize: 50)
        calendarLabel.numberOfLines = 0
        calendarLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(calendarLabel)
        calendarLabel.leadingAnchor.constraint(equalTo: cryptoLabel.leadingAnchor, constant: 0).isActive = true
        calendarLabel.topAnchor.constraint(equalTo: cryptoLabel.bottomAnchor, constant: 10).isActive = true
        
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.themePurple.cgColor
        loginButton.backgroundColor = .clear
        loginButton.layer.cornerRadius = 63/2
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginButton)
        loginButton.leadingAnchor.constraint(equalTo: getStartedButton.trailingAnchor, constant: 14).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor, constant: 0).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 152).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        
        loginLabel.text = "or Log in"
        loginLabel.textAlignment = .left
        loginLabel.textColor = .themePurple
        loginLabel.font = .sofiaSemiBold(ofSize: 17)
        loginLabel.numberOfLines = 0
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addSubview(loginLabel)
        loginLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 16).isActive = true
        loginLabel.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor, constant: 0).isActive = true
            
    }
    
}
