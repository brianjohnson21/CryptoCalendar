//
//  SpotlightCollectionViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import UIKit

class SpotlightCollectionViewCell: UICollectionViewCell {
    
    var shadowView = UIView()
    var containerView = UIView()
    var expertImageView = UIImageView()
    var greenRedArrow = UIImageView()
    var percentLabel = UILabel()
    var expertNameLabel = UILabel()
    var gradientImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        contentView.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.contentView.layer.masksToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

// MARK: VIEWS

extension SpotlightCollectionViewCell {
    func setupViews() {
        
        shadowView.backgroundColor = .clear
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowOpacity = 0.05
        shadowView.layer.shadowRadius = 4
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shadowView)
        shadowView.fillSuperview()
        
        containerView.backgroundColor = .lightGray
        containerView.layer.cornerRadius = 17
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.addSubview(containerView)
        containerView.fillSuperview()
                
        expertImageView.backgroundColor = .lightGray
        expertImageView.contentMode = .scaleAspectFill
        expertImageView.layer.masksToBounds = true
        expertImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(expertImageView)
        expertImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -5).isActive = true
        expertImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 5).isActive = true
        expertImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        expertImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        gradientImageView.image = UIImage(named: "spotlightGradient")
        gradientImageView.contentMode = .scaleAspectFill
        gradientImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(gradientImageView)
        gradientImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        gradientImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        gradientImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        gradientImageView.heightAnchor.constraint(equalToConstant: 82).isActive = true
        
        //greenRedArrow.image = UIImage(named: "greenArrowDownTwo")
        greenRedArrow.contentMode = .scaleAspectFill
        greenRedArrow.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(greenRedArrow)
        greenRedArrow.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        greenRedArrow.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -19).isActive = true
        greenRedArrow.heightAnchor.constraint(equalToConstant: 13).isActive = true
        greenRedArrow.widthAnchor.constraint(equalToConstant: 11).isActive = true
        
        percentLabel.textAlignment = .left
        percentLabel.textColor = UIColor.white.withAlphaComponent(0.75)
        percentLabel.font = .sofiaSemiBold(ofSize: 15)
        percentLabel.numberOfLines = 0
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(percentLabel)
        percentLabel.centerYAnchor.constraint(equalTo: greenRedArrow.centerYAnchor, constant: -1).isActive = true
        percentLabel.leadingAnchor.constraint(equalTo: greenRedArrow.trailingAnchor, constant: 5).isActive = true
        
        expertNameLabel.textAlignment = .left
        expertNameLabel.textColor = .white
        expertNameLabel.font = .sofiaSemiBold(ofSize: 26)
        expertNameLabel.numberOfLines = 0
        expertNameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(expertNameLabel)
        expertNameLabel.bottomAnchor.constraint(equalTo: greenRedArrow.topAnchor, constant: -8).isActive = true
        expertNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        
    }
}
