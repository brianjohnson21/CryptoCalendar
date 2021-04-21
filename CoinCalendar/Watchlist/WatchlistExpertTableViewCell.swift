//
//  WatchlistExpertTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/21/21.
//

import UIKit

class WatchlistExpertTableViewCell: UITableViewCell {
    
    var contentContainer = UIView()
    var coinImageView = UIImageView()
    var coinNameLabel = UILabel()
    var blockChainNameLabel = UILabel()
    
    var coinPriceLabel = UILabel()
    var percentChangeLabel = UILabel()
    
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

extension WatchlistExpertTableViewCell {
    
    func setupViews() {
        
        contentContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        contentContainer.layer.cornerRadius = 0
        contentContainer.backgroundColor = .white
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentContainer)
        contentContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        contentContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        contentContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        contentContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        coinImageView.contentMode = .scaleAspectFill
        coinImageView.layer.cornerRadius = 29/2
        coinImageView.layer.masksToBounds = true
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(coinImageView)
        coinImageView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 10).isActive = true
        coinImageView.centerYAnchor.constraint(equalTo: contentContainer.centerYAnchor, constant: 0).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        blockChainNameLabel.textAlignment = .left
        blockChainNameLabel.textColor = .black
        blockChainNameLabel.font = .sofiaMedium(ofSize: 15)
        blockChainNameLabel.numberOfLines = 0
        blockChainNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(blockChainNameLabel)
        blockChainNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 13).isActive = true
        blockChainNameLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor, constant: 0).isActive = true
        
        coinNameLabel.textAlignment = .left
        coinNameLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        coinNameLabel.font = .sofiaRegular(ofSize: 11)
        coinNameLabel.numberOfLines = 0
        coinNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(coinNameLabel)
        coinNameLabel.leadingAnchor.constraint(equalTo: blockChainNameLabel.leadingAnchor, constant: 0).isActive = true
        coinNameLabel.topAnchor.constraint(equalTo: blockChainNameLabel.bottomAnchor, constant: 3).isActive = true
        
        coinPriceLabel.textAlignment = .right
        coinPriceLabel.textColor = .black
        coinPriceLabel.font = .sofiaMedium(ofSize: 15)
        coinPriceLabel.numberOfLines = 0
        coinPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(coinPriceLabel)
        coinPriceLabel.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -10).isActive = true
        coinPriceLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor, constant: 0).isActive = true
        
        percentChangeLabel.textAlignment = .right
        percentChangeLabel.textColor = UIColor(red: 36/255, green: 157/255, blue: 48/255, alpha: 0.6)
        percentChangeLabel.font = .sofiaRegular(ofSize: 11)
        percentChangeLabel.numberOfLines = 0
        percentChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(percentChangeLabel)
        percentChangeLabel.trailingAnchor.constraint(equalTo: coinPriceLabel.trailingAnchor, constant: 0).isActive = true
        percentChangeLabel.centerYAnchor.constraint(equalTo: coinNameLabel.centerYAnchor, constant: 0).isActive = true
        
    }
    
}
