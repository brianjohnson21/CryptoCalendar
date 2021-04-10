//
//  TempCodeViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/9/21.
//

import Foundation
import UIKit
import Lottie

extension TempCodeViewController {
    
    func setupPromoContainer() {
        
        opacityLayer.backgroundColor = .white
        opacityLayer.alpha = 0
        opacityLayer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(opacityLayer)
        opacityLayer.fillSuperview()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.8
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        opacityLayer.addSubview(blurEffectView)
                
        promoContainer.backgroundColor = .clear
        promoContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(promoContainer)
        promoContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        promoContainer.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        promoContainer.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        promoContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        backImageView.alpha = 0
        backImageView.image = UIImage(named: "backWhiteArrow")
        backImageView.setImageColor(color: .black)
        backImageView.contentMode = .scaleAspectFill
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        promoContainer.addSubview(backImageView)
        backImageView.leadingAnchor.constraint(equalTo: promoContainer.leadingAnchor, constant: 26).isActive = true
        backImageView.topAnchor.constraint(equalTo: promoContainer.topAnchor, constant: 51).isActive = true
        backImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        backImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        backButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        backButton.backgroundColor = .clear
        backButton.translatesAutoresizingMaskIntoConstraints = false
        promoContainer.addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: promoContainer.leadingAnchor, constant: 0).isActive = true
        backButton.topAnchor.constraint(equalTo: promoContainer.topAnchor, constant: 0).isActive = true
        backButton.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: 30).isActive = true
        backButton.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 30).isActive = true
        
        promoCodeContainer.alpha = 0
        promoCodeContainer.backgroundColor = .clear//UIColor.clear.withAlphaComponent(0.2)
        promoCodeContainer.layer.borderColor = UIColor.coinBaseBlue.cgColor
        promoCodeContainer.layer.borderWidth = 1
        promoCodeContainer.layer.cornerRadius = 4
        promoCodeContainer.translatesAutoresizingMaskIntoConstraints = false
        promoContainer.addSubview(promoCodeContainer)
        promoCodeContainer.leadingAnchor.constraint(equalTo: promoContainer.leadingAnchor, constant: 45).isActive = true
        promoCodeContainer.trailingAnchor.constraint(equalTo: promoContainer.trailingAnchor, constant: -45).isActive = true
        promoCodeContainer.centerYAnchor.constraint(equalTo: promoContainer.centerYAnchor, constant: -50).isActive = true
        promoCodeContainer.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        var placeHolder = NSMutableAttributedString()
        let Name  = "Access code"
        placeHolder = NSMutableAttributedString(string:Name, attributes: [NSAttributedString.Key.font: UIFont.sofiaSemiBold(ofSize: 22)])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black.withAlphaComponent(0.85), range:NSRange(location:0,length:Name.count))
        promoCodeTextField.attributedPlaceholder = placeHolder
        promoCodeTextField.autocorrectionType = .no
        promoCodeTextField.font = .sofiaSemiBold(ofSize: 22)
        promoCodeTextField.textColor = .black
        promoCodeTextField.tintColor = .black
        promoCodeTextField.returnKeyType = .done
        promoCodeTextField.delegate = self
        promoCodeTextField.textAlignment = .center
        promoCodeTextField.tag = 1
        promoCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        promoCodeContainer.addSubview(promoCodeTextField)
        promoCodeTextField.leadingAnchor.constraint(equalTo: promoCodeContainer.leadingAnchor, constant: 18).isActive = true
        promoCodeTextField.trailingAnchor.constraint(equalTo: promoCodeContainer.trailingAnchor, constant: -18).isActive = true
        promoCodeTextField.topAnchor.constraint(equalTo: promoCodeContainer.topAnchor, constant: 0).isActive = true
        promoCodeTextField.bottomAnchor.constraint(equalTo: promoCodeContainer.bottomAnchor, constant: 0).isActive = true
        
        promoSubmitButton.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)
        promoSubmitButton.addTarget(self, action: #selector(didTapSubmit), for: .touchUpInside)
        promoSubmitButton.backgroundColor = UIColor.coinBaseBlue.withAlphaComponent(0.8)
        promoSubmitButton.setTitle("Submit", for: .normal)
        promoSubmitButton.setTitleColor(.white, for: .normal)
        promoSubmitButton.titleLabel?.font = .sofiaSemiBold(ofSize: 22)
        promoCodeTextField.inputAccessoryView = promoSubmitButton
        
        let successCheck = Animation.named("successCheck")
        successCheckLottie.isUserInteractionEnabled = false
        successCheckLottie.alpha = 0
        successCheckLottie.animation = successCheck
        successCheckLottie.loopMode = .playOnce
        successCheckLottie.animationSpeed = 1.0
        successCheckLottie.contentMode = .scaleAspectFill
        successCheckLottie.backgroundColor = .clear
        successCheckLottie.translatesAutoresizingMaskIntoConstraints = false
        promoContainer.addSubview(successCheckLottie)
        successCheckLottie.centerXAnchor.constraint(equalTo: promoCodeContainer.centerXAnchor).isActive = true
        successCheckLottie.centerYAnchor.constraint(equalTo: promoCodeContainer.centerYAnchor, constant: 0).isActive = true
        successCheckLottie.heightAnchor.constraint(equalToConstant: 100).isActive = true
        successCheckLottie.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //successCheckLottie.play()
    }
    
}
