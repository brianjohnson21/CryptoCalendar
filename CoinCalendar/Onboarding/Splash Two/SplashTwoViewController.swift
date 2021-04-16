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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        modifyConstraints()
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
        guard let path = Bundle.main.path(forResource: "hexPatternVertical", ofType:"mov") else { //streat
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
        switch progressStep {
        case 0:
            animateCryptoAway()
            pageControl.set(progress: 1, animated: true)
            progress.animate(toAngle: 72, duration: 0.28) { (success) in
                print("Step 2")
                self.animateBenefitIn(benefitImage: self.benefitOneImageView, benefitTitle: self.benefitOneTitleLabel, benefitDetail: self.benefitOneDetailLabel)
            }
        case 1:
            animateBenefitOut(benefitImage: self.benefitOneImageView, benefitTitle: self.benefitOneTitleLabel, benefitDetail: self.benefitOneDetailLabel)
            pageControl.set(progress: 2, animated: true)
            progress.animate(toAngle: 144, duration: 0.28) { (success) in
                self.animateBenefitIn(benefitImage: self.benefitTwoImageView, benefitTitle: self.benefitTwoTitleLabel, benefitDetail: self.benefitTwoDetailLabel)
                print("Step 3")
            }
        case 2:
            animateBenefitOut(benefitImage: self.benefitTwoImageView, benefitTitle: self.benefitTwoTitleLabel, benefitDetail: self.benefitTwoDetailLabel)
            pageControl.set(progress: 3, animated: true)
            progress.animate(toAngle: 216, duration: 0.28) { (success) in
                self.animateBenefitIn(benefitImage: self.benefitThreeImageView, benefitTitle: self.benefitThreeTitleLabel, benefitDetail: self.benefitThreeDetailLabel)
                print("Step 4")
            }
        case 3:
            animateBenefitOut(benefitImage: self.benefitThreeImageView, benefitTitle: self.benefitThreeTitleLabel, benefitDetail: self.benefitThreeDetailLabel)
            pageControl.set(progress: 4, animated: true)
            progress.animate(toAngle: 288, duration: 0.28) { (success) in
                print("Step 5")
                self.animateBenefitIn(benefitImage: self.benefitFourImageView, benefitTitle: self.benefitFourTitleLabel, benefitDetail: self.benefitFourDetailLabel)
            }
        
        default:
            print("Step 6")
            animateBenefitOut(benefitImage: self.benefitFourImageView, benefitTitle: self.benefitFourTitleLabel, benefitDetail: self.benefitFourDetailLabel)
            progress.animate(toAngle: 360, duration: 0.28) { (success) in
                print("Step 5")
                self.successImpactGenerator()
                //self.didTapGetStarted()
                self.beginTransition()
                
            }
        }
        progressStep += 1
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
            animateCoin(coin: btcIcon, delay: baseValue, xAxis: -113, yAxis: -330)
            animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 123, yAxis: -294)
            animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 116, yAxis: -18)
            animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 155, yAxis: 152)
            animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 131, yAxis: 365)
            animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -131, yAxis: 387)
            animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -64, yAxis: 109)
            animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -129, yAxis: -34)
        case .iphone78Plus() :
            animateCoin(coin: btcIcon, delay: baseValue, xAxis: -113, yAxis: -320)
            animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 123, yAxis: -270)
            animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 116, yAxis: -18)
            animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 155, yAxis: 152)
            animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 131, yAxis: 329)
            animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -131, yAxis: 341)
            animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -64, yAxis: 85)
            animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -129, yAxis: -34)
        case .iphone11() :
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
