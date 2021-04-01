//
//  PickCryptoCollectionViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/31/21.
//

import UIKit

class PickCryptoCollectionViewCell: UICollectionViewCell {
    
    var circularView = CircularProgressView()
    var duration: TimeInterval!
    var coinImageView = UIImageView()
    var coinLabel = UILabel()
    var blockChainLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        contentView.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

// MARK: VIEWS

extension PickCryptoCollectionViewCell {
    
    func setupViews() {
        //let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        //coinImageView.addGestureRecognizer(tap)
        coinImageView.isUserInteractionEnabled = true
        coinImageView.backgroundColor = .clear
        coinImageView.contentMode = .scaleAspectFill
        coinImageView.layer.cornerRadius = 60/2
        coinImageView.translatesAutoresizingMaskIntoConstraints  = false
        contentView.addSubview(coinImageView)
        coinImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        coinImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        blockChainLabel.font = .sofiaMedium(ofSize: 15)
        blockChainLabel.textAlignment = .center
        blockChainLabel.textColor = .black
        blockChainLabel.numberOfLines = 0
        blockChainLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(blockChainLabel)
        blockChainLabel.centerXAnchor.constraint(equalTo: coinImageView.centerXAnchor, constant: 0).isActive = true
        blockChainLabel.topAnchor.constraint(equalTo: coinImageView.bottomAnchor, constant: 7).isActive = true
        
        coinLabel.font = .sofiaRegular(ofSize: 11)
        coinLabel.textAlignment = .center
        coinLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        coinLabel.numberOfLines = 0
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinLabel)
        coinLabel.centerXAnchor.constraint(equalTo: coinImageView.centerXAnchor, constant: 0).isActive = true
        coinLabel.topAnchor.constraint(equalTo: blockChainLabel.bottomAnchor, constant: 4).isActive = true
                
        //
        
        //circularView.center = coinImageView.center
        circularView.alpha = 0
        circularView.backgroundColor = .clear
        circularView.translatesAutoresizingMaskIntoConstraints = false
        circularView.isUserInteractionEnabled = false
        contentView.addSubview(circularView)
        circularView.leadingAnchor.constraint(equalTo: coinImageView.leadingAnchor).isActive = true
        circularView.trailingAnchor.constraint(equalTo: coinImageView.trailingAnchor).isActive = true
        circularView.topAnchor.constraint(equalTo: coinImageView.topAnchor).isActive = true
        circularView.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor).isActive = true
        
    
    }
    
    
    @objc func handleTap() {
        circularView.alpha = 1.0
        duration = 0.4    //Play with whatever value you want :]
        circularView.progressAnimation(duration: duration)
    }
    
    @objc func hideRing() {
        circularView.alpha = 0
    }
    
}
