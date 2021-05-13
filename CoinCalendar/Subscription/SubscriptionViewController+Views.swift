//
//  SubscriptionViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/29/21.
//

import Foundation
import UIKit
import Lottie
import Comets

extension SubscriptionViewController {
    
    func setupViews() {
        
        mainScrollView.isScrollEnabled = false
        mainScrollView.backgroundColor = .coinBaseBlue
        mainScrollView.contentSize = CGSize(width: view.frame.width * 2, height: view.frame.height)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        
        setupComets()
        
        containerView.backgroundColor = .clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        dismissImageView.isHidden = true
        dismissImageView.image = UIImage(named: "searchX")
        dismissImageView.setImageColor(color: .white)
        dismissImageView.contentMode = .scaleAspectFill
        dismissImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dismissImageView)
        dismissImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 26).isActive = true
        dismissImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 51).isActive = true
        dismissImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        dismissImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        subscribeButton.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        subscribeButton.backgroundColor = .white
        //subscribeButton.setTitle("Try Free & Subscribe", for: .normal)
        //subscribeButton.setTitleColor(.keyEventHeadlineColorModeLight, for: .normal)
        //subscribeButton.titleLabel?.font = .sofiaSemiBold(ofSize: 22)
        subscribeButton.continueLabel.text = "Try Free & Subscribe"
        subscribeButton.layer.cornerRadius = 60/2
        subscribeButton.layer.masksToBounds = true
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subscribeButton)
        subscribeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40).isActive = true
        subscribeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
                        
        tryFreeLabel.isHidden = true
        tryFreeLabel.isUserInteractionEnabled = false
        tryFreeLabel.text = "Try Free & Subscribe"
        tryFreeLabel.font = .sofiaSemiBold(ofSize: 22)
        tryFreeLabel.textColor = .keyEventHeadlineColorModeLight
        tryFreeLabel.numberOfLines = 0
        tryFreeLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.addSubview(tryFreeLabel)
        tryFreeLabel.centerYAnchor.constraint(equalTo: subscribeButton.centerYAnchor, constant: 0).isActive = true
        tryFreeLabel.centerXAnchor.constraint(equalTo: subscribeButton.centerXAnchor, constant: 0).isActive = true
                
        subSuccessAnimation.isHidden = true
        let subSuccess = Animation.named("checkSuccessBurst")
        subSuccessAnimation.isUserInteractionEnabled = false
        subSuccessAnimation.alpha = 1.0
        subSuccessAnimation.animation = subSuccess
        subSuccessAnimation.loopMode = .loop
        subSuccessAnimation.animationSpeed = 1.0
        subSuccessAnimation.contentMode = .scaleAspectFill
        subSuccessAnimation.backgroundColor = .clear
        subSuccessAnimation.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.addSubview(subSuccessAnimation)
        subSuccessAnimation.centerXAnchor.constraint(equalTo: subscribeButton.centerXAnchor).isActive = true
        subSuccessAnimation.centerYAnchor.constraint(equalTo: subscribeButton.centerYAnchor, constant: 0).isActive = true
        subSuccessAnimation.heightAnchor.constraint(equalToConstant: 50).isActive = true
        subSuccessAnimation.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //subSuccessAnimation.play()
        
        promoCodeButton.addTarget(self, action: #selector(didTapPromoButton), for: .touchUpInside)
        promoCodeButton.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        promoCodeButton.titleLabel?.font = .sofiaSemiBold(ofSize: 15)
        promoCodeButton.layer.cornerRadius = 29/2
        promoCodeButton.layer.masksToBounds = true
        promoCodeButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(promoCodeButton)
        promoCodeButton.centerYAnchor.constraint(equalTo: dismissImageView.centerYAnchor, constant: 0).isActive = true
        promoCodeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        promoCodeButton.heightAnchor.constraint(equalToConstant: 29).isActive = true
        promoCodeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        promoCodeLabel.isUserInteractionEnabled = false
        promoCodeLabel.text = "Promo Code"
        promoCodeLabel.font = .sofiaSemiBold(ofSize: 15)
        promoCodeLabel.textColor = .white
        promoCodeLabel.numberOfLines = 0
        promoCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        promoCodeButton.addSubview(promoCodeLabel)
        promoCodeLabel.centerYAnchor.constraint(equalTo: promoCodeButton.centerYAnchor, constant: 0).isActive = true
        promoCodeLabel.centerXAnchor.constraint(equalTo: promoCodeButton.centerXAnchor, constant: 0).isActive = true
        
        appliedPromoContainer.layer.cornerRadius = 29/2
        appliedPromoContainer.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        appliedPromoContainer.alpha = 0
        appliedPromoContainer.isUserInteractionEnabled = false
        appliedPromoContainer.backgroundColor = UIColor(red: 160/255, green: 223/255, blue: 150/255, alpha: 1.0)
        appliedPromoContainer.translatesAutoresizingMaskIntoConstraints = false
        promoCodeButton.addSubview(appliedPromoContainer)
        appliedPromoContainer.fillSuperview()
                
        appliedPromoLabel.isUserInteractionEnabled = false
        appliedPromoLabel.text = "Code Applied!"
        appliedPromoLabel.font = .sofiaSemiBold(ofSize: 15)
        appliedPromoLabel.textColor = .white
        appliedPromoLabel.numberOfLines = 0
        appliedPromoLabel.translatesAutoresizingMaskIntoConstraints = false
        appliedPromoContainer.addSubview(appliedPromoLabel)
        appliedPromoLabel.centerYAnchor.constraint(equalTo: appliedPromoContainer.centerYAnchor, constant: 0).isActive = true
        appliedPromoLabel.centerXAnchor.constraint(equalTo: appliedPromoContainer.centerXAnchor, constant: 0).isActive = true
        
        let tryTimeLabelText = "Try 7 days free, then $4.99/month.\nCancel anytime."
        tryTimeLabel.setupLineHeight(myText: tryTimeLabelText, myLineSpacing: 4)
        tryTimeLabel.font = .sofiaSemiBold(ofSize: 16)
        tryTimeLabel.textColor = .white
        tryTimeLabel.numberOfLines = 0
        tryTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(tryTimeLabel)
        tryTimeLabel.leadingAnchor.constraint(equalTo: subscribeButton.leadingAnchor, constant: 10).isActive = true
        tryTimeLabel.bottomAnchor.constraint(equalTo: subscribeButton.topAnchor, constant: -23).isActive = true
        
        createBenefitLabel(benefitLabel: benefitOneLabel, benefitString: "Get key insights on which coins\nare bullish and bearish")
        benefitOneLabel.bottomAnchor.constraint(equalTo: tryTimeLabel.topAnchor, constant: -74).isActive = true
        
        createBenefitLabel(benefitLabel: benefitTwoLabel, benefitString: "See what’s trending and\nimportant highlights")
        benefitTwoLabel.bottomAnchor.constraint(equalTo: benefitOneLabel.topAnchor, constant: -21).isActive = true
        
        createBenefitLabel(benefitLabel: benefitThreeLabel, benefitString: "Keep track of news that pertains\nto specific coins")
        benefitThreeLabel.bottomAnchor.constraint(equalTo: benefitTwoLabel.topAnchor, constant: -21).isActive = true
        
        createBenefitLabel(benefitLabel: benefitFourLabel, benefitString: "Stay on top of key events\nhappening in crypto")
        benefitFourLabel.bottomAnchor.constraint(equalTo: benefitThreeLabel.topAnchor, constant: -21).isActive = true
        
        createBullet(labelToPin: benefitOneLabel)
        createBullet(labelToPin: benefitTwoLabel)
        createBullet(labelToPin: benefitThreeLabel)
        createBullet(labelToPin: benefitFourLabel)
        
        freeTrialContainer.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        freeTrialContainer.layer.cornerRadius = 29/2
        freeTrialContainer.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(freeTrialContainer)
        freeTrialContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 26).isActive = true
        freeTrialContainer.bottomAnchor.constraint(equalTo: benefitFourLabel.topAnchor, constant: -31).isActive = true
        freeTrialContainer.heightAnchor.constraint(equalToConstant: 29).isActive = true
        freeTrialContainer.widthAnchor.constraint(equalToConstant: 169).isActive = true
        
        freeTrialLabel.text = "7 Day Free Trial"
        freeTrialLabel.textColor = .white
        freeTrialLabel.font = .sofiaSemiBold(ofSize: 15)
        freeTrialLabel.textAlignment = .left
        freeTrialLabel.numberOfLines = 0
        freeTrialLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(freeTrialLabel)
        freeTrialLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 67).isActive = true
        freeTrialLabel.bottomAnchor.constraint(equalTo: benefitFourLabel.topAnchor, constant: -37).isActive = true
        
        createBullet(labelToPin: freeTrialLabel)
        
        freeTrialContainer.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        freeTrialContainer.layer.cornerRadius = 29/2
        freeTrialContainer.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(freeTrialContainer)
        freeTrialContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 26).isActive = true
        freeTrialContainer.trailingAnchor.constraint(equalTo: freeTrialLabel.trailingAnchor, constant: 1).isActive = true
        freeTrialContainer.centerYAnchor.constraint(equalTo: freeTrialLabel.centerYAnchor, constant: -0.5).isActive = true
        //freeTrialContainer.bottomAnchor.constraint(equalTo: benefitFourLabel.topAnchor, constant: -31).isActive = true
        freeTrialContainer.heightAnchor.constraint(equalToConstant: 29).isActive = true
        //freeTrialContainer.widthAnchor.constraint(equalToConstant: 169).isActive = true
        
        dividerLine.backgroundColor = .white
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dividerLine)
        dividerLine.leadingAnchor.constraint(equalTo: freeTrialContainer.leadingAnchor, constant: 0).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: freeTrialContainer.topAnchor, constant: -13).isActive = true
        dividerLine.widthAnchor.constraint(equalToConstant: 151).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        titleLabel.text = "Get Full Access"
        titleLabel.textColor = .white
        titleLabel.font = .sofiaRegular(ofSize: 22)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: dividerLine.leadingAnchor, constant: 0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: dividerLine.topAnchor, constant: -13).isActive = true
        
        let lottieContainer = UIView()
        lottieContainer.backgroundColor = .clear
        lottieContainer.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(lottieContainer)
        lottieContainer.topAnchor.constraint(equalTo: dismissImageView.bottomAnchor, constant: 0).isActive = true
        lottieContainer.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0).isActive = true
        lottieContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        lottieContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        let checkAnimation = Animation.named("coinsRotating")
        checkmarkLottie.isHidden = true
        checkmarkLottie.isUserInteractionEnabled = false
        checkmarkLottie.alpha = 1.0
        checkmarkLottie.animation = checkAnimation
        checkmarkLottie.loopMode = .loop
        checkmarkLottie.animationSpeed = 0.35
        checkmarkLottie.contentMode = .scaleAspectFill
        checkmarkLottie.backgroundColor = .clear
        checkmarkLottie.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(checkmarkLottie)
        checkmarkLottie.centerXAnchor.constraint(equalTo: lottieContainer.centerXAnchor).isActive = true
        checkmarkLottie.centerYAnchor.constraint(equalTo: lottieContainer.centerYAnchor, constant: 0).isActive = true
        checkmarkLottie.heightAnchor.constraint(equalToConstant: 120).isActive = true
        checkmarkLottie.widthAnchor.constraint(equalToConstant: 120).isActive = true
        checkmarkLottie.play()
        
        //confettiLottie
        
        let confettiAnimation = Animation.named("Confetti2")
        confettiLottie.isUserInteractionEnabled = false
        confettiLottie.alpha = 1.0
        confettiLottie.animation = confettiAnimation
        confettiLottie.loopMode = .playOnce
        confettiLottie.animationSpeed = 1.0
        confettiLottie.contentMode = .scaleAspectFill
        confettiLottie.backgroundColor = .clear
        confettiLottie.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(confettiLottie)
        confettiLottie.fillSuperview()
        
        confettiLottieTwo.transform = CGAffineTransform(scaleX: -1, y: 1);
        confettiLottieTwo.isUserInteractionEnabled = false
        confettiLottieTwo.alpha = 1.0
        confettiLottieTwo.animation = confettiAnimation
        confettiLottieTwo.loopMode = .playOnce
        confettiLottieTwo.animationSpeed = 1.0
        confettiLottieTwo.contentMode = .scaleAspectFill
        confettiLottieTwo.backgroundColor = .clear
        confettiLottieTwo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(confettiLottieTwo)
        confettiLottieTwo.fillSuperview()
        
    }
    
    func createBenefitLabel(benefitLabel: UILabel, benefitString: String) {
        benefitLabel.setupLineHeight(myText: benefitString, myLineSpacing: 4)
        benefitLabel.textColor = .white
        benefitLabel.font = .sofiaLight(ofSize: 15)
        benefitLabel.textAlignment = .left
        benefitLabel.numberOfLines = 0
        benefitLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(benefitLabel)
        benefitLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 67).isActive = true
    }
    
    func createBullet(labelToPin: UILabel) {
        let bulletImageView = UIImageView()
        bulletImageView.image = UIImage(named: "check-circle")
        bulletImageView.contentMode = .scaleAspectFill
        bulletImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(bulletImageView)
        bulletImageView.trailingAnchor.constraint(equalTo: labelToPin.leadingAnchor, constant: -15).isActive = true
        bulletImageView.topAnchor.constraint(equalTo: labelToPin.topAnchor, constant: -2).isActive = true
    }
    
    func setupPromoContainer() {
                
        promoContainer.backgroundColor = .clear
        promoContainer.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(promoContainer)
        promoContainer.leadingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        promoContainer.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        promoContainer.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        promoContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        backImageView.image = UIImage(named: "backWhiteArrow")
        backImageView.contentMode = .scaleAspectFill
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        promoContainer.addSubview(backImageView)
        backImageView.leadingAnchor.constraint(equalTo: promoContainer.leadingAnchor, constant: 26).isActive = true
        backImageView.topAnchor.constraint(equalTo: promoContainer.topAnchor, constant: 51).isActive = true
        backImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        backImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        backButton.backgroundColor = .clear
        backButton.translatesAutoresizingMaskIntoConstraints = false
        promoContainer.addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: promoContainer.leadingAnchor, constant: 0).isActive = true
        backButton.topAnchor.constraint(equalTo: promoContainer.topAnchor, constant: 0).isActive = true
        backButton.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: 30).isActive = true
        backButton.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 30).isActive = true
        
        promoCodeContainer.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        promoCodeContainer.layer.borderColor = UIColor.white.cgColor
        promoCodeContainer.layer.borderWidth = 1
        promoCodeContainer.layer.cornerRadius = 4
        promoCodeContainer.translatesAutoresizingMaskIntoConstraints = false
        promoContainer.addSubview(promoCodeContainer)
        promoCodeContainer.leadingAnchor.constraint(equalTo: promoContainer.leadingAnchor, constant: 45).isActive = true
        promoCodeContainer.trailingAnchor.constraint(equalTo: promoContainer.trailingAnchor, constant: -45).isActive = true
        promoCodeContainer.centerYAnchor.constraint(equalTo: promoContainer.centerYAnchor, constant: -50).isActive = true
        promoCodeContainer.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        var placeHolder = NSMutableAttributedString()
        let Name  = "Promo code"
        placeHolder = NSMutableAttributedString(string:Name, attributes: [NSAttributedString.Key.font: UIFont.sofiaSemiBold(ofSize: 22)])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white.withAlphaComponent(0.85), range:NSRange(location:0,length:Name.count))
        promoCodeTextField.attributedPlaceholder = placeHolder
        promoCodeTextField.autocorrectionType = .no
        promoCodeTextField.font = .sofiaSemiBold(ofSize: 22)
        promoCodeTextField.textColor = .white
        promoCodeTextField.tintColor = .white
        promoCodeTextField.returnKeyType = .done
        promoCodeTextField.delegate = self
        promoCodeTextField.textAlignment = .center
        promoCodeTextField.tag = 1
        promoCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        promoCodeContainer.addSubview(promoCodeTextField)
        promoCodeTextField.leadingAnchor.constraint(equalTo: promoCodeContainer.leadingAnchor, constant: 18).isActive = true
        promoCodeTextField.trailingAnchor.constraint(equalTo: promoCodeContainer.trailingAnchor, constant: -8).isActive = true
        promoCodeTextField.topAnchor.constraint(equalTo: promoCodeContainer.topAnchor, constant: 0).isActive = true
        promoCodeTextField.bottomAnchor.constraint(equalTo: promoCodeContainer.bottomAnchor, constant: 0).isActive = true
        
        promoSubmitButton.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)
        promoSubmitButton.addTarget(self, action: #selector(didTapSubmit), for: .touchUpInside)
        promoSubmitButton.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        promoSubmitButton.setTitle("Submit", for: .normal)
        promoSubmitButton.setTitleColor(.keyEventHeadlineColorModeLight, for: .normal)
        promoSubmitButton.titleLabel?.font = .sofiaSemiBold(ofSize: 22)
        promoCodeTextField.inputAccessoryView = promoSubmitButton
        
        let successCheck = Animation.named("successCheck")
        successCheckLottie.isUserInteractionEnabled = false
        successCheckLottie.alpha = 0
        successCheckLottie.animation = successCheck
        successCheckLottie.loopMode = .playOnce
        successCheckLottie.animationSpeed = 1.0
        successCheckLottie.contentMode = .scaleAspectFill
        successCheckLottie.backgroundColor = .clear
        successCheckLottie.translatesAutoresizingMaskIntoConstraints = false
        promoContainer.addSubview(successCheckLottie)
        successCheckLottie.centerXAnchor.constraint(equalTo: promoCodeContainer.centerXAnchor).isActive = true
        successCheckLottie.centerYAnchor.constraint(equalTo: promoCodeContainer.centerYAnchor, constant: 0).isActive = true
        successCheckLottie.heightAnchor.constraint(equalToConstant: 100).isActive = true
        successCheckLottie.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //successCheckLottie.play()
    }
    
}

//MARK: COMENTS

extension SubscriptionViewController {
    func setupComets() {
        
        cometsLayer.isUserInteractionEnabled = false
        cometsLayer.backgroundColor = .clear
        cometsLayer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cometsLayer)
        cometsLayer.fillSuperview()
        
        // Customize your comet
        let width: Double = 375//self.bounds.width
        let height: Double = 812//self.bounds.height
        let comets = [Comet(startPoint: CGPoint(x: 100, y: 0),
                            endPoint: CGPoint(x: 0, y: 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0.4 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.8 * width),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0.8 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.2 * width),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: width, y: 0.2 * height),
                            endPoint: CGPoint(x: 0, y: 0.25 * height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0, y: height - 0.8 * width),
                            endPoint: CGPoint(x: 0.6 * width, y: height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: width - 100, y: height),
                            endPoint: CGPoint(x: width, y: height - 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0, y: 0.8 * height),
                            endPoint: CGPoint(x: width, y: 0.75 * height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white)]

        // draw line track and animate
        for comet in comets {
            cometsLayer.layer.addSublayer(comet.drawLine())
            cometsLayer.layer.addSublayer(comet.animate())
        }
    }
}
