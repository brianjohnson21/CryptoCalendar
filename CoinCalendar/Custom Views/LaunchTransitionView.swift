//
//  LaunchTransitionView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit

protocol LaunchTransitionViewDelegate: class {
    func didFinishLaunchAnimation()
}

class LaunchTransitionView: UIView {
    
    weak var delegate: LaunchTransitionViewDelegate?
    var backgroundLayer = UIView()
    
    var topHalf = UIView()
    var bottomHalf = UIView()
    
    var dripContainer = UIView()
    var dImageView = UIImageView()
    var rImageView = UIImageView()
    var iImageView = UIImageView()
    var pImageView = UIImageView()
    var spinner = UIActivityIndicatorView(style: .white)
    
    var instaMallLogo = UIImageView()
    var halfHeight: CGFloat = 0
    var enigmaBottom: CGFloat = -45
    
    var fromEnigmaImageView = UIImageView()
    
    var showDrip = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        modifyConstraints()
        setupViews()
        self.backgroundColor = .clear
        //print("did this 😅😅😅")
        //perform(#selector(animateViewsAway), with: self, afterDelay: 0.25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: VIEWS

extension LaunchTransitionView {
    
    func modifyConstraints() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            enigmaBottom = -11
        case .iphone78() :
            enigmaBottom = -11
        case .iphone78Plus() :
            enigmaBottom = -11
        case .iphone11() :
            enigmaBottom = -45
        default:
            enigmaBottom = -45
        }
    }
    
    func setupViews() {
        
        backgroundLayer.backgroundColor = .clear
        backgroundLayer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backgroundLayer)
        backgroundLayer.fillSuperview()
        
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        let screen50 = height/2
        halfHeight = screen50
        
        topHalf.backgroundColor = .themePurple
        topHalf.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(topHalf)
        topHalf.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topHalf.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topHalf.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topHalf.heightAnchor.constraint(equalToConstant: screen50).isActive = true
        
        bottomHalf.backgroundColor = .themePurple
        bottomHalf.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomHalf)
        bottomHalf.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomHalf.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomHalf.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomHalf.heightAnchor.constraint(equalToConstant: screen50).isActive = true
        
        dripContainer.layer.masksToBounds = false
        dripContainer.backgroundColor = .clear
        dripContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dripContainer)
        dripContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dripContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dripContainer.heightAnchor.constraint(equalToConstant: 227).isActive = true
        dripContainer.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        if showDrip {
            dImageView.image = UIImage(named: "Drip_D")
            dImageView.contentMode = .scaleAspectFill
            dImageView.translatesAutoresizingMaskIntoConstraints = false
            dripContainer.addSubview(dImageView)
            dImageView.centerXAnchor.constraint(equalTo: dripContainer.centerXAnchor).isActive = true
            dImageView.bottomAnchor.constraint(equalTo: dripContainer.bottomAnchor).isActive = true
            dImageView.heightAnchor.constraint(equalToConstant: 68.31).isActive = true
            dImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            
            rImageView.image = UIImage(named: "Drip_R")
            rImageView.contentMode = .scaleAspectFill
            rImageView.translatesAutoresizingMaskIntoConstraints = false
            dripContainer.addSubview(rImageView)
            rImageView.centerXAnchor.constraint(equalTo: dripContainer.centerXAnchor).isActive = true
            rImageView.bottomAnchor.constraint(equalTo: dImageView.topAnchor, constant: -5.93).isActive = true
            rImageView.heightAnchor.constraint(equalToConstant: 58.34).isActive = true
            rImageView.widthAnchor.constraint(equalToConstant: 59.83).isActive = true
            
            iImageView.image = UIImage(named: "Drip_I")
            iImageView.contentMode = .scaleAspectFill
            iImageView.translatesAutoresizingMaskIntoConstraints = false
            dripContainer.addSubview(iImageView)
            iImageView.centerXAnchor.constraint(equalTo: dripContainer.centerXAnchor).isActive = true
            iImageView.bottomAnchor.constraint(equalTo: rImageView.topAnchor, constant: -2.13).isActive = true
            iImageView.heightAnchor.constraint(equalToConstant: 24.92).isActive = true
            iImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            
            pImageView.image = UIImage(named: "Drip_P")
            pImageView.contentMode = .scaleAspectFill
            pImageView.translatesAutoresizingMaskIntoConstraints = false
            dripContainer.addSubview(pImageView)
            pImageView.centerXAnchor.constraint(equalTo: dripContainer.centerXAnchor).isActive = true
            pImageView.bottomAnchor.constraint(equalTo: iImageView.topAnchor, constant: -7.88).isActive = true
            pImageView.heightAnchor.constraint(equalToConstant: 59.5).isActive = true
            pImageView.widthAnchor.constraint(equalToConstant: 59.91).isActive = true
        } else {
            instaMallLogo.image = UIImage(named: "NSTAMALLLaunchLogo")
            instaMallLogo.contentMode = .scaleAspectFill
            instaMallLogo.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(instaMallLogo)
            instaMallLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            instaMallLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            instaMallLogo.heightAnchor.constraint(equalToConstant: 28).isActive = true
            instaMallLogo.widthAnchor.constraint(equalToConstant: 284).isActive = true
        }
        
        fromEnigmaImageView.isHidden = true
        fromEnigmaImageView.image = UIImage(named: "enigmaLaunch")
        fromEnigmaImageView.contentMode = .scaleAspectFill
        fromEnigmaImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(fromEnigmaImageView)
        fromEnigmaImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        fromEnigmaImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: enigmaBottom).isActive = true
        fromEnigmaImageView.heightAnchor.constraint(equalToConstant: 42.59).isActive = true
        fromEnigmaImageView.widthAnchor.constraint(equalToConstant: 148).isActive = true
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        self.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.topAnchor.constraint(equalTo: dripContainer.bottomAnchor, constant: 80).isActive = true
        
    }
    
}

//MARK: ACTIONS

extension LaunchTransitionView {
    
    @objc func animateViewsAway() {
        spinner.stopAnimating()
        spinner.alpha = 0
        animateOut(animateView: fromEnigmaImageView, delay: 0.15)
        
        if showDrip {
            animateOut(animateView: dImageView, delay: 0.25)
            animateOut(animateView: rImageView, delay: 0.35)
            animateOut(animateView: iImageView, delay: 0.45)
            animateOut(animateView: pImageView, delay: 0.55)
        } else {
            
            UIView.animate(withDuration: 0.35, delay: 0.25, options: []) {
                self.instaMallLogo.alpha = 0
                self.instaMallLogo.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
            } completion: { (success) in
                self.animateHalves()
            }

            
        }
        
        if showDrip {
            perform(#selector(hideSelf), with: self, afterDelay: 0.55)
        } else {
            perform(#selector(hideSelf), with: self, afterDelay: 0.8)
        }
    }
    
    @objc func hideSelf() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }) { (success) in
            self.delegate?.didFinishLaunchAnimation()
            self.removeFromSuperview()
        }
    }
    
        
    func animateOut(animateView: UIView, delay: Double) {
        UIView.animate(withDuration: 0.35, delay: delay, options: [], animations: {
            animateView.transform = CGAffineTransform(translationX: 0, y: 50)
            animateView.alpha = 0
        }) { (success) in
            //
        }
    }
    
    func animateHalves() {
        UIView.animate(withDuration: 0.5) {
            self.topHalf.transform = CGAffineTransform(translationX: 0, y: -self.halfHeight)
            self.bottomHalf.transform = CGAffineTransform(translationX: 0, y: self.halfHeight)
        }
    }
    
    
}

