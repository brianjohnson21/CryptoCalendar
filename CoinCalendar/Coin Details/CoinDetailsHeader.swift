//
//  CoinDetailsHeader.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/12/21.
//

import UIKit

class CoinDetailsHeader: UIView {
    
    var sectionTitleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupViews()
   }
   
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}

// MARK: VIEWS

extension CoinDetailsHeader {
    
    func setupViews() {
        sectionTitleLabel.textColor = .black
        sectionTitleLabel.textAlignment = .left
        sectionTitleLabel.font = .sofiaSemiBold(ofSize: 21)
        sectionTitleLabel.numberOfLines = 0
        sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sectionTitleLabel)
        sectionTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17).isActive = true
        sectionTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -23).isActive = true
    }
    
}
