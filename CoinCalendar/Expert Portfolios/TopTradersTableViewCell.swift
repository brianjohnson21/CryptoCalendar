//
//  TopTradersTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import UIKit

class TopTradersTableViewCell: UITableViewCell {
    
    let traderImageView = UIImageView()
    let traderNameLabel = UILabel()
    let traderCoinsLabel = UILabel()
    let returnPercentLabel = UILabel()
    let returnImageView = UIImageView()

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

extension TopTradersTableViewCell {
    func setupViews() {
        
        traderImageView.backgroundColor = .lightGray
        traderImageView.layer.cornerRadius = 61/2
        traderImageView.layer.masksToBounds = true
        traderImageView.contentMode = .scaleAspectFill
        traderImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(traderImageView)
        traderImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        traderImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        traderImageView.heightAnchor.constraint(equalToConstant: 61).isActive = true
        traderImageView.widthAnchor.constraint(equalToConstant: 61).isActive = true
        
        traderNameLabel.textAlignment = .left
        traderNameLabel.font = .sofiaSemiBold(ofSize: 20)
        traderNameLabel.textColor = .black
        traderNameLabel.numberOfLines = 0
        traderNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(traderNameLabel)
        traderNameLabel.leadingAnchor.constraint(equalTo: traderImageView.trailingAnchor, constant: 13).isActive = true
        traderNameLabel.topAnchor.constraint(equalTo: traderImageView.topAnchor, constant: 8).isActive = true

        traderCoinsLabel.textAlignment = .left
        traderCoinsLabel.font = .sofiaRegular(ofSize: 15)
        traderCoinsLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        traderCoinsLabel.numberOfLines = 0
        traderCoinsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(traderCoinsLabel)
        traderCoinsLabel.leadingAnchor.constraint(equalTo: traderNameLabel.leadingAnchor, constant: 0).isActive = true
        traderCoinsLabel.topAnchor.constraint(equalTo: traderNameLabel.bottomAnchor, constant: 7).isActive = true

        returnPercentLabel.textAlignment = .right
        returnPercentLabel.font = .sofiaSemiBold(ofSize: 15)
        returnPercentLabel.textColor = .black
        returnPercentLabel.numberOfLines = 0
        returnPercentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(returnPercentLabel)
        returnPercentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23).isActive = true
        returnPercentLabel.centerYAnchor.constraint(equalTo: traderNameLabel.centerYAnchor, constant: 0).isActive = true

        returnImageView.image = UIImage(named: "greenArrowDownTwo")
        returnImageView.contentMode = .scaleAspectFill
        returnImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(returnImageView)
        returnImageView.trailingAnchor.constraint(equalTo: returnPercentLabel.leadingAnchor, constant: -5).isActive = true
        returnImageView.centerYAnchor.constraint(equalTo: returnPercentLabel.centerYAnchor, constant: 0).isActive = true
        returnImageView.heightAnchor.constraint(equalToConstant: 13).isActive = true
        returnImageView.widthAnchor.constraint(equalToConstant: 11).isActive = true
    }
}
