//
//  MainFeedCardTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit

class MainFeedCardTableViewCell: UITableViewCell {
    
    var shadowLayer = UIView()
    var contentContainer = UIView()
    var headlineLabel = UILabel()
    var detailLabel = UILabel()
    var dateLabel = UILabel()
    var moreDotsImageView = UIImageView()
    var cryptoImageView = UIImageView()

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

extension MainFeedCardTableViewCell {
    
    func setupViews() {
        
        shadowLayer.backgroundColor = .clear
        shadowLayer.layer.shadowColor = UIColor.black.cgColor
        shadowLayer.layer.shadowOffset = CGSize(width: 1, height: 2)
        shadowLayer.layer.shadowOpacity = 0.15
        shadowLayer.layer.shadowRadius = 4
        shadowLayer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shadowLayer)
        shadowLayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18).isActive = true
        shadowLayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18).isActive = true
        shadowLayer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7.5).isActive = true
        shadowLayer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7.5).isActive = true
        
        contentContainer.backgroundColor = .white
        contentContainer.layer.cornerRadius = 8
        contentContainer.layer.masksToBounds = true
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        shadowLayer.addSubview(contentContainer)
        contentContainer.fillSuperview()
        
        headlineLabel.textAlignment = .left
        headlineLabel.textColor = .keyEventHeadlineColorModeLight
        headlineLabel.font = .sofiaSemiBold(ofSize: 15)
        headlineLabel.numberOfLines = 0
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(headlineLabel)
        headlineLabel.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 14).isActive = true
        headlineLabel.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 12).isActive = true
        
        moreDotsImageView.image = UIImage(named: "more-horizontal")
        moreDotsImageView.contentMode = .scaleAspectFill
        moreDotsImageView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(moreDotsImageView)
        moreDotsImageView.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -8).isActive = true
        moreDotsImageView.centerYAnchor.constraint(equalTo: headlineLabel.centerYAnchor, constant: 0).isActive = true
        moreDotsImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        moreDotsImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        detailLabel.textAlignment = .left
        detailLabel.textColor = .keyEventDetailColorModeLight
        detailLabel.font = .sofiaMedium(ofSize: 13)
        detailLabel.numberOfLines = 2
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(detailLabel)
        detailLabel.leadingAnchor.constraint(equalTo: headlineLabel.leadingAnchor, constant: 0).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -50).isActive = true
        detailLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 15).isActive = true
        
        dateLabel.textAlignment = .left
        dateLabel.textColor = .keyEventHeadlineColorModeLight
        dateLabel.font = .sofiaRegular(ofSize: 13)
        dateLabel.numberOfLines = 2
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(dateLabel)
        dateLabel.leadingAnchor.constraint(equalTo: headlineLabel.leadingAnchor, constant: 0).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor, constant: -11).isActive = true
                
        cryptoImageView.image = UIImage(named: "btcIcon")
        cryptoImageView.contentMode = .scaleAspectFill
        cryptoImageView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(cryptoImageView)
        cryptoImageView.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -8).isActive = true
        cryptoImageView.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor, constant: -11).isActive = true
        cryptoImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        cryptoImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
    }
    
}
