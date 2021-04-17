//
//  ContactsTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/16/21.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    var containerView = UIView()
    var nameCircleImageView = UIImageView()
    var nameCircleLabel = UILabel()
    var contactNameLabel = UILabel()
    var phoneNumberLabel = UILabel()
    var selectedImageView = UIImageView()
    var bigPlusImageView = UIImageView()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

// MARK: Helpers

extension ContactsTableViewCell {
    
    private func setupViews() {
        
        containerView.backgroundColor = .clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        // MARK: Name Circle
        
        nameCircleImageView.layer.cornerRadius = 60/2
        nameCircleImageView.backgroundColor = .lightGray
        nameCircleImageView.contentMode = .scaleAspectFill
        nameCircleImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(nameCircleImageView)
        nameCircleImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        nameCircleImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        nameCircleImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nameCircleImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        nameCircleLabel.textAlignment = .center
        nameCircleLabel.textColor = .keyEventHeadlineColorModeLight
        nameCircleLabel.font = .sofiaRegular(ofSize: 22)
        nameCircleLabel.numberOfLines = 0
        nameCircleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCircleImageView.addSubview(nameCircleLabel)
        nameCircleLabel.centerYAnchor.constraint(equalTo: nameCircleImageView.centerYAnchor).isActive = true
        nameCircleLabel.centerXAnchor.constraint(equalTo: nameCircleImageView.centerXAnchor).isActive = true
        
        // MARK: Setup Contact Label
        
        contactNameLabel.textColor = UIColor.keyEventHeadlineColorModeLight
        contactNameLabel.textAlignment = .left
        contactNameLabel.font = .sofiaSemiBold(ofSize: 15)
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(contactNameLabel)
        contactNameLabel.leadingAnchor.constraint(equalTo: nameCircleImageView.trailingAnchor, constant: 20).isActive = true
        contactNameLabel.topAnchor.constraint(equalTo: nameCircleImageView.topAnchor, constant: 9).isActive = true
        
        // MARK: Setup Phone Number Label
        
        phoneNumberLabel.textColor = UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.6)
        phoneNumberLabel.textAlignment = .left
        phoneNumberLabel.font = .sofiaRegular(ofSize: 13)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(phoneNumberLabel)
        phoneNumberLabel.topAnchor.constraint(equalTo: contactNameLabel.bottomAnchor, constant: 4).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: contactNameLabel.leadingAnchor, constant: 0).isActive = true
        //phoneNumberLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        //phoneNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
//        let selectedImage = UIImage(named: "bigPlus")
//        selectedImageView.setImageColor(color: .themePurple)
//        selectedImageView.image = selectedImage
//        selectedImageView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.addSubview(selectedImageView)
//        selectedImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
//        selectedImageView.heightAnchor.constraint(equalToConstant: 23).isActive = true
//        selectedImageView.widthAnchor.constraint(equalToConstant: 23).isActive = true
//        selectedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        bigPlusImageView.image = UIImage(named: "plus-circle1.5")
        bigPlusImageView.setImageColor(color: .coinBaseBlue)
        bigPlusImageView.contentMode = .scaleAspectFill
        bigPlusImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(bigPlusImageView)
        bigPlusImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        bigPlusImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        bigPlusImageView.heightAnchor.constraint(equalToConstant: 23).isActive = true
        bigPlusImageView.widthAnchor.constraint(equalToConstant: 23).isActive = true
        
    }
    
}

// MARK: Actions

extension ContactsTableViewCell {
    
    func selectedState() {
        let selectedImage = UIImage(named: "checkFull")
        bigPlusImageView.image = selectedImage
    }
    
    func deselectedState() {
        
        let selectedImage = UIImage(named: "bigPlus")
        selectedImageView.image = selectedImage
        selectedImageView.setImageColor(color: .coinBaseBlue)
        
    }
    
    func jiggle() {
        lightImpactGenerator()
        UIView.animate(withDuration: 0.15, animations: {
            self.containerView.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }) { (success) in
            UIView.animate(withDuration: 0.15, animations: {
                self.containerView.transform = CGAffineTransform(scaleX: 1.02, y: 1.02)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.15, animations: {
                    self.containerView.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
                }, completion: { (success) in
                    UIView.animate(withDuration: 0.15, animations: {
                        self.containerView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }, completion: { (success) in
                        print("complete")
                        
                    })
                })
            })
        }
    }
    
           
}


