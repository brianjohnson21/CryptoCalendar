//
//  MainFeedListHeaderView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit

class MainFeedListHeaderView: UIView {
    
    var headerLabel = UILabel()

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

extension MainFeedListHeaderView {
    func setupViews() {
                        
        headerLabel.textAlignment = .left
        headerLabel.textColor = UIColor.black.withAlphaComponent(0.75)
        headerLabel.font = .sofiaBold(ofSize: 13)
        headerLabel.numberOfLines = 2
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(headerLabel)
        headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11).isActive = true
        
    }
}
