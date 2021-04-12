//
//  CompareTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/12/21.
//

import UIKit

class CompareTableViewCell: UITableViewCell {
    
    var centerContainer = UIView()
    var leftContainer = UIView()
    var rightContainer = UIView()
    
    var keyMetricLabel = UILabel()
    var leftLabel = UILabel()
    var rightLabel = UILabel()
    
    var dividerLine = UIView()
    
    var leftVolatility = UIImageView()
    var rightVolatility = UIImageView()
    
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

extension CompareTableViewCell {
    
    func setupViews() {
        
        centerContainer.backgroundColor = .clear
        centerContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(centerContainer)
        centerContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        centerContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        centerContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        centerContainer.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        leftContainer.backgroundColor = .clear
        leftContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(leftContainer)
        leftContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        leftContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        leftContainer.trailingAnchor.constraint(equalTo: centerContainer.leadingAnchor).isActive = true
        leftContainer.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        rightContainer.backgroundColor = .clear
        rightContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rightContainer)
        rightContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        rightContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        rightContainer.leadingAnchor.constraint(equalTo: centerContainer.trailingAnchor).isActive = true
        rightContainer.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        keyMetricLabel.textAlignment = .center
        keyMetricLabel.textColor = UIColor.black.withAlphaComponent(0.35)
        keyMetricLabel.font = .sofiaRegular(ofSize: 13)
        keyMetricLabel.numberOfLines = 0
        keyMetricLabel.translatesAutoresizingMaskIntoConstraints = false
        centerContainer.addSubview(keyMetricLabel)
        keyMetricLabel.centerXAnchor.constraint(equalTo: centerContainer.centerXAnchor).isActive = true
        keyMetricLabel.centerYAnchor.constraint(equalTo: centerContainer.centerYAnchor).isActive = true
        
        leftLabel.textAlignment = .center
        leftLabel.textColor = .black
        leftLabel.font = .sofiaSemiBold(ofSize: 20)
        leftLabel.numberOfLines = 0
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftContainer.addSubview(leftLabel)
        leftLabel.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor).isActive = true
        leftLabel.centerYAnchor.constraint(equalTo: leftContainer.centerYAnchor).isActive = true
        
        rightLabel.textAlignment = .center
        rightLabel.textColor = .black
        rightLabel.font = .sofiaSemiBold(ofSize: 20)
        rightLabel.numberOfLines = 0
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightContainer.addSubview(rightLabel)
        rightLabel.centerXAnchor.constraint(equalTo: rightContainer.centerXAnchor).isActive = true
        rightLabel.centerYAnchor.constraint(equalTo: rightContainer.centerYAnchor).isActive = true
        
        dividerLine.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dividerLine)
        dividerLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        dividerLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        dividerLine.widthAnchor.constraint(equalToConstant: 93).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        leftVolatility.isHidden = true
        leftVolatility.contentMode = .scaleAspectFill
        leftVolatility.translatesAutoresizingMaskIntoConstraints = false
        leftContainer.addSubview(leftVolatility)
        leftVolatility.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor).isActive = true
        leftVolatility.centerYAnchor.constraint(equalTo: leftContainer.centerYAnchor).isActive = true
        leftVolatility.heightAnchor.constraint(equalToConstant: 19).isActive = true
        leftVolatility.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        rightVolatility.isHidden = true
        rightVolatility.contentMode = .scaleAspectFill
        rightVolatility.translatesAutoresizingMaskIntoConstraints = false
        rightContainer.addSubview(rightVolatility)
        rightVolatility.centerXAnchor.constraint(equalTo: rightContainer.centerXAnchor).isActive = true
        rightVolatility.centerYAnchor.constraint(equalTo: rightContainer.centerYAnchor).isActive = true
        rightVolatility.heightAnchor.constraint(equalToConstant: 19).isActive = true
        rightVolatility.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
}
