//
//  SetAlertOptionOneTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/10/21.
//

import UIKit

class SetAlertOptionOneTableViewCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var upDownImageView = UIImageView()
    var titleLabelExtended = UILabel()
    var bottomTitleLabel = UILabel()
    var emptyImageView = UIImageView()
    var selectedImageView = UIImageView()

    var detailLabel = UILabel()
    
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

extension SetAlertOptionOneTableViewCell {
    func setupViews() {
        
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.font = .sofiaMedium(ofSize: 16)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        upDownImageView.contentMode = .scaleAspectFit
        upDownImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(upDownImageView)
        upDownImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5).isActive = true
        upDownImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: -2).isActive = true
        upDownImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        upDownImageView.widthAnchor.constraint(equalToConstant: 13).isActive = true
        
        titleLabelExtended.textColor = .black
        titleLabelExtended.textAlignment = .left
        titleLabelExtended.font = .sofiaMedium(ofSize: 16)
        titleLabelExtended.numberOfLines = 0
        titleLabelExtended.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabelExtended)
        titleLabelExtended.leadingAnchor.constraint(equalTo: upDownImageView.trailingAnchor, constant: 5).isActive = true
        titleLabelExtended.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0).isActive = true
        
        bottomTitleLabel.textColor = .black
        bottomTitleLabel.textAlignment = .left
        bottomTitleLabel.font = .sofiaMedium(ofSize: 16)
        bottomTitleLabel.numberOfLines = 0
        bottomTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bottomTitleLabel)
        bottomTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        bottomTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7).isActive = true
        
        detailLabel.textColor = UIColor.black.withAlphaComponent(0.35)
        detailLabel.textAlignment = .left
        detailLabel.font = .sofiaRegular(ofSize: 14)
        detailLabel.numberOfLines = 0
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailLabel)
        detailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        detailLabel.topAnchor.constraint(equalTo: bottomTitleLabel.bottomAnchor, constant: 8).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
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

extension SetAlertOptionOneTableViewCell {
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
