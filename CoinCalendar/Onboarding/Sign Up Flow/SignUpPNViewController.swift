//
//  SignUpPNViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit
import Lottie
import CHIPageControl
import FlagPhoneNumber
import PhotoCircleCrop
import WXImageCompress
//import FBSDKLoginKit
import AuthenticationServices

protocol SignUpPNViewControllerDelegate: class {
    func didCompleteNowFadeMusic()
}

class SignUpPNViewController: UIViewController {
    
    //Transition Views
    var getStartedButton = UIButton()
    var getStartedBottom: NSLayoutConstraint!
    var getStartedLeading: NSLayoutConstraint!
    var getStartedWidth: NSLayoutConstraint!
    var getStartedLabel = UILabel()
    var getStartedArrowImageView = UIImageView()
    
    //
    
    var isClubHouse = false
    var notOnList = true
    let toastView = ToastNotificationView()
    var fromSignUp = UserDefaults()
    
    var isFacebookSignUp = false
    var isAppleEmailSignUp = false
    var dismissArrowImageView = UIImageView()
    var titleLabel = UILabel()
    var faceBookButton = UIButton()
    var appleButton = UIButton()
    var emailButton = UIButton()
    
    //
    
    //var delegate: SignUpPNViewControllerDelegate!
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
    var termsLabel = UILabel()
    var termsButton = UIButton()
    
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
    
    var userSignup: UserSignup?
    
    //let facebookLoginManager = LoginManager()
    
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
        
        //Iphone 12
        case .iphone12AndPro() :
            circleCenter = -390
        case .iphone12ProMax() :
            circleCenter = -431
            
        default:
            circleCenter = -375
        }
                
        setupViews()
        setupTransitionViews()
        //setupEnterName()
        if !isFacebookSignUp && !isAppleEmailSignUp {
            setupEnterEmail()
            print("did this 🤟🤟🤟 111")
        } else if isFacebookSignUp || isAppleEmailSignUp {
            //enterNameTextField.text = userSignup?.name
            print("did this 🤟🤟🤟 222")
        }
        
        setupEnterPhoneNumber()
        setupEnterCode()
        
        setupProfilePhoto()
        
        //transitionViews()
        
        
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        backDismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(goToTerms), for: .touchUpInside)
        faceBookButton.addTarget(self, action: #selector(didTapFB), for: .touchUpInside)
        appleButton.addTarget(self, action: #selector(didTapApple), for: .touchUpInside)
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
    }
}

//MARK: ACTIONS

extension SignUpPNViewController {
    @objc func goToTerms() {
        if let url = URL(string: "https://app.termly.io/document/privacy-policy/91abe50e-7767-4407-b2a3-11090c66613d") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func animateViewsIn() {
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
        
        mainHeight.constant = view.frame.height + 10
        getStartedBottom.constant = conBottom
        continueBottom.constant = conBottom
        getStartedWidth.constant = view.frame.width - 36
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
            self.dismissArrowImageView.alpha = 0
            self.titleLabel.alpha = 0
            self.emailButton.alpha = 0
            self.mainContainer.layer.cornerRadius = 0
            self.getStartedLabel.alpha = 0
            self.getStartedArrowImageView.alpha = 0
            
            self.phoneNumberContainer.alpha = 1.0
            self.phoneNumberTextField.becomeFirstResponder()

            self.mainContainer.alpha = 1.0
            self.dismissImageView.alpha = 1.0
            self.signUpTitleLabel.alpha = 1.0
            self.signUpSteplabel.alpha = 1.0
            self.pageControl.alpha = 1.0
            self.emailFBContentContainer.alpha = 1.0
            
        } completion: { (success) in
            self.continueButton.alpha = 1.0
            self.getStartedButton.isHidden = true
            
            UIView.animate(withDuration: 0.35) {
                self.continueButton.continueLabel.alpha = 1.0
            }
        }
    }
    
    @objc func dismissVC() {
        if stepOne {
            UIView.animate(withDuration: 0.35) {
                self.mainContainer.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height + 10)
                self.view.endEditing(true)
            } completion: { (success) in
//                if self.isClubHouse {
                    self.dismiss(animated: true, completion: nil)
//                } else {
//                    //self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: {})
//                    self.dismiss(animated: true, completion: nil)
//                }
            }
        } else if stepTwo {
            goBackToEnterEmail()
        } else if stepThree {
            goBackToPhoneNumber()
        } else {
            goBackToEnterCode()
        }
    }
    
    @objc func goToPickCrypto() {
        continueButton.isUserInteractionEnabled = false
        shrinkAnimation(viewToAnimate: photoImageView, delay: 0.1)
        shrinkAnimation(viewToAnimate: nameLabel, delay: 0.1)
        shrinkAnimation(viewToAnimate: photoDetailLabel, delay: 0.25)
        shrinkAnimation(viewToAnimate: pageControl, delay: 0.3)
        shrinkAnimation(viewToAnimate: termsLabel, delay: 0.3)
        shrinkAnimation(viewToAnimate: signUpTitleLabel, delay: 0.35)
        shrinkAnimation(viewToAnimate: backImageView, delay: 0.39)
        shrinkAnimation(viewToAnimate: continueLabel, delay: 0.3)
        //shrinkAnimation(viewToAnimate: continueButton.continueLabel, delay: 0.3)
        //shrinkAnimation(viewToAnimate: continueButton.spinner, delay: 0.3)
        shrinkAnimation(viewToAnimate: dismissImageView, delay: 0.35)
        
        continueBottom.constant = -30
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        } completion: { (success) in
            
        }
        
        perform(#selector(showPickCrypto), with: self, afterDelay: 0.7)
        
    }
    
    @objc func showPickCrypto() {
        let sortFilterVC = PickCryptoViewController()
        sortFilterVC.modalPresentationStyle = .overFullScreen
        self.present(sortFilterVC, animated: false) {
            //
        }
    }
    
    @objc func shrinkTransition() {
        continueButton.isUserInteractionEnabled = false
        shrinkAnimation(viewToAnimate: photoImageView, delay: 0.1)
        shrinkAnimation(viewToAnimate: nameLabel, delay: 0.1)
        shrinkAnimation(viewToAnimate: photoDetailLabel, delay: 0.25)
        shrinkAnimation(viewToAnimate: pageControl, delay: 0.3)
        shrinkAnimation(viewToAnimate: termsLabel, delay: 0.3)
        shrinkAnimation(viewToAnimate: signUpTitleLabel, delay: 0.35)
        shrinkAnimation(viewToAnimate: backImageView, delay: 0.39)
        shrinkAnimation(viewToAnimate: continueLabel, delay: 0.3)
        shrinkAnimation(viewToAnimate: continueButton.continueLabel, delay: 0.3)
        shrinkAnimation(viewToAnimate: continueButton.spinner, delay: 0.3)
        shrinkAnimation(viewToAnimate: dismissImageView, delay: 0.35)
        continueButton.spinner.stopAnimating()
        continueButton.spinner.isHidden = true
        
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
                                self.fromSignUp.setValue(true, forKey: "comingFromSignUp")
//                                if self.notOnList == false {
//                                    self.goToHome()
//                                }
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
        if !isFacebookSignUp && !isAppleEmailSignUp {
            //print("did this ☠️☠️☠️")
            if stepOne {
                if phoneNubmerIsValid {
                    self.goToEnterCodeStep()
                    self.stepOne = false
                    self.stepTwo = true
                    API.sharedInstance.sendSMSVerify(user: UserSignup(phone: phoneNumber, name: enterNameTextField.text, email: nil, facebookId: nil, appleId: nil, password: nil)) { (success, loginRequest, error) in
                        guard error == nil else {
                            print(error!)
                            return
                        }
                        
                        guard success else {
                            print("error getting on wait list")
                            return
                        }
                        
                        DispatchQueue.main.async { [weak self] in
                            self?.loginRequest = loginRequest
                            self?.goToEnterCodeStep()
                            self?.stepOne = false
                            self?.stepTwo = true
                        }
                    }
                } else {
                    emailContainer.badWiggle()
                    errorImpactGenerator()
                }
            } else if stepTwo {
                if codeIsSet {
                    goToStepThree()
                    stepOne = false
                    stepTwo = false
                    stepThree = true
                } else {
                    nameContainer.badWiggle()
                    errorImpactGenerator()
                }
                
            } else if stepThree {
                if emailIsSet {
                    goToPhotoStep()
                } else {
                    emailContainer.badWiggle()
                    errorImpactGenerator()
                }
            } else {
                continueButton.showLoader()

                if self.userSignup == nil {
                    self.userSignup = UserSignup(phone: nil, name: enterNameTextField.text, email: emailTextField.text, facebookId: nil, password: "")
                } else {
                    self.userSignup?.email = emailTextField.text //updating just in case they've edited the field
                }
                
                self.userSignup?.phone = self.phoneNumber
                
                API.sharedInstance.register(user: self.userSignup!) { (success, user, error) in
                    guard error == nil else {
                        print(error!)
                        DispatchQueue.main.async {
                            self.notAllowed()
                            self.notOnList = true
                        }
                        return
                    }
                    
                    guard success, let user = user else {
                        print("error creating user")
                        return
                    }
                    
                    DispatchQueue.main.async { [weak self] in
                        User.current = user
                        User.saveCurrentUser()
                        self?.uploadImage()
                        self?.goToPickCrypto()
                    }
                }
            }
        } else {
            print("did this ⛱⛱⛱")
            if stepOne {
                if phoneNubmerIsValid {
//                    checkIfPhoneNumberHasBeenGrantedAccess()
                } else {
                    emailContainer.badWiggle()
                    errorImpactGenerator()
                }
            } else if stepTwo {
                goToPhotoStep()
            } else { //facebook or apple sign up
                /*
                LAPI.sharedInstance.register(user: self.userSignup!) { (success, user, error) in
                    guard error == nil else {
                        print(error!)
                        return
                    }
                    
                    guard success, let user = user else {
                        print("error creating user")
                        return
                    }
                    
                    DispatchQueue.main.async { [weak self] in
                        User.current = user
                        User.saveCurrentUser()
                        
                        self?.uploadImage()
                        self?.shrinkTransition()
                    }
                }
                */
            }
        }
    }
    
    @objc func notAllowed() {
        toastView.presentError(withMessage: "You are not on the list!")
        self.dismiss(animated: true, completion: nil)
        continueButton.badWiggle()
        errorImpactGenerator()
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
        print("did this 💀💀💀")
    }
    
}

//MARK: TRANSITION ANIMATIONS

extension SignUpPNViewController: CircleCropViewControllerDelegate {
    func goToStepThree() {
        pageControl.set(progress: 2, animated: true)
        self.emailTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.codeContainer.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            self.codeContainer.alpha = 0
            //self.dismissImageView.transform = CGAffineTransform(translationX: -20, y: 0)
            //self.dismissImageView.alpha = 0
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                //self.backImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                //self.backImageView.alpha = 1.0
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
            self.emailFBContentContainer.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            self.emailFBContentContainer.alpha = 0
            
            //self.backImageView.transform = CGAffineTransform(translationX: 40, y: 0)
            //self.backImageView.alpha = 0
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.nameContainer.alpha = 1.0
                self.nameContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                
                //self.dismissImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                //self.dismissImageView.alpha = 1.0
            }) { (success) in
                self.stepOne = true
                self.stepTwo = false
            }
        }
    }
    
    @objc func goBackToPhoneNumber() {
        pageControl.set(progress: 1, animated: true)
        self.enterNameTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.codeContainer.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            self.codeContainer.alpha = 0
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.phoneNumberContainer.alpha = 1.0
                self.phoneNumberContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (success) in
                self.stepThree = false
                self.stepTwo = true
            }
        }
    }
    
    @objc func goBackToEnterCode() {
        pageControl.set(progress: 2, animated: true)
        self.codeTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.profilePhotoContainer.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            self.profilePhotoContainer.alpha = 0
            self.termsLabel.alpha = 0
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.codeContainer.alpha = 1.0
                self.codeContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (success) in
                self.stepThree = true
            }
        }
    }
    
    func goToPhotoStep() {
        
        var conBottom: CGFloat = -42
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            conBottom = -58
        case .iphone78() :
            conBottom = -58
        case .iphone78Plus() :
            conBottom = -58
        case .iphone11() :
            conBottom = -59
        default:
            conBottom = -70 //17
        }
        
        if !isAppleEmailSignUp && !isFacebookSignUp {
            pageControl.set(progress: 3, animated: true)
            stepThree = false
        } else {
            pageControl.set(progress: 2, animated: true)
            stepTwo = false
        }
        
        self.continueBottom.constant = conBottom
        UIView.animate(withDuration: 0.35, animations: {
            self.emailFBContentContainer.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            self.emailFBContentContainer.alpha = 0
            self.view.layoutIfNeeded()
            self.view.endEditing(true)
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.profilePhotoContainer.alpha = 1.0
                self.termsLabel.alpha = 1.0
                self.profilePhotoContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (success) in
                self.termsButton.isHidden = false
            }
        }
    }
    
    func goToEnterPhoneNumberStep() {
        pageControl.set(progress: 2, animated: true)
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
        stepOne = false
        stepTwo = true
        self.codeTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.phoneNumberContainer.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            self.phoneNumberContainer.alpha = 0
            if self.isAppleEmailSignUp || self.isFacebookSignUp {
                self.dismissImageView.transform = CGAffineTransform(translationX: -20, y: 0)
                self.dismissImageView.alpha = 0
            }
        }) { (successs) in
            UIView.animate(withDuration: 0.35, animations: {
                self.codeContainer.alpha = 1.0
                self.codeContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                
                if self.isAppleEmailSignUp || self.isFacebookSignUp {
                    self.backImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.backImageView.alpha = 1.0
                }
            }) { (success) in
                
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
        
        pageControl.set(progress: 0, animated: true)
        self.termsButton.isHidden = true
        self.phoneNumberTextField.becomeFirstResponder()
        UIView.animate(withDuration: 0.35, animations: {
            self.phoneNumberContainer.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            self.phoneNumberContainer.alpha = 0
                                    
            self.backImageView.transform = CGAffineTransform(translationX: 20, y: 0)
            self.backImageView.alpha = 0
        }) { (successs) in
            self.continueBottom.constant = conBottom
            UIView.animate(withDuration: 0.35, animations: {
                self.emailFBContentContainer.alpha = 1.0
                self.emailFBContentContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                self.emailTextField.becomeFirstResponder()
                self.dismissImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.dismissImageView.alpha = 1.0
                self.view.layoutIfNeeded()
            }) { (success) in
                self.stepOne = true
                self.stepTwo = false
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
        guard let photo = self.photo else {
            print("photo is nil, can't upload")
            return
        }
        
        photoImageView.image = photo
        
        ImageUploader.uploadImage(image: photo.wxCompress(), keyName: "user:\(User.current.id!.uuidString)") { (error, success, url) in
            if let error = error {
                print(error)
                return
            }
            
            guard success else {
                print("upload failed")
                return
            }
            
            User.current.profilePhotoUrl = url
            
            API.sharedInstance.updateUser(user: User.current) { (success, user, error) in
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
        }
    }
    
    func circleCropDidCropImage(_ image: UIImage) {
        self.photo = image.wxCompress()
        self.photoImageView.image = image
        uploadImage()
    }
    
    func circleCropDidCancel() {
        print("User canceled the crop flow")
    }
}

//MARK: TEXTFIELD DELEGATE

extension SignUpPNViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let  char = string.cString(using: String.Encoding.utf8)!
            let isBackSpace = strcmp(char, "\\b")
            var currentText = ""
            if (isBackSpace == -92) {
                //currentText = textField.text!.substring(to: textField.text!.index(before: textField.text!.endIndex))
            }
            else {
                currentText = textField.text! + string
            }
            
            
            if stepThree {
                //updateCheckmarkOne(fieldLenght: currentText.count, lottieAnimation: checkmarkOneLottie)
                updateCheckmarkTwo(fieldLenght: currentText.count, lottieAnimation: checkMarkTwoLottie)
                if isValidEmail(currentText) {
                    updateCheckmarkTwo(fieldLenght: currentText.count, lottieAnimation: checkMarkTwoLottie)
                } else {
                    checkMarkTwoLottie.play(fromFrame: 0, toFrame: 0, loopMode: .playOnce) { (success) in }
                    emailIsSet = false
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

extension SignUpPNViewController: FPNTextFieldDelegate {
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


//MARK: DYLAN ADD FB AND APPLE EMAIL LOGIC

extension SignUpPNViewController {
    @objc func didTapFB() {
        /*
        lightImpactGenerator()
        
        facebookLoginManager.logIn(permissions: ["email"], from: self) { (loginResult, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            if loginResult?.isCancelled ?? false {
                print("User cancelled login.")
            } else if let _ = loginResult?.token {
                let connection = GraphRequestConnection()
                connection.add(GraphRequest(graphPath: "me", parameters: ["fields": "email, first_name, last_name, picture"])) { httpResponse, result, error in
                    guard error == nil else {
                        print(error!)
                        return
                    }
                    if let result = result as? [String:Any] {
                        print(result)
                    }
                    if let result = result as? [String:Any],
                        let email = result["email"] as? String, let firstName = result["first_name"] as? String, let lastName = result["last_name"] as? String,
                        let fbId = result["id"] as? String { //}, let picture = result["picture"] as? [String: Any], let data = picture["data"] as? [String: Any], let url = data["url"] as? String {
                        DispatchQueue.main.async { [weak self] in
                            self?.userSignup = UserSignup(phone: nil, name: "\(String(describing: firstName)) \(String(describing: lastName))", email: email, facebookId: fbId, password: "")
                            self?.emailTextField.text = email
                            guard let checkMarkTwoLottie = self?.checkMarkTwoLottie else { return }
                            self?.updateCheckmarkTwo(fieldLenght: email.count, lottieAnimation: checkMarkTwoLottie)
                        }
                    }
                }
                connection.start()
                
            } else {
                print("error logging into fb")
            }
        }
         */
    }
    
    @objc func didTapApple() {
        lightImpactGenerator()
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
    }
    
}

extension SignUpPNViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        /*
        switch authorization.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                
                // Create an account in your system.
                let userIdentifier = appleIDCredential.user
                let fullName = appleIDCredential.fullName
                let email = appleIDCredential.email
                
                DispatchQueue.main.async { [weak self] in
                    self?.userSignup = UserSignup(phone: nil, name: "\(fullName?.givenName ?? "First Name") \(fullName?.familyName ?? "Last Name")", email: email, facebookId: nil, appleId: userIdentifier, password: "")
                    self?.emailTextField.text = email
                    guard let checkMarkTwoLottie = self?.checkMarkTwoLottie else { return }
                    self?.updateCheckmarkTwo(fieldLenght: email?.count ?? 0, lottieAnimation: checkMarkTwoLottie)
                }
            
//            case let passwordCredential as ASPasswordCredential:
//                break
                // Sign in using an existing iCloud Keychain credential.
//                let username = passwordCredential.user
//                let password = passwordCredential.password
//
//                API.sharedInstance.appleLogin(loginRequest: AppleLoginAttempt(appleId: username, token: password)) { (success, user, error, statusCode) in
//                    guard error == nil else {
//                        print(error!)
//                        return
//                    }
//
//                    guard success, let user = user else {
//                        print("error loggin in with apple")
//                        return
//                    }
//
//                    DispatchQueue.main.async { [weak self] in
//                        User.current = user
//                        User.saveCurrentUser()
//
//                        self?.goToHome()
//                    }
//                }
                
            default:
                break
            }
        
        */
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error)
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: "2FA Needed", message: "You need to enable 2-Factor Authentication on your Apple account to be able to sign in with Apple.", preferredStyle: .alert)
            self?.present(alert, animated: true, completion: nil)
        }
    }
}

