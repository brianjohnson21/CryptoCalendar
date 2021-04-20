//
//  FollowUnfollowView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/19/21.
//

import UIKit

class FollowUnfollowView: UIView {

    var containerView = UIView()
    var followImageView = UIImageView()
    var followLabel = UILabel()
    var unFollowLabel = UILabel()
    var checkmarkImageView = UIImageView() {
        didSet {
            print("here")
        }
    }
    var isFollowing = false
    /*
    var gamer: Gamer? {
        didSet {
            if (gamer?.areFollowing ?? false) {
                print("is following \(gamer?.areFollowing) - 🟩🟩🟩")
                //unFollowUser()
                followUser()
            } else {
                print("is not following \(gamer?.areFollowing) - 🟦🟦🟦")
                //followUser()
                unFollowUser()
            }
        }
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: VIEWS

extension FollowUnfollowView {
    
    func setupViews() {
        
        containerView.backgroundColor = .coinBaseBlue
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
        containerView.fillSuperview()
        
        followImageView.isHidden = true
        followImageView.alpha = 1.0
        followImageView.image = UIImage(named: "followUser")
        followImageView.setImageColor(color: .white)
        followImageView.contentMode = .scaleAspectFill
        followImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(followImageView)
        followImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        followImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 2).isActive = true
        followImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        followImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        checkmarkImageView.isHidden = true
        checkmarkImageView.alpha = 0
        checkmarkImageView.image = UIImage(named: "followCheck")
        checkmarkImageView.setImageColor(color: .white)
        checkmarkImageView.contentMode = .scaleAspectFill
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(checkmarkImageView)
        checkmarkImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkmarkImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        checkmarkImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        checkmarkImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        followLabel.text = "+ Follow"
        followLabel.textAlignment = .center
        followLabel.textColor = .white
        followLabel.font = .sofiaSemiBold(ofSize: 14)
        followLabel.numberOfLines = 0
        followLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(followLabel)
        followLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        followLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 1).isActive = true
        
        unFollowLabel.text = "Following"
        unFollowLabel.alpha = 0
        unFollowLabel.textAlignment = .center
        unFollowLabel.textColor = .white
        unFollowLabel.font = .sofiaSemiBold(ofSize: 14)
        unFollowLabel.numberOfLines = 0
        unFollowLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(unFollowLabel)
        unFollowLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        unFollowLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 1).isActive = true
        unFollowLabel.transform = CGAffineTransform(scaleX: 0.35, y: 0.35)
        
    }
    
}

//MARK: ACTIONS

extension FollowUnfollowView {
    
    func followUser() {
        lightImpactGenerator()
        //print("is following - 🟩🟩🟩")
        UIView.animate(withDuration: 0.25) {
            self.followImageView.alpha = 0
            self.followImageView.transform = CGAffineTransform(scaleX: 0.35, y: 0.35)
            self.followLabel.alpha = 0
            self.followLabel.transform = CGAffineTransform(scaleX: 0.35, y: 0.35)
        }
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: [], animations: {
            self.checkmarkImageView.alpha = 1.0
            self.checkmarkImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.unFollowLabel.alpha = 1.0
            self.unFollowLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
    }
    
    func unFollowUser() {
        lightImpactGenerator()
        //print("did this - 🟦🟦🟦")
        UIView.animate(withDuration: 0.25) {
            self.checkmarkImageView.alpha = 0
            self.unFollowLabel.alpha = 0
            self.unFollowLabel.transform = CGAffineTransform(scaleX: 0.35, y: 0.35)
            self.followImageView.transform = CGAffineTransform(scaleX: 0.35, y: 0.35)
        }
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: [], animations: {
            self.followImageView.alpha = 1.0
            self.checkmarkImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.followLabel.alpha = 1.0
            self.followLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
    }

}
