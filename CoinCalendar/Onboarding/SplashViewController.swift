//
//  ViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit
import Lottie
import AVFoundation
import AVKit


class SplashViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        setupViews()
        playVideoAudio()
        
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.5)
        
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
    }

}


//MARK: SET UP VIDEO & AUDIO

extension SplashViewController {
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

extension SplashViewController {
    
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
        
        animateCoin(coin: btcIcon, delay: baseValue, xAxis: -113, yAxis: -330)
        animateCoin(coin: sushiIcon, delay: baseValue + (multiplier), xAxis: 123, yAxis: -294)
        animateCoin(coin: ethIcon, delay: baseValue + (multiplier * 2), xAxis: 116, yAxis: -18)
        animateCoin(coin: thetaFuelIcon, delay: baseValue + (multiplier * 3), xAxis: 155, yAxis: 152)
        animateCoin(coin: uniSwapIcon, delay: baseValue + (multiplier * 4), xAxis: 131, yAxis: 365)
        animateCoin(coin: chainLinkIcon, delay: baseValue + (multiplier * 5), xAxis: -131, yAxis: 387)
        animateCoin(coin: enjinIcon, delay: baseValue + (multiplier * 6), xAxis: -64, yAxis: 109)
        animateCoin(coin: adaIcon, delay: baseValue + (multiplier * 7), xAxis: -129, yAxis: -34)
                
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
        let signupPN = SignUpPNViewController()
        signupPN.modalPresentationStyle = .overFullScreen
        self.present(signupPN, animated: false) {
            self.getStartedButton.isHidden = true
        }
    }
    
    @objc func unhideViews() {
        //self.getStartedButton.isHidden = false
    }
    
}
