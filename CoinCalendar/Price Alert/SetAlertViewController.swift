//
//  SetAlertViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/10/21.
//

import UIKit
import Lottie

protocol SetAlertViewControllerDelegate: class {
    func doubleDismiss()
}

class SetAlertViewController: UIViewController {
    
    weak var delegate: SetAlertViewControllerDelegate?
    var opacityLayer = UIView()
    var mainScrollView = UIScrollView()
    var wrapper = UIView()
    var mainContainer = UIView()
    var mainContainerHeight: NSLayoutConstraint!
    var navView = UIView()
    var contentContainer = UIView()
    var navTitleLabel = UILabel()
    var keyLine = UIView()
    
    var mainFeedTableView = UITableView()
    var setAlertOptionOneTableViewCell = "setAlertOptionOneTableViewCell"
    var setAlertOptionTwoTableViewCell = "setAlertOptionTwoTableViewCell"
    
    var whiteGradient = UIImageView()
    var resetButton = ContinueButton()
    var resetBottom: NSLayoutConstraint!
    
    var successCheck = AnimationView()
    var addedToWatchListLabel = UILabel()
    
    var coinImageView = UIImageView()
    var blockChainLabel = UILabel()
    var coinLabel = UILabel()
    var dividerLine = UIView()
    var coinPriceLabel = UILabel()
    var currentPriceLabel = UILabel()
    
    var priceTextField = UITextField()
    var priceLabel = UILabel()
    var specificPriceSelected = false
    var inPriceMode = false
    
    var isComingFromCoinOptions = false
    var isDismissing = false
    
    var coinPrice = "1"
    var coinName = "Cardano"
    var coinSymbol = "ADA"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupTableView()
        setupSuccessLottie()
        
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
        
    }
    
}

//MARK: ACTIONS

extension SetAlertViewController {
    @objc func animateViewsIn() {
        
        if isComingFromCoinOptions {
            mainContainerHeight.constant = self.view.frame.height - 71
            UIView.animate(withDuration: 0.35) {
                self.contentContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                self.contentContainer.alpha = 1.0
                self.view.layoutIfNeeded()
            } completion: { (success) in
                //
            }
        } else {
            UIView.animate(withDuration: 0.35) {
                self.opacityLayer.alpha = 0.75
                self.mainContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                self.keyLine.transform = CGAffineTransform(translationX: 0, y: 0)
            } completion: { (success) in
                //
            }
        }
                
    }
    
    @objc func dimissVC() {
        if isComingFromCoinOptions {
            delegate?.doubleDismiss()
        }
        UIView.animate(withDuration: 0.28) {
            self.view.endEditing(true)
            self.mainScrollView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.opacityLayer.alpha = 0
        } completion: { (success) in
            if self.isComingFromCoinOptions {
                self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: {
                    
                })
            } else {
                self.dismiss(animated: false) {
                    //
                }
            }
            
        }
    }
    
    @objc func showHideResetButton() {
        resetBottom.constant = -25
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func didTapConfirm() {
        
        if inPriceMode {
            resetBottom.constant = 100
            UIView.animate(withDuration: 0.35) {
                self.priceLabel.alpha = 0
                self.priceLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.view.endEditing(true)
                self.view.layoutIfNeeded()
            } completion: { (success) in
                self.successCheck.alpha = 1.0
                self.successCheck.play()
                UIView.animate(withDuration: 0.35) {
                    self.addedToWatchListLabel.alpha = 1.0
                }
                self.perform(#selector(self.dimissVC), with: self, afterDelay: 1.5)
            }

            
        } else {
            if specificPriceSelected {
                resetBottom.constant = -304
                self.inPriceMode = true
                UIView.animate(withDuration: 0.35) {
                    self.mainFeedTableView.alpha = 0
                    self.mainFeedTableView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    self.view.layoutIfNeeded()
                    self.priceTextField.becomeFirstResponder()
                } completion: { (success) in
                    UIView.animate(withDuration: 0.35) {
                        self.priceLabel.alpha = 0.5
                    }
                }
            } else {
                resetBottom.constant = 100
                UIView.animate(withDuration: 0.35) {
                    self.mainFeedTableView.alpha = 0
                    self.mainFeedTableView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    self.view.layoutIfNeeded()
                } completion: { (success) in
                    self.successCheck.alpha = 1.0
                    self.successCheck.play()
                    UIView.animate(withDuration: 0.35) {
                        self.addedToWatchListLabel.alpha = 1.0
                    }
                    self.perform(#selector(self.dimissVC), with: self, afterDelay: 1.5)
                }
            }
        }
        
    }
}

//MARK: SCROLLVIEW DELEGATE

extension SetAlertViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.tag == 1 {
            let yOffset = scrollView.contentOffset.y// + 44
            if yOffset > -44 {
                scrollView.setContentOffset(CGPoint(x: 0, y: -44), animated: false)
            }
            
            if yOffset < -85 {
                if !isDismissing {
                    dimissVC()
                    isDismissing = true
                }
            }
        }
    }
}


//MARK: SCROLLVIEW DELEGATE

extension SetAlertViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        lightImpactGenerator()
        
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
        
        //print("\(updatedText) - 😂😂😂")
        
        if updatedText == "" {
            priceLabel.alpha = 0.5
            priceLabel.text = "$$$"
        } else {
            priceLabel.alpha = 1.0
            priceLabel.text = "$\(updatedText)"
        }
        
        return true
        
    }
    
}
