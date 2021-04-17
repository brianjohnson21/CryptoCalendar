//
//  InviteFriendsSectionHeaderView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/16/21.
//

import UIKit

class InviteFriendsSectionHeaderView: UIView {
    
    var letterLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .coinBaseBlue
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: VIEWS

extension InviteFriendsSectionHeaderView {
    
    func setupViews() {
        letterLabel.textAlignment = .left
        letterLabel.font = .sofiaSemiBold(ofSize: 15)
        letterLabel.textColor = UIColor.white
        letterLabel.numberOfLines = 0
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(letterLabel)
        letterLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 29).isActive = true
        letterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
}
