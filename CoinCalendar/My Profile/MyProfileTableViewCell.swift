//
//  MyProfileTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import UIKit

class MyProfileTableViewCell: UITableViewCell {

    var settingsIcon = UIImageView()
    var settingsLabel = UILabel()
    var dividerLine = UIView()
    var arrowImageView = UIImageView()
    var profileButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear//UIColor(red: 27/255, green: 28/255, blue: 30/255, alpha: 1.0)
        self.backgroundColor = .clear//UIColor(red: 27/255, green: 28/255, blue: 30/255, alpha: 1.0)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension MyProfileTableViewCell {
    
    func setupViews() {
        
        settingsIcon.contentMode = .scaleAspectFill
        settingsIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(settingsIcon)
        settingsIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26).isActive = true
        settingsIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        settingsIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        settingsIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        settingsLabel.textAlignment = .left
        settingsLabel.textColor = .keyEventHeadlineColorModeLight
        settingsLabel.font = .sofiaSemiBold(ofSize: 15)
        settingsLabel.numberOfLines = 0
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(settingsLabel)
        settingsLabel.leadingAnchor.constraint(equalTo: settingsIcon.trailingAnchor, constant: 17).isActive = true
        settingsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        
        dividerLine.backgroundColor = UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.1)
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dividerLine)
        dividerLine.leadingAnchor.constraint(equalTo: settingsIcon.leadingAnchor, constant: 0).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        arrowImageView.alpha = 0.5
        arrowImageView.image = UIImage(named: "arrow-left")
        arrowImageView.setImageColor(color: .keyEventDetailColorModeLight)
        arrowImageView.transform = arrowImageView.transform.rotated(by: .pi)
        arrowImageView.contentMode = .scaleAspectFill
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(arrowImageView)
        arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileButton)
        profileButton.fillSuperview()
        
    }
    
}
