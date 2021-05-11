//
//  WelcomeViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/6/21.
//

import Foundation
import UIKit
import Lottie

extension WelcomeViewController {
    
    func modifyConstraints() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        switch screenHeight {
        case .iphone5() :
            cardHeight = 430
        case .iphone78() :
            cardHeight = 400
            buttonBottom = -21
        case .iphone78Plus() :
            cardHeight = 400
            buttonBottom = -21
        case .iphone11Max() :
            cardHeight = 430
        default:
            cardHeight = 430
        }
    }
    
    func setupContainer() {
        
        self.view.backgroundColor = .clear
        
        opacityLayer.backgroundColor = .black
        opacityLayer.alpha = 0
        opacityLayer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(opacityLayer)
        opacityLayer.fillSuperview()
        
        cardContainer.backgroundColor = .white
        cardContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cardContainer.layer.cornerRadius = 24
        cardContainer.layer.masksToBounds = true
        cardContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cardContainer)
        cardContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        cardContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        cardContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        cardContainer.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
        cardContainer.transform = CGAffineTransform(translationX: 0, y: cardHeight)
        
        downArrow.image = UIImage(named: "downArrow")
        downArrow.contentMode = .scaleAspectFill
        downArrow.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(downArrow)
        downArrow.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 22).isActive = true
        downArrow.topAnchor.constraint(equalTo: cardContainer.topAnchor, constant: 14).isActive = true
        downArrow.heightAnchor.constraint(equalToConstant: 24).isActive = true
        downArrow.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        logoImageView.isHidden = false
        logoImageView.image = UIImage(named: "lynkBlueRed")
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(logoImageView)
        logoImageView.topAnchor.constraint(equalTo: cardContainer.topAnchor, constant: 14).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: cardContainer.centerXAnchor).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 31).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 33).isActive = true
        
        pageControl.numberOfPages = 2
        pageControl.padding = 4
        pageControl.radius = 3
        pageControl.currentPageTintColor = .coinBaseBlue
        pageControl.tintColor = UIColor.coinBaseBlue.withAlphaComponent(0.42)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(pageControl)
        pageControl.centerYAnchor.constraint(equalTo: downArrow.centerYAnchor, constant: 0).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -20).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        nextButton.isUserInteractionEnabled = true
        nextButton.priceLabel.text = "Next"
        nextButton.purpleBG.backgroundColor = .coinBaseBlue
        nextButton.priceLabel.textColor = .white
        nextButton.updatedPriceLabel.text = "Let's go!"
        nextButton.updatedPriceLabel.textColor = .white
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(nextButton)
        nextButton.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 26).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -26).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: buttonBottom).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        
        //let swipeContentSize = view.frame.width - (26 * 2)
        //nextButton.swipeScrollView.contentSize = CGSize(width: swipeContentSize, height: 63)
        
//        let swipeSize = (view.frame.width - 52) * 2
//        swipeView.swipeScrollView.contentSize = CGSize(width: swipeSize, height: 63)
//        swipeView.swipeScrollView.contentOffset.x = CGFloat(swipeSize / 2)
        swipeView.isHidden = true
        swipeView.swipeScrollView.delegate = self
        swipeView.alpha = 0
        swipeView.layer.cornerRadius = 10
        swipeView.backgroundColor = .coinBaseBlue
        swipeView.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(swipeView)
        swipeView.leadingAnchor.constraint(equalTo: nextButton.leadingAnchor).isActive = true
        swipeView.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor).isActive = true
        swipeView.topAnchor.constraint(equalTo: nextButton.topAnchor).isActive = true
        swipeView.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor).isActive = true
        
        //
        
        successView.isUserInteractionEnabled = false
        successView.layer.cornerRadius = 10
        successView.alpha = 0
        successView.layer.zPosition = 100
        successView.backgroundColor = UIColor(red: 42/255, green: 218/255, blue: 112/255, alpha: 1.0)
        successView.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(successView)
        successView.leadingAnchor.constraint(equalTo: nextButton.leadingAnchor).isActive = true
        successView.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor).isActive = true
        successView.topAnchor.constraint(equalTo: nextButton.topAnchor).isActive = true
        successView.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor).isActive = true
        
        let checkAnimation = Animation.named("checkSuccessBurst")
        checkmarkLottie.isUserInteractionEnabled = false
        checkmarkLottie.alpha = 1.0
        checkmarkLottie.animation = checkAnimation
        checkmarkLottie.loopMode = .playOnce
        checkmarkLottie.contentMode = .scaleAspectFill
        checkmarkLottie.backgroundColor = .clear
        checkmarkLottie.translatesAutoresizingMaskIntoConstraints = false
        successView.addSubview(checkmarkLottie)
        checkmarkLottie.centerXAnchor.constraint(equalTo: successView.centerXAnchor).isActive = true
        checkmarkLottie.centerYAnchor.constraint(equalTo: successView.centerYAnchor, constant: 0).isActive = true
        checkmarkLottie.heightAnchor.constraint(equalToConstant: 50).isActive = true
        checkmarkLottie.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        //print("😀😀😀 - \(checkmarkLottie.logHierarchyKeypaths()) - 😀😀😀")
        
        var i = 0
        let loadingLayers = ["Check.Shape 1.Stroke 1.Color"]
        for layer in 1...loadingLayers.count {
            let keyPath = AnimationKeypath(keypath: "\(loadingLayers[layer - 1])")
            let colorProvider = ColorValueProvider(UIColor(red: 42/255, green: 218/255, blue: 112/255, alpha: 1.0).lottieColorValue)
            checkmarkLottie.setValueProvider(colorProvider, keypath: keyPath)
            i += 1
        }
        
        
        
    }
    
    func createViews() {
        
        createMessages(messageView: welcomeContainer,
                       emoji: "🚀🌕",
                       titleString: "Expert Trades",//Welcome to Squad Up
                       detailString: "Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua. Ut enim ad minim veniam.") //"Welcome to our community where you can play the hottest games with your favorite (verified) gamers, celebrities, and content users!
        
        createMessages(messageView: discoverContainer,
                       emoji: "⚠️⛔️",
                       titleString: "Not Financial Advice",
                       detailString: "Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do privacy policy incididunt ut labore et\ndolore magna aliqua. Ut enim terms of use.")
        
        createMessages(messageView: requestContainer,
                       emoji: "🤟💬🎥",
                       titleString: "Interact",
                       detailString: "Chat 1-on-1, create private groups, or even\nbroadcast your message to an audience of\nunlimited people by creating a channel!")
        
        createMessages(messageView: encryptionContainer,
                       emoji: "🔒🤐",
                       titleString: "End-To-End Encryption",
                       detailString: "Your conversations are kept private.\nPlain and simple as it should be.")
        
        createMessages(messageView: playContainer,
                       emoji: "🎉 🎊",
                       titleString: "Invest at your own risk",
                       detailString: "Once you are in, just relax, be respectful and courteous\nto everyone in the community and have fun!")
        
        
        discoverContainer.alpha = 0
        discoverContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        requestContainer.alpha = 0
        requestContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        encryptionContainer.alpha = 0
        encryptionContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        playContainer.alpha = 0
        playContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        termsButton.isUserInteractionEnabled = false
        termsButton.addTarget(self, action: #selector(didTapViewSource(sender:)), for: .touchUpInside)
        termsButton.tag = 1
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(termsButton)
        termsButton.trailingAnchor.constraint(equalTo: discoverContainer.trailingAnchor, constant: 0).isActive = true
        termsButton.bottomAnchor.constraint(equalTo: discoverContainer.bottomAnchor, constant: 0).isActive = true
        termsButton.leadingAnchor.constraint(equalTo: discoverContainer.leadingAnchor, constant: 0).isActive = true
        termsButton.topAnchor.constraint(equalTo: discoverContainer.topAnchor).isActive = true
        
    }
    
    func createMessages(messageView: UIView, emoji: String, titleString: String, detailString: String) {
        
        messageView.backgroundColor = .clear
        messageView.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(messageView)
        messageView.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor).isActive = true
        messageView.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: cardContainer.topAnchor, constant: 77).isActive = true
        messageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        let emojiLabel = UILabel()
        emojiLabel.text = emoji
        emojiLabel.textAlignment = .center
        emojiLabel.font = .sofiaSemiBold(ofSize: 28)
        emojiLabel.numberOfLines = 0
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        messageView.addSubview(emojiLabel)
        emojiLabel.centerXAnchor.constraint(equalTo: messageView.centerXAnchor).isActive = true
        emojiLabel.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 31).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = titleString
        titleLabel.textAlignment = .center
        titleLabel.textColor = .keyEventHeadlineColorModeLight
        titleLabel.font = .sofiaSemiBold(ofSize: 17)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: messageView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 19).isActive = true
        
        let detailLabel = UILabel()
        detailLabel.setupLineHeight(myText: detailString, myLineSpacing: 7)
        detailLabel.textAlignment = .center
        detailLabel.textColor = UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.6)
        detailLabel.font = .sofiaRegular(ofSize: 13)
        detailLabel.numberOfLines = 0
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        messageView.addSubview(detailLabel)
        //detailLabel.centerXAnchor.constraint(equalTo: messageView.centerXAnchor).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 0).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: 0).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        
        //let notFinancialAdviceText = "By tapping continue, you are agreeing to our\nprivacy policy and terms of use"
        
        let text = (detailLabel.text)!
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "privacy policy")
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        let range2 = (text as NSString).range(of: "terms of use")
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range2)
        detailLabel.attributedText = underlineAttriString
        
    }
    
    
}

