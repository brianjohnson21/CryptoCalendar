//
//  WelcomeViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/6/21.
//

import UIKit
import CHIPageControl

class WelcomeViewController: UIViewController {
    
    var opacityLayer = UIView()
    var cardContainer = UIView()
    var downArrow = UIImageView()
    var dismissButton = UIButton()
    var logoImageView = UIImageView()
    var pageControl = CHIPageControlAleppo()
    var nextButton = DiscountButtonView()
    
    var welcomeContainer = UIView()
    var discoverContainer = UIView()
    var requestContainer = UIView()
    var encryptionContainer = UIView()
    var playContainer = UIView()
    
    var stepOne = true
    var stepTwo = false
    var stepThree = false
    var stepFour = false
    
    var cardHeight: CGFloat = 430
    var buttonBottom: CGFloat = -42
    
    var fistTimeOnExplorePage = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        modifyConstraints()
        setupContainer()
        createViews()
        perform(#selector(presentViews), with: self, afterDelay: 0.1)
        let nextTapped = UITapGestureRecognizer(target: self, action: #selector(goToNextStep))
        nextButton.addGestureRecognizer(nextTapped)
    }

}

//MARK: ACTIONS

extension WelcomeViewController {
    
    @objc func presentViews() {
        UIView.animate(withDuration: 0.35, animations: {
            self.opacityLayer.alpha = 0.65
            self.cardContainer.transform = CGAffineTransform(translationX: 0, y: -5)
        }) { (success) in
            UIView.animate(withDuration: 0.2, animations: {
                self.cardContainer.transform = CGAffineTransform(translationX: 0, y: 5)
            }) { (successz) in
                UIView.animate(withDuration: 0.2) {
                    self.cardContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                }
            }
        }
    }
    
    @objc func goToNextStep() {
        lightImpactGenerator()
        if stepOne {
            pageControl.set(progress: 1, animated: true)
            animateStepAway(stepToAnimate: welcomeContainer, stepToBringIn: discoverContainer)
            stepOne = false
            stepTwo = true
        } else if stepTwo {
            pageControl.set(progress: 2, animated: true)
            animateStepAway(stepToAnimate: discoverContainer, stepToBringIn: requestContainer)
            stepTwo = false
            stepThree = true
        } else if stepThree {
            //nextButton.applyPromoCodeAnimation()
            pageControl.set(progress: 3, animated: true)
            animateStepAway(stepToAnimate: requestContainer, stepToBringIn: encryptionContainer)
            stepThree = false
            stepFour = true
        } else if stepFour {
            nextButton.applyPromoCodeAnimation()
            pageControl.set(progress: 4, animated: true)
            animateStepAway(stepToAnimate: encryptionContainer, stepToBringIn: playContainer)
            stepFour = false
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.cardContainer.transform = CGAffineTransform(translationX: 0, y: self.cardHeight)
                self.opacityLayer.alpha = 0
            }) { (success) in
                self.dismissWelcome()
            }
        }
        
    }
    
    func animateStepAway(stepToAnimate: UIView, stepToBringIn: UIView) {
        nextButton.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.35, animations: {
            stepToAnimate.alpha = 0
            stepToAnimate.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
        }) { (success) in
            self.animateStepIn(stepToAnimate: stepToBringIn)
        }
    }
    
    func animateStepIn(stepToAnimate: UIView) {
        
        UIView.animate(withDuration: 0.35, animations: {
            stepToAnimate.alpha = 1.0
            stepToAnimate.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { (success) in
            self.nextButton.isUserInteractionEnabled = true
        }
    }
    
    @objc func dismissWelcome() {
        self.dismiss(animated: false) {
            print("Done")
            self.fistTimeOnExplorePage.set(true, forKey: "fistTimeOnExplorePage")
        }
    }
    
}
