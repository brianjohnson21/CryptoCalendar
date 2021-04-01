//
//  MyAlertsTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import UIKit

class MyAlertsTableViewCell: UITableViewCell {
    
    var alertTitleLabel = UILabel()
    var alertDetailLabel = UILabel()
    var dotsImageView = UIImageView()
    var dividerLine = UIView()

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

extension MyAlertsTableViewCell {
    func setupViews() {
        
        alertTitleLabel.textAlignment = .left
        alertTitleLabel.textColor = .black
        alertTitleLabel.font = .sofiaSemiBold(ofSize: 15)
        alertTitleLabel.numberOfLines = 0
        alertTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(alertTitleLabel)
        alertTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        alertTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        
        alertDetailLabel.textAlignment = .left
        alertDetailLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        alertDetailLabel.font = .sofiaMedium(ofSize: 13)
        alertDetailLabel.numberOfLines = 0
        alertDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(alertDetailLabel)
        alertDetailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        alertDetailLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor, constant: 10).isActive = true
        
        dividerLine.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dividerLine)
        dividerLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        dotsImageView.image = UIImage(named: "more-vertical")
        dotsImageView.setImageColor(color: .themePurple)
        dotsImageView.contentMode = .scaleAspectFill
        dotsImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dotsImageView)
        dotsImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        dotsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17).isActive = true
        dotsImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        dotsImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
}
