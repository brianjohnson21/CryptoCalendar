//
//  SignUpPNViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import Foundation
import UIKit
import Lottie

extension SignUpPNViewController {
    
    func setupTransitionViews() {
                    
        getStartedButton.backgroundColor = .coinBaseBlue
        getStartedButton.layer.cornerRadius = 63/2
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(getStartedButton)
        getStartedLeading = getStartedButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 18)
        getStartedLeading.isActive = true
        getStartedBottom = getStartedButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -72)
        getStartedBottom.isActive = true
        getStartedWidth = getStartedButton.widthAnchor.constraint(equalToConstant: 252)
        getStartedWidth.isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        
        getStartedLabel.text = "GET STARTED"
        getStartedLabel.textAlignment = .left
        getStartedLabel.textColor = .white
        getStartedLabel.font = .sofiaSemiBold(ofSize: 17)
        getStartedLabel.numberOfLines = 0
        getStartedLabel.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addSubview(getStartedLabel)
        getStartedLabel.leadingAnchor.constraint(equalTo: getStartedButton.leadingAnchor, constant: 33).isActive = true
        getStartedLabel.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor, constant: 0).isActive = true
                
        getStartedArrowImageView.image = UIImage(named: "getStartedArrow")
        getStartedArrowImageView.contentMode = .scaleAspectFill
        getStartedArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addSubview(getStartedArrowImageView)
        getStartedArrowImageView.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor).isActive = true
        getStartedArrowImageView.trailingAnchor.constraint(equalTo: getStartedButton.trailingAnchor, constant: -14).isActive = true
        getStartedArrowImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        getStartedArrowImageView.widthAnchor.constraint(equalToConstant: 62).isActive = true
        
            
    }
    
    func setupViews() {
        
        var conBottom: CGFloat = -325
        var backTop: CGFloat = 60
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            conBottom = -325
        case .iphone78() :
            conBottom = -240
            backTop = 40
        case .iphone78Plus() :
            conBottom = -250
            backTop = 40
        case .iphone11() :
            conBottom = -325
            
            
        default:
            conBottom = -325
        }
        
        mainContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainContainer.layer.cornerRadius = 15
        mainContainer.layer.masksToBounds = true
        mainContainer.backgroundColor = .white
        mainContainer.alpha = 0
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainContainer)
        //mainContainer.fillSuperview()
        mainContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 10).isActive = true
        mainHeight = mainContainer.heightAnchor.constraint(equalToConstant: view.frame.height)
        mainHeight.isActive = true
        
        dismissImageView.alpha = 0
        dismissImageView.image = UIImage(named: "searchX")
        dismissImageView.setImageColor(color: .coinBaseBlue)
        dismissImageView.contentMode = .scaleAspectFill
        dismissImageView.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(dismissImageView)
        dismissImageView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 24).isActive = true
        dismissImageView.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: backTop).isActive = true
        dismissImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        dismissImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true

        backImageView.image = UIImage(named: "arrow-left")
        backImageView.alpha = 0
        backImageView.contentMode = .scaleAspectFill
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(backImageView)
        backImageView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 24).isActive = true
        backImageView.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: backTop).isActive = true
        backImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        backImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        backImageView.transform = CGAffineTransform(translationX: 50, y: 0)
        
        backDismissButton.backgroundColor = .clear
        backDismissButton.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(backDismissButton)
        backDismissButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backDismissButton.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backDismissButton.bottomAnchor.constraint(equalTo: dismissImageView.bottomAnchor, constant: 15).isActive = true
        backDismissButton.trailingAnchor.constraint(equalTo: dismissImageView.trailingAnchor, constant: 15).isActive = true
        
        signUpTitleLabel.alpha = 0
        signUpTitleLabel.text = "Sign Up"
        signUpTitleLabel.textColor = .keyEventHeadlineColorModeLight
        signUpTitleLabel.textAlignment = .left
        signUpTitleLabel.font = .sofiaBold(ofSize: 34)
        signUpTitleLabel.numberOfLines = 0
        signUpTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(signUpTitleLabel)
        signUpTitleLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 24).isActive = true
        signUpTitleLabel.topAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 40).isActive = true
        
        signUpSteplabel.alpha = 0
        signUpSteplabel.isHidden = true
        signUpSteplabel.text = "Step 1 of 3"
        signUpSteplabel.textAlignment = .left
        signUpSteplabel.font = .sofiaSemiBold(ofSize: 15)
        signUpSteplabel.numberOfLines = 0
        signUpSteplabel.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(signUpSteplabel)
        signUpSteplabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 24).isActive = true
        signUpSteplabel.topAnchor.constraint(equalTo: signUpTitleLabel.bottomAnchor, constant: 10).isActive = true
        
        pageControl.alpha = 0
        if !isAppleEmailSignUp && !isFacebookSignUp {
            pageControl.numberOfPages = 4
        } else {
            pageControl.numberOfPages = 3
        }
        pageControl.padding = 4
        pageControl.radius = 3
        pageControl.currentPageTintColor = .coinBaseBlue
        pageControl.tintColor = UIColor.coinBaseBlue.withAlphaComponent(0.42)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(pageControl)
        pageControl.topAnchor.constraint(equalTo: signUpTitleLabel.bottomAnchor, constant: 11).isActive = true
        //pageControl.leadingAnchor.constraint(equalTo: signUpTitleLabel.leadingAnchor).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: signUpTitleLabel.leadingAnchor, constant: 10).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        continueButton.alpha = 0
        continueButton.continueLabel.alpha = 0
        continueButton.continueLabel.text = "Continue"
        continueButton.layer.cornerRadius = 63/2
        continueButton.backgroundColor = .coinBaseBlue
        continueButton.purpleBG.backgroundColor = .coinBaseBlue
        continueButton.layer.masksToBounds = true
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor, constant: 0).isActive = true
        continueBottom = continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -72)
        continueBottom.isActive = true
        let buttonWidth = self.view.frame.width - (18 * 2)
        continueWidth = continueButton.widthAnchor.constraint(equalToConstant: buttonWidth)
        continueWidth.isActive = true
        continueHeight = continueButton.heightAnchor.constraint(equalToConstant: 63)
        continueHeight.isActive = true
        
        termsLabel.alpha = 0
        termsLabel.setupLineHeight(myText: "By tapping continue, you are agreeing to our\nterms of use and privacy policy", myLineSpacing: 3)
        termsLabel.textAlignment = .center
        termsLabel.textColor = UIColor.coinBaseBlue.withAlphaComponent(0.6)
        termsLabel.font = .sofiaRegular(ofSize: 10)
        termsLabel.numberOfLines = 09
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(termsLabel)
        termsLabel.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 8).isActive = true
        termsLabel.centerXAnchor.constraint(equalTo: continueButton.centerXAnchor).isActive = true
        
        termsButton.isHidden = true
        termsButton.backgroundColor = .clear
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(termsButton)
        termsButton.leadingAnchor.constraint(equalTo: termsLabel.leadingAnchor).isActive = true
        termsButton.trailingAnchor.constraint(equalTo: termsLabel.trailingAnchor).isActive = true
        termsButton.topAnchor.constraint(equalTo: termsLabel.topAnchor).isActive = true
        termsButton.bottomAnchor.constraint(equalTo: termsLabel.bottomAnchor).isActive = true
        
//        continueLabel.text = "Continue"
//        continueLabel.textAlignment = .center
//        continueLabel.textColor = .coinBaseBlue
//        continueLabel.font = .sofiaSemiBold(ofSize: 17)
//        continueLabel.numberOfLines = 0
//        continueLabel.translatesAutoresizingMaskIntoConstraints = false
//        continueButton.addSubview(continueLabel)
//        continueLabel.centerYAnchor.constraint(equalTo: continueButton.centerYAnchor).isActive = true
//        continueLabel.centerXAnchor.constraint(equalTo: continueButton.centerXAnchor).isActive = true
        
        transitionView.layer.cornerRadius = 10
        transitionView.isUserInteractionEnabled = false
        transitionView.backgroundColor = .coinBaseBlue
        transitionView.alpha = 0
        transitionView.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(transitionView)
        transitionLeading = transitionView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 26)
        transitionLeading.isActive = true
        transitionTrailing = transitionView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -26)
        transitionTrailing.isActive = true
        transitionBottom = transitionView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: -42)
        transitionBottom.isActive = true
        transitionHeight = transitionView.heightAnchor.constraint(equalToConstant: 63)
        transitionHeight.isActive = true
        
    }
    
    func setupEnterName() {
        nameContainer.alpha = 0
        nameContainer.backgroundColor = .clear
        nameContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(nameContainer)
        nameContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        nameContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        nameContainer.topAnchor.constraint(equalTo: signUpSteplabel.bottomAnchor, constant: 16).isActive = true
        nameContainer.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        enterNameContainer.layer.borderColor = UIColor.coinBaseBlue.cgColor
        enterNameContainer.layer.borderWidth = 1
        enterNameContainer.layer.cornerRadius = 8
        enterNameContainer.translatesAutoresizingMaskIntoConstraints = false
        nameContainer.addSubview(enterNameContainer)
        enterNameContainer.leadingAnchor.constraint(equalTo: nameContainer.leadingAnchor, constant: 26).isActive = true
        enterNameContainer.trailingAnchor.constraint(equalTo: nameContainer.trailingAnchor, constant: -26).isActive = true
        enterNameContainer.topAnchor.constraint(equalTo: nameContainer.topAnchor, constant: 14).isActive = true
        enterNameContainer.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        var placeHolder = NSMutableAttributedString()
        let Name  = "Enter your name"
        placeHolder = NSMutableAttributedString(string:Name, attributes: [NSAttributedString.Key.font: UIFont.sofiaMedium(ofSize: 15)])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.coinBaseBlue.withAlphaComponent(0.4), range:NSRange(location:0,length:Name.count))
        enterNameTextField.attributedPlaceholder = placeHolder
        enterNameTextField.autocorrectionType = .no
        enterNameTextField.font = .sofiaMedium(ofSize: 15)
        enterNameTextField.textColor = .coinBaseBlue
        //enterNameTextField.becomeFirstResponder()
        enterNameTextField.tintColor = .coinBaseBlue
        enterNameTextField.returnKeyType = .done
        enterNameTextField.delegate = self
        enterNameTextField.tag = 1
        enterNameTextField.translatesAutoresizingMaskIntoConstraints = false
        enterNameContainer.addSubview(enterNameTextField)
        enterNameTextField.leadingAnchor.constraint(equalTo: enterNameContainer.leadingAnchor, constant: 18).isActive = true
        enterNameTextField.trailingAnchor.constraint(equalTo: enterNameContainer.trailingAnchor, constant: -8).isActive = true
        enterNameTextField.topAnchor.constraint(equalTo: enterNameContainer.topAnchor, constant: 0).isActive = true
        enterNameTextField.bottomAnchor.constraint(equalTo: enterNameContainer.bottomAnchor, constant: 0).isActive = true
        
        let checkAnimation = Animation.named("checkmark_1")
        checkmarkOneLottie.isUserInteractionEnabled = false
        checkmarkOneLottie.alpha = 1.0
        checkmarkOneLottie.animation = checkAnimation
        checkmarkOneLottie.contentMode = .scaleAspectFill
        checkmarkOneLottie.backgroundColor = .clear
        checkmarkOneLottie.translatesAutoresizingMaskIntoConstraints = false
        enterNameContainer.addSubview(checkmarkOneLottie)
        checkmarkOneLottie.centerYAnchor.constraint(equalTo: enterNameContainer.centerYAnchor).isActive = true
        checkmarkOneLottie.trailingAnchor.constraint(equalTo: enterNameContainer.trailingAnchor, constant: -6).isActive = true
        checkmarkOneLottie.heightAnchor.constraint(equalToConstant: 50).isActive = true
        checkmarkOneLottie.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //print("😀😀😀 - \(checkmarkOneLottie.logHierarchyKeypaths()) - 😀😀😀")
    
        var i = 0
        let loadingLayers = ["Shape Layer 4.Shape 1.Stroke 1.Color", "Shape Layer 1.Ellipse 1.Stroke 1.Color", "Shape Layer 3.Ellipse 1.Stroke 1.Color"]
        for layer in 1...loadingLayers.count {
            
            let keyPath = AnimationKeypath(keypath: "\(loadingLayers[layer - 1])")
            
            if i == 1 {
                let colorProvider = ColorValueProvider(UIColor.coinBaseBlue.withAlphaComponent(0.4).lottieColorValue)
                checkmarkOneLottie.setValueProvider(colorProvider, keypath: keyPath)
            } else {
                let colorProvider = ColorValueProvider(UIColor.coinBaseBlue.lottieColorValue)
                checkmarkOneLottie.setValueProvider(colorProvider, keypath: keyPath)
            }
            i += 1
        }
    }
    
    func setupEnterEmail() {
        emailFBContentContainer.alpha = 0
        emailFBContentContainer.backgroundColor = .clear
        emailFBContentContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(emailFBContentContainer)
        emailFBContentContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        emailFBContentContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        emailFBContentContainer.topAnchor.constraint(equalTo: signUpSteplabel.bottomAnchor, constant: 16).isActive = true
        emailFBContentContainer.heightAnchor.constraint(equalToConstant: 160).isActive = true
        emailFBContentContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        emailContainer.layer.borderColor = UIColor.coinBaseBlue.cgColor
        emailContainer.layer.borderWidth = 1
        emailContainer.layer.cornerRadius = 8
        emailContainer.translatesAutoresizingMaskIntoConstraints = false
        emailFBContentContainer.addSubview(emailContainer)
        emailContainer.leadingAnchor.constraint(equalTo: emailFBContentContainer.leadingAnchor, constant: 26).isActive = true
        emailContainer.trailingAnchor.constraint(equalTo: emailFBContentContainer.trailingAnchor, constant: -26).isActive = true
        emailContainer.topAnchor.constraint(equalTo: emailFBContentContainer.topAnchor, constant: 14).isActive = true
        emailContainer.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        var placeHolder = NSMutableAttributedString()
        let Name  = "Enter your email"
        placeHolder = NSMutableAttributedString(string:Name, attributes: [NSAttributedString.Key.font: UIFont.sofiaMedium(ofSize: 15)])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.coinBaseBlue.withAlphaComponent(0.4), range:NSRange(location:0,length:Name.count))
        emailTextField.attributedPlaceholder = placeHolder
        emailTextField.autocorrectionType = .no
        emailTextField.font = .sofiaMedium(ofSize: 15)
        emailTextField.textColor = .black
        emailTextField.keyboardType = .emailAddress
        emailTextField.tintColor = .coinBaseBlue
        emailTextField.returnKeyType = .done
        emailTextField.delegate = self
        emailTextField.tag = 1
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailContainer.addSubview(emailTextField)
        emailTextField.leadingAnchor.constraint(equalTo: emailContainer.leadingAnchor, constant: 18).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: emailContainer.trailingAnchor, constant: -8).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailContainer.topAnchor, constant: 0).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: emailContainer.bottomAnchor, constant: 0).isActive = true
        
        fbImageView.isHidden = true
        fbImageView.image = UIImage(named: "fbImage")
        fbImageView.contentMode = .scaleAspectFill
        fbImageView.translatesAutoresizingMaskIntoConstraints = false
        emailFBContentContainer.addSubview(fbImageView)
        fbImageView.leadingAnchor.constraint(equalTo: emailContainer.leadingAnchor, constant: 0).isActive = true
        fbImageView.topAnchor.constraint(equalTo: emailContainer.bottomAnchor, constant: 22).isActive = true
        fbImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        fbImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        fbLabel.isHidden = true
        fbLabel.text = "Continue with Facebook"
        fbLabel.textAlignment = .left
        fbLabel.textColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha: 1.0)
        fbLabel.font = .sofiaSemiBold(ofSize: 15)
        fbLabel.numberOfLines = 0
        fbLabel.translatesAutoresizingMaskIntoConstraints = false
        emailFBContentContainer.addSubview(fbLabel)
        fbLabel.leadingAnchor.constraint(equalTo: fbImageView.trailingAnchor, constant: 10).isActive = true
        fbLabel.centerYAnchor.constraint(equalTo: fbImageView.centerYAnchor, constant: 0).isActive = true
        
        let checkAnimation = Animation.named("checkmark_1")
        checkMarkTwoLottie.isUserInteractionEnabled = false
        checkMarkTwoLottie.alpha = 1.0
        checkMarkTwoLottie.animation = checkAnimation
        checkMarkTwoLottie.contentMode = .scaleAspectFill
        checkMarkTwoLottie.backgroundColor = .clear
        checkMarkTwoLottie.translatesAutoresizingMaskIntoConstraints = false
        emailContainer.addSubview(checkMarkTwoLottie)
        checkMarkTwoLottie.centerYAnchor.constraint(equalTo: emailContainer.centerYAnchor).isActive = true
        checkMarkTwoLottie.trailingAnchor.constraint(equalTo: emailContainer.trailingAnchor, constant: -6).isActive = true
        checkMarkTwoLottie.heightAnchor.constraint(equalToConstant: 50).isActive = true
        checkMarkTwoLottie.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //print("😀😀😀 - \(checkmarkOneLottie.logHierarchyKeypaths()) - 😀😀😀")
    
        var i = 0
        let loadingLayers = ["Shape Layer 4.Shape 1.Stroke 1.Color", "Shape Layer 1.Ellipse 1.Stroke 1.Color", "Shape Layer 3.Ellipse 1.Stroke 1.Color"]
        for layer in 1...loadingLayers.count {
            
            let keyPath = AnimationKeypath(keypath: "\(loadingLayers[layer - 1])")
            
            if i == 1 {
                let colorProvider = ColorValueProvider(UIColor.coinBaseBlue.withAlphaComponent(0.4).lottieColorValue)
                checkMarkTwoLottie.setValueProvider(colorProvider, keypath: keyPath)
            } else {
                let colorProvider = ColorValueProvider(UIColor.coinBaseBlue.lottieColorValue)
                checkMarkTwoLottie.setValueProvider(colorProvider, keypath: keyPath)
            }
            i += 1
        }
        
        faceBookButton.isHidden = true
        faceBookButton.tag = 1
        faceBookButton.adjustsImageWhenHighlighted = false
        //faceBookButton.setBackgroundImage(UIImage(named: "contFB"), for: .normal)
        //faceBookButton.imageView?.contentMode = .scaleAspectFill
        faceBookButton.backgroundColor = UIColor(red: 23/255, green: 119/255, blue: 240/255, alpha: 1.0)
        faceBookButton.layer.cornerRadius = 5
        faceBookButton.layer.masksToBounds = true
        faceBookButton.translatesAutoresizingMaskIntoConstraints = false
        emailFBContentContainer.addSubview(faceBookButton)
        faceBookButton.leadingAnchor.constraint(equalTo: emailContainer.leadingAnchor, constant: 0).isActive = true
        //faceBookButton.trailingAnchor.constraint(equalTo: emailContainer.trailingAnchor, constant: 0).isActive = true
        faceBookButton.trailingAnchor.constraint(equalTo: emailContainer.centerXAnchor, constant: -8).isActive = true
        faceBookButton.topAnchor.constraint(equalTo: emailContainer.bottomAnchor, constant: 24).isActive = true
        faceBookButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        let fbImageView = UIImageView()
        fbImageView.isUserInteractionEnabled = false
        fbImageView.image = UIImage(named: "fbEmail")
        fbImageView.contentMode = .scaleAspectFit
        fbImageView.translatesAutoresizingMaskIntoConstraints = false
        faceBookButton.addSubview(fbImageView)
        fbImageView.fillSuperview()
     
        appleButton.isHidden = true
        appleButton.tag = 2
        appleButton.adjustsImageWhenHighlighted = false
        //appleButton.setBackgroundImage(UIImage(named: "contApple"), for: .normal)
        //appleButton.imageView?.contentMode = .scaleAspectFill
        appleButton.backgroundColor = .black
        appleButton.layer.cornerRadius = 5
        appleButton.layer.masksToBounds = true
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        emailFBContentContainer.addSubview(appleButton)
        //appleButton.leadingAnchor.constraint(equalTo: faceBookButton.leadingAnchor, constant: 0).isActive = true
        appleButton.leadingAnchor.constraint(equalTo: emailContainer.centerXAnchor, constant: 8).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: emailContainer.trailingAnchor, constant: 0).isActive = true
        appleButton.topAnchor.constraint(equalTo: emailContainer.bottomAnchor, constant: 24).isActive = true
        appleButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        let appleImageView = UIImageView()
        appleImageView.isUserInteractionEnabled = false
        appleImageView.image = UIImage(named: "appleEmail")
        appleImageView.contentMode = .scaleAspectFit
        appleImageView.translatesAutoresizingMaskIntoConstraints = false
        appleButton.addSubview(appleImageView)
        appleImageView.fillSuperview()
        
    }
    
    func setupProfilePhoto() {
        
        var photoTop: CGFloat = 93
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            photoTop = 0
        case .iphone78() :
            photoTop = 70
        case .iphone78Plus() :
            photoTop = 93
        case .iphone11() :
            photoTop = 93
        default:
            photoTop = 93
        }
        
        profilePhotoContainer.backgroundColor = .clear
        profilePhotoContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(profilePhotoContainer)
        profilePhotoContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        profilePhotoContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        profilePhotoContainer.topAnchor.constraint(equalTo: signUpSteplabel.bottomAnchor, constant: 16).isActive = true
        profilePhotoContainer.heightAnchor.constraint(equalToConstant: 420).isActive = true
        profilePhotoContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        
        photoDetailLabel.text = "Looking good! Now add your picture to continue."
        photoDetailLabel.textAlignment = .left
        photoDetailLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        photoDetailLabel.font = .sofiaRegular(ofSize: 13)
        photoDetailLabel.numberOfLines = 0
        photoDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        profilePhotoContainer.addSubview(photoDetailLabel)
        photoDetailLabel.leadingAnchor.constraint(equalTo: profilePhotoContainer.leadingAnchor, constant: 26).isActive = true
        photoDetailLabel.topAnchor.constraint(equalTo: profilePhotoContainer.topAnchor, constant: 4).isActive = true
        
        photoImageView.image = UIImage(named: "profileImagePH")
        photoImageView.setImageColor(color: .coinBaseBlue)
        photoImageView.layer.cornerRadius = 172/2
        photoImageView.layer.masksToBounds = true
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        profilePhotoContainer.addSubview(photoImageView)
        photoImageView.centerXAnchor.constraint(equalTo: profilePhotoContainer.centerXAnchor, constant: 0).isActive = true
        photoImageView.topAnchor.constraint(equalTo: photoDetailLabel.bottomAnchor, constant: photoTop).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 172).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 172).isActive = true
        photoImageView.isUserInteractionEnabled = true
        photoImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(replacePhotoClicked)))
        
//        nameLabel.text = "Stephen"
        nameLabel.textAlignment = .center
        nameLabel.textColor = .coinBaseBlue
        nameLabel.font = .sofiaMedium(ofSize: 14)
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        profilePhotoContainer.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: profilePhotoContainer.centerXAnchor, constant: 0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 27).isActive = true
    }
    
    func setupEnterPhoneNumber() {
        
        phoneNumberContainer.backgroundColor = .clear
        phoneNumberContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(phoneNumberContainer)
        phoneNumberContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        phoneNumberContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        phoneNumberContainer.topAnchor.constraint(equalTo: signUpSteplabel.bottomAnchor, constant: 16).isActive = true
        phoneNumberContainer.heightAnchor.constraint(equalToConstant: 160).isActive = true
        phoneNumberContainer.transform = CGAffineTransform(translationX: 0, y: 0)
        /*
        if isFacebookSignUp || isAppleEmailSignUp {
            phoneNumberContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            phoneNumberContainer.alpha = 0
        } else {
            phoneNumberContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        }
        */
        
        enterPhoneNumberContainer.backgroundColor = UIColor.coinBaseBlue.withAlphaComponent(0.05)
        enterPhoneNumberContainer.layer.cornerRadius = 8
        enterPhoneNumberContainer.layer.borderColor = UIColor.coinBaseBlue.cgColor
        enterPhoneNumberContainer.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberContainer.addSubview(enterPhoneNumberContainer)
        enterPhoneNumberContainer.leadingAnchor.constraint(equalTo: phoneNumberContainer.leadingAnchor, constant: 26).isActive = true
        enterPhoneNumberContainer.trailingAnchor.constraint(equalTo: phoneNumberContainer.trailingAnchor, constant: -26).isActive = true
        enterPhoneNumberContainer.topAnchor.constraint(equalTo: phoneNumberContainer.topAnchor, constant: 14).isActive = true
        enterPhoneNumberContainer.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        var placeHolder = NSMutableAttributedString()
        let Name  = "Phone Number"
        placeHolder = NSMutableAttributedString(string:Name, attributes: [NSAttributedString.Key.font:UIFont.sofiaMedium(ofSize: 15)])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.coinBaseBlue.withAlphaComponent(0.4), range:NSRange(location:0,length:Name.count))
        phoneNumberTextField.attributedPlaceholder = placeHolder
        phoneNumberTextField.backgroundColor = .clear
        //phoneNumberTextField.flagButtonSize = CGSize(width: 44, height: 44)
        phoneNumberTextField.tag = 1
        phoneNumberTextField.setFlag(key: .US)
        phoneNumberTextField.delegate = self
        phoneNumberTextField.keyboardType = .numberPad
        phoneNumberTextField.autocorrectionType = .no
        phoneNumberTextField.textColor = .black
        phoneNumberTextField.tintColor = .coinBaseBlue
        phoneNumberTextField.returnKeyType = .next
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        enterPhoneNumberContainer.addSubview(phoneNumberTextField)
        phoneNumberTextField.leadingAnchor.constraint(equalTo: enterPhoneNumberContainer.leadingAnchor, constant: 18).isActive = true
        phoneNumberTextField.trailingAnchor.constraint(equalTo: enterPhoneNumberContainer.trailingAnchor, constant: -8).isActive = true
        phoneNumberTextField.topAnchor.constraint(equalTo: enterPhoneNumberContainer.topAnchor, constant: 0).isActive = true
        phoneNumberTextField.bottomAnchor.constraint(equalTo: enterPhoneNumberContainer.bottomAnchor, constant: 0).isActive = true
        
        phoneNumberDetailLabel.text = "*You will receive a verification code"
        phoneNumberDetailLabel.textAlignment = .left
        phoneNumberDetailLabel.textColor = UIColor.coinBaseBlue.withAlphaComponent(0.6)
        phoneNumberDetailLabel.font = .sofiaRegular(ofSize: 13)
        phoneNumberDetailLabel.numberOfLines = 0
        phoneNumberDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberContainer.addSubview(phoneNumberDetailLabel)
        phoneNumberDetailLabel.leadingAnchor.constraint(equalTo: enterPhoneNumberContainer.leadingAnchor, constant: 4).isActive = true
        phoneNumberDetailLabel.topAnchor.constraint(equalTo: enterPhoneNumberContainer.bottomAnchor, constant: 15).isActive = true
        
    }
    
    func setupEnterCode() {
        
        codeContainer.backgroundColor = .clear
        codeContainer.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(codeContainer)
        codeContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 0).isActive = true
        codeContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: 0).isActive = true
        codeContainer.topAnchor.constraint(equalTo: signUpSteplabel.bottomAnchor, constant: 16).isActive = true
        codeContainer.heightAnchor.constraint(equalToConstant: 160).isActive = true
        codeContainer.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
            
        //codeTextField.defaultCharacter = "-"
        codeTextField.configure()
        codeTextField.didEnterLastDigit = { [weak self] code in
            print(code)
        }
        codeTextField.delegate = self
        codeTextField.translatesAutoresizingMaskIntoConstraints = false
        codeContainer.addSubview(codeTextField)
        codeTextField.leadingAnchor.constraint(equalTo: codeContainer.leadingAnchor, constant: 27).isActive = true
        codeTextField.trailingAnchor.constraint(equalTo: codeContainer.trailingAnchor, constant: -27).isActive = true
        codeTextField.topAnchor.constraint(equalTo: codeContainer.topAnchor, constant: 14).isActive = true
        codeTextField.heightAnchor.constraint(equalToConstant: 87).isActive = true
                
        let attrs1 = [NSAttributedString.Key.font : UIFont.sofiaRegular(ofSize: 15), NSAttributedString.Key.foregroundColor : UIColor.gray.withAlphaComponent(0.6)]
        let attrs2 = [NSAttributedString.Key.font : UIFont.sofiaRegular(ofSize: 15), NSAttributedString.Key.foregroundColor : UIColor(red: 32/255, green: 164/255, blue: 239/255, alpha: 1.0)]
        let attributedString1 = NSMutableAttributedString(string:"Didn’t arrive? ", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:"Re-send", attributes:attrs2)
        attributedString1.append(attributedString2)
        codeDetailLabel.attributedText = attributedString1
        codeDetailLabel.textAlignment = .left
        codeDetailLabel.numberOfLines = 0
        codeDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        codeContainer.addSubview(codeDetailLabel)
        codeDetailLabel.leadingAnchor.constraint(equalTo: codeTextField.leadingAnchor, constant: 4).isActive = true
        codeDetailLabel.topAnchor.constraint(equalTo: codeTextField.bottomAnchor, constant: 21).isActive = true
        
    }
    
    func transitionViews() {
        
        dismissArrowImageView.image = UIImage(named: "downArrowWhite")
        dismissArrowImageView.setImageColor(color: .coinBaseBlue)
        dismissArrowImageView.contentMode = .scaleAspectFill
        dismissArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(dismissArrowImageView)
        dismissArrowImageView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 22).isActive = true
        dismissArrowImageView.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 14).isActive = true
        dismissArrowImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        dismissArrowImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.text = "Sign up"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .coinBaseBlue
        titleLabel.font = .sofiaBold(ofSize: 24)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: dismissArrowImageView.centerYAnchor, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor, constant: 0).isActive = true
        
        faceBookButton.setBackgroundImage(UIImage(named: "contFB"), for: .normal)
        faceBookButton.imageView?.contentMode = .scaleAspectFit
        faceBookButton.backgroundColor = UIColor(red: 23/255, green: 119/255, blue: 240/255, alpha: 1.0)
        faceBookButton.layer.cornerRadius = 5
        faceBookButton.layer.masksToBounds = true
        faceBookButton.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(faceBookButton)
        faceBookButton.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 12).isActive = true
        faceBookButton.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -12).isActive = true
        faceBookButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 45).isActive = true
        faceBookButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
     
        appleButton.setBackgroundImage(UIImage(named: "contApple"), for: .normal)
        appleButton.imageView?.contentMode = .scaleAspectFit
        appleButton.backgroundColor = .coinBaseBlue
        appleButton.layer.cornerRadius = 5
        appleButton.layer.masksToBounds = true
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(appleButton)
        appleButton.leadingAnchor.constraint(equalTo: faceBookButton.leadingAnchor, constant: 0).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: faceBookButton.trailingAnchor, constant: 0).isActive = true
        appleButton.topAnchor.constraint(equalTo: faceBookButton.bottomAnchor, constant: 10).isActive = true
        appleButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        emailButton.setTitle("Continue with email", for: .normal)
        emailButton.titleLabel?.font = .sofiaSemiBold(ofSize: 18)
        emailButton.setTitleColor(.coinBaseBlue, for: .normal)
        emailButton.backgroundColor = .clear
        emailButton.layer.cornerRadius = 5
        emailButton.layer.masksToBounds = true
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(emailButton)
        emailButton.leadingAnchor.constraint(equalTo: faceBookButton.leadingAnchor, constant: 0).isActive = true
        emailButton.trailingAnchor.constraint(equalTo: faceBookButton.trailingAnchor, constant: 0).isActive = true
        emailButton.topAnchor.constraint(equalTo: appleButton.bottomAnchor, constant: 10).isActive = true
        emailButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
    }
    
}


