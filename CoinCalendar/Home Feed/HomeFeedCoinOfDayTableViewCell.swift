//
//  HomeFeedCoinOfDayTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/1/21.
//

import UIKit

class HomeFeedCoinOfDayTableViewCell: UITableViewCell {
    
    var cardContainer = UIView()
    var coinOfDayLabel = UILabel()
    
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

extension HomeFeedCoinOfDayTableViewCell {
    func setupViews() {
                
        cardContainer.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        cardContainer.layer.cornerRadius = 14
        cardContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cardContainer)
        cardContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        cardContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        cardContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21).isActive = true
        cardContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        
        let coinOfDayLabelText = "COIN\nOF THE\nDAY"
        coinOfDayLabel.setupLineHeight(myText: coinOfDayLabelText, myLineSpacing: 4)
        coinOfDayLabel.textAlignment = .left
        coinOfDayLabel.textColor = .keyEventHeadlineColorModeLight
        coinOfDayLabel.font = .sofiaBold(ofSize: 42)
        coinOfDayLabel.numberOfLines = 0
        coinOfDayLabel.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(coinOfDayLabel)
        coinOfDayLabel.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 17).isActive = true
        coinOfDayLabel.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: -25).isActive = true
    }
}
