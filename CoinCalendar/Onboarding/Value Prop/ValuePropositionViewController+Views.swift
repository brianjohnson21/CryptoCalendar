//
//  ValuePropositionViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/15/21.
//

import Foundation
import UIKit
import CHIPageControl

extension ValuePropositionViewController {
    
    func setupTransitionViews() {
                    
        containerView.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        containerView.alpha = 0
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView)
        containerView.fillSuperview()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.8
        blurEffectView.frame = containerView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerView.addSubview(blurEffectView)
        
        setupContent()
        
        getStartedButton.addTarget(self, action: #selector(goToNextStep), for: .touchUpInside)
        getStartedButton.backgroundColor = .coinBaseBlue
        getStartedButton.layer.cornerRadius = 63/2
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(getStartedButton)
        getStartedLeading = getStartedButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 18)
        getStartedLeading.isActive = true
        getStartedBottom = getStartedButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -72)
        getStartedBottom.isActive = true
        getStartedWidth = getStartedButton.widthAnchor.constraint(equalToConstant: 252)
        getStartedWidth.isActive = true
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
                
        getStartedArrowImageView.image = UIImage(named: "getStartedArrow")
        getStartedArrowImageView.contentMode = .scaleAspectFill
        getStartedArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addSubview(getStartedArrowImageView)
        getStartedArrowImageView.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor).isActive = true
        getStartedArrowImageView.trailingAnchor.constraint(equalTo: getStartedButton.trailingAnchor, constant: -14).isActive = true
        getStartedArrowImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        getStartedArrowImageView.widthAnchor.constraint(equalToConstant: 62).isActive = true
        
        nextLabel.alpha = 0
        nextLabel.text = "NEXT"
        nextLabel.textAlignment = .center
        nextLabel.font = .sofiaSemiBold(ofSize: 17)
        nextLabel.textColor = .white
        nextLabel.numberOfLines = 0
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addSubview(nextLabel)
        nextLabel.centerXAnchor.constraint(equalTo: getStartedButton.centerXAnchor).isActive = true
        nextLabel.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor, constant: 0).isActive = true
                
        pageControl.numberOfPages = 5
        pageControl.padding = 10
        pageControl.radius = 4
        pageControl.currentPageTintColor = .coinBaseBlue
        pageControl.tintColor = UIColor.coinBaseBlue.withAlphaComponent(0.42)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pageControl)
        pageControl.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -11).isActive = true
        //pageControl.leadingAnchor.constraint(equalTo: signUpTitleLabel.leadingAnchor).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: getStartedButton.centerXAnchor, constant: 0).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 80).isActive = true
                    
    }
    
    func setupContent() {
        mainScrollView.delegate = self
        mainScrollView.isScrollEnabled = false
        mainScrollView.contentSize = CGSize(width: view.frame.width * 5, height: view.frame.height)
        mainScrollView.showsHorizontalScrollIndicator = false
        mainScrollView.isPagingEnabled = true
        mainScrollView.backgroundColor = .clear
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        
        createBenefitContainer(benefitImage: "phoneEmpty",
                               benefitTitle: "Never miss an opportunity",
                               benefitDetail: "Get much more relevant and detailed information about the coins you are watching or currently invested into",
                               leadingCon: 0)
        
        createBenefitContainer(benefitImage: "phoneEmpty",
                               benefitTitle: "Manage your entire portfolio",
                               benefitDetail: "Easily stay on top of all your crypto investments in one centralized location",
                               leadingCon: 1)
        
        createBenefitContainer(benefitImage: "phoneEmpty",
                               benefitTitle: "Sophisticated price alerts",
                               benefitDetail: "Set and receive custom price alerts for all the coins you are watching so you can never miss an opportunity",
                               leadingCon: 2)
        
        createBenefitContainer(benefitImage: "phoneEmpty",
                               benefitTitle: "Stay on top of key events",
                               benefitDetail: "Major events in the crypto industry can play a vital role in the price of an asset growing exponentially. CryptoBase makes it easy to never miss a key event.",
                               leadingCon: 3)
        
        createBenefitContainer(benefitImage: "phoneEmpty",
                               benefitTitle: "Gain access to way more data",
                               benefitDetail: "Go beyond price and market cap and see all the details about a coin from price metrics to social metrics, volatility, news volume and much more!",
                               leadingCon: 4)
         
    }
    
    func createBenefitContainer(benefitImage: String, benefitTitle: String, benefitDetail: String, leadingCon: CGFloat) {
        
        let contentContainer = UIView()
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(contentContainer)
        contentContainer.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 0).isActive = true
        contentContainer.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        contentContainer.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        if leadingCon >= 1 {
            contentContainer.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: view.frame.width * leadingCon).isActive = true
        } else {
            contentContainer.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 0).isActive = true
        }
        
        let benefitImageView = UIImageView()
        benefitImageView.contentMode = .scaleAspectFill
        benefitImageView.image = UIImage(named: benefitImage)
        benefitImageView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(benefitImageView)
        benefitImageView.centerXAnchor.constraint(equalTo: contentContainer.centerXAnchor).isActive = true
        benefitImageView.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 97).isActive = true
        benefitImageView.heightAnchor.constraint(equalToConstant: 355).isActive = true
        benefitImageView.widthAnchor.constraint(equalToConstant: 178).isActive = true
        
        let benefitTitleLabel = UILabel()
        benefitTitleLabel.alpha = 1.0
        benefitTitleLabel.text = benefitTitle
        benefitTitleLabel.textAlignment = .center
        benefitTitleLabel.font = .sofiaMedium(ofSize: 21)
        benefitTitleLabel.textColor = .black
        benefitTitleLabel.numberOfLines = 0
        benefitTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(benefitTitleLabel)
        benefitTitleLabel.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 26).isActive = true
        benefitTitleLabel.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -26).isActive = true
        benefitTitleLabel.topAnchor.constraint(equalTo: benefitImageView.bottomAnchor, constant: 58).isActive = true
        
        let benefitDetailLabel = UILabel()
        benefitDetailLabel.alpha = 1.0
        benefitDetailLabel.setupLineHeight(myText: benefitDetail, myLineSpacing: 4)
        benefitDetailLabel.textAlignment = .center
        benefitDetailLabel.font = .sofiaLight(ofSize: 14)
        benefitDetailLabel.textColor = UIColor(red: 10/255, green: 10/255, blue: 10/255, alpha: 1.0)
        benefitDetailLabel.numberOfLines = 0
        benefitDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(benefitDetailLabel)
        benefitDetailLabel.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 26).isActive = true
        benefitDetailLabel.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -26).isActive = true
        benefitDetailLabel.topAnchor.constraint(equalTo: benefitTitleLabel.bottomAnchor, constant: 9).isActive = true
        
    }
    
}
