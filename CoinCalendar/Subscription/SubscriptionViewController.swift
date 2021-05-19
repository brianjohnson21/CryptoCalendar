//
//  SubscriptionViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/29/21.
//

import UIKit
import Lottie
import Comets
import SwiftyStoreKit

class SubscriptionViewController: UIViewController {

    var mainScrollView = UIScrollView()
    var containerView = UIView()
    var subscribeButton = SubscribeButton()
    var dismissImageView = UIImageView()
    var promoCodeButton = UIButton()
    var promoCodeLabel = UILabel()
    var appliedPromoContainer = UIView()
    var appliedPromoLabel = UILabel()
    var tryTimeLabel = UILabel()
    var benefitOneLabel = UILabel()
    var benefitTwoLabel = UILabel()
    var benefitThreeLabel = UILabel()
    var benefitFourLabel = UILabel()
    var tryFreeLabel = UILabel()
    var subSuccessAnimation = AnimationView()
    var cometsLayer = UIView()
    
    var freeTrialContainer = UIView()
    var freeTrialLabel = UILabel()
    
    var dividerLine = UIView()
    var titleLabel = UILabel()
    
    var checkmarkLottie = AnimationView()
    var successCheckLottie = AnimationView()
    
    var promoContainer = UIView()
    var backImageView = UIImageView()
    var backButton = UIButton()
    var promoCodeContainer = UIView()
    var promoCodeTextField = UITextField()
    var promoSubmitButton = UIButton()
    let toastView = ToastNotificationView()
    
    var confettiLottie = AnimationView()
    var confettiLottieTwo = AnimationView()
    
    var appliedPromoCode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setupViews()
        //setupComets()
        setupPromoContainer()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appMovedToForeround() {
        checkmarkLottie.play()
    }

}

//MARK: ACTIONS

extension SubscriptionViewController {
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapPromoButton() {        
        lightImpactGenerator()
        UIView.animate(withDuration: 0.25) {
            self.mainScrollView.contentOffset.x = self.view.frame.width
            self.promoCodeTextField.becomeFirstResponder()
        } completion: { (success) in
            //
        }
    }
    
    @objc func didTapBackButton() {
        lightImpactGenerator()
        UIView.animate(withDuration: 0.25) {
            self.view.endEditing(true)
            self.mainScrollView.contentOffset.x = 0
        } completion: { (success) in
            if self.appliedPromoCode {
                self.promoCodeButton.isUserInteractionEnabled = false
                self.updatePromorCodeButton()
            }
        }
    }
    
    @objc func showErrorState() {
        errorImpactGenerator()
        promoCodeContainer.badWiggle()
        promoCodeContainer.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        promoSubmitButton.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        promoCodeContainer.layer.borderColor = UIColor.red.cgColor
        promoCodeTextField.text = ""
        toastView.presentError(withMessage: "Invalid Code")
        perform(#selector(showDefaultState), with: self, afterDelay: 0.4)
    }
    
    @objc func showDefaultState() {
        promoCodeContainer.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        promoCodeContainer.layer.borderColor = UIColor.white.cgColor
    }
    
    @objc func successValidCode() {
        appliedPromoCode = true
        promoSubmitButton.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.35) {
            self.promoCodeContainer.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
            self.promoCodeContainer.alpha = 0
        } completion: { (success) in
            self.successCheckLottie.alpha = 1.0
            self.successCheckLottie.play()
            self.successImpactGenerator()
            self.promoCodeButton.isUserInteractionEnabled = false
            self.perform(#selector(self.didTapBackButton), with: self, afterDelay: 1.25)
        }
    }
    
    
    @objc func didTapSubmit() {
        lightImpactGenerator()
        if promoCodeTextField.text != "Hola" {
            showErrorState()
        } else {
            successValidCode()
        }
    }
    
    @objc func updatePromorCodeButton() {
        confettiLottie.play()
        UIView.animate(withDuration: 0.35) {
            self.appliedPromoContainer.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.appliedPromoContainer.alpha = 1.0
        } completion: { (success) in
            self.confettiLottieTwo.play()
        }

    }
    
    @objc func didTapSubscribe() {
        lightImpactGenerator()
        
        subscribeButton.showLoader()
        
        let purchaseId = "CryptoGainz_Sub1"
        
        print("⚠️⚠️⚠️ 111")
        
        if User.purchasedIds.contains(purchaseId) {
            self.dismiss(animated: true, completion: nil)
            print("⚠️⚠️⚠️ 000")
        } else {
            SwiftyStoreKit.purchaseProduct(purchaseId, quantity: 1, atomically: true) { [weak self] result in
                switch result {
                case .success(let purchase):
                    print("⚠️⚠️⚠️ 222")
                    /*
                     self?.productId = purchase.productId
                     let data = SwiftyStoreKit.localReceiptData
                     self?.receiptData = data?.base64EncodedString(options: [])
                     */
                    print("Purchase Success: \(purchase.productId)")
                    DispatchQueue.main.async { [weak self] in
                        self?.subscribeButton.showCheckmark()
                    }
                case .error(let error):
                    print("⚠️⚠️⚠️ 333")
                    self?.subscribeButton.didCancelLoader()
                    switch error.code {
                    case .unknown: print("Unknown error. Please contact support")
                    case .clientInvalid: print("Not allowed to make the payment")
                    case .paymentCancelled: break
                    case .paymentInvalid: print("The purchase identifier was invalid")
                    case .paymentNotAllowed: print("The device is not allowed to make the payment")
                    case .storeProductNotAvailable: print("The product is not available in the current storefront")
                    case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                    case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                    case .cloudServiceRevoked: print("User has revoked permission to use this cloud service")
                    default: print((error as NSError).localizedDescription)
                    }
                }
            }
        }
    }
}

//MARK" TEXTFIELD DELEGATE

extension SubscriptionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didTapSubmit()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let  char = string.cString(using: String.Encoding.utf8)!
           
        let isBackSpace = strcmp(char, "\\b")
           
        if (isBackSpace == -92) {
            //priceText = "$\(textField.text!.substring(to: textField.text!.index(before: textField.text!.endIndex)))"
        }
        else {
            //priceText = "$\(textField.text! + string)"
        }
                
        let currentText = textField.text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else {
            
            return false
        }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
                
        // make sure the result is under 16 characters
        if updatedText.count < 1 {
            promoSubmitButton.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        } else {
            promoSubmitButton.backgroundColor = UIColor.white.withAlphaComponent(1.0)
        }
        return true
        
    }
}

//MARK: SUBSCRIBE BUTTON DELEGATE

extension SubscriptionViewController: SubscribeButtonDelegate {
    func didFinishCheckmark() {
        self.dismiss(animated: true, completion: nil)
    }
}
