//
//  HomeFeedCoinCollectionViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/1/21.
//

import UIKit

class HomeFeedCoinCollectionViewCell: UICollectionViewCell {
    
    var contentContainer = UIView()
    var coinImageView = UIImageView()
    var coinNameLabel = UILabel()
    var coinPriceLabel = UILabel()
    var upDownImageView = UIImageView()
    var upDownLabel = UILabel()
    
    var isDarkMode = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.contentView.layer.masksToBounds = false
        self.layer.masksToBounds = false
        contentView.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

// MARK: VIEWS

extension HomeFeedCoinCollectionViewCell {
    func setupViews() {
        
        if isDarkMode {
            coinNameLabel.textColor = .white
            coinPriceLabel.textColor = UIColor.white.withAlphaComponent(0.6)
            upDownLabel.textColor = .white
            contentContainer.backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1.0)
        } else {
            coinNameLabel.textColor = .keyEventHeadlineColorModeLight
            coinPriceLabel.textColor = .keyEventDetailColorModeLight//UIColor.white.withAlphaComponent(0.6)
            upDownLabel.textColor = .keyEventHeadlineColorModeLight
            contentContainer.backgroundColor = .white//UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1.0)
        }
        contentContainer.layer.cornerRadius = 14
        contentContainer.layer.shadowColor = UIColor.black.cgColor
        contentContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentContainer.layer.shadowOpacity = 0.1
        contentContainer.layer.shadowRadius = 2
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentContainer)
        contentContainer.fillSuperview()
        
        coinImageView.contentMode = .scaleAspectFill
        coinImageView.layer.cornerRadius = 37/2
        coinImageView.layer.masksToBounds = true
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(coinImageView)
        coinImageView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 10).isActive = true
        coinImageView.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 10).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 37).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 37).isActive = true
        
        coinNameLabel.textAlignment = .left
        coinNameLabel.font = .sofiaSemiBold(ofSize: 14)
        coinNameLabel.numberOfLines = 0
        coinNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(coinNameLabel)
        coinNameLabel.leadingAnchor.constraint(equalTo: coinImageView.leadingAnchor, constant: 0).isActive = true
        coinNameLabel.topAnchor.constraint(equalTo: coinImageView.bottomAnchor, constant: 19).isActive = true
                
        coinPriceLabel.textAlignment = .left
        coinPriceLabel.font = .sofiaMedium(ofSize: 14)
        coinPriceLabel.numberOfLines = 0
        coinPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(coinPriceLabel)
        coinPriceLabel.leadingAnchor.constraint(equalTo: coinNameLabel.leadingAnchor, constant: 0).isActive = true
        coinPriceLabel.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: 4).isActive = true
        
        upDownImageView.contentMode = .scaleAspectFit
        upDownImageView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(upDownImageView)
        upDownImageView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 11).isActive = true
        upDownImageView.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor, constant: -8).isActive = true
        upDownImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        upDownImageView.widthAnchor.constraint(equalToConstant: 8).isActive = true
                
        upDownLabel.textAlignment = .left
        upDownLabel.font = .sofiaSemiBold(ofSize: 14)
        upDownLabel.numberOfLines = 0
        upDownLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(upDownLabel)
        upDownLabel.leadingAnchor.constraint(equalTo: upDownImageView.trailingAnchor, constant: 4).isActive = true
        upDownLabel.centerYAnchor.constraint(equalTo: upDownImageView.centerYAnchor, constant: 0).isActive = true
        
    }
}
