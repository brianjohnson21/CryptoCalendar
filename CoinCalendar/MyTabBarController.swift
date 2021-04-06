//
//  MyTabBarController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
            
//        let appearance = tabBar.standardAppearance
//        appearance.shadowImage = nil
//        appearance.shadowColor = nil
//        tabBar.standardAppearance = appearance;
//
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        tabBar.layer.shadowOffset = CGSize(width: -4, height: 6)
        tabBar.layer.shadowOpacity = 0.75
        tabBar.layer.shadowRadius = 8
        
    }
}

extension MyTabBarController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let tabViewControllers = tabBarController.viewControllers, let toIndex = tabViewControllers.firstIndex(of: viewController) else {
            return false
        }
        animateToTab(toIndex: toIndex)
        return true
    }

    func animateToTab(toIndex: Int) {
        guard let tabViewControllers = viewControllers,
            let selectedVC = selectedViewController else { return }

        guard let fromView = selectedVC.view,
            let toView = tabViewControllers[toIndex].view,
            let fromIndex = tabViewControllers.firstIndex(of: selectedVC),
            fromIndex != toIndex else { return }


        // Add the toView to the tab bar view
        fromView.superview?.addSubview(toView)

        // Position toView off screen (to the left/right of fromView)
        let screenWidth = UIScreen.main.bounds.size.width
        let scrollRight = toIndex > fromIndex
        let offset = (scrollRight ? screenWidth : -screenWidth)
        toView.center = CGPoint(x: fromView.center.x + offset, y: toView.center.y)
        // Disable interaction during animation
        view.isUserInteractionEnabled = false

        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                        // Slide the views by -offset
                        fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
                        toView.center = CGPoint(x: toView.center.x - offset, y: toView.center.y)
        }, completion: { finished in
            // Remove the old view from the tabbar view.
            fromView.removeFromSuperview()
            self.selectedIndex = toIndex
            self.view.isUserInteractionEnabled = true
        })
    }
}
