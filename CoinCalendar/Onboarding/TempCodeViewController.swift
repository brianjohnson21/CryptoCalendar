//
//  TempCodeViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/9/21.
//

import UIKit
import Lottie

protocol TempCodeViewControllerDelegate: class {
    func didEnterCorrectCode()
}

class TempCodeViewController: UIViewController {
    weak var delegate: TempCodeViewControllerDelegate?
    var opacityLayer = UIView()
    var promoContainer = UIView()
    var backImageView = UIImageView()
    var backButton = UIButton()
    var promoCodeContainer = UIView()
    var promoCodeTextField = UITextField()
    var promoSubmitButton = UIButton()
    let toastView = ToastNotificationView()
    var successCheckLottie = AnimationView()
    
    var isCorrectCode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setupPromoContainer()
        
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
    }

}

//MARK: ACTIONS

extension TempCodeViewController {
    
    @objc func animateViewsIn() {
        UIView.animate(withDuration: 0.35) {
            self.opacityLayer.alpha = 0.95
            self.promoCodeContainer.alpha = 1.0
            self.backImageView.alpha = 1.0
            self.promoCodeTextField.becomeFirstResponder()
        } completion: { (success) in
            //
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
    
    @objc func showErrorState() {
        errorImpactGenerator()
        promoCodeContainer.badWiggle()
        promoCodeContainer.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        //promoSubmitButton.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        promoCodeContainer.layer.borderColor = UIColor.red.cgColor
        promoCodeTextField.text = ""
        toastView.presentError(withMessage: "Invalid Code")
        perform(#selector(showDefaultState), with: self, afterDelay: 0.4)
    }
    
    
    @objc func showDefaultState() {
        promoCodeContainer.backgroundColor = .clear//UIColor.clear.withAlphaComponent(0.2)
        promoCodeContainer.layer.borderColor = UIColor.coinBaseBlue.cgColor
    }
    @objc func successValidCode() {
        isCorrectCode = true
        dismissVC()
    }
    
    @objc func dismissVC() {
        UIView.animate(withDuration: 0.35) {
            self.opacityLayer.alpha = 0
            self.promoCodeContainer.alpha = 0
            self.backImageView.alpha = 0
            self.view.endEditing(true)
        } completion: { (success) in
            self.dismiss(animated: false) {
                if self.isCorrectCode {
                    self.delegate?.didEnterCorrectCode()
                }
            }
        }
    }
    
}

//MARK" TEXTFIELD DELEGATE

extension TempCodeViewController: UITextFieldDelegate {
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
            //promoSubmitButton.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        } else {
            //promoSubmitButton.backgroundColor = UIColor.white.withAlphaComponent(1.0)
        }
        return true
        
    }
}
