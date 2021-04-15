//
//  LoginPNViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/14/21.
//

import UIKit
import Lottie
import CHIPageControl
import FlagPhoneNumber
import PhotoCircleCrop
import WXImageCompress

protocol LoginPNViewControllerDelegate: class {
    func didCompleteNowFadeMusic()
}

class LoginPNViewController: UIViewController {
    
    var dismissArrowImageView = UIImageView()
    var titleLabel = UILabel()
    var faceBookButton = UIButton()
    var appleButton = UIButton()
    var emailButton = UIButton()
    
    //
    
    var delegate: SignUpPNViewControllerDelegate!
    var backImageView = UIImageView()
    var dismissImageView = UIImageView()
    var backDismissButton = UIButton()
    var backButton = UIButton()
    var pageControl = CHIPageControlAleppo()
    var signUpTitleLabel = UILabel()
    var signUpSteplabel = UILabel()
    
    var keyboardShowing = false
    var continueButton = ContinueButton()
    var continueBottom: NSLayoutConstraint!
    var continueWidth: NSLayoutConstraint!
    var continueHeight: NSLayoutConstraint!
    var continueLabel = UILabel()
    
    //Enter Email
    var emailFBContentContainer = UIView()
    var emailContainer = UIView()
    var emailTextField = UITextField()
    var fbImageView = UIImageView()
    var fbLabel = UILabel()
    
    //Enter Name
    var nameContainer = UIView()
    var enterNameContainer = UIView()
    var enterNameTextField = UITextField()
    var nameIsSet = false
    var emailIsSet = false
    
    //Enter Photo
    var profilePhotoContainer = UIView()
    var photoDetailLabel = UILabel()
    var photoImageView = UIImageView()
    var nameLabel = UILabel()
    
    //Enter Phone Number
    var phoneNumberContainer = UIView()
    var enterPhoneNumberContainer = UIView()
    var phoneNumberTextField = FPNTextField()
    var phoneNumber = ""
    var phoneNubmerIsValid = false
    var phoneNumberDetailLabel = UILabel()
    
    //Enter Code
    var codeContainer = UIView()
    var codeTextField = OneTimeCodeTextField()
    var codeIsSet = true
    var codeDetailLabel = UILabel()
    
    var stepOne = true
    var stepTwo = false
    var stepThree = false
    //var stepFour = false
    
    var mainContainer = UIView()
    var mainHeight: NSLayoutConstraint!
    
    var transitionView = UIView()
    var transitionHeight: NSLayoutConstraint!
    var transitionLeading: NSLayoutConstraint!
    var transitionTrailing: NSLayoutConstraint!
    var transitionBottom: NSLayoutConstraint!
    
    var checkmarkOneLottie = AnimationView()
    var checkMarkTwoLottie = AnimationView()
    
    var circleCenter: CGFloat = -375
    
    var loginRequest: SMSLoginRequest?
    var photo: UIImage?
    var userName: String?
    var userEmail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
                
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        switch screenHeight {
        case .iphone5() :
            circleCenter = -375
        case .iphone78() :
            circleCenter = -302
        case .iphone78Plus() :
            circleCenter = -337
        case .iphone11() :
            circleCenter = -416
        default:
            circleCenter = -375
        }
        
        setupViews()
        //setupEnterName()
        setupEnterPhoneNumber()
        //setupEnterEmail()
        setupEnterCode()
        //setupProfilePhoto()
        //transitionViews()
        
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        backDismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
    }
}

//MARK: ACTIONS

extension LoginPNViewController {
    
    @objc func animateViewsIn() {
        mainHeight.constant = view.frame.height + 10
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
            self.dismissArrowImageView.alpha = 0
            self.titleLabel.alpha = 0
            self.faceBookButton.alpha = 0
            self.appleButton.alpha = 0
            self.emailButton.alpha = 0
            self.phoneNumberTextField.becomeFirstResponder()
            self.mainContainer.layer.cornerRadius = 0
            
            //
            self.dismissImageView.alpha = 1.0
            self.signUpTitleLabel.alpha = 1.0
            self.signUpSteplabel.alpha = 1.0
            self.pageControl.alpha = 1.0
            self.continueButton.alpha = 1.0
            self.emailContainer.alpha = 1.0
            self.continueButton.transform =  CGAffineTransform(translationX: 0, y: 0)
            
        } completion: { (success) in
            //
        }
    }
    
    @objc func dismissVC() {
        /*
        if stepOne {
            UIView.animate(withDuration: 0.35) {
                self.mainContainer.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height + 10)
                self.view.endEditing(true)
            } completion: { (success) in
                self.dismiss(animated: false) {
                    //
                }
            }
        } else if stepTwo {
            goBackToStepOne()
        } else if stepThree {
            goBackToEnterEmail()
        }
        */
        UIView.animate(withDuration: 0.35) {
            self.mainContainer.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height + 10)
            self.view.endEditing(true)
        } completion: { (success) in
            self.dismiss(animated: false) {
                //
            }
        }
    }
    
    @objc func shrinkTransition() {
        self.view.endEditing(true)
        continueButton.isUserInteractionEnabled = false
        shrinkAnimation(viewToAnimate: codeDetailLabel, delay: 0.1)
        shrinkAnimation(viewToAnimate: codeTextField, delay: 0.1)
        shrinkAnimation(viewToAnimate: photoDetailLabel, delay: 0.25)
        shrinkAnimation(viewToAnimate: pageControl, delay: 0.3)
        shrinkAnimation(viewToAnimate: signUpTitleLabel, delay: 0.35)
        shrinkAnimation(viewToAnimate: backImageView, delay: 0.39)
        shrinkAnimation(viewToAnimate: continueLabel, delay: 0.3)
        shrinkAnimation(viewToAnimate: dismissImageView, delay: 0.3)
        shrinkAnimation(viewToAnimate: continueButton.continueLabel, delay: 0.3)
        
        continueWidth.constant = 63
        //delegate.didCompleteNowFadeMusic()
        UIView.animate(withDuration: 0.35, delay: 0.35, options: [], animations: {
            self.continueButton.layer.cornerRadius = 63/2
            self.view.layoutIfNeeded()
        }) { (success) in
            self.continueBottom.constant = self.circleCenter - 15 //-375
            UIView.animate(withDuration: 0.5, delay: 0.15, options: [], animations: {
                self.view.layoutIfNeeded()
            }) { (success) in
                self.continueBottom.constant = self.circleCenter + 7 //-375
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.layoutIfNeeded()
                }) { (success) in
                    self.continueBottom.constant = self.circleCenter
                    UIView.animate(withDuration: 0.25, animations: {
                        self.view.layoutIfNeeded()
                    }) { (success) in
                        UIView.animate(withDuration: 0.8, delay: 0.2, options: [], animations: {
                            self.continueButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        }) { (success) in
                            UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                                self.continueButton.transform = CGAffineTransform(scaleX: 50, y:  50)
                            }) { (success) in
                                self.goToHome()
                            }
                        }
                    }
                }
            }
        }
    }
    
    @objc func shrinkAnimation(viewToAnimate: UIView, delay: Double) {
        
        UIView.animate(withDuration: 0.35, delay: delay, options: [], animations: {
            viewToAnimate.alpha = 0
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        }) { (success) in }
    }
    
    @objc func continueTapped() {
        if stepOne {
            if phoneNubmerIsValid {
                goToEnterCodeStep()
                stepOne = false
                stepTwo = true
                stepThree = false
            } else {
                emailContainer.badWiggle()
                errorImpactGenerator()
            }
        } else if stepTwo {
            if codeIsSet {
                shrinkTransition()
            } else {
                codeContainer.badWiggle()
                errorImpactGenerator()
            }
        } else {
//            User.current.name = nameLabel.text
//            shrinkTransition()
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @objc func suckButtonIn() {
        transitionView.alpha = 1.0
        transitionHeight.constant = 59
        transitionLeading.constant = 28
        transitionTrailing.constant = -28
        transitionBottom.constant = -46
        
        UIView.animate(withDuration: 0.45, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }) { (success) in
            self.animateTransition()
        }
    }
    
    @objc func animateTransition() {
        
        transitionView.alpha = 1.0
        transitionHeight.constant = view.frame.height
        transitionLeading.constant = 0
        transitionTrailing.constant = 0
        transitionBottom.constant = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }) { (success) in
            self.goToHome()
        }
        
    }
    
    func registeredUserGoToHome() {
        continueButton.isUserInteractionEnabled = false
        shrinkAnimation(viewToAnimate: continueLabel, delay: 0)
        shrinkAnimation(viewToAnimate: codeDetailLabel, delay: 0.2)
        shrinkAnimation(viewToAnimate: codeTextField, delay: 0.2)
        shrinkAnimation(viewToAnimate: pageControl, delay: 0.4)
        shrinkAnimation(viewToAnimate: signUpTitleLabel, delay: 0.45)
        shrinkAnimation(viewToAnimate: backImageView, delay: 0.49)
        shrinkAnimation(viewToAnimate: continueButton.continueLabel, delay: 0.3)
        
        continueWidth.constant = 63
        
        //delegate.didCompleteNowFadeMusic()
        UIView.animate(withDuration: 0.35, delay: 0.1, options: [], animations: {
            self.continueButton.layer.cornerRadius = 63/2
            self.view.endEditing(true)
            self.view.layoutIfNeeded()
        }) { (success) in
            self.continueBottom.constant = self.circleCenter - 15 //-375
            UIView.animate(withDuration: 0.5, delay: 0.15, options: [], animations: {
                self.view.layoutIfNeeded()
            }) { (success) in
                self.continueBottom.constant = self.circleCenter + 7 //-375
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.layoutIfNeeded()
                }) { (success) in
                    self.continueBottom.constant = self.circleCenter
                    UIView.animate(withDuration: 0.25, animations: {
                        self.view.layoutIfNeeded()
                    }) { (success) in
                        UIView.animate(withDuration: 0.8, delay: 0.35, options: [], animations: {
                            self.continueButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        }) { (success) in
                            UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                                self.continueButton.transform = CGAffineTransform(scaleX: 50, y:  50)
                            }) { (success) in
                                self.goToHome()
                            }
                        }
                    }
                }
            }
        }
        
        
    }
    
    func goToHome() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MyTabBarController") as! MyTabBarController
        let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = vc
    }
    
}

//MARK: TRANSITION ANIMATIONS

extension LoginPNViewController: CircleCropViewControllerDelegate {
    func goToStepTwo() {
        pageControl.set(progress: 1, animated: true)
        self.emailTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.nameContainer.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            self.nameContainer.alpha = 0
            self.dismissImageView.transform = CGAffineTransform(translationX: -20, y: 0)
            self.dismissImageView.alpha = 0
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.backImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.backImageView.alpha = 1.0
                self.emailFBContentContainer.alpha = 1.0
                self.emailFBContentContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (success) in
                //
            }
        }
    }
    
    @objc func goBackToStepOne() {
        pageControl.set(progress: 0, animated: true)
        self.enterNameTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.codeContainer.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            self.codeContainer.alpha = 0
            
            self.backImageView.transform = CGAffineTransform(translationX: 40, y: 0)
            self.backImageView.alpha = 0
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.emailContainer.alpha = 1.0
                self.emailContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.dismissImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.dismissImageView.alpha = 1.0
                self.emailTextField.becomeFirstResponder()
            }) { (success) in
                self.stepOne = true
                self.stepTwo = false
            }
        }
    }
    
    func goToPhotoStep() {
        //stepThree = false
        
        var conBottom: CGFloat = -42
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            conBottom = -325
        case .iphone78() :
            conBottom = -30
        case .iphone78Plus() :
            conBottom = -30
        case .iphone11() :
            conBottom = -42
        default:
            conBottom = -42
        }
        
        pageControl.set(progress: 2, animated: true)
        self.continueBottom.constant = conBottom
        UIView.animate(withDuration: 0.35, animations: {
            self.emailFBContentContainer.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            self.emailFBContentContainer.alpha = 0
            self.view.layoutIfNeeded()
            self.view.endEditing(true)
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.profilePhotoContainer.alpha = 1.0
                self.profilePhotoContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (success) in
                //
            }
        }
    }
    
    func goToEnterPhoneNumberStep() {
        pageControl.set(progress: 1, animated: true)
        self.phoneNumberTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.nameContainer.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            self.nameContainer.alpha = 0
            self.dismissImageView.transform = CGAffineTransform(translationX: -20, y: 0)
            self.dismissImageView.alpha = 0
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.backImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.backImageView.alpha = 1.0
                self.phoneNumberContainer.alpha = 1.0
                self.phoneNumberContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (success) in
                //
            }
        }
    }
    
    func goToEnterCodeStep() {
        pageControl.set(progress: 1, animated: true)
        self.codeTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.phoneNumberContainer.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            self.phoneNumberContainer.alpha = 0
            
//            self.dismissImageView.transform = CGAffineTransform(translationX: -20, y: 0)
//            self.dismissImageView.alpha = 0
        }) { (successs) in
            self.codeTextField.becomeFirstResponder()
            UIView.animate(withDuration: 0.35, animations: {
                self.codeContainer.alpha = 1.0
                self.codeContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                
//                self.backImageView.transform = CGAffineTransform(translationX: 0, y: 0)
//                self.backImageView.alpha = 1.0
            }) { (success) in
                //
            }
        }
    }
    
    @objc func goBackToEnterPhoneNumber() {
        pageControl.set(progress: 1, animated: true)
        self.phoneNumberTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.codeContainer.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            self.codeContainer.alpha = 0
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.phoneNumberContainer.alpha = 1.0
                self.phoneNumberContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (success) in
                self.stepOne = false
                self.stepTwo = true
                self.stepThree = false
            }
        }
    }
    
    @objc func goBackToEnterEmail() {
        
        var conBottom: CGFloat = -325
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            conBottom = -325
        case .iphone78() :
            conBottom = -240
        case .iphone78Plus() :
            conBottom = -250
        case .iphone11() :
            conBottom = -325
        default:
            conBottom = -325
        }
        
        pageControl.set(progress: 1, animated: true)
        self.phoneNumberTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.profilePhotoContainer.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            self.profilePhotoContainer.alpha = 0
        }) { (successs) in
            self.continueBottom.constant = conBottom
            UIView.animate(withDuration: 0.35, animations: {
                self.emailFBContentContainer.alpha = 1.0
                self.emailFBContentContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                self.emailTextField.becomeFirstResponder()
                self.view.layoutIfNeeded()
            }) { (success) in
                self.stepOne = false
                self.stepTwo = true
                self.stepThree = false
            }
        }
    }
    
    @objc func replacePhotoClicked() {
        ImagePickerManager().pickImage(self){ image in
            if let image = image {
                self.pickedImage(image: image)
            } else {
                print("no photo retrieved")
            }
        }
    }
    
    func pickedImage(image: UIImage) {
        self.photo = image
        let circleCropController = CircleCropViewController()
        circleCropController.delegate = self
        circleCropController.image = image
        self.present(circleCropController, animated: true, completion: nil)
    }
    
    func uploadImage() {
        guard let photo = self.photo, let id = User.current.id else {
            print("photo is nil, can't upload")
            return
        }
        
        photoImageView.image = photo
        
        ImageUploader.uploadImage(image: photo, keyName: "user:\(id.uuidString)") { (error, success, url) in
            if let error = error {
                print(error)
                return
            }
            
            guard success else {
                print("upload failed")
                return
            }
            /*
            User.current.profilePhotoUrl = url
            
            SAPI.sharedInstance.updateUser(user: User.current) { (success, user, error) in
                guard error == nil else {
                    print(error!)
                    return
                }
                guard success, let user = user else {
                    print("failed updating user")
                    return
                }
                
                DispatchQueue.main.async {
                    User.current = user
                    User.saveCurrentUser()
                }
            }
            */
        }
    }
    
    func circleCropDidCropImage(_ image: UIImage) {
        self.photo = image.wxCompress()
        uploadImage()
    }
    
    func circleCropDidCancel() {
        print("User canceled the crop flow")
    }
}

//MARK: TEXTFIELD DELEGATE

extension LoginPNViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !stepThree {
            let  char = string.cString(using: String.Encoding.utf8)!
            let isBackSpace = strcmp(char, "\\b")
            var currentText = ""
            if (isBackSpace == -92) {
                //currentText = textField.text!.substring(to: textField.text!.index(before: textField.text!.endIndex))
            }
            else {
                currentText = textField.text! + string
            }
            
            
            if stepOne {
                updateCheckmarkTwo(fieldLenght: currentText.count, lottieAnimation: checkMarkTwoLottie)
                
                if isValidEmail(currentText) {
                    updateCheckmarkTwo(fieldLenght: currentText.count, lottieAnimation: checkMarkTwoLottie)
                } else {
                    checkMarkTwoLottie.play(fromFrame: 0, toFrame: 0, loopMode: .playOnce) { (success) in }
                    emailIsSet = false
                }
            }
        }
        return true
    }
    
    func updateCheckmarkOne(fieldLenght: Int, lottieAnimation: AnimationView) {
        if fieldLenght > 0 {
            if !nameIsSet {
                lottieAnimation.play(fromFrame: 14, toFrame: 36, loopMode: .playOnce) { (success) in }
            }
            nameIsSet = true
        } else {
            nameIsSet = false
            lottieAnimation.play(fromFrame: 0, toFrame: 0, loopMode: .playOnce) { (success) in }
        }
    }
    
    func updateCheckmarkTwo(fieldLenght: Int, lottieAnimation: AnimationView) {
        
        
        if fieldLenght > 0 {
            if !emailIsSet {
                lottieAnimation.play(fromFrame: 14, toFrame: 36, loopMode: .playOnce) { (success) in }
            }
            emailIsSet = true
        } else {
            emailIsSet = false
            lottieAnimation.play(fromFrame: 0, toFrame: 0, loopMode: .playOnce) { (success) in }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        continueTapped()
        return true
    }
    
   
}

//MARK: FLAG DELEGATE ------------------------------------------------------------------------------------------------------------------------------------

extension LoginPNViewController: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        
        if isValid {
            print("valid!!!")
            phoneNubmerIsValid = true
        } else {
            print("Invalid!!!")
            phoneNubmerIsValid = false
        }
        
        guard let number = textField.getFormattedPhoneNumber(format: FPNFormat.E164), isValid else {
//            disableContinue()
            return
        }
        
        self.phoneNumber = number
    }
    
    func fpnDisplayCountryList() {
        //
    }
    
    
}
