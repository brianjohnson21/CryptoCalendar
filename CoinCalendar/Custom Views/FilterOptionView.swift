//
//  FilterOptionView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/5/21.
//

import UIKit

class FilterOptionView: UIButton {

    var selectionBubble = UIView()
    var filterLabel = UILabel()
    var selectionButton = UIButton()
    
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

extension FilterOptionView {
    func setupViews() {
        
        filterLabel.layer.zPosition = 2
        filterLabel.font = .sofiaBold(ofSize: 11)
        filterLabel.textColor = .white
        filterLabel.textAlignment = .center
        filterLabel.numberOfLines = 0
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(filterLabel)
        filterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        filterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        selectionBubble.alpha = 0
        selectionBubble.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        selectionBubble.backgroundColor = .white
        selectionBubble.layer.cornerRadius = 21/2
        selectionBubble.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(selectionBubble)
        selectionBubble.leadingAnchor.constraint(equalTo: filterLabel.leadingAnchor, constant: -7).isActive = true
        selectionBubble.trailingAnchor.constraint(equalTo: filterLabel.trailingAnchor, constant: 7).isActive = true
        selectionBubble.centerYAnchor.constraint(equalTo: filterLabel.centerYAnchor, constant: -1).isActive = true
        selectionBubble.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
}

//MARK: ACTIONS

extension FilterOptionView {
    func didSelectOption() {
        UIView.animate(withDuration: 0.2) {
            self.filterLabel.textColor = .coinBaseBlue
            self.selectionBubble.alpha = 1.0
            self.selectionBubble.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    func desSelectOption() {
        UIView.animate(withDuration: 0.2) {
            self.filterLabel.textColor = .white
            self.selectionBubble.alpha = 0
            self.selectionBubble.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }
    }
    
    func optionSet() {
        self.filterLabel.textColor = .coinBaseBlue
        self.selectionBubble.alpha = 1.0
        self.selectionBubble.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
}
