//
//  CoinIconFeedTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/8/21.
//

import UIKit

class CoinIconFeedTableViewCell: UITableViewCell {
    
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

extension CoinIconFeedTableViewCell {
    func setupViews() {
        
        coinContainer.backgroundColor = .clear
        coinContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinContainer)
        coinContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        coinContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        coinContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        coinContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        //coinContainer.widthAnchor.constraint(equalToConstant: 53).isActive = true

        coinImageView.contentMode = .scaleAspectFill
        coinImageView.layer.cornerRadius = 29/2
        coinImageView.layer.masksToBounds = true
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        coinContainer.addSubview(coinImageView)
        coinImageView.centerYAnchor.constraint(equalTo: coinContainer.centerYAnchor).isActive = true
        coinImageView.centerXAnchor.constraint(equalTo: coinContainer.centerXAnchor).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
    }

}
