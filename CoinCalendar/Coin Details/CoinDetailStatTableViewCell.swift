//
//  CoinDetailStatTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/12/21.
//

import UIKit

class CoinDetailStatTableViewCell: UITableViewCell {
    
    var detailImageView = UIImageView()
    var detailLabel = UILabel()
    var statLabel = UILabel()

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

extension CoinDetailStatTableViewCell {
    func setupViews() {
                
        detailImageView.contentMode = .scaleAspectFill
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailImageView)
        detailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17).isActive = true
        detailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        detailImageView.heightAnchor.constraint(equalToConstant: 21).isActive = true
        detailImageView.widthAnchor.constraint(equalToConstant: 21).isActive = true
        
        detailLabel.textColor = .black
        detailLabel.textAlignment = .left
        detailLabel.font = .sofiaRegular(ofSize: 16)
        detailLabel.numberOfLines = 0
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailLabel)
        detailLabel.leadingAnchor.constraint(equalTo: detailImageView.trailingAnchor, constant: 17).isActive = true
        detailLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        statLabel.textColor = .black
        statLabel.textAlignment = .right
        statLabel.font = .sofiaRegular(ofSize: 16)
        statLabel.numberOfLines = 0
        statLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(statLabel)
        statLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        statLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
    }
}
