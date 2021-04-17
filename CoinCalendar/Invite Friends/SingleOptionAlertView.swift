//
//  SingleOptionAlertView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/16/21.
//

import UIKit
import Lottie

class SingleOptionAlertView: UIView {

    //var delegate: ConfirmAlertViewDelegte!
    var opacityLayer = UIView()
    var containerView = UIView()
    var reqTitleLabel = UILabel()
    var reqDetailLabel = UILabel()
    var topDividerLine = UIView()
    var confirmLabel = UILabel()
    
    var confirmButton = UIButton()
    var whiteCoverView = UIView()
    var lottieCompleted = false
    
    var confettiCannons = AnimationView()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Views

extension SingleOptionAlertView {
    func setupViews() {
        
        opacityLayer.backgroundColor = .black
        opacityLayer.alpha = 0
        opacityLayer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(opacityLayer)
        opacityLayer.fillSuperview()
        
        containerView.backgroundColor = .themeGray
        containerView.layer.cornerRadius = 11
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 0.18
        containerView.layer.shadowRadius = 0.28
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32).isActive = true
        containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 204).isActive = true
        containerView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        containerView.alpha = 0
        
        //reqTitleLabel.text = "End Video Chat"
        reqTitleLabel.textAlignment = .center
        reqTitleLabel.textColor = .white//UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 1.0)
        reqTitleLabel.font = .sofiaBold(ofSize: 18)
        reqTitleLabel.numberOfLines = 0
        reqTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(reqTitleLabel)
        reqTitleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        reqTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25).isActive = true
        
        reqDetailLabel.setupLineHeight(myText: "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor incididunt ut.", myLineSpacing: 4)
        reqDetailLabel.textAlignment = .center
        reqDetailLabel.textColor = UIColor.white.withAlphaComponent(0.6)//UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        reqDetailLabel.font = .sofiaRegular(ofSize: 15)
        reqDetailLabel.numberOfLines = 0
        reqDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(reqDetailLabel)
        //reqDetailLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        reqDetailLabel.topAnchor.constraint(equalTo: reqTitleLabel.bottomAnchor, constant: 7).isActive = true
        reqDetailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        reqDetailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        topDividerLine.backgroundColor = UIColor.white.withAlphaComponent(0.1)//UIColor(red: 228/255, green: 228/255, blue: 230/255, alpha: 1.0)
        topDividerLine.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(topDividerLine)
        topDividerLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 31.5).isActive = true
        topDividerLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -31.5).isActive = true
        topDividerLine.topAnchor.constraint(equalTo: reqDetailLabel.bottomAnchor, constant: 20.5).isActive = true
        topDividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
                
        confirmLabel.text = "GOT IT"
        confirmLabel.textAlignment = .center
        confirmLabel.textColor = UIColor.white.withAlphaComponent(0.8)//.themePurple//UIColor(red: 255/255, green: 81/255, blue: 6/255, alpha: 1.0)
        confirmLabel.font = .sofiaBold(ofSize: 13)
        confirmLabel.numberOfLines = 0
        confirmLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(confirmLabel)
        confirmLabel.topAnchor.constraint(equalTo: topDividerLine.bottomAnchor, constant: 24).isActive = true
        confirmLabel.centerXAnchor.constraint(equalTo: topDividerLine.centerXAnchor, constant: 0).isActive = true
        
        //Buttons
        
        confirmButton.addTarget(self, action: #selector(animateViewsOut), for: .touchUpInside)
        confirmButton.backgroundColor = .clear//UIColor.red.withAlphaComponent(0.5)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(confirmButton)
        confirmButton.leadingAnchor.constraint(equalTo: confirmLabel.leadingAnchor, constant: -20).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: confirmLabel.bottomAnchor, constant: 20).isActive = true
        confirmButton.trailingAnchor.constraint(equalTo: confirmLabel.trailingAnchor, constant: 20).isActive = true
        confirmButton.topAnchor.constraint(equalTo: confirmLabel.topAnchor, constant: -20).isActive = true
        
        whiteCoverView.isHidden = true
        whiteCoverView.alpha = 0
        whiteCoverView.backgroundColor = .backgroundTheme
        whiteCoverView.layer.cornerRadius = 11
        whiteCoverView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(whiteCoverView)
        whiteCoverView.fillSuperview()
        
        let cannonAnimation = Animation.named("Confetti_v03")
        confettiCannons.isUserInteractionEnabled = false
        confettiCannons.alpha = 0
        confettiCannons.animation = cannonAnimation
        confettiCannons.loopMode = .loop
        confettiCannons.animationSpeed = 1.15
        confettiCannons.contentMode = .scaleAspectFill
        confettiCannons.backgroundColor = .clear
        confettiCannons.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(confettiCannons)
        confettiCannons.fillSuperview()
        //confettiCannons.play()
        
    }
}

//MARK: ACTIONS

extension SingleOptionAlertView {
    
    @objc func animateViewsin() {
        
        self.isHidden = false
        confettiCannons.play()
        confettiCannons.alpha = 1.0
        UIView.animate(withDuration: 0.3, delay: 0.5, options: [], animations: {
            self.opacityLayer.alpha = 0.7
            self.containerView.transform = CGAffineTransform(translationX: 1.05, y: 1.05)
            self.containerView.alpha = 1.0
        }) { (success) in
            UIView.animate(withDuration: 0.15, animations: {
                self.containerView.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
            }) { (success) in
                UIView.animate(withDuration: 0.15) {
                    self.containerView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }
        }
        
    }
    
    @objc func animateViewsOut() {
        lightImpactGenerator()
        UIView.animate(withDuration: 0.3, animations: {
            self.opacityLayer.alpha = 0
            self.confettiCannons.alpha = 0
            self.containerView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            self.containerView.alpha = 0
        }) { (success) in
            self.isHidden = true
            if self.lottieCompleted {
                self.confettiCannons.stop()
                //self.delegate.didFinishCheckmarkAnimation()
                self.isHidden = true
            }
        }
    }
    
    @objc func showSuccess() {
        whiteCoverView.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.whiteCoverView.alpha = 1.0
        }) { (success) in
            self.animateViewsOut()
        }
    }
    
}



