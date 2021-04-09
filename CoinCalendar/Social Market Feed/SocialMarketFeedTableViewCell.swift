//
//  SocialMarketFeedTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/3/21.
//

import UIKit

class SocialMarketFeedTableViewCell: UITableViewCell {
    
    var coinContainer = UIView()
    var coinImageView = UIImageView()
    
    var coinHealthContainer = UIView()
    var coinRankContainer = UIView()
    var priceContainer = UIView()
    var volatilityContainer = UIView()
    
    var coinHealthLabel = UILabel()
    var coinRankLabel = UILabel()
    var priceScoreLabel = UILabel()
    var volatilityLabel = UILabel()
    var whiteGradient = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension SocialMarketFeedTableViewCell {
    func setupViews() {
                        
//        coinContainer.backgroundColor = .clear
//        coinContainer.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(coinContainer)
//        coinContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
//        coinContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        coinContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        coinContainer.widthAnchor.constraint(equalToConstant: 53).isActive = true
//
//        coinImageView.contentMode = .scaleAspectFill
//        coinImageView.layer.cornerRadius = 29/2
//        coinImageView.layer.masksToBounds = true
//        coinImageView.translatesAutoresizingMaskIntoConstraints = false
//        coinContainer.addSubview(coinImageView)
//        coinImageView.centerYAnchor.constraint(equalTo: coinContainer.centerYAnchor).isActive = true
//        coinImageView.centerXAnchor.constraint(equalTo: coinContainer.centerXAnchor).isActive = true
//        coinImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
//        coinImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        coinHealthContainer.backgroundColor = .clear
        coinHealthContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinHealthContainer)
        coinHealthContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        coinHealthContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        coinHealthContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        coinHealthContainer.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        coinRankContainer.backgroundColor = .clear
        coinRankContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinRankContainer)
        coinRankContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        //coinRankContainer.leadingAnchor.constraint(equalTo: coinHealthContainer.trailingAnchor).isActive = true
        coinRankContainer.leadingAnchor.constraint(equalTo: coinHealthContainer.trailingAnchor, constant: 5).isActive = true
        coinRankContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        coinRankContainer.widthAnchor.constraint(equalToConstant: 85).isActive = true
        
        volatilityContainer.backgroundColor = .clear
        volatilityContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(volatilityContainer)
        volatilityContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        //volatilityContainer.leadingAnchor.constraint(equalTo: coinRankContainer.trailingAnchor).isActive = true
        volatilityContainer.leadingAnchor.constraint(equalTo: coinRankContainer.trailingAnchor, constant: 5).isActive = true
        volatilityContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        volatilityContainer.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        priceContainer.backgroundColor = .clear
        priceContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceContainer)
        priceContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        //priceContainer.leadingAnchor.constraint(equalTo: volatilityContainer.trailingAnchor).isActive = true
        priceContainer.leadingAnchor.constraint(equalTo: volatilityContainer.trailingAnchor, constant: 5).isActive = true
        priceContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        priceContainer.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        createSectionLabel(label: coinHealthLabel, string: "9.0", cointainer: coinHealthContainer)
        createSectionLabel(label: priceScoreLabel, string: "8.3", cointainer: priceContainer)
        createSectionLabel(label: coinRankLabel, string: "7.0", cointainer: coinRankContainer)
        createSectionLabel(label: volatilityLabel, string: "6.5", cointainer: volatilityContainer)
        
    }
    
    func createSectionLabel(label: UILabel, string: String, cointainer: UIView) {
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
