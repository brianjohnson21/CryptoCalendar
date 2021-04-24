//
//  SplashTwoViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/15/21.
//

import Foundation
import UIKit
import KDCircularProgress
import CHIPageControl
import Lottie

extension SplashTwoViewController {
    
    func modifyConstraints() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            cryptoLabelTop = 153
        case .iphone78() :
            cryptoLabelTop = 153
        case .iphone78Plus() :
            cryptoLabelTop = 128
        case .iphone11() :
            cryptoLabelTop = 153
        default:
            cryptoLabelTop = 153
        }
    }
    
    func setupViews() {
        
        mainContainer.backgroundColor = .red
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainContainer)
        mainContainer.fillSuperview()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.4
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
        
        circularButton.layer.zPosition = 2
        circularButton.layer.shadowColor = UIColor.black.cgColor
        circularButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        circularButton.layer.shadowOpacity = 0.15
        circularButton.layer.shadowRadius = 4
        circularButton.addTarget(self, action: #selector(circleButtonTapped), for: .touchUpInside)
        circularButton.backgroundColor = .coinBaseBlue
        circularButton.layer.cornerRadius = 77/2
        circularButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(circularButton)
        circularButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32).isActive = true
        circularButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -57).isActive = true
        circularButton.heightAnchor.constraint(equalToConstant: 77).isActive = true
        circularButton.widthAnchor.constraint(equalToConstant: 77).isActive = true
        
        whiteCirculeView.isUserInteractionEnabled = false
        whiteCirculeView.backgroundColor = .white
        whiteCirculeView.layer.cornerRadius = 77/2
        whiteCirculeView.translatesAutoresizingMaskIntoConstraints = false
        circularButton.addSubview(whiteCirculeView)
        whiteCirculeView.fillSuperview()
        
        let buttonBlurEffect = UIBlurEffect(style: .regular)
        let buttonBlurredEffectView = UIVisualEffectView(effect: buttonBlurEffect)
        buttonBlurredEffectView.frame = circularButton.bounds
        circularButton.addSubview(buttonBlurredEffectView)
        
        let checkAnimation = Animation.named("pulseStart")
        pulseLottie.isUserInteractionEnabled = false
        pulseLottie.alpha = 1.0
        pulseLottie.animation = checkAnimation
        pulseLottie.contentMode = .scaleAspectFill
        pulseLottie.animationSpeed = 0.5
        //pulseLottie.loopMode = .loop
        pulseLottie.backgroundColor = .clear
        pulseLottie.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pulseLottie)
        pulseLottie.centerYAnchor.constraint(equalTo: circularButton.centerYAnchor).isActive = true
        pulseLottie.centerXAnchor.constraint(equalTo: circularButton.centerXAnchor).isActive = true
        pulseLottie.heightAnchor.constraint(equalToConstant: 150).isActive = true
        pulseLottie.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pulseLottie.play(fromFrame: 0, toFrame: 30, loopMode: .loop) { (success) in
            //
        }
        //print("😀😀😀 - \(pulseLottie.logHierarchyKeypaths()) - 😀😀😀")
        
        var i = 0
        let loadingLayers = ["Shape Layer 1.Ellipse 1.Fill 1.Color", "w2.Ellipse 1.Fill 1.Color", "w1.Ellipse 1.Fill 1.Color"]
        for layer in 1...loadingLayers.count {

            let keyPath = AnimationKeypath(keypath: "\(loadingLayers[layer - 1])")

            if i == 0 {
                let colorProvider = ColorValueProvider(UIColor.clear.lottieColorValue)
                pulseLottie.setValueProvider(colorProvider, keypath: keyPath)
            } else {
                let colorProvider = ColorValueProvider(UIColor.coinBaseBlue.lottieColorValue)
                pulseLottie.setValueProvider(colorProvider, keypath: keyPath)
            }
            i += 1
        }
    
        
        blueArrow.isUserInteractionEnabled = false
        blueArrow.image = UIImage(named: "blurArrowRight")
        blueArrow.contentMode = .scaleAspectFill
        blueArrow.translatesAutoresizingMaskIntoConstraints = false
        circularButton.addSubview(blueArrow)
        blueArrow.centerXAnchor.constraint(equalTo: circularButton.centerXAnchor).isActive = true
        blueArrow.centerYAnchor.constraint(equalTo: circularButton.centerYAnchor).isActive = true
        blueArrow.heightAnchor.constraint(equalToConstant: 35).isActive = true
        blueArrow.widthAnchor.constraint(equalToConstant: 35).isActive = true
                
        progress = KDCircularProgress()
        progress.layer.zPosition = 2
        progress.isUserInteractionEnabled = false
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.2
        progress.clockwise = true
        progress.trackColor = .clear
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.glowMode = .noGlow
        progress.glowAmount = 0.9
        progress.roundedCorners = true
        progress.set(colors: .coinBaseBlue)
        progress.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progress)
        progress.centerXAnchor.constraint(equalTo: circularButton.centerXAnchor).isActive = true
        progress.centerYAnchor.constraint(equalTo: circularButton.centerYAnchor).isActive = true
        progress.heightAnchor.constraint(equalToConstant: 105).isActive = true
        progress.widthAnchor.constraint(equalToConstant: 105).isActive = true
        
        progress.animate(toAngle: 0, duration: 3.0) { (success) in
            print("did this 🤟🤟🤟")
        }
                
        pageControl.numberOfPages = 5
        pageControl.padding = 10
        pageControl.radius = 4
        pageControl.currentPageTintColor = .coinBaseBlue
        pageControl.tintColor = UIColor(red: 204/255, green: 207/255, blue: 207/255, alpha: 1.0)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pageControl)
        pageControl.centerYAnchor.constraint(equalTo: circularButton.centerYAnchor, constant: 11).isActive = true
        //pageControl.leadingAnchor.constraint(equalTo: signUpTitleLabel.leadingAnchor).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 48).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        //
        
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
        cryptoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: cryptoLabelTop).isActive = true
        
        calendarLabel.alpha = 0
        calendarLabel.transform = CGAffineTransform(translationX: 0, y: 50)
        calendarLabel.text = "Track"
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
        
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
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
        
        createBenefitContainer(benefitImageView: benefitOneImageView,
                               benefitImage: "phoneEmpty",
                               benefitTitleLabel: benefitOneTitleLabel,
                               benefitTitle: "Never miss an opportunity",
                               benefitDetailLabel: benefitOneDetailLabel,
                               benefitDetail: "Get much more pertinent and detailed information about the coins you are watching or currently invested into")
        
        createBenefitContainer(benefitImageView: benefitTwoImageView,
                               benefitImage: "phoneEmpty",
                               benefitTitleLabel: benefitTwoTitleLabel,
                               benefitTitle: "Manage your entire portfolio",
                               benefitDetailLabel: benefitTwoDetailLabel,
                               benefitDetail: "Easily stay on top of all your crypto investments in one centralized location")
        
        createBenefitContainer(benefitImageView: benefitThreeImageView,
                               benefitImage: "phoneEmpty",
                               benefitTitleLabel: benefitThreeTitleLabel,
                               benefitTitle: "Sophisticated price alerts",
                               benefitDetailLabel: benefitThreeDetailLabel,
                               benefitDetail: "Set and receive custom price alerts for all the coins you are watching so you can never miss an opportunity")
        
        createBenefitContainer(benefitImageView: benefitFourImageView,
                               benefitImage: "phoneEmpty",
                               benefitTitleLabel: benefitFourTitleLabel,
                               benefitTitle: "Stay on top of key events",
                               benefitDetailLabel: benefitFourDetailLabel,
                               benefitDetail: "Major events in the crypto industry can play a vital role in the price of an asset growing exponentially. CryptoBase makes it easy to never miss a key event.")
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
    
    func createBenefitContainer(benefitImageView: UIImageView, benefitImage: String, benefitTitleLabel: UILabel, benefitTitle: String, benefitDetailLabel: UILabel, benefitDetail: String) {
                
        benefitImageView.alpha = 0
        benefitImageView.transform = CGAffineTransform(translationX: 100, y: 0)
        benefitImageView.contentMode = .scaleAspectFill
        benefitImageView.image = UIImage(named: benefitImage)
        benefitImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(benefitImageView)
        benefitImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        benefitImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 97).isActive = true
        benefitImageView.heightAnchor.constraint(equalToConstant: 355).isActive = true
        benefitImageView.widthAnchor.constraint(equalToConstant: 178).isActive = true
        
        benefitTitleLabel.transform = CGAffineTransform(translationX: 100, y: 0)
        benefitTitleLabel.alpha = 0
        benefitTitleLabel.text = benefitTitle
        benefitTitleLabel.textAlignment = .center
        benefitTitleLabel.font = .sofiaMedium(ofSize: 21)
        benefitTitleLabel.textColor = .black
        benefitTitleLabel.numberOfLines = 0
        benefitTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(benefitTitleLabel)
        benefitTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 26).isActive = true
        benefitTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -26).isActive = true
        benefitTitleLabel.topAnchor.constraint(equalTo: benefitImageView.bottomAnchor, constant: 58).isActive = true
        
        benefitDetailLabel.alpha = 0
        benefitDetailLabel.transform = CGAffineTransform(translationX: 100, y: 0)
        benefitDetailLabel.setupLineHeight(myText: benefitDetail, myLineSpacing: 4)
        benefitDetailLabel.textAlignment = .center
        benefitDetailLabel.font = .sofiaLight(ofSize: 14)
        benefitDetailLabel.textColor = UIColor(red: 10/255, green: 10/255, blue: 10/255, alpha: 1.0)
        benefitDetailLabel.numberOfLines = 0
        benefitDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(benefitDetailLabel)
        benefitDetailLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 26).isActive = true
        benefitDetailLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -26).isActive = true
        benefitDetailLabel.topAnchor.constraint(equalTo: benefitTitleLabel.bottomAnchor, constant: 9).isActive = true
        
    }
    
}

