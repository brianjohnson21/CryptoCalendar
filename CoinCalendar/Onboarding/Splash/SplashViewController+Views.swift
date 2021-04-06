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
        blurEffectView.alpha = 0.8
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        iconsBGImageView.isHidden = true
        iconsBGImageView.image = UIImage(named: "iphoneXSplashBG")
        iconsBGImageView.contentMode = .scaleAspectFill
        iconsBGImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iconsBGImageView)
        iconsBGImageView.fillSuperview()
        
        getStartedButton.backgroundColor = .coinBaseBlue//.themePurple
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
        calendarLabel.text = "Gainz"
        calendarLabel.textAlignment = .left
        calendarLabel.textColor = .keyEventHeadlineColorModeLight
        calendarLabel.font = .sofiaSemiBold(ofSize: 50)
        calendarLabel.numberOfLines = 0
        calendarLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(calendarLabel)
        calendarLabel.leadingAnchor.constraint(equalTo: cryptoLabel.leadingAnchor, constant: 0).isActive = true
        calendarLabel.topAnchor.constraint(equalTo: cryptoLabel.bottomAnchor, constant: 10).isActive = true
        
        goingToMoonLabel.alpha = 0
        goingToMoonLabel.transform = CGAffineTransform(translationX: 0, y: 50)
        goingToMoonLabel.text = "We going to the moon! 🚀🌕"
        goingToMoonLabel.textAlignment = .left
        goingToMoonLabel.font = .sofiaRegular(ofSize: 15)
        goingToMoonLabel.textColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0)
        goingToMoonLabel.numberOfLines = 0
        goingToMoonLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(goingToMoonLabel)
        goingToMoonLabel.leadingAnchor.constraint(equalTo: calendarLabel.leadingAnchor, constant: 5).isActive = true
        goingToMoonLabel.topAnchor.constraint(equalTo: calendarLabel.bottomAnchor, constant: 10).isActive = true
        
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.coinBaseBlue.cgColor
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
        loginLabel.textColor = .coinBaseBlue//.themePurple
        loginLabel.font = .sofiaSemiBold(ofSize: 17)
        loginLabel.numberOfLines = 0
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addSubview(loginLabel)
        loginLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 16).isActive = true
        loginLabel.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor, constant: 0).isActive = true
        
        let whatWeDoLabelText = "Democratizing Crypto\nResearch to empower you to\nmake informed investment\ndecisions"
        whatWeDoLabel.setupLineHeight(myText: whatWeDoLabelText, myLineSpacing: 4)
        whatWeDoLabel.alpha = 0
        whatWeDoLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        whatWeDoLabel.textAlignment = .left
        whatWeDoLabel.font = .sofiaRegular(ofSize: 20)
        whatWeDoLabel.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1.0)
        whatWeDoLabel.numberOfLines = 0
        whatWeDoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(whatWeDoLabel)
        whatWeDoLabel.leadingAnchor.constraint(equalTo: goingToMoonLabel.leadingAnchor, constant: 0).isActive = true
        whatWeDoLabel.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -20).isActive = true
        
        createIcon(iconView: btcIcon, iconString: "btcSplash")
        btcIcon.heightAnchor.constraint(equalToConstant: 29).isActive = true
        btcIcon.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        createIcon(iconView: sushiIcon, iconString: "sushiSplash")
        sushiIcon.heightAnchor.constraint(equalToConstant: 22).isActive = true
        sushiIcon.widthAnchor.constraint(equalToConstant: 22).isActive = true
        
        createIcon(iconView: ethIcon, iconString: "ethSplash")
        ethIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ethIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        createIcon(iconView: thetaFuelIcon, iconString: "thetaFuelSplash")
        thetaFuelIcon.heightAnchor.constraint(equalToConstant: 29).isActive = true
        thetaFuelIcon.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        createIcon(iconView: uniSwapIcon, iconString: "uniSplash")
        uniSwapIcon.heightAnchor.constraint(equalToConstant: 45).isActive = true
        uniSwapIcon.widthAnchor.constraint(equalToConstant: 41).isActive = true
        
        createIcon(iconView: chainLinkIcon, iconString: "chainlinkSplash")
        chainLinkIcon.heightAnchor.constraint(equalToConstant: 38).isActive = true
        chainLinkIcon.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        createIcon(iconView: enjinIcon, iconString: "enjinSplash")
        enjinIcon.heightAnchor.constraint(equalToConstant: 29).isActive = true
        enjinIcon.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        createIcon(iconView: adaIcon, iconString: "cardanoSplash")
        adaIcon.heightAnchor.constraint(equalToConstant: 38).isActive = true
        adaIcon.widthAnchor.constraint(equalToConstant: 41).isActive = true
            
    }
    
    func createIcon(iconView: UIImageView, iconString: String) {
        iconView.alpha = 0
        iconView.image = UIImage(named: iconString)
        iconView.contentMode = .scaleAspectFill
        iconView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iconView)
        iconView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        iconView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
    }
    
    func setupLaunchTransition() {
        launchTransition.delegate = self
        launchTransition.layer.zPosition = 100
        launchTransition.alpha = 1.0
        launchTransition.spinner.isHidden = true
        launchTransition.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(launchTransition)
        launchTransition.fillSuperview()
        //let window = UIApplication.shared.keyWindow!
        //launchTransition.frame = window.bounds
        //window.addSubview(launchTransition)
    }
    
}

