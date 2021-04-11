//
//  PinnedCoinCollectionViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/10/21.
//

import UIKit

class PinnedCoinCollectionViewCell: UICollectionViewCell {
    
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

    var volatilityGraphImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.masksToBounds = false
        self.layer.masksToBounds = false
        contentView.backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

//MARK: VIEWS

extension PinnedCoinCollectionViewCell {
    func setupViews() {                
        
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
        coinRankContainer.leadingAnchor.constraint(equalTo: coinHealthContainer.trailingAnchor).isActive = true
        coinRankContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        coinRankContainer.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        volatilityContainer.backgroundColor = .clear
        volatilityContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(volatilityContainer)
        volatilityContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        volatilityContainer.leadingAnchor.constraint(equalTo: coinRankContainer.trailingAnchor).isActive = true
        volatilityContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        volatilityContainer.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
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
        priceContainer.leadingAnchor.constraint(equalTo: volatilityContainer.trailingAnchor).isActive = true
        priceContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        priceContainer.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        createSectionLabel(label: coinHealthLabel, string: "9.0", cointainer: coinHealthContainer)
        createSectionLabel(label: coinRankLabel, string: "7.0", cointainer: coinRankContainer)
        createSectionLabel(label: priceScoreLabel, string: "8.3", cointainer: priceContainer)
        
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
