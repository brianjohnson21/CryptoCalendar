//
//  SplashTwoViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/15/21.
//

import UIKit
import Lottie
import AVFoundation
import AVKit
import KDCircularProgress
import CHIPageControl

class SplashTwoViewController: UIViewController {
    
    let launchTransition = LaunchTransitionView()
    
    var circularButton = UIButton()
    var whiteCirculeView = UIView()
    var progress: KDCircularProgress!
    var blueArrow = UIImageView()
    var progressStep = 0
    var pageControl = CHIPageControlAleppo()
    var pulseLottie = AnimationView()
    var mainScrollView = UIScrollView()
    var lastScrollPosition = CGPoint.zero
    
    var benefitImageHeight: CGFloat = 355
    var benefitImagetop: CGFloat = 97
    var benefitImageWidth: CGFloat = 178
    var benefitTitleSize: CGFloat = 21
    var benefitDetailSize: CGFloat = 14
    var circleBottom: CGFloat = -57
    var benefitTitleTop: CGFloat = 58
    
    var benefitOneImageView = UIImageView()
    var benefitOneTitleLabel = UILabel()
    var benefitOneDetailLabel = UILabel()
    
    var benefitTwoImageView = UIImageView()
    var benefitTwoTitleLabel = UILabel()
    var benefitTwoDetailLabel = UILabel()
    
    var benefitThreeImageView = UIImageView()
    var benefitThreeTitleLabel = UILabel()
    var benefitThreeDetailLabel = UILabel()
    
    var benefitFourImageView = UIImageView()
    var benefitFourTitleLabel = UILabel()
    var benefitFourDetailLabel = UILabel()
    
    var benefitFiveImageView = UIImageView()
    var benefitFiveTitleLabel = UILabel()
    var benefitFiveDetailLabel = UILabel()

    var mainContainer = UIView()
    var previewPlayer = AVPlayer()
    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()

    var iconsBGImageView = UIImageView()
    var loginButton = UIButton()
    var loginLabel = UILabel()
    var getStartedButton = UIButton()
    var getStartedLeading: NSLayoutConstraint!
    var getStartedLabel = UILabel()
    var getStartedArrowImageView = UIImageView()
    var cryptoLabel = UILabel()
    var cryptoLabelTop: CGFloat = 153
    var calendarLabel = UILabel()
    
    var goingToMoonLabel = UILabel()
    var whatWeDoLabel = UILabel()
    var whatWeDoFontSize: CGFloat = 20
    
    //Icons
    
    var btcIcon = UIImageView()
    var sushiIcon = UIImageView()
    var adaIcon = UIImageView()
    var ethIcon = UIImageView()
    var enjinIcon = UIImageView()
    var thetaFuelIcon = UIImageView()
    var chainLinkIcon = UIImageView()
    var uniSwapIcon = UIImageView()
    
    var icons: [UIImageView] = []
    
    var isGoingLeft = false
    var isGoingRight = false
    var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white//.green
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        modifyConstraints()
        modifyStepsConstraints()
        setupViews()
        playVideoAudio()
        setupLaunchTransition()
        
        
        let min = CGFloat(-20)
        let max = CGFloat(20)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        
        mainContainer.addMotionEffect(motionEffectGroup)
        
        getStartedButton.isHidden = true
        loginButton.isHidden = true
        
        icons.append(btcIcon)
        icons.append(sushiIcon)
        icons.append(adaIcon)
        icons.append(ethIcon)
        icons.append(enjinIcon)
        icons.append(thetaFuelIcon)
        icons.append(chainLinkIcon)
        icons.append(uniSwapIcon)
    }
    
    @objc func appMovedToForeround() {
        pulseLottie.play()
        pulseLottie.play(fromFrame: 0, toFrame: 30, loopMode: .loop) { (success) in
            //
        }
    }

}


//MARK: SET UP VIDEO & AUDIO

extension SplashTwoViewController {
    func playVideoAudio() {
              
        //LOCAL
        guard let path = Bundle.main.path(forResource: "hex_loop_3mb", ofType:"mp4") else { //hex_loop_422 //hexPatternVertical
              debugPrint("video.m4v not found")
              return
          }
        
    
        //Mini Preview Window
        previewPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        let previewPlayerLayer = AVPlayerLayer(player: previewPlayer)
        
        previewPlayer.isMuted = true
        previewPlayerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        previewPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        mainContainer.layer.addSublayer(previewPlayerLayer)
        previewPlayer.play()
        
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { [weak self] _ in
            self?.previewPlayer.seek(to: CMTime.zero)
            self?.previewPlayer.play()
        }

    }
    
}

//MARK: ACTIONS

extension SplashTwoViewController {
    @objc func circleButtonTapped() {
        lightImpactGenerator()
        mainScrollView.isUserInteractionEnabled = false
        switch progressStep {
        case 0:
            animateCryptoAway()
            pageControl.set(progress: 1, animated: true)
            progress.animate(toAngle: 60, duration: 0.28) { (success) in
                print("Step 2")
                self.animateBenefitIn(benefitImage: self.benefitOneImageView, benefitTitle: self.benefitOneTitleLabel, benefitDetail: self.benefitOneDetailLabel)
                self.mainScrollView.isUserInteractionEnabled = true
            }
        case 1:
            animateBenefitOut(benefitImage: self.benefitOneImageView, benefitTitle: self.benefitOneTitleLabel, benefitDetail: self.benefitOneDetailLabel)
            pageControl.set(progress: 2, animated: true)
            progress.animate(toAngle: 120, duration: 0.28) { (success) in
                self.animateBenefitIn(benefitImage: self.benefitTwoImageView, benefitTitle: self.benefitTwoTitleLabel, benefitDetail: self.benefitTwoDetailLabel)
                self.mainScrollView.isUserInteractionEnabled = true
                print("Step 3")
            }
        case 2:
            animateBenefitOut(benefitImage: self.benefitTwoImageView, benefitTitle: self.benefitTwoTitleLabel, benefitDetail: self.benefitTwoDetailLabel)
            pageControl.set(progress: 3, animated: true)
            progress.animate(toAngle: 180, duration: 0.28) { (success) in
                self.animateBenefitIn(benefitImage: self.benefitThreeImageView, benefitTitle: self.benefitThreeTitleLabel, benefitDetail: self.benefitThreeDetailLabel)
                self.mainScrollView.isUserInteractionEnabled = true
                print("Step 4")
            }
        case 3:
            animateBenefitOut(benefitImage: self.benefitThreeImageView, benefitTitle: self.benefitThreeTitleLabel, benefitDetail: self.benefitThreeDetailLabel)
            pageControl.set(progress: 4, animated: true)
            progress.animate(toAngle: 240, duration: 0.28) { (success) in
                print("Step 5")
                self.animateBenefitIn(benefitImage: self.benefitFourImageView, benefitTitle: self.benefitFourTitleLabel, benefitDetail: self.benefitFourDetailLabel)
                self.mainScrollView.isUserInteractionEnabled = true
            }
        
        case 4:
            animateBenefitOut(benefitImage: self.benefitFourImageView, benefitTitle: self.benefitFourTitleLabel, benefitDetail: self.benefitFourDetailLabel)
            pageControl.set(progress: 5, animated: true)
            progress.animate(toAngle: 300, duration: 0.28) { (success) in
                print("Step 5")
                self.animateBenefitIn(benefitImage: self.benefitFiveImageView, benefitTitle: self.benefitFiveTitleLabel, benefitDetail: self.benefitFiveDetailLabel)
                self.mainScrollView.isUserInteractionEnabled = true
            }
        
        default:
            animateBenefitOut(benefitImage: self.benefitFiveImageView, benefitTitle: self.benefitFiveTitleLabel, benefitDetail: self.benefitFiveDetailLabel)
            progress.animate(toAngle: 360, duration: 0.28) { (success) in
                print("Step 5")
                self.successImpactGenerator()
                //self.didTapGetStarted()
                self.beginTransition()
                
            }
        }
        progressStep += 1
    }
    
    @objc func swipeBack() {
        lightImpactGenerator()
        mainScrollView.isUserInteractionEnabled = false
        switch progressStep {
        case 0:
            print("Step 1")
        case 1:
            animateBenefitOutReverse(benefitImage: self.benefitOneImageView, benefitTitle: self.benefitOneTitleLabel, benefitDetail: self.benefitOneDetailLabel)
            pageControl.set(progress: 0, animated: true)
            progress.animate(toAngle: 0, duration: 0.28) { (success) in
                self.showCryptoAgain()
                self.mainScrollView.isUserInteractionEnabled = true
                print("Step 3")
            }
        case 2:
            animateBenefitOutReverse(benefitImage: self.benefitTwoImageView, benefitTitle: self.benefitTwoTitleLabel, benefitDetail: self.benefitTwoDetailLabel)
            pageControl.set(progress: 1, animated: true)
            progress.animate(toAngle: 60, duration: 0.28) { (success) in
                self.animateBenefitInReverse(benefitImage: self.benefitOneImageView, benefitTitle: self.benefitOneTitleLabel, benefitDetail: self.benefitOneDetailLabel)
                self.mainScrollView.isUserInteractionEnabled = true
                print("Step 4")
            }
        case 3:
            animateBenefitOutReverse(benefitImage: self.benefitThreeImageView, benefitTitle: self.benefitThreeTitleLabel, benefitDetail: self.benefitThreeDetailLabel)
            pageControl.set(progress: 2, animated: true)
            progress.animate(toAngle: 120, duration: 0.28) { (success) in
                print("Step 5")
                self.animateBenefitInReverse(benefitImage: self.benefitTwoImageView, benefitTitle: self.benefitTwoTitleLabel, benefitDetail: self.benefitTwoDetailLabel)
                self.mainScrollView.isUserInteractionEnabled = true
            }
        
        case 4:
            animateBenefitOutReverse(benefitImage: self.benefitFourImageView, benefitTitle: self.benefitFourTitleLabel, benefitDetail: self.benefitFourDetailLabel)
            pageControl.set(progress: 3, animated: true)
            progress.animate(toAngle: 180, duration: 0.28) { (success) in
                print("Step 5")
                self.animateBenefitInReverse(benefitImage: self.benefitThreeImageView, benefitTitle: self.benefitThreeTitleLabel, benefitDetail: self.benefitThreeDetailLabel)
                self.mainScrollView.isUserInteractionEnabled = true
            }
        
        default:
            animateBenefitOutReverse(benefitImage: self.benefitFiveImageView, benefitTitle: self.benefitFiveTitleLabel, benefitDetail: self.benefitFiveDetailLabel)
            pageControl.set(progress: 4, animated: true)
            progress.animate(toAngle: 240, duration: 0.28) { (success) in
                print("Step 5")
                self.animateBenefitInReverse(benefitImage: self.benefitFourImageView, benefitTitle: self.benefitFourTitleLabel, benefitDetail: self.benefitFourDetailLabel)
                self.mainScrollView.isUserInteractionEnabled = true
            }
        }
        progressStep -= 1
    }
    
    
    
    @objc func animateCryptoAway() {
        aniamteAway(viewToAnimate: cryptoLabel, delay: 0)
        aniamteAway(viewToAnimate: calendarLabel, delay: 0.1)
        aniamteAway(viewToAnimate: goingToMoonLabel, delay: 0.2)
        aniamteAway(viewToAnimate: whatWeDoLabel, delay: 0.3)
        for icon in icons {
            UIView.animate(withDuration: 0.35) {
                icon.alpha = 0
            }
        }
        
        UIView.animate(withDuration: 0.35) {
            self.pulseLottie.alpha = 0
        } completion: { (success) in
            self.pulseLottie.isHidden = true
        }
    }
    
    @objc func beginTransition() {
        UIView.animate(withDuration: 0.35) {
            self.whiteCirculeView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.whiteCirculeView.alpha = 0
            self.blueArrow.alpha = 0
            self.pageControl.alpha = 0
            self.pageControl.transform = CGAffineTransform(scaleX: -100, y: 0)
        } completion: { (success) in
            self.didTapGetStarted()
        }
    }
    
    @objc func animateBenefitIn(benefitImage: UIImageView, benefitTitle: UILabel, benefitDetail: UILabel) {
        animateIn(viewToAnimate: benefitImage, delay: 0)
        animateIn(viewToAnimate: benefitTitle, delay: 0.1)
        animateIn(viewToAnimate: benefitDetail, delay: 0.2)
    }
    
    @objc func animateBenefitOut(benefitImage: UIImageView, benefitTitle: UILabel, benefitDetail: UILabel) {
        aniamteAway(viewToAnimate: benefitImage, delay: 0)
        aniamteAway(viewToAnimate: benefitTitle, delay: 0.1)
        aniamteAway(viewToAnimate: benefitDetail, delay: 0.2)
    }
    
    @objc func aniamteAway(viewToAnimate: UIView, delay: Double) {
        UIView.animate(withDuration: 0.35, delay: delay, options: []) {
            viewToAnimate.transform = CGAffineTransform(translationX: -100, y: 0)
            viewToAnimate.alpha = 0
        } completion: { (success) in
            //
        }
    }
    
    @objc func animateIn(viewToAnimate: UIView, delay: Double) {
        UIView.animate(withDuration: 0.35, delay: delay, options: []) {
            viewToAnimate.transform = CGAffineTransform(translationX: 0, y: 0)
            viewToAnimate.alpha = 1.0
        } completion: { (success) in
            //
        }
    }
    
    //
    
    @objc func showCryptoAgain() {
        animateInReverse(viewToAnimate: cryptoLabel, delay: 0)
        animateInReverse(viewToAnimate: calendarLabel, delay: 0.1)
        animateInReverse(viewToAnimate: goingToMoonLabel, delay: 0.2)
        animateInReverse(viewToAnimate: whatWeDoLabel, delay: 0.3)
        for icon in icons {
            UIView.animate(withDuration: 0.35) {
                icon.alpha = 1.00
            }
        }
        
        self.pulseLottie.isHidden = false
                
        UIView.animate(withDuration: 0.75) {
            self.pulseLottie.alpha = 1.0
        }
    }
    
    @objc func animateBenefitInReverse(benefitImage: UIImageView, benefitTitle: UILabel, benefitDetail: UILabel) {
        animateInReverse(viewToAnimate: benefitImage, delay: 0)
        animateInReverse(viewToAnimate: benefitTitle, delay: 0.1)
        animateInReverse(viewToAnimate: benefitDetail, delay: 0.2)
    }
    
    @objc func animateBenefitOutReverse(benefitImage: UIImageView, benefitTitle: UILabel, benefitDetail: UILabel) {
        aniamteAwayReverse(viewToAnimate: benefitImage, delay: 0)
        aniamteAwayReverse(viewToAnimate: benefitTitle, delay: 0.1)
        aniamteAwayReverse(viewToAnimate: benefitDetail, delay: 0.2)
    }
    
    @objc func aniamteAwayReverse(viewToAnimate: UIView, delay: Double) {
        UIView.animate(withDuration: 0.35, delay: delay, options: []) {
            viewToAnimate.transform = CGAffineTransform(translationX: 100, y: 0)
            viewToAnimate.alpha = 0
        } completion: { (success) in
            //
        }
    }
    
    @objc func animateInReverse(viewToAnimate: UIView, delay: Double) {
        UIView.animate(withDuration: 0.35, delay: delay, options: []) {
            viewToAnimate.transform = CGAffineTransform(translationX: 0, y: 0)
            viewToAnimate.alpha = 1.0
        } completion: { (success) in
            //
        }
    }
    
    @objc func doTransitionViewThing() {
        self.launchTransition.animateViewsAway()
    }
    
    @objc func animateViewsIn() {
        getStartedLeading.constant = 18
        UIView.animate(withDuration: 0.5, delay: 0.5, options: []) {
            self.view.layoutIfNeeded()
        } completion: { (success) in
            //
        }
        
        showView(viewToAnimate: cryptoLabel, delay: 0)
        showView(viewToAnimate: calendarLabel, delay: 0.25)
        showView(viewToAnimate: goingToMoonLabel, delay: 0.5)
        showView(viewToAnimate: whatWeDoLabel, delay: 1.25)
        
        let baseValue: Double = 0.75
        let multiplier: Double = 0.15
                                
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            animateCoin(coin: btcIcon, delay: baseValue, xAxis: -113, yAxis: -330)
            animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 123, yAxis: -294)
            animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 116, yAxis: -18)
            animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 155, yAxis: 152)
            animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 131, yAxis: 365)
            animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -131, yAxis: 387)
            animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -64, yAxis: 109)
            animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -129, yAxis: -34)
            
        case .iphone78() :
            animateCoin(coin: btcIcon, delay: baseValue, xAxis: -113, yAxis: -258)
            animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 123, yAxis: -294)
            animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 116, yAxis: -18)
            animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 155, yAxis: 152)
            animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 131, yAxis: 300)
            animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -131, yAxis: 304)
            animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -33, yAxis: 30)
            animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -127, yAxis: -25)
            
        case .iphone78Plus() :
            animateCoin(coin: btcIcon, delay: baseValue, xAxis: -113, yAxis: -320)
            animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 123, yAxis: -270)
            animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 116, yAxis: -18)
            animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 155, yAxis: 152)
            animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 131, yAxis: 329)
            animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -131, yAxis: 341)
            animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -64, yAxis: 85)
            animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -129, yAxis: -34)
            
        case .iphone11Max() :
            animateCoin(coin: btcIcon, delay: baseValue, xAxis: -133, yAxis: -375)
            animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 146, yAxis: -343)
            animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 117, yAxis: -60)
            animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 172, yAxis: 152)
            animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 143, yAxis: 405)
            animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -151, yAxis: 416)
            animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -64, yAxis: 109)
            animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -129, yAxis: -34)
        
        case .iphone12Mini() :
            animateCoin(coin: btcIcon, delay: baseValue, xAxis: -113, yAxis: -330)
            animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 123, yAxis: -294)
            animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 116, yAxis: -18)
            animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 155, yAxis: 152)
            animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 131, yAxis: 365)
            animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -131, yAxis: 387)
            animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -64, yAxis: 109)
            animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -129, yAxis: -34)
            
        case .iphone12ProMax() :
            animateCoin(coin: btcIcon, delay: baseValue, xAxis: -133, yAxis: -375)
            animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 146, yAxis: -343)
            animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 117, yAxis: -60)
            animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 172, yAxis: 152)
            animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 143, yAxis: 420)
            animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -151, yAxis: 431)
            animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -70, yAxis: 109)
            animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -135, yAxis: -34)
                        
        default:
            animateCoin(coin: btcIcon, delay: baseValue, xAxis: -113, yAxis: -330)
            animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 123, yAxis: -294)
            animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 116, yAxis: -18)
            animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 155, yAxis: 152)
            animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 131, yAxis: 365)
            animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -131, yAxis: 387)
            animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -64, yAxis: 109)
            animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -129, yAxis: -34)
        }
                
    }
    
    @objc func animateCoin(coin: UIImageView, delay: Double, xAxis: CGFloat, yAxis: CGFloat) {
        UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.85, options: .curveEaseInOut) {
            coin.alpha = 1.0
            coin.transform = CGAffineTransform(translationX: xAxis, y: yAxis)
        } completion: { (success) in
            //
        }
    }
    
    @objc func showView(viewToAnimate: UIView, delay: Double) {
        UIView.animate(withDuration: 0.35, delay: delay, options: []) {
            viewToAnimate.alpha = 1.0
            viewToAnimate.transform = CGAffineTransform(translationX: 0, y: 0)
        } completion: { (success) in
            //
        }
    }
    
    @objc func didTapGetStarted() {
        let signupPNVC = SignUpPNTwoViewController()
        signupPNVC.delegate = self
        signupPNVC.modalPresentationStyle = .overFullScreen
        self.present(signupPNVC, animated: false) {
            self.getStartedButton.isHidden = true
        }
    }
    
    @objc func didTapLogin() {
        let signupPN = LoginPNViewController()
        //signupPN.delegate = self
        signupPN.modalPresentationStyle = .overFullScreen
        self.present(signupPN, animated: true) {
            //self.getStartedButton.isHidden = true
        }
    }
    
    @objc func goToTempCode() {
        let signupPN = TempCodeViewController()
        signupPN.delegate = self
        signupPN.modalPresentationStyle = .overFullScreen
        self.present(signupPN, animated: false) {
            //
        }
    }
    
    @objc func unhideViews() {
        //self.getStartedButton.isHidden = false
    }
    
}

//MARK: TRANSITION DELEGATE

extension SplashTwoViewController: LaunchTransitionViewDelegate {
    func didFinishLaunchAnimation() {
        animateViewsIn()
    }
}

//MARK: TEMP CODE DELEGATE

extension SplashTwoViewController: TempCodeViewControllerDelegate {
    func didEnterCorrectCode() {
        didTapGetStarted()
    }

}

//MARK: SIGN UP PN DELEGATE

extension SplashTwoViewController: SignUpPNViewControllerDelegate {
    func didGoBack() {
        self.getStartedButton.isHidden = false
    }
}

//MARK: SIGN UP PN TWO DELEGATE

extension SplashTwoViewController: SignUpPNTwoViewControllerDelegate {
    func hideOldViews() {
        self.circularButton.isHidden = true
        self.progress.isHidden = true
    }
}

//MARK: SCROLLVIEW DELEGATE

extension SplashTwoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /*
        guard scrollView.contentOffset.x > lastScrollPosition.x else {
            scrollView.setContentOffset(lastScrollPosition, animated: false)
            return
        }
        
        lastScrollPosition = scrollView.contentOffset
         */
        
        if (self.lastContentOffset > scrollView.contentOffset.x) {
            //print("scroll right")
            isGoingLeft = false
            isGoingRight = true
        } else if (self.lastContentOffset < scrollView.contentOffset.x) {
            //print("scroll left")
            isGoingLeft = true
            isGoingRight = false
        }
        
        let xAxis = scrollView.contentOffset.x
        let viewWidth = view.frame.width
        
        if isGoingLeft {
            if xAxis > 0 && progressStep == 0 {
                circleButtonTapped()
            } else if xAxis > viewWidth && progressStep == 1 {
                circleButtonTapped()
            } else if xAxis > viewWidth * 2 && progressStep == 2 {
                circleButtonTapped()
            } else if xAxis > viewWidth * 3 && progressStep == 3 {
                circleButtonTapped()
            } else if xAxis > viewWidth * 4 && progressStep == 4 {
                circleButtonTapped()
            } else if xAxis > viewWidth * 5 && progressStep == 5 {
                circleButtonTapped()
            }
        } else if isGoingRight {
            if xAxis < viewWidth && progressStep == 1 {
                swipeBack()
            } else if xAxis < viewWidth * 2 && progressStep == 2 {
                swipeBack()
            } else if xAxis < viewWidth * 3 && progressStep == 3 {
                swipeBack()
            } else if xAxis < viewWidth * 4 && progressStep == 4 {
                swipeBack()
            } else if xAxis < viewWidth * 5 && progressStep == 5 {
                swipeBack()
            }
        }
           
        self.lastContentOffset = scrollView.contentOffset.x;
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.isUserInteractionEnabled = true
    }
    
    
}
