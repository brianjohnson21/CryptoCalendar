//
//  ExpertPostTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/19/21.
//

import UIKit

class ExpertPostTableViewCell: UITableViewCell {
    
    var shadowLayer = UIView()
    var contentContainer = UIView()
    
    var expertImageView = UIImageView()
    var expertNameLabel = UILabel()
    var reportDots = UIImageView()
    var expertMessageLabel = UILabel()
    var postDateLabel = UILabel()
    var moreDots = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        //self.contentView.backgroundColor = .white
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension ExpertPostTableViewCell {
    func setupViews() {
        
        expertImageView.layer.zPosition = 2
        expertImageView.backgroundColor = .blue
        expertImageView.contentMode = .scaleAspectFill
        expertImageView.layer.cornerRadius = 29/2
        expertImageView.layer.masksToBounds = true
        expertImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(expertImageView)
        expertImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 31).isActive = true
        expertImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19).isActive = true
        expertImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        expertImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        expertNameLabel.layer.zPosition = 2
        expertNameLabel.textColor = .black
        expertNameLabel.textAlignment = .left
        expertNameLabel.font = .sofiaSemiBold(ofSize: 15)
        expertNameLabel.numberOfLines = 0
        expertNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(expertNameLabel)
        expertNameLabel.leadingAnchor.constraint(equalTo: expertImageView.trailingAnchor, constant: 5).isActive = true
        expertNameLabel.centerYAnchor.constraint(equalTo: expertImageView.centerYAnchor, constant: 0).isActive = true
        
        expertMessageLabel.layer.zPosition = 2
        expertMessageLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        expertMessageLabel.textAlignment = .left
        expertMessageLabel.font = .sofiaMedium(ofSize: 15)
        expertMessageLabel.numberOfLines = 0
        expertMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(expertMessageLabel)
        expertMessageLabel.leadingAnchor.constraint(equalTo: expertImageView.leadingAnchor, constant: 0).isActive = true
        expertMessageLabel.topAnchor.constraint(equalTo: expertImageView.bottomAnchor, constant: 19).isActive = true
        expertMessageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -31).isActive = true
        
        postDateLabel.layer.zPosition = 2
        postDateLabel.textColor = .black
        postDateLabel.textAlignment = .left
        postDateLabel.font = .sofiaRegular(ofSize: 13)
        postDateLabel.numberOfLines = 0
        postDateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(postDateLabel)
        postDateLabel.leadingAnchor.constraint(equalTo: expertImageView.leadingAnchor, constant: 0).isActive = true
        postDateLabel.topAnchor.constraint(equalTo: expertMessageLabel.bottomAnchor, constant: 16).isActive = true
        postDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25).isActive = true
        
        shadowLayer.backgroundColor = .clear
        shadowLayer.layer.shadowColor = UIColor.black.cgColor
        shadowLayer.layer.shadowOffset = CGSize(width: 1, height: 2)
        shadowLayer.layer.shadowOpacity = 0.15
        shadowLayer.layer.shadowRadius = 4
        shadowLayer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shadowLayer)
        shadowLayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        shadowLayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23).isActive = true
        shadowLayer.bottomAnchor.constraint(equalTo: postDateLabel.bottomAnchor, constant: 17).isActive = true
        shadowLayer.topAnchor.constraint(equalTo: expertImageView.topAnchor, constant: -11).isActive = true
        
        contentContainer.backgroundColor = .white
        contentContainer.layer.cornerRadius = 8
        contentContainer.layer.masksToBounds = true
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        shadowLayer.addSubview(contentContainer)
        contentContainer.fillSuperview()
        
        moreDots.image = UIImage(named: "more-horizontal")
        moreDots.setImageColor(color: UIColor.black.withAlphaComponent(0.6))
        moreDots.contentMode = .scaleAspectFill
        moreDots.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(moreDots)
        moreDots.centerYAnchor.constraint(equalTo: expertImageView.centerYAnchor).isActive = true
        moreDots.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -16).isActive = true
        moreDots.heightAnchor.constraint(equalToConstant: 24).isActive = true
        moreDots.widthAnchor.constraint(equalToConstant: 24).isActive = true
                
        
    }
}
