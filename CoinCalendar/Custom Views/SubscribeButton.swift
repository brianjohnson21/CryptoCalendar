//
//  SubscribeButton.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 5/12/21.
//

import UIKit
import Lottie

protocol SubscribeButtonDelegate: class {
    func didFinishCheckmark()
}

class SubscribeButton: UIButton {

    var delegate: SubscribeButtonDelegate!
    var continueLabel = UILabel()
    var confirmLabel = UILabel()
    var purpleBG = UIView()
    var checkmarkLottie = AnimationView()
    var spinner = UIActivityIndicatorView(style: .medium)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: VIEWS

extension SubscribeButton {
    
    func setupViews() {
        
        purpleBG.isUserInteractionEnabled = false
        purpleBG.backgroundColor = .white
        purpleBG.layer.cornerRadius = 10
        purpleBG.layer.masksToBounds = true
        purpleBG.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(purpleBG)
        purpleBG.fillSuperview()
        
        continueLabel.isUserInteractionEnabled = false
        continueLabel.textAlignment = .center
        continueLabel.textColor = .keyEventHeadlineColorModeLight
        continueLabel.font = .sofiaSemiBold(ofSize: 22)
        continueLabel.numberOfLines = 0
        continueLabel.translatesAutoresizingMaskIntoConstraints = false
        purpleBG.addSubview(continueLabel)
        continueLabel.centerYAnchor.constraint(equalTo: purpleBG.centerYAnchor).isActive = true
        continueLabel.centerXAnchor.constraint(equalTo: purpleBG.centerXAnchor).isActive = true
        
        confirmLabel.isUserInteractionEnabled = false
        confirmLabel.alpha = 0
        confirmLabel.textAlignment = .center
        confirmLabel.textColor = .white
        confirmLabel.font = .sofiaSemiBold(ofSize: 17)
        confirmLabel.numberOfLines = 0
        confirmLabel.translatesAutoresizingMaskIntoConstraints = false
        purpleBG.addSubview(confirmLabel)
        confirmLabel.centerYAnchor.constraint(equalTo: purpleBG.centerYAnchor, constant: 0).isActive = true
        confirmLabel.centerXAnchor.constraint(equalTo: purpleBG.centerXAnchor).isActive = true
        
        spinner.isHidden = true
        spinner.alpha = 0
        spinner.color = .keyEventHeadlineColorModeLight
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        purpleBG.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: purpleBG.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: purpleBG.centerYAnchor).isActive = true
        
        let checkAnimation = Animation.named("checkSuccessBurst")
        checkmarkLottie.isUserInteractionEnabled = false
        checkmarkLottie.alpha = 1.0
        checkmarkLottie.animation = checkAnimation
        checkmarkLottie.loopMode = .playOnce
        checkmarkLottie.contentMode = .scaleAspectFill
        checkmarkLottie.backgroundColor = .clear
        checkmarkLottie.translatesAutoresizingMaskIntoConstraints = false
        purpleBG.addSubview(checkmarkLottie)
        checkmarkLottie.centerXAnchor.constraint(equalTo: purpleBG.centerXAnchor).isActive = true
        checkmarkLottie.centerYAnchor.constraint(equalTo: purpleBG.centerYAnchor, constant: 0).isActive = true
        checkmarkLottie.heightAnchor.constraint(equalToConstant: 50).isActive = true
        checkmarkLottie.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //checkmarkLottie.play()
        
    }
    
}

//MARK: ACTIONS

extension SubscribeButton {
    
    func showNewLabel() {
        confirmLabel.transform = CGAffineTransform(translationX: 0, y: -50)
        UIView.animate(withDuration: 0.25, delay: 0, options: [], animations: {
            self.continueLabel.transform = CGAffineTransform(translationX: 0, y: 50)
            self.continueLabel.alpha = 0
        }) { (success) in
            UIView.animate(withDuration: 0.25) {
                self.confirmLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.confirmLabel.alpha = 1.0
            }
        }
    }
    
    func showOriginalLabel() {
        UIView.animate(withDuration: 0.25, delay: 0, options: [], animations: {
            self.confirmLabel.transform = CGAffineTransform(translationX: 0, y: -50)
            self.confirmLabel.alpha = 0
        }) { (success) in
            UIView.animate(withDuration: 0.25) {
                self.continueLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.continueLabel.alpha = 1.0
            }
        }
    }
    
    @objc func showCheckmark() {
        spinner.isHidden = true
        UIView.animate(withDuration: 0.2, animations: {
            self.continueLabel.alpha = 0
            self.continueLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.spinner.alpha = 0
        }) { (success) in
            self.checkmarkLottie.play { (success) in
                self.delegate.didFinishCheckmark()
            }
        }
    }
    
    func showLoader() {
        UIView.animate(withDuration: 0.2, animations: {
            self.continueLabel.alpha = 0
            self.continueLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { (success) in
            self.spinner.isHidden = false
            UIView.animate(withDuration: 0.35) {
                self.spinner.alpha = 1.0
            }
        }
    }
    
    @objc func didCancelLoader() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
            //self.spinner.transform = CGAffineTransform(translationX: 0, y: 50)
            self.spinner.alpha = 0
        }) { (success) in
            UIView.animate(withDuration: 0.2) {
                self.continueLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.continueLabel.alpha = 1.0
            }
        }
    }
    
    @objc func showCheckMarkThenConfirm() {
        UIView.animate(withDuration: 0.2, animations: {
            self.continueLabel.alpha = 0
            self.continueLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { (success) in
            self.confirmLabel.alpha = 0
            self.confirmLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.checkmarkLottie.play { (success) in
                UIView.animate(withDuration: 0.35, animations: {
                    self.checkmarkLottie.alpha = 0
                    self.checkmarkLottie.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                }) { (success) in
                    UIView.animate(withDuration: 0.35, animations: {
                        self.confirmLabel.alpha = 1.0
                        self.confirmLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }) { (success) in
                        //
                    }
                }
            }
        }
    }
    
}
