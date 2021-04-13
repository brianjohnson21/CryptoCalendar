//
//  SetAlertViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/10/21.
//

import Foundation
import UIKit
import Lottie

extension SetAlertViewController {
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
        if isComingFromCoinOptions {
            mainContainerHeight = mainContainer.heightAnchor.constraint(equalToConstant: self.view.frame.height - 71)
            mainContainerHeight.isActive = true
        } else {
            mainContainer.heightAnchor.constraint(equalToConstant: self.view.frame.height - 71).isActive = true
            mainContainer.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
            keyLine.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        }
        
        keyLine.backgroundColor = .white
        keyLine.layer.cornerRadius = 4/2
        keyLine.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(keyLine)
        keyLine.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor).isActive = true
        keyLine.bottomAnchor.constraint(equalTo: mainContainer.topAnchor, constant: -6).isActive = true
        keyLine.widthAnchor.constraint(equalToConstant: 34).isActive = true
        keyLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        let dismissButton = UIButton()
        dismissButton.backgroundColor = .clear
        dismissButton.addTarget(self, action: #selector(dimissVC), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        wrapper.addSubview(dismissButton)
        dismissButton.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor).isActive = true
        dismissButton.topAnchor.constraint(equalTo: wrapper.topAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: keyLine.topAnchor).isActive = true
        
        if isComingFromCoinOptions {
            contentContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
            contentContainer.alpha = 0
        }
        contentContainer.backgroundColor = .white
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(contentContainer)
        contentContainer.fillSuperview()
        
        navView.backgroundColor = .white
        navView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(navView)
        navView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: contentContainer.topAnchor).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 124).isActive = true
        
        navTitleLabel.text = "Set Price Alert"
        navTitleLabel.textColor = .keyEventHeadlineColorModeLight
        navTitleLabel.textAlignment = .center
        navTitleLabel.font = .sofiaMedium(ofSize: 17)
        navTitleLabel.numberOfLines = 0
        navTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(navTitleLabel)
        navTitleLabel.centerXAnchor.constraint(equalTo: contentContainer.centerXAnchor).isActive = true
        navTitleLabel.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 20).isActive = true
        navTitleLabel.centerXAnchor.constraint(equalTo: contentContainer.centerXAnchor, constant: 0).isActive = true
        
        //coinImageView.image = UIImage(named: "ADA")
        coinImageView.backgroundColor = .lightGray
        coinImageView.contentMode = .scaleAspectFill
        coinImageView.layer.cornerRadius = 29/2
        coinImageView.translatesAutoresizingMaskIntoConstraints  = false
        navView.addSubview(coinImageView)
        coinImageView.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 24).isActive = true
        coinImageView.topAnchor.constraint(equalTo: navTitleLabel.bottomAnchor, constant: 28).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        //blockChainLabel.text = "Cardano"
        blockChainLabel.font = .sofiaMedium(ofSize: 15)
        blockChainLabel.textAlignment = .left
        blockChainLabel.textColor = .black
        blockChainLabel.numberOfLines = 0
        blockChainLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(blockChainLabel)
        blockChainLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 13).isActive = true
        blockChainLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor, constant: 0).isActive = true
        
        //coinLabel.text = "ADA"
        coinLabel.font = .sofiaRegular(ofSize: 11)
        coinLabel.textAlignment = .left
        coinLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        coinLabel.numberOfLines = 0
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(coinLabel)
        coinLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 13).isActive = true
        coinLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor, constant: 0).isActive = true
        
        //coinPriceLabel.text = "$1.21"
        coinPriceLabel.font = .sofiaMedium(ofSize: 15)
        coinPriceLabel.textAlignment = .right
        coinPriceLabel.textColor = .black
        coinPriceLabel.numberOfLines = 0
        coinPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(coinPriceLabel)
        coinPriceLabel.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -24).isActive = true
        coinPriceLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor, constant: 0).isActive = true
        
        currentPriceLabel.text = "Current Price"
        currentPriceLabel.font = .sofiaRegular(ofSize: 11)
        currentPriceLabel.textAlignment = .right
        currentPriceLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        currentPriceLabel.numberOfLines = 0
        currentPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(currentPriceLabel)
        currentPriceLabel.trailingAnchor.constraint(equalTo: coinPriceLabel.trailingAnchor, constant: 0).isActive = true
        currentPriceLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor, constant: 0).isActive = true
        
        dividerLine.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(dividerLine)
        dividerLine.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 24).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -24).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
    }
    
    func setupTableView() {
        mainFeedTableView = UITableView(frame: self.view.frame, style: .plain)
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.tag = 2
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(SetAlertOptionOneTableViewCell.self, forCellReuseIdentifier: setAlertOptionOneTableViewCell)
        mainFeedTableView.register(SetAlertOptionTwoTableViewCell.self, forCellReuseIdentifier: setAlertOptionTwoTableViewCell)
        mainFeedTableView.allowsMultipleSelection = false
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 200, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor).isActive = true
        mainFeedTableView.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor).isActive = true
        mainFeedTableView.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        
        whiteGradient.isUserInteractionEnabled = false
        whiteGradient.image = UIImage(named: "whiteGradient")
        whiteGradient.contentMode = .scaleAspectFill
        whiteGradient.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(whiteGradient)
        whiteGradient.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor).isActive = true
        whiteGradient.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor).isActive = true
        whiteGradient.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor).isActive = true
        whiteGradient.heightAnchor.constraint(equalToConstant: 119).isActive = true
        
        resetButton.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
        resetButton.continueLabel.text = "Confirm"
        resetButton.confirmLabel.text = "Set Price"
        resetButton.backgroundColor = .coinBaseBlue
        resetButton.purpleBG.backgroundColor = .coinBaseBlue
        resetButton.layer.cornerRadius = 8
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(resetButton)
        resetButton.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 26).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -26).isActive = true
        resetBottom = resetButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 100)
        resetBottom.isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        var placeHolder = NSMutableAttributedString()
        let Name  = "$$$"
        placeHolder = NSMutableAttributedString(string:Name, attributes: [NSAttributedString.Key.font: UIFont.sofiaMedium(ofSize: 80)])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.clear, range:NSRange(location:0,length:Name.count))
        priceTextField.attributedPlaceholder = placeHolder
        priceTextField.alpha = 0
        priceTextField.autocorrectionType = .no
        priceTextField.keyboardType = .decimalPad
        priceTextField.font = .sofiaSemiBold(ofSize: 80)
        priceTextField.textColor = .clear
        priceTextField.tintColor = .coinBaseBlue
        priceTextField.returnKeyType = .done
        priceTextField.delegate = self
        priceTextField.textAlignment = .center
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(priceTextField)
        priceTextField.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 18).isActive = true
        priceTextField.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -18).isActive = true
        priceTextField.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 75).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        priceLabel.backgroundColor = .clear
        priceLabel.alpha = 0
        priceLabel.text = "$$$"
        priceLabel.textAlignment = .center
        priceLabel.textColor = .black
        priceLabel.font = .sofiaMedium(ofSize: 80)
        priceLabel.numberOfLines = 0
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(priceLabel)
        priceLabel.centerYAnchor.constraint(equalTo: priceTextField.centerYAnchor).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: priceTextField.centerXAnchor).isActive = true
    }
    
    func setupSuccessLottie() {
        let checkAnimation = Animation.named("successCheck")
        successCheck.isUserInteractionEnabled = false
        successCheck.alpha = 0
        successCheck.loopMode = .playOnce
        successCheck.animation = checkAnimation
        successCheck.contentMode = .scaleAspectFill
        successCheck.backgroundColor = .clear
        successCheck.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(successCheck)
        successCheck.centerYAnchor.constraint(equalTo: contentContainer.centerYAnchor, constant: -50).isActive = true
        successCheck.centerXAnchor.constraint(equalTo: contentContainer.centerXAnchor).isActive = true
        successCheck.heightAnchor.constraint(equalToConstant: 100).isActive = true
        successCheck.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
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
        
        addedToWatchListLabel.alpha = 0
        addedToWatchListLabel.text = "Alert set!"
        addedToWatchListLabel.textAlignment = .center
        addedToWatchListLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        addedToWatchListLabel.font = .sofiaRegular(ofSize: 20)
        addedToWatchListLabel.numberOfLines = 0
        addedToWatchListLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(addedToWatchListLabel)
        addedToWatchListLabel.centerXAnchor.constraint(equalTo: contentContainer.centerXAnchor, constant: 0).isActive = true
        addedToWatchListLabel.topAnchor.constraint(equalTo: successCheck.bottomAnchor, constant: 5).isActive = true
    }
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension SetAlertViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        if indexPath.row <= 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: setAlertOptionOneTableViewCell, for: indexPath) as! SetAlertOptionOneTableViewCell
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "Price"
                cell.upDownImageView.image = UIImage(named: "greenArrowDownTwo")
                cell.titleLabelExtended.text = "by 5%"
                cell.bottomTitleLabel.text = ""
                let detailLabelText = "Alert me when the price increases 5%"
                cell.detailLabel.setupLineHeight(myText: detailLabelText, myLineSpacing: 4)
                
            case 1:
                cell.titleLabel.text = "Price"
                cell.upDownImageView.image = UIImage(named: "redArrowDownTwo")
                cell.titleLabelExtended.text = "by 5%"
                cell.bottomTitleLabel.text = ""
                let detailLabelText = "Alert me when the price decreses 5%"
                cell.detailLabel.setupLineHeight(myText: detailLabelText, myLineSpacing: 4)
                
            case 2:
                cell.titleLabel.text = "Social Volume"
                cell.upDownImageView.image = UIImage(named: "greenArrowDownTwo")
                cell.titleLabelExtended.text = "by 50% in"
                cell.bottomTitleLabel.text = "the last 24 hrs"
                let detailLabelText = "Alert me when the social volume\nincreases 50% from the previous day\nsum"
                cell.detailLabel.setupLineHeight(myText: detailLabelText, myLineSpacing: 4)
                
            default:
                cell.titleLabel.text = "Health Score is"
                cell.upDownImageView.image = UIImage(named: "greenArrowDownTwo")
                cell.upDownImageView.transform = CGAffineTransform(rotationAngle: .pi/2)
                cell.titleLabelExtended.text = "75"
                cell.bottomTitleLabel.text = ""
                let detailLabelText = "Alert me when the health score\nis greater than 75"
                cell.detailLabel.setupLineHeight(myText: detailLabelText, myLineSpacing: 4)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: setAlertOptionTwoTableViewCell, for: indexPath) as! SetAlertOptionTwoTableViewCell
            
            if indexPath.row == 4 {
                cell.titleLabel.text = "Specific Price 🎯💸"
                let detailLabelText = "Alert me when a specific price is hit"
                cell.detailLabel.setupLineHeight(myText: detailLabelText, myLineSpacing: 4)
            } else if indexPath.row == 5 {
                cell.titleLabel.text = "New ATH 🔥"
                let detailLabelText = "Alert me when a new all time high\nprice has been hit"
                cell.detailLabel.setupLineHeight(myText: detailLabelText, myLineSpacing: 4)
            } else {
                cell.titleLabel.text = "New ATL ❄️"
                let detailLabelText = "Alert me when a new all time low\nprice has been hit"
                cell.detailLabel.setupLineHeight(myText: detailLabelText, myLineSpacing: 4)
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showHideResetButton()
        
        if indexPath.row <= 3 {
            let cell = tableView.cellForRow(at: indexPath) as! SetAlertOptionOneTableViewCell
            cell.activateFilter()
        } else {
            let cell = tableView.cellForRow(at: indexPath) as! SetAlertOptionTwoTableViewCell
            cell.activateFilter()
        }
        
        if indexPath.row == 4 {
            specificPriceSelected = true
        } else {
            specificPriceSelected = false
        }
        
        if indexPath.row == 4 {
            resetButton.showNewLabel()
        } else {
            resetButton.showOriginalLabel()
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if indexPath.row <= 3 {
            let cell = tableView.cellForRow(at: indexPath) as! SetAlertOptionOneTableViewCell
            cell.deactivateFilter()
        } else {
            let cell = tableView.cellForRow(at: indexPath) as! SetAlertOptionTwoTableViewCell
            cell.deactivateFilter()
        }
    }
}
