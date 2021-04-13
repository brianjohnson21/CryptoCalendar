//
//  CoinDetailCoinTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/12/21.
//

import UIKit

class CoinDetailCoinTableViewCell: UITableViewCell {
    
    var coinImageView = UIImageView()
    var blockChainLabel = UILabel()
    var coinLabel = UILabel()

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

extension CoinDetailCoinTableViewCell {
    func setupViews() {
        
        coinImageView.backgroundColor = .blue
        coinImageView.layer.cornerRadius = 50/2
        coinImageView.layer.masksToBounds = true
        coinImageView.contentMode = .scaleAspectFill
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinImageView)
        coinImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17).isActive = true
        coinImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        blockChainLabel.textAlignment = .left
        blockChainLabel.textColor = .black
        blockChainLabel.font = .sofiaSemiBold(ofSize: 26)
        blockChainLabel.numberOfLines = 0
        blockChainLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(blockChainLabel)
        blockChainLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 11).isActive = true
        blockChainLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor, constant: 4).isActive = true
        
        coinLabel.textAlignment = .left
        coinLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        coinLabel.font = .sofiaMedium(ofSize: 19)
        coinLabel.numberOfLines = 0
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinLabel)
        coinLabel.leadingAnchor.constraint(equalTo: blockChainLabel.leadingAnchor, constant: 0).isActive = true
        coinLabel.topAnchor.constraint(equalTo: blockChainLabel.bottomAnchor, constant: 2).isActive = true
        
    }
}
