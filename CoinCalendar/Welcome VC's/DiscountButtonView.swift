//
//  DiscountButtonView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/6/21.
//

import UIKit

class DiscountButtonView: UIView {
    
    var priceLabel = UILabel()
    var updatedPriceLabel = UILabel()
    var purpleBG = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: VIEWS

extension DiscountButtonView {
    
    func setupViews() {
        
        purpleBG.backgroundColor = .pinkTheme
        purpleBG.layer.cornerRadius = 10
        purpleBG.layer.masksToBounds = true
        purpleBG.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(purpleBG)
        purpleBG.fillSuperview()
        
        priceLabel.textAlignment = .center
        priceLabel.textColor = .white
        priceLabel.font = .sofiaSemiBold(ofSize: 17)
        priceLabel.numberOfLines = 0
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        purpleBG.addSubview(priceLabel)
        priceLabel.centerYAnchor.constraint(equalTo: purpleBG.centerYAnchor).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: purpleBG.centerXAnchor).isActive = true
        
        updatedPriceLabel.alpha = 0
        updatedPriceLabel.textAlignment = .center
        updatedPriceLabel.textColor = .white
        updatedPriceLabel.font = .sofiaSemiBold(ofSize: 17)
        updatedPriceLabel.numberOfLines = 0
        updatedPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        purpleBG.addSubview(updatedPriceLabel)
        updatedPriceLabel.centerYAnchor.constraint(equalTo: purpleBG.centerYAnchor, constant: 0).isActive = true
        updatedPriceLabel.centerXAnchor.constraint(equalTo: purpleBG.centerXAnchor).isActive = true
        updatedPriceLabel.transform = CGAffineTransform(translationX: 0, y: -50)
        
    }
    
}

//MARK: ACTIONS

extension DiscountButtonView {
    
    func applyPromoCodeAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.priceLabel.transform = CGAffineTransform(translationX: 0, y: 50)
            self.priceLabel.alpha = 0
        }) { (success) in
            UIView.animate(withDuration: 0.5) {
                self.updatedPriceLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.updatedPriceLabel.alpha = 1.0
            }
        }
    }
    
}
