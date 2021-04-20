//
//  ExpertWatchlistTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/19/21.
//

import UIKit

class ExpertWatchlistTableViewCell: UITableViewCell {

    var coinImageView = UIImageView()
    var blockChainNameLabel = UILabel()
    var coinNameLabel = UILabel()
    var coinPriceLabel = UILabel()
    
    var dividerLine = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .white
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension ExpertWatchlistTableViewCell {
    func setupViews() {
        coinImageView.contentMode = .scaleAspectFill
        coinImageView.layer.cornerRadius = 29/2
        coinImageView.layer.masksToBounds = true
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinImageView)
        coinImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        coinImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        blockChainNameLabel.textAlignment = .center
        blockChainNameLabel.textColor = UIColor.black
        blockChainNameLabel.font = .sofiaMedium(ofSize: 15)
        blockChainNameLabel.numberOfLines = 0
        blockChainNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(blockChainNameLabel)
        blockChainNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 13).isActive = true
        blockChainNameLabel.centerYAnchor.constraint(equalTo: coinImageView.centerYAnchor, constant: -6).isActive = true
        
        coinNameLabel.textAlignment = .center
        coinNameLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        coinNameLabel.font = .sofiaRegular(ofSize: 11)
        coinNameLabel.numberOfLines = 0
        coinNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinNameLabel)
        coinNameLabel.leadingAnchor.constraint(equalTo: blockChainNameLabel.leadingAnchor, constant: 0).isActive = true
        coinNameLabel.topAnchor.constraint(equalTo: blockChainNameLabel.bottomAnchor, constant: 3).isActive = true
        
        coinPriceLabel.textAlignment = .right
        coinPriceLabel.textColor = UIColor.black
        coinPriceLabel.font = .sofiaSemiBold(ofSize: 15)
        coinPriceLabel.numberOfLines = 0
        coinPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinPriceLabel)
        coinPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23).isActive = true
        coinPriceLabel.centerYAnchor.constraint(equalTo: blockChainNameLabel.centerYAnchor, constant: 0).isActive = true
                
    }
}
