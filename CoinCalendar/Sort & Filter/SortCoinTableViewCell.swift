//
//  SortCoinTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/29/21.
//

import UIKit

class SortCoinTableViewCell: UITableViewCell {
    
    var coinImageView = UIImageView()
    var coinLabel = UILabel()
    var blockChainLabel = UILabel()
    var emptyImageView = UIImageView()
    var selectedImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension SortCoinTableViewCell {
    func setupViews() {
        
        coinImageView.backgroundColor = .green
        coinImageView.contentMode = .scaleAspectFill
        coinImageView.layer.cornerRadius = 29/2
        coinImageView.translatesAutoresizingMaskIntoConstraints  = false
        contentView.addSubview(coinImageView)
        coinImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26).isActive = true
        coinImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        blockChainLabel.font = .sofiaMedium(ofSize: 15)
        blockChainLabel.textAlignment = .left
        blockChainLabel.textColor = .black
        blockChainLabel.numberOfLines = 0
        blockChainLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(blockChainLabel)
        blockChainLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 13).isActive = true
        blockChainLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor, constant: 0).isActive = true
        
        coinLabel.font = .sofiaRegular(ofSize: 11)
        coinLabel.textAlignment = .left
        coinLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        coinLabel.numberOfLines = 0
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinLabel)
        coinLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 13).isActive = true
        coinLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor, constant: 0).isActive = true
        
        emptyImageView.image = UIImage(named: "emptySquare")
        //emptyImageView.setImageColor(color: .coinBaseBlue)
        emptyImageView.contentMode = .scaleAspectFill
        emptyImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emptyImageView)
        emptyImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26).isActive = true
        emptyImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        emptyImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        emptyImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        selectedImageView.alpha = 0
        selectedImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        selectedImageView.image = UIImage(named: "checkSquare")
        //selectedImageView.setImageColor(color: .coinBaseBlue)
        selectedImageView.contentMode = .scaleAspectFill
        selectedImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(selectedImageView)
        selectedImageView.leadingAnchor.constraint(equalTo: emptyImageView.leadingAnchor).isActive = true
        selectedImageView.topAnchor.constraint(equalTo: emptyImageView.topAnchor).isActive = true
        selectedImageView.trailingAnchor.constraint(equalTo: emptyImageView.trailingAnchor).isActive = true
        selectedImageView.bottomAnchor.constraint(equalTo: emptyImageView.bottomAnchor).isActive = true
    }
}

//MARK: ACTIONS

extension SortCoinTableViewCell {
    @objc func activateFilter() {
        lightImpactGenerator()        
        UIView.animate(withDuration: 0.25) {
            self.selectedImageView.alpha = 1.0
            self.selectedImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    @objc func deactivateFilter() {
        lightImpactGenerator()
        UIView.animate(withDuration: 0.25) {
            self.selectedImageView.alpha = 0
            self.selectedImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }
    }
}
