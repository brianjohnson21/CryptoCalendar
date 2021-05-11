//
//  SwipeConfirmView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 5/10/21.
//

import UIKit
import Lottie

class SwipeConfirmView: UIView {
    
    var swipeContainer = UIView()
    var swipeScrollView = UIScrollView()
    var containerOne = UIView()
    var containerTwo = UIView()
    var swipeLabel = UILabel()
    var swipeLottie = AnimationView()
    
    var arrowsContainer = UIView()
    var arrowsAnimation = AnimationView()
    
    
    
    var didConfirm = false

    override init(frame: CGRect) {
       super.init(frame: frame)
        self.layer.masksToBounds = true
       self.backgroundColor = .clear
       setupViews()
       
   }
   
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}

// MARK: Helpers

extension SwipeConfirmView {
    func setupViews() {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        //swipeLabel.alpha = 0
        swipeLabel.text = "Swipe to confirm"
        swipeLabel.textAlignment = .right
        swipeLabel.textColor = .white
        swipeLabel.font = .sofiaSemiBold(ofSize: 17)
        swipeLabel.numberOfLines = 0
        swipeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(swipeLabel)
        swipeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        swipeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        swipeContainer.backgroundColor = .clear
        swipeContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(swipeContainer)
        swipeContainer.fillSuperview()
                
        let swipeSize = (screenWidth - 52) * 2
        swipeScrollView.contentSize = CGSize(width: swipeSize, height: 63)
        swipeScrollView.showsHorizontalScrollIndicator = false
        swipeScrollView.translatesAutoresizingMaskIntoConstraints = false
        swipeContainer.addSubview(swipeScrollView)
        swipeScrollView.leadingAnchor.constraint(equalTo: swipeContainer.leadingAnchor).isActive = true
        swipeScrollView.topAnchor.constraint(equalTo: swipeContainer.topAnchor).isActive = true
        swipeScrollView.trailingAnchor.constraint(equalTo: swipeContainer.trailingAnchor).isActive = true
        swipeScrollView.heightAnchor.constraint(equalToConstant: 63).isActive = true
        swipeScrollView.contentOffset.x = CGFloat(swipeSize / 2)
        
        containerOne.backgroundColor = .clear
        containerOne.translatesAutoresizingMaskIntoConstraints = false
        swipeScrollView.addSubview(containerOne)
        containerOne.leadingAnchor.constraint(equalTo: swipeScrollView.leadingAnchor).isActive = true
        containerOne.topAnchor.constraint(equalTo: swipeScrollView.topAnchor).isActive = true
        containerOne.widthAnchor.constraint(equalToConstant: CGFloat(screenWidth - 52)).isActive = true
        containerOne.heightAnchor.constraint(equalToConstant: 63).isActive = true
        
        arrowsContainer.backgroundColor = .white
        arrowsContainer.layer.cornerRadius = 10
        arrowsContainer.translatesAutoresizingMaskIntoConstraints = false
        swipeScrollView.addSubview(arrowsContainer)
        arrowsContainer.leadingAnchor.constraint(equalTo: containerOne.trailingAnchor, constant: 4).isActive = true
        arrowsContainer.topAnchor.constraint(equalTo: containerOne.topAnchor, constant: 4).isActive = true
        arrowsContainer.bottomAnchor.constraint(equalTo: containerOne.bottomAnchor, constant: -4).isActive = true
        arrowsContainer.widthAnchor.constraint(equalToConstant: 65).isActive = true
        arrowsContainer.transform = CGAffineTransform(translationX: -150, y: 0)
        
        let checkAnimation = Animation.named("blueArrows")
        arrowsAnimation.isUserInteractionEnabled = false
        arrowsAnimation.alpha = 1.0
        arrowsAnimation.animation = checkAnimation
        arrowsAnimation.loopMode = .loop
        arrowsAnimation.contentMode = .scaleAspectFill
        arrowsAnimation.backgroundColor = .clear
        arrowsAnimation.translatesAutoresizingMaskIntoConstraints = false
        arrowsContainer.addSubview(arrowsAnimation)
        arrowsAnimation.centerYAnchor.constraint(equalTo: arrowsContainer.centerYAnchor).isActive = true
        arrowsAnimation.centerXAnchor.constraint(equalTo: arrowsContainer.centerXAnchor).isActive = true
        arrowsAnimation.heightAnchor.constraint(equalToConstant: 50).isActive = true
        arrowsAnimation.widthAnchor.constraint(equalToConstant: 50).isActive = true
        arrowsAnimation.play()
        arrowsAnimation.transform = CGAffineTransform(rotationAngle: -.pi/2)
                
        containerTwo.backgroundColor = .clear
        containerTwo.translatesAutoresizingMaskIntoConstraints = false
        swipeScrollView.addSubview(containerTwo)
        containerTwo.leadingAnchor.constraint(equalTo: containerOne.trailingAnchor).isActive = true
        containerTwo.topAnchor.constraint(equalTo: swipeScrollView.topAnchor).isActive = true
        containerTwo.widthAnchor.constraint(equalToConstant: CGFloat(screenWidth - 52)).isActive = true
        containerTwo.heightAnchor.constraint(equalToConstant: 63).isActive = true

    }
}



