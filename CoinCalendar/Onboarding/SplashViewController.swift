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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        setupViews()
        playVideoAudio()
        
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.5)
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
        
        UIView.animate(withDuration: 0.5) {
            self.cryptoLabel.alpha = 1.0
            self.cryptoLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        }

        UIView.animate(withDuration: 0.5, delay: 0.25, options: []) {
            self.calendarLabel.alpha = 1.0
            self.calendarLabel.transform = CGAffineTransform(translationX: 0, y: 0)
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
