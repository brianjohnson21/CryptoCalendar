//
//  InfoTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/6/21.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    var infoTitleLabel = UILabel()
    var infoDetailLabel = UILabel()
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

extension InfoTableViewCell {
    func setupViews() {
        
        infoTitleLabel.textAlignment = .left
        infoTitleLabel.textColor = .coinBaseBlue
        infoTitleLabel.font = .sofiaSemiBold(ofSize: 18)
        infoTitleLabel.numberOfLines = 0
        infoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoTitleLabel)
        infoTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        infoTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        
        infoDetailLabel.textAlignment = .left
        infoDetailLabel.textColor = .black
        infoDetailLabel.font = .sofiaRegular(ofSize: 16)
        infoDetailLabel.numberOfLines = 0
        infoDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoDetailLabel)
        infoDetailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        infoDetailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        infoDetailLabel.topAnchor.constraint(equalTo: infoTitleLabel.bottomAnchor, constant: 17).isActive = true
        infoDetailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        dividerLine.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dividerLine)
        dividerLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
