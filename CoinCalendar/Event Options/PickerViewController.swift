//
//  PickerViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import UIKit

protocol PickerViewControllerDelegate: class {
    func didSetAlarm(date: Date)
}

class PickerViewController: UIViewController {
    
    weak var delegate: PickerViewControllerDelegate?
    var opacityLayer = UIView()
    var mainScrollView = UIScrollView()
    var wrapper = UIView()
    var mainContainer = UIView()
    var navView = UIView()
    var navTitleLabel = UILabel()
    var keyLine = UIView()

    let picker = UIPickerView()
    
    var isDismissing = false
    var resetButton = ContinueButton()
    
    var pickerOptions: [String] = ["Day of", "Day before", "3 days before", "7 days before", "14 days before", "30 days before"]

    var daysTillEvent: Int = 30
    
    var selectedDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupPicker()
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
    }

}


//MARK: ACTIONS

extension PickerViewController {
    @objc func animateViewsIn() {
        UIView.animate(withDuration: 0.35) {
            
            self.resetButton.alpha = 1.0
            self.resetButton.transform = CGAffineTransform(translationX: 0, y: 0)
            
            self.picker.alpha = 1.0
            self.picker.transform = CGAffineTransform(translationX: 0, y: 0)
            
            self.navTitleLabel.alpha = 1.0
            self.navTitleLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        } completion: { (success) in
            //
        }
    }
    
    @objc func dimissVC() {
        delegate?.didSetAlarm(date: selectedDate)
        UIView.animate(withDuration: 0.28) {
            self.mainScrollView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.opacityLayer.alpha = 0
        } completion: { (success) in
            self.dismiss(animated: false) {
                //
            }
        }
    }
    
    @objc func didTapConfirm() {
        successImpactGenerator()
        resetButton.showCheckmark()
        self.picker.isUserInteractionEnabled = false
    }
}


//MARK: SCROLLVIEW DELEGATE

extension PickerViewController: UIScrollViewDelegate {
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
                
    }
}

//MARK: CONTINUE DELEGATE

extension PickerViewController: ContinueButtonDelegate {
    func didFinishCheckmark() {
        dimissVC()
    }
}
