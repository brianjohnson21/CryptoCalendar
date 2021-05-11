//
//  WelcomeViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/6/21.
//

import UIKit
import CHIPageControl
import Lottie

class WelcomeViewController: UIViewController {
    var termsOfUseLink = "https://www.cryptogainz.xyz/terms-of-use"
    var privacyLink = "https://www.cryptogainz.xyz/privacy-policy"
    
    var opacityLayer = UIView()
    var cardContainer = UIView()
    var downArrow = UIImageView()
    var dismissButton = UIButton()
    var logoImageView = UIImageView()
    var pageControl = CHIPageControlAleppo()
    var nextButton = DiscountButtonView()
    var swipeView = SwipeConfirmView()
    
    var welcomeContainer = UIView()
    var discoverContainer = UIView()
    var requestContainer = UIView()
    var encryptionContainer = UIView()
    var playContainer = UIView()
    var termsButton = UIButton()
    
    var successView = UIView()
    var checkmarkLottie = AnimationView()
    
    var stepOne = true
    var stepTwo = false
    var stepThree = false
    var stepFour = false
    
    var cardHeight: CGFloat = 430
    var buttonBottom: CGFloat = -42
    var viewedDiscoverExperts = UserDefaults()
    
    var fistTimeOnExplorePage = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        modifyConstraints()
        setupContainer()
        createViews()
        perform(#selector(presentViews), with: self, afterDelay: 0.1)
        //let nextTapped = UITapGestureRecognizer(target: self, action: #selector(goToNextStep))
        let nextTapped = UITapGestureRecognizer(target: self, action: #selector(goToSwipeToConfirm))
        nextButton.addGestureRecognizer(nextTapped)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appMovedToForeround() {
        swipeView.swipeLottie.play()
    }
    

}

//MARK: ACTIONS

extension WelcomeViewController {
    @objc func didTapViewSource(sender: UIButton) {
        lightImpactGenerator()
        let eventSourceVC = EventSourceWebViewController()
        if sender.tag == 1 {
            eventSourceVC.urlString = termsOfUseLink
        } else {
            eventSourceVC.urlString = privacyLink
        }
        self.present(eventSourceVC, animated: true) {
            //
        }
    }
    
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
    
    @objc func goToSwipeToConfirm() {
        lightImpactGenerator()
        if stepOne {
            termsButton.isUserInteractionEnabled = true
            pageControl.set(progress: 1, animated: true)
            animateStepAway(stepToAnimate: welcomeContainer, stepToBringIn: discoverContainer)
            stepOne = false
            stepTwo = true
            
            self.swipeView.isHidden = false
            UIView.animate(withDuration: 0.35) {
                self.swipeView.alpha = 1.0
                self.swipeView.arrowsContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                self.swipeView.swipeLabel.alpha = 1.0
            } completion: { (success) in
                //
            }

            
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

//MARK: SCROLLVIEW DELEGATE

extension WelcomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yAxis = scrollView.contentOffset.x
        let maxX: CGFloat = 323
        let minX: CGFloat = 200
                
        //print("\(((yAxis - minX) / (maxX - minX))) - 🤕🤕🤕")
        
        swipeView.swipeLabel.alpha = (yAxis - minX) / (maxX - minX)
        
        if yAxis <= 72 {
            if !swipeView.didConfirm {
                successImpactGenerator()
                showConfirm()
            }
            swipeView.didConfirm = true
            scrollView.isUserInteractionEnabled = false
            scrollView.contentOffset.x = 72
            swipeView.isUserInteractionEnabled = false
            swipeView.swipeScrollView.isUserInteractionEnabled = false
            UIView.animate(withDuration: 0.1) {
                scrollView.contentOffset.x = 72
            }
        }
    }
    
    @objc func showConfirm() {
        UIView.animate(withDuration: 0.35) {
            self.swipeView.arrowsContainer.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            self.swipeView.arrowsContainer.alpha = 0
        } completion: { (success) in
            UIView.animate(withDuration: 0.35) {
                self.successView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.successView.alpha = 1.0
            } completion: { (success) in
                self.checkmarkLottie.play { (success) in
                    UIView.animate(withDuration: 0.4, animations: {
                        self.cardContainer.transform = CGAffineTransform(translationX: 0, y: self.cardHeight)
                        self.opacityLayer.alpha = 0
                    }) { (success) in
                        self.viewedDiscoverExperts.set(true, forKey: "viewedDiscoverExperts")
                        self.dismissWelcome()
                    }
                }
            }
        }
        
    }
    
}
