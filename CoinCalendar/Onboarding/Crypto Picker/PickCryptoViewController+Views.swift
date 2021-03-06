//
//  PickCryptoViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/31/21.
//

import Foundation
import UIKit

extension PickCryptoViewController {
    
    func setupNav() {
        navView.layer.zPosition = 2
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOffset = CGSize(width: 0, height: 2)
        navView.layer.shadowOpacity = 0
        navView.layer.shadowRadius = 4
        navView.backgroundColor = .white
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOffset = CGSize(width: 0, height: 2)
        navView.layer.shadowOpacity = 0
        navView.layer.shadowRadius = 4
        navView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navView)
        navView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        navHeight = navView.heightAnchor.constraint(equalToConstant: 188) //nvHeight
        navHeight.isActive = true
        
        detailLabel.layer.zPosition = 2
        detailLabel.alpha = 0
        detailLabel.transform = CGAffineTransform(translationX: 0, y: 50)
        //let detailLabelText = "Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt"
        let detailLabelText = "The coins you select will be added to your watchlist\nfor you to keep a close eye on"
        detailLabel.setupLineHeight(myText: detailLabelText, myLineSpacing: 5)
        detailLabel.textAlignment = .left
        detailLabel.font = .sofiaLight(ofSize: 12)
        detailLabel.textColor = .keyEventDetailColorModeLight
        detailLabel.numberOfLines = 0
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(detailLabel)
        detailLabel.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 31).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -20).isActive = true
        
        titleLabel.layer.zPosition = 2
        titleLabel.alpha = 0
        titleLabel.transform = CGAffineTransform(translationX: 0, y: 50)
        let titleLabelText = "Please select which coins\nyou are most interested in"
        titleLabel.setupLineHeight(myText: titleLabelText, myLineSpacing: 5)
        titleLabel.textAlignment = .left
        titleLabel.font = .sofiaSemiBold(ofSize: 20)
        titleLabel.textColor = .keyEventHeadlineColorModeLight
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 31).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: detailLabel.topAnchor, constant: -12).isActive = true
    }
    
    func setupGlobalCollectionView() {
        
        // MARK: Setup Collection View Flow Layout
        
        globalContactListCollectionViewFlowLayout.scrollDirection = .vertical
        let viewThird = (view.frame.width - 12) / 3
        globalContactListCollectionViewFlowLayout.itemSize = CGSize(width: 88, height: 134)
        globalContactListCollectionViewFlowLayout.minimumLineSpacing = 0
        globalContactListCollectionViewFlowLayout.minimumInteritemSpacing = 0
        globalContactListCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 10 , left: 0, bottom: 0, right: 0)
        globalContactListCollectionViewFlowLayout.estimatedItemSize = CGSize.zero
                
        
        // MARK: Setup Collection View
        
        globalContactListCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: globalContactListCollectionViewFlowLayout)
        globalContactListCollectionView.tag = 1
        globalContactListCollectionView.dataSource = self
        globalContactListCollectionView.delegate = self
        globalContactListCollectionView.alpha = 0
        globalContactListCollectionView.register(PickCryptoCollectionViewCell.self, forCellWithReuseIdentifier: pickCryptoCollectionViewCell)
        globalContactListCollectionView.allowsMultipleSelection = true
        globalContactListCollectionView.allowsSelection = true
        globalContactListCollectionView.backgroundColor = .clear
        globalContactListCollectionView.bounces = true
        globalContactListCollectionView.contentInset = .zero
        globalContactListCollectionView.isPagingEnabled = false
        globalContactListCollectionView.isScrollEnabled = true
        globalContactListCollectionView.showsVerticalScrollIndicator = false
        globalContactListCollectionView.showsHorizontalScrollIndicator = false
        globalContactListCollectionView.sizeToFit()
        globalContactListCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        globalContactListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(globalContactListCollectionView)
        globalContactListCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 6).isActive = true
        globalContactListCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -6).isActive = true
        globalContactListCollectionView.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
        //globalContactListCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        globalContactListCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        whiteGradient.alpha = 0
        whiteGradient.isUserInteractionEnabled = false
        whiteGradient.image = UIImage(named: "whiteGradient")
        whiteGradient.contentMode = .scaleAspectFill
        whiteGradient.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(whiteGradient)
        whiteGradient.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        whiteGradient.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        whiteGradient.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        whiteGradient.heightAnchor.constraint(equalToConstant: 100).isActive = true
                
        continueButton.layer.zPosition = 100
        continueButton.addTarget(self, action: #selector(continueClicked), for: .touchUpInside)
        continueButton.alpha = 1.0
        continueButton.continueLabel.text = "Continue"
        continueButton.layer.cornerRadius = 63/2
        continueButton.backgroundColor = .coinBaseBlue
        continueButton.purpleBG.backgroundColor = .coinBaseBlue
        continueButton.layer.masksToBounds = true
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        continueBottom = continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -55)
        continueBottom.isActive = true
        let buttonWidth = self.view.frame.width - (18 * 2)
        continueWidth = continueButton.widthAnchor.constraint(equalToConstant: buttonWidth)
        continueWidth.isActive = true
        continueHeight = continueButton.heightAnchor.constraint(equalToConstant: 63)
        continueHeight.isActive = true
        
        let termsPrivacyText = "By tapping continue, you are agreeing to our\nprivacy policy and terms of use"
        termsPrivacyLabel.setupLineHeight(myText: termsPrivacyText, myLineSpacing: 4)
        termsPrivacyLabel.textAlignment = .center
        termsPrivacyLabel.font = .sofiaSemiBold(ofSize: 10)
        termsPrivacyLabel.textColor = UIColor.black.withAlphaComponent(0.28)
        termsPrivacyLabel.numberOfLines = 0
        termsPrivacyLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(termsPrivacyLabel)
        termsPrivacyLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -25).isActive = true
        termsPrivacyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        let text = (termsPrivacyLabel.text)!
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "privacy policy")
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        let range2 = (text as NSString).range(of: "terms of use")
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range2)
        termsPrivacyLabel.attributedText = underlineAttriString
        
        termsButton.addTarget(self, action: #selector(didTapViewSource(sender:)), for: .touchUpInside)
        termsButton.tag = 1
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(termsButton)
        termsButton.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor, constant: 0).isActive = true
        termsButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        termsButton.leadingAnchor.constraint(equalTo: continueButton.centerXAnchor, constant: 0).isActive = true
        termsButton.topAnchor.constraint(equalTo: termsPrivacyLabel.topAnchor).isActive = true
        
        privacyButton.addTarget(self, action: #selector(didTapViewSource(sender:)), for: .touchUpInside)
        privacyButton.tag = 2
        privacyButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(privacyButton)
        privacyButton.leadingAnchor.constraint(equalTo: continueButton.leadingAnchor, constant: 0).isActive = true
        privacyButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        privacyButton.trailingAnchor.constraint(equalTo: continueButton.centerXAnchor, constant: 0).isActive = true
        privacyButton.topAnchor.constraint(equalTo: termsPrivacyLabel.topAnchor).isActive = true
        
    }
    
}

//MARK: COLLECTIONVIEW DELEGATE & DATASOURCE

extension PickCryptoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pickCryptoCollectionViewCell, for: indexPath) as! PickCryptoCollectionViewCell
        cell.coinImageView.image = UIImage(named: coins[indexPath.row][1])
        cell.blockChainLabel.text = coins[indexPath.row][0]
        cell.coinLabel.text = coins[indexPath.row][1]
        
        if coinsSelected.contains(coins[indexPath.row][1]) {
            cell.handleTap()
        } else {
            cell.hideRing()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        lightImpactGenerator()
        let cell = collectionView.cellForItem(at: indexPath) as! PickCryptoCollectionViewCell
        cell.handleTap()
        
        coinsSelected.append(coins[indexPath.row][1])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        lightImpactGenerator()
        let cell = collectionView.cellForItem(at: indexPath) as! PickCryptoCollectionViewCell
        cell.hideRing()
        
        coinsSelected.remove(at: indexPath.row)
    }
}
