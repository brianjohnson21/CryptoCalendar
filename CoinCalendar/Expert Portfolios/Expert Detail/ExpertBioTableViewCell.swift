//
//  ExpertBioTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import UIKit

class ExpertBioTableViewCell: UITableViewCell {
    
    var whiteCornerView = UIView()
    
    var expertNameLabel = UILabel()
    var expertBioLabel = UILabel()
    var checkmarkImageView = UIImageView()
    var dividerLine = UIView()
    var igImageView = UIImageView()
    var igButton = UIButton()
    var twitterImageView = UIImageView()
    var twitterButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        self.layer.masksToBounds = false
        self.contentView.layer.masksToBounds = false
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension ExpertBioTableViewCell {
    func setupViews() {
        
        whiteCornerView.backgroundColor = .white
        whiteCornerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        whiteCornerView.layer.cornerRadius = 21
        whiteCornerView.layer.shadowColor = UIColor.black.cgColor
        whiteCornerView.layer.shadowOffset = CGSize(width: 0, height: -4)
        whiteCornerView.layer.shadowOpacity = 0.25
        whiteCornerView.layer.shadowRadius = 6
        whiteCornerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(whiteCornerView)
        whiteCornerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        whiteCornerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        whiteCornerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        whiteCornerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        expertNameLabel.textAlignment = .left
        expertNameLabel.textColor = .black
        expertNameLabel.font = .sofiaBold(ofSize: 26)
        expertNameLabel.numberOfLines = 0
        expertNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(expertNameLabel)
        expertNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        expertNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21).isActive = true
        
        expertBioLabel.textAlignment = .left
        expertBioLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        expertBioLabel.font = .sofiaRegular(ofSize: 15)
        expertBioLabel.numberOfLines = 0
        expertBioLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(expertBioLabel)
        expertBioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        expertBioLabel.topAnchor.constraint(equalTo: expertNameLabel.bottomAnchor, constant: 20).isActive = true
        expertBioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23).isActive = true
        expertBioLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -36).isActive = true
        
        twitterImageView.image = UIImage(named: "twitterThicc")
        twitterImageView.setImageColor(color: .black)
        twitterImageView.contentMode = .scaleAspectFill
        twitterImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(twitterImageView)
        twitterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23).isActive = true
        twitterImageView.centerYAnchor.constraint(equalTo: expertNameLabel.centerYAnchor, constant: 0).isActive = true
        twitterImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        twitterImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(twitterButton)
        twitterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        twitterButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        twitterButton.bottomAnchor.constraint(equalTo: twitterImageView.bottomAnchor, constant: 10).isActive = true
        twitterButton.leadingAnchor.constraint(equalTo: twitterImageView.leadingAnchor, constant: -5).isActive = true
        
        igImageView.image = UIImage(named: "igThicc")
        igImageView.setImageColor(color: .black)
        igImageView.contentMode = .scaleAspectFill
        igImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(igImageView)
        igImageView.trailingAnchor.constraint(equalTo: twitterImageView.leadingAnchor, constant: -17).isActive = true
        igImageView.centerYAnchor.constraint(equalTo: expertNameLabel.centerYAnchor, constant: 0).isActive = true
        igImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        igImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        igButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(igButton)
        igButton.trailingAnchor.constraint(equalTo: twitterButton.leadingAnchor, constant: 0).isActive = true
        igButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        igButton.bottomAnchor.constraint(equalTo: igImageView.bottomAnchor, constant: 10).isActive = true
        igButton.leadingAnchor.constraint(equalTo: igImageView.leadingAnchor, constant: -5).isActive = true
        
        checkmarkImageView.image = UIImage(named: "checkmarkBlue")
        checkmarkImageView.setImageColor(color: .coinBaseBlue)
        checkmarkImageView.contentMode = .scaleAspectFill
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(checkmarkImageView)
        checkmarkImageView.leadingAnchor.constraint(equalTo: expertNameLabel.trailingAnchor, constant: 6).isActive = true
        checkmarkImageView.centerYAnchor.constraint(equalTo: expertNameLabel.centerYAnchor, constant: 0).isActive = true
        checkmarkImageView.heightAnchor.constraint(equalToConstant: 21).isActive = true
        checkmarkImageView.widthAnchor.constraint(equalToConstant: 21).isActive = true
        
        dividerLine.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        dividerLine.layer.cornerRadius = 1/2
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dividerLine)
        dividerLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}
