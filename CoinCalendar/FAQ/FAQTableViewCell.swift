//
//  FAQTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 5/2/21.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    
    var questionLabel = UILabel()
    var faqLabel = UILabel()

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
          
}

//MARK: Helpers

extension FAQTableViewCell {
    
    func setupViews() {
        
        questionLabel.textAlignment = .left
        questionLabel.font = .sofiaSemiBold(ofSize: 14)
        questionLabel.textColor = .coinBaseBlue //.keyEventHeadlineColorModeLight
        questionLabel.numberOfLines = 0
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(questionLabel)
        questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        
        faqLabel.textAlignment = .left
        faqLabel.font = .sofiaRegular(ofSize: 12)
        faqLabel.textColor = UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.6)
        faqLabel.numberOfLines = 0
        faqLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(faqLabel)
        faqLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        faqLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 9).isActive = true
        faqLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        faqLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        
    }
    
}
