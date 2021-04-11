//
//  PinnedCoinView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/11/21.
//

import UIKit

class PinnedCoinView: UIView {
    
    var pinHeight: NSLayoutConstraint!
    var pinScrollView = UIScrollView()
    var pinnedCoinImageView = UIImageView()
    var pinnedCoinHealthContainer = UIView()
    var pinnedCoinRankContainer = UIView()
    var pinnedVolatilityContainer = UIView()
    var pinnedVolatilityGraphImageView = UIImageView()
    var pinnedPriceContainer = UIView()
    
    var coinHealthLabel = UILabel()
    var coinRankLabel = UILabel()
    var priceScoreLabel = UILabel()

    var healthWidth: CGFloat = 75
    var priceScoreWidth: CGFloat = 85
    var volatilityWidth: CGFloat = 75
    var rankWidth: CGFloat = 90
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        //setupViews()
        
        setupPinScrollView()
       
   }
   
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}

// MARK: Helpers

extension PinnedCoinView {
    
    func setupPinScrollView() {
        
        let pinnedCoinImageContainer = UIView()
        pinnedCoinImageContainer.backgroundColor = .clear
        pinnedCoinImageContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pinnedCoinImageContainer)
        pinnedCoinImageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        pinnedCoinImageContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pinnedCoinImageContainer.widthAnchor.constraint(equalToConstant: 53).isActive = true
        pinnedCoinImageContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        
        pinnedCoinImageView.alpha = 1.0
        pinnedCoinImageView.contentMode = .scaleAspectFill
        pinnedCoinImageView.layer.cornerRadius = 29/2
        pinnedCoinImageView.layer.masksToBounds = true
        pinnedCoinImageView.translatesAutoresizingMaskIntoConstraints = false
        pinnedCoinImageContainer.addSubview(pinnedCoinImageView)
        pinnedCoinImageView.centerYAnchor.constraint(equalTo: pinnedCoinImageContainer.centerYAnchor, constant: 2).isActive = true
        pinnedCoinImageView.centerXAnchor.constraint(equalTo: pinnedCoinImageContainer.centerXAnchor, constant: 2).isActive = true
        pinnedCoinImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        pinnedCoinImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        pinScrollView.tag = 5
        pinScrollView.showsHorizontalScrollIndicator = false
        pinScrollView.contentSize = CGSize(width: 375 * 1.025, height: 53)
        pinScrollView.backgroundColor = .mainFeedBackgroundColorModeLight
        pinScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pinScrollView)
        pinScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        pinScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pinScrollView.leadingAnchor.constraint(equalTo: pinnedCoinImageContainer.trailingAnchor, constant: 5).isActive = true
        pinScrollView.heightAnchor.constraint(equalToConstant: 53).isActive = true
                
        pinnedCoinHealthContainer.backgroundColor = .clear
        pinnedCoinHealthContainer.translatesAutoresizingMaskIntoConstraints = false
        pinScrollView.addSubview(pinnedCoinHealthContainer)
        pinnedCoinHealthContainer.topAnchor.constraint(equalTo: pinScrollView.topAnchor).isActive = true
        pinnedCoinHealthContainer.leadingAnchor.constraint(equalTo: pinScrollView.leadingAnchor, constant: 5).isActive = true
        pinnedCoinHealthContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        pinnedCoinHealthContainer.widthAnchor.constraint(equalToConstant: healthWidth).isActive = true

        pinnedPriceContainer.backgroundColor = .clear
        pinnedPriceContainer.translatesAutoresizingMaskIntoConstraints = false
        pinScrollView.addSubview(pinnedPriceContainer)
        pinnedPriceContainer.topAnchor.constraint(equalTo: pinScrollView.topAnchor).isActive = true
        pinnedPriceContainer.leadingAnchor.constraint(equalTo: pinnedCoinHealthContainer.trailingAnchor, constant: 5).isActive = true
        pinnedPriceContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        pinnedPriceContainer.widthAnchor.constraint(equalToConstant: priceScoreWidth).isActive = true

        pinnedVolatilityContainer.backgroundColor = .clear
        pinnedVolatilityContainer.translatesAutoresizingMaskIntoConstraints = false
        pinScrollView.addSubview(pinnedVolatilityContainer)
        pinnedVolatilityContainer.topAnchor.constraint(equalTo: pinScrollView.topAnchor).isActive = true
        pinnedVolatilityContainer.leadingAnchor.constraint(equalTo: pinnedPriceContainer.trailingAnchor, constant: 5).isActive = true
        pinnedVolatilityContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        pinnedVolatilityContainer.widthAnchor.constraint(equalToConstant: volatilityWidth).isActive = true

        pinnedVolatilityGraphImageView.contentMode = .scaleAspectFill
        pinnedVolatilityGraphImageView.translatesAutoresizingMaskIntoConstraints = false
        pinnedVolatilityContainer.addSubview(pinnedVolatilityGraphImageView)
        pinnedVolatilityGraphImageView.centerXAnchor.constraint(equalTo: pinnedVolatilityContainer.centerXAnchor).isActive = true
        pinnedVolatilityGraphImageView.centerYAnchor.constraint(equalTo: pinnedVolatilityContainer.centerYAnchor).isActive = true
        pinnedVolatilityGraphImageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        pinnedVolatilityGraphImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true

        pinnedCoinRankContainer.backgroundColor = .clear
        pinnedCoinRankContainer.translatesAutoresizingMaskIntoConstraints = false
        pinScrollView.addSubview(pinnedCoinRankContainer)
        pinnedCoinRankContainer.topAnchor.constraint(equalTo: pinScrollView.topAnchor).isActive = true
        pinnedCoinRankContainer.leadingAnchor.constraint(equalTo: pinnedVolatilityContainer.trailingAnchor, constant: 5).isActive = true
        pinnedCoinRankContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        pinnedCoinRankContainer.widthAnchor.constraint(equalToConstant: rankWidth).isActive = true
        
                
    }
    
    func createPinnedLabel(label: UILabel, string: String, cointainer: UIView) {
        label.text = string
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = .sofiaSemiBold(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        cointainer.addSubview(label)
        label.centerXAnchor.constraint(equalTo: cointainer.centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: cointainer.centerYAnchor, constant: 0).isActive = true
    }
    
}
