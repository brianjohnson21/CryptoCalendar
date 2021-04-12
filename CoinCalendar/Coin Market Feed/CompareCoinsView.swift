//
//  CompareCoinsView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/11/21.
//

import UIKit

class CompareCoinsView: UIView {
    
    var topContainer = UIView()
    
    var coinOneImageView = UIImageView()
    var coinOneShortNameLabel = UILabel()
    
    var coinTwoImageView = UIImageView()
    var coinTwoShortNameLabel = UILabel()

    var cancelImageView = UIImageView()
    var cancelButton = UIButton()
    
    var dividerLine = UIView()
    
    var coinOneTop: NSLayoutConstraint!
    var coinOneLeading: NSLayoutConstraint!
    
    var coinTwoLeading: NSLayoutConstraint!
    
    var shortNameOneLabel = UILabel()
    var shortNameTwoLabel = UILabel()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupViews()
   }
   
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}

// MARK: VIEWS

extension CompareCoinsView {
    func setupViews() {
        
        topContainer.alpha = 0
        topContainer.backgroundColor = .white
        topContainer.layer.shadowColor = UIColor.black.cgColor
        topContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        topContainer.layer.shadowOpacity = 0
        topContainer.layer.shadowRadius = 4
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(topContainer)
        topContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topContainer.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
        createCoinImage(coinImage: coinOneImageView, coinLabel: coinOneShortNameLabel)
        coinOneLeading = coinOneImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27)
        coinOneLeading.isActive = true
        coinOneTop = coinOneImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14)
        coinOneTop.isActive = true
        coinOneShortNameLabel.text = "Pick coin"
        
        createCoinImage(coinImage: coinTwoImageView, coinLabel: coinTwoShortNameLabel)
        coinTwoLeading = coinTwoImageView.leadingAnchor.constraint(equalTo: coinOneImageView.trailingAnchor, constant: 80)
        coinTwoLeading.isActive = true
        coinTwoImageView.centerYAnchor.constraint(equalTo: coinOneImageView.centerYAnchor, constant: 0).isActive = true
        coinTwoShortNameLabel.text = "Pick coin"
        
        cancelImageView.image = UIImage(named: "searchX")
        cancelImageView.setImageColor(color: .black)
        cancelImageView.contentMode = .scaleAspectFill
        cancelImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cancelImageView)
        cancelImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18).isActive = true
        cancelImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        cancelImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        cancelImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        cancelButton.backgroundColor = .clear
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cancelButton)
        cancelButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: cancelImageView.leadingAnchor, constant: -20).isActive = true
        
        dividerLine.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dividerLine)
        dividerLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        dividerLine.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //
        
        shortNameOneLabel.alpha = 0
        shortNameOneLabel.textAlignment = .center
        shortNameOneLabel.textColor = .black
        shortNameOneLabel.font = .sofiaRegular(ofSize: 13)
        shortNameOneLabel.numberOfLines = 0
        shortNameOneLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(shortNameOneLabel)
        shortNameOneLabel.topAnchor.constraint(equalTo: coinOneImageView.bottomAnchor, constant: 8).isActive = true
        shortNameOneLabel.centerXAnchor.constraint(equalTo: coinOneImageView.centerXAnchor, constant: 0).isActive = true
        
        shortNameTwoLabel.alpha = 0
        shortNameTwoLabel.textAlignment = .center
        shortNameTwoLabel.textColor = .black
        shortNameTwoLabel.font = .sofiaRegular(ofSize: 13)
        shortNameTwoLabel.numberOfLines = 0
        shortNameTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(shortNameTwoLabel)
        shortNameTwoLabel.topAnchor.constraint(equalTo: coinTwoImageView.bottomAnchor, constant: 8).isActive = true
        shortNameTwoLabel.centerXAnchor.constraint(equalTo: coinTwoImageView.centerXAnchor, constant: 0).isActive = true
    }
    
    func createCoinImage(coinImage: UIImageView, coinLabel: UILabel) {
        
        coinImage.contentMode = .scaleAspectFill
        coinImage.layer.cornerRadius = 29/2
        coinImage.layer.masksToBounds = true
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(coinImage)
        coinImage.heightAnchor.constraint(equalToConstant: 29).isActive = true
        coinImage.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        coinLabel.textAlignment = .left
        coinLabel.textColor = .black
        coinLabel.font = .sofiaRegular(ofSize: 13)
        coinLabel.numberOfLines = 0
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(coinLabel)
        coinLabel.leadingAnchor.constraint(equalTo: coinImage.trailingAnchor, constant: 9).isActive = true
        coinLabel.centerYAnchor.constraint(equalTo: coinImage.centerYAnchor, constant: 0).isActive = true
        
        
    }
}

//MARK: ACTIONS

extension CompareCoinsView {
    @objc func resetCoins() {
        coinTwoImageView.image = UIImage(named: "coinEmptyState")
        coinTwoShortNameLabel.text = "Pick coin"
    }
}
