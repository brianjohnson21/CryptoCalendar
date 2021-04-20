//
//  ExpertCurrentCoinMarketFeedTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import UIKit

class ExpertCurrentCoinMarketFeedTableViewCell: UITableViewCell {
    
    var coinNameContainer = UIView()
    var blockChainNameLabel = UILabel()
    var coinNameLabel = UILabel()
    
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
    
    var volatilityWidth: CGFloat = 109
    var healthWidth: CGFloat = 124
    var priceScoreWidth: CGFloat = 109
    var rankWidth: CGFloat = 109
    
    var percentChangeLabel = UILabel()

    var volatilityGraphImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        self.layer.zPosition = 2
        self.contentView.layer.zPosition = 2
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension ExpertCurrentCoinMarketFeedTableViewCell {
    func setupViews() {
        
        coinNameContainer.backgroundColor = .clear
        coinNameContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinNameContainer)
        coinNameContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        coinNameContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        coinNameContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        coinNameContainer.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        blockChainNameLabel.textAlignment = .center
        blockChainNameLabel.textColor = UIColor.black
        blockChainNameLabel.font = .sofiaMedium(ofSize: 15)
        blockChainNameLabel.numberOfLines = 0
        blockChainNameLabel.translatesAutoresizingMaskIntoConstraints = false
        coinNameContainer.addSubview(blockChainNameLabel)
        blockChainNameLabel.leadingAnchor.constraint(equalTo: coinNameContainer.leadingAnchor, constant: 6).isActive = true
        blockChainNameLabel.centerYAnchor.constraint(equalTo: coinNameContainer.centerYAnchor, constant: -6).isActive = true
        
        coinNameLabel.textAlignment = .center
        coinNameLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        coinNameLabel.font = .sofiaRegular(ofSize: 11)
        coinNameLabel.numberOfLines = 0
        coinNameLabel.translatesAutoresizingMaskIntoConstraints = false
        coinNameContainer.addSubview(coinNameLabel)
        coinNameLabel.leadingAnchor.constraint(equalTo: blockChainNameLabel.leadingAnchor, constant: 0).isActive = true
        coinNameLabel.topAnchor.constraint(equalTo: blockChainNameLabel.bottomAnchor, constant: 3).isActive = true
        
        //
        
        coinHealthContainer.backgroundColor = .clear
        coinHealthContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinHealthContainer)
        coinHealthContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        coinHealthContainer.leadingAnchor.constraint(equalTo: coinNameContainer.trailingAnchor, constant: 0).isActive = true
        coinHealthContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        coinHealthContainer.widthAnchor.constraint(equalToConstant: 59).isActive = true
        
        coinRankContainer.backgroundColor = .clear
        coinRankContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinRankContainer)
        coinRankContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        coinRankContainer.leadingAnchor.constraint(equalTo: coinHealthContainer.trailingAnchor, constant: 0).isActive = true
        coinRankContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        coinRankContainer.widthAnchor.constraint(equalToConstant: 94).isActive = true
        
        priceContainer.backgroundColor = .clear
        priceContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceContainer)
        priceContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        priceContainer.leadingAnchor.constraint(equalTo: coinRankContainer.trailingAnchor, constant: 0).isActive = true
        priceContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        priceContainer.widthAnchor.constraint(equalToConstant: 84).isActive = true
        
        createSectionLabel(label: coinHealthLabel, string: "9.0", cointainer: coinHealthContainer)
        createSectionLabel(label: coinRankLabel, string: "7.0", cointainer: coinRankContainer)
        createSectionLabel(label: priceScoreLabel, string: "8.3", cointainer: priceContainer)
        
        percentChangeLabel.textAlignment = .right
        percentChangeLabel.font = .sofiaRegular(ofSize: 11)
        percentChangeLabel.numberOfLines = 0
        percentChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(percentChangeLabel)
        percentChangeLabel.trailingAnchor.constraint(equalTo: coinRankLabel.trailingAnchor, constant: 0).isActive = true
        percentChangeLabel.topAnchor.constraint(equalTo: coinRankLabel.bottomAnchor, constant: 4).isActive = true
        
    }
    
    func createSectionLabel(label: UILabel, string: String, cointainer: UIView) {
        label.text = string
        label.textAlignment = .right
        label.textColor = UIColor.black
        label.font = .sofiaSemiBold(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        cointainer.addSubview(label)
        label.trailingAnchor.constraint(equalTo: cointainer.trailingAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: cointainer.centerYAnchor, constant: -6).isActive = true
    }
}
