//
//  CoinMarketFeedTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/3/21.
//

import UIKit

class CoinMarketFeedTableViewCell: UITableViewCell {
    
    var coinContainer = UIView()
    var coinImageView = UIImageView()
    
    var coinHealthContainer = UIView()
    var coinRankContainer = UIView()
    var priceContainer = UIView()
    var volatilityContainer = UIView()
    
    var coinHealthLabel = UILabel()
    
    var coinHealthMeterContainer = UIView()
    var coinHealthMeter = UIView()
    var coinHealthMeterWidth: NSLayoutConstraint!
    
    var coinRankLabel = UILabel()
    var priceScoreLabel = UILabel()
    var volatilityLabel = UILabel()
    
    var healthWidth: CGFloat = 75
    var priceScoreWidth: CGFloat = 85
    var volatilityWidth: CGFloat = 75
    var rankWidth: CGFloat = 90
    
    var volatilityGraphImageView = UIImageView()
    
    //
    
    var marketCapContainer = UIView()
    var percentChangeContainer = UIView()
    var volumeContainer = UIView()
    
    var marketCapLabel = UILabel()
    var percentChangeLabel = UILabel()
    var volumeLabel = UILabel()
    
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

extension CoinMarketFeedTableViewCell {
    func setupViews() {
        
        coinHealthContainer.backgroundColor = .clear
        coinHealthContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinHealthContainer)
        coinHealthContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        coinHealthContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        coinHealthContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        coinHealthContainer.widthAnchor.constraint(equalToConstant: healthWidth).isActive = true
        
        coinHealthMeterContainer.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        coinHealthMeterContainer.layer.cornerRadius = 5/2
        coinHealthMeterContainer.layer.masksToBounds = true
        coinHealthMeterContainer.translatesAutoresizingMaskIntoConstraints = false
        coinHealthContainer.addSubview(coinHealthMeterContainer)
        coinHealthMeterContainer.centerYAnchor.constraint(equalTo: coinHealthContainer.centerYAnchor).isActive = true
        coinHealthMeterContainer.centerXAnchor.constraint(equalTo: coinHealthContainer.centerXAnchor).isActive = true
        coinHealthMeterContainer.widthAnchor.constraint(equalToConstant: 49).isActive = true
        coinHealthMeterContainer.heightAnchor.constraint(equalToConstant: 5).isActive = true
                
        coinHealthMeter.layer.cornerRadius = 5/2
        coinHealthMeter.layer.masksToBounds = false
        coinHealthMeter.translatesAutoresizingMaskIntoConstraints = false
        coinHealthMeterContainer.addSubview(coinHealthMeter)
        coinHealthMeter.leadingAnchor.constraint(equalTo: coinHealthMeterContainer.leadingAnchor).isActive = true
        coinHealthMeter.centerYAnchor.constraint(equalTo: coinHealthMeterContainer.centerYAnchor).isActive = true
        coinHealthMeter.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        coinRankContainer.backgroundColor = .clear
        coinRankContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinRankContainer)
        coinRankContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        coinRankContainer.leadingAnchor.constraint(equalTo: coinHealthContainer.trailingAnchor, constant: 5).isActive = true
        coinRankContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        coinRankContainer.widthAnchor.constraint(equalToConstant: priceScoreWidth).isActive = true
        
        volatilityContainer.backgroundColor = .clear
        volatilityContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(volatilityContainer)
        volatilityContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        volatilityContainer.leadingAnchor.constraint(equalTo: coinRankContainer.trailingAnchor, constant: 5).isActive = true
        volatilityContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        volatilityContainer.widthAnchor.constraint(equalToConstant: volatilityWidth).isActive = true
        
        volatilityGraphImageView.contentMode = .scaleAspectFill
        volatilityGraphImageView.translatesAutoresizingMaskIntoConstraints = false
        volatilityContainer.addSubview(volatilityGraphImageView)
        volatilityGraphImageView.centerXAnchor.constraint(equalTo: volatilityContainer.centerXAnchor).isActive = true
        volatilityGraphImageView.centerYAnchor.constraint(equalTo: volatilityContainer.centerYAnchor).isActive = true
        volatilityGraphImageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        volatilityGraphImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        priceContainer.backgroundColor = .clear
        priceContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceContainer)
        priceContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        priceContainer.leadingAnchor.constraint(equalTo: volatilityContainer.trailingAnchor, constant: 5).isActive = true
        priceContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        priceContainer.widthAnchor.constraint(equalToConstant: rankWidth).isActive = true
        
        createSectionLabel(label: coinHealthLabel, string: "9.0", cointainer: coinHealthContainer)
        createSectionLabel(label: coinRankLabel, string: "7.0", cointainer: coinRankContainer)
        createSectionLabel(label: priceScoreLabel, string: "8.3", cointainer: priceContainer)
        
        coinHealthLabel.isHidden = true
        
        //
        
        marketCapContainer.backgroundColor = .clear
        marketCapContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(marketCapContainer)
        marketCapContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        marketCapContainer.leadingAnchor.constraint(equalTo: priceContainer.trailingAnchor, constant: 5).isActive = true
        marketCapContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        marketCapContainer.widthAnchor.constraint(equalToConstant: 85).isActive = true
        
        percentChangeContainer.backgroundColor = .clear
        percentChangeContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(percentChangeContainer)
        percentChangeContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        percentChangeContainer.leadingAnchor.constraint(equalTo: marketCapContainer.trailingAnchor, constant: 5).isActive = true
        percentChangeContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        percentChangeContainer.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        volumeContainer.backgroundColor = .clear
        volumeContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(volumeContainer)
        volumeContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        volumeContainer.leadingAnchor.constraint(equalTo: percentChangeContainer.trailingAnchor, constant: 5).isActive = true
        volumeContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        volumeContainer.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        createSectionLabel(label: marketCapLabel, string: "9.0", cointainer: marketCapContainer)
        createSectionLabel(label: percentChangeLabel, string: "7.0", cointainer: percentChangeContainer)
        createSectionLabel(label: volumeLabel, string: "6.5", cointainer: volumeContainer)
        
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
