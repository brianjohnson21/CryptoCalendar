//
//  OptionsView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import UIKit

class OptionsView: UIView {
    
    var iconImageView = UIImageView()
    var optionTitleLabel = UILabel()
    var optionDetailLabel = UILabel()
    var optionButton = UIButton()

    override init(frame: CGRect) {
       super.init(frame: frame)
       self.backgroundColor = .clear
       setupViews()
       
   }
   
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}

// MARK: Helpers

extension OptionsView {
    
    func setupViews() {
        
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(iconImageView)
        iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        optionTitleLabel.textColor = .keyEventHeadlineColorModeLight
        optionTitleLabel.font = .sofiaMedium(ofSize: 17)
        optionTitleLabel.textAlignment = .left
        optionTitleLabel.numberOfLines = 0
        optionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(optionTitleLabel)
        optionTitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 21).isActive = true
        optionTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 21).isActive = true
        
        optionDetailLabel.textColor = UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.6)
        optionDetailLabel.font = .sofiaRegular(ofSize: 13)
        optionDetailLabel.textAlignment = .left
        optionDetailLabel.numberOfLines = 0
        optionDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(optionDetailLabel)
        optionDetailLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 21).isActive = true
        optionDetailLabel.topAnchor.constraint(equalTo: optionTitleLabel.bottomAnchor, constant: 5).isActive = true
        
        optionButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(optionButton)
        optionButton.fillSuperview()
        
    }
    
}

