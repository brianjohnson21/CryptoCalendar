//
//  EventFeedInfoViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/10/21.
//

import UIKit

class EventFeedInfoViewController: UIViewController {

    var opacityLayer = UIView()
    var mainScrollView = UIScrollView()
    var mainContainer = UIView()
    var navView = UIView()
    var navTitleLabel = UILabel()
    var keyLine = UIView()

    var mainFeedTableView = UITableView()
    var infoTableViewCell = "infoTableViewCell"
    
    var whiteGradient = UIImageView()
    var isDismissing = false
    
    var expos: [[String]] = [
        ["Reliable", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"],
        ["Important", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setupViews()
        setupTableView()
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
        
    }

}

//MARK: ACTIONS

extension EventFeedInfoViewController {
    @objc func animateViewsIn() {
        UIView.animate(withDuration: 0.35) {
            self.opacityLayer.alpha = 0.75
            self.mainContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            self.keyLine.transform = CGAffineTransform(translationX: 0, y: 0)
        } completion: { (success) in
            //
        }
    }
    
    
    @objc func dimissVC() {
        UIView.animate(withDuration: 0.28) {
            self.mainScrollView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.opacityLayer.alpha = 0
        } completion: { (success) in
            self.dismiss(animated: false) {
                //
            }
        }
    }
}

//MARK: SCROLLVIEW DELEGATE

extension EventFeedInfoViewController: UIScrollViewDelegate {
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
        
        if scrollView.tag == 2 {
            let yAxis = scrollView.contentOffset.y// + notchOffset
            
            if yAxis <= 60 {
                let navShadow: Float = Float((0.3 * yAxis) / 60)
                navView.layer.shadowOpacity = navShadow
            } else {
                navView.layer.shadowOpacity = 0.3
            }
        }
    }
}
