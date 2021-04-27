//
//  WelcomeViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/6/21.
//

import Foundation
import UIKit

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
        
        pageControl.numberOfPages = 5
        pageControl.padding = 4
        pageControl.radius = 3
        pageControl.currentPageTintColor = .coinBaseBlue
        pageControl.tintColor = UIColor.coinBaseBlue.withAlphaComponent(0.42)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(pageControl)
        pageControl.centerYAnchor.constraint(equalTo: downArrow.centerYAnchor, constant: 0).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: cardContainer.trailingAnchor, constant: -26).isActive = true
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
        
    }
    
    func createViews() {
        
        createMessages(messageView: welcomeContainer,
                       emoji: "👋",
                       titleString: "Welcome to CryptoGainz",//Welcome to Squad Up
                       detailString: "Here you can interact with your friends, engage with\nyour favorite users, join communities of like\nminded people and much, much more!") //"Welcome to our community where you can play the hottest games with your favorite (verified) gamers, celebrities, and content users!
        
        createMessages(messageView: discoverContainer,
                       emoji: "🔍",
                       titleString: "Discover",
                       detailString: "Quickly and easily connect with friends and\ncommunities of people with thousands joining daily!")
        
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
                       titleString: "Have fun",
                       detailString: "Once you are in, just relax, be respectful and courteous\nto everyone in the community and have fun!")
        
        
        discoverContainer.alpha = 0
        discoverContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        requestContainer.alpha = 0
        requestContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        encryptionContainer.alpha = 0
        encryptionContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        playContainer.alpha = 0
        playContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
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
        
    }
    
    
}

