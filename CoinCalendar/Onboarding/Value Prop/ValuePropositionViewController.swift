//
//  ValuePropositionViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/15/21.
//

import UIKit
import CHIPageControl

class ValuePropositionViewController: UIViewController {
    
    var containerView = UIView()

    //Transition Views
    var getStartedButton = UIButton()
    var getStartedBottom: NSLayoutConstraint!
    var getStartedLeading: NSLayoutConstraint!
    var getStartedWidth: NSLayoutConstraint!
    var getStartedLabel = UILabel()
    var getStartedArrowImageView = UIImageView()
    var continueBottom: NSLayoutConstraint!
    var nextLabel = UILabel()
    
    var mainScrollView = UIScrollView()
    
    var pageControl = CHIPageControlAleppo()
    var step: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setupTransitionViews()
        
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
    }

}

//MARK: ACTIONS

extension ValuePropositionViewController {
    @objc func animateViewsIn() {
        var conBottom: CGFloat = -38
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            conBottom = -38
        case .iphone78() :
            conBottom = -38
        case .iphone78Plus() :
            conBottom = -38
        case .iphone11Max() :
            conBottom = -38
        default:
            conBottom = -38
        }
        
        getStartedBottom.constant = conBottom
        getStartedWidth.constant = view.frame.width - 36
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
            self.containerView.alpha = 1.0
            self.getStartedLabel.alpha = 0
            self.getStartedArrowImageView.alpha = 0
            self.nextLabel.alpha = 1.0
        } completion: { (success) in
            //self.getStartedButton.isHidden = true
            
            UIView.animate(withDuration: 0.35) {
                //self.continueButton.continueLabel.alpha = 1.0
            }
        }
    }
    
    @objc func goToNextStep() {
        if step < 5 {
            lightImpactGenerator()
            let scrollPoint = CGPoint(x: Int(view.frame.width) * step, y: 0)
            mainScrollView.setContentOffset(scrollPoint, animated: true)
            
            switch step {
            case 1:
                pageControl.set(progress: 1, animated: true)
            case 2:
                pageControl.set(progress: 2, animated: true)
            case 3:
                pageControl.set(progress: 3, animated: true)
            case 4:
                pageControl.set(progress: 4, animated: true)
            default:
                pageControl.set(progress: 0, animated: true)
            }
            
            step += 1
        } else {
            successImpactGenerator()
        }
    }
}

//MARK: SCROLLVIEW DELEGATE

extension ValuePropositionViewController: UIScrollViewDelegate {

}
