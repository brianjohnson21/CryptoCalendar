//
//  TimePickerViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/20/21.
//

import UIKit

protocol TimePickerViewControllerDelegate: class {
    func didPickDuration(duration: String)
}

class TimePickerViewController: UIViewController {
    
    weak var delegate: TimePickerViewControllerDelegate?
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
    
    var duration: [String] = ["24hr ROI", "7 Day ROI", "30 Day ROI", "3 Month ROI", "1 Year ROI"]
    
    var selectedDuration = "30 Day ROI"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupPicker()
        perform(#selector(animateViewsIn), with: self, afterDelay: 0.01)
    }

}


//MARK: ACTIONS

extension TimePickerViewController {
    @objc func animateViewsIn() {
        UIView.animate(withDuration: 0.35) {
            self.wrapper.transform = CGAffineTransform(translationX: 0, y: 0)
            self.opacityLayer.alpha = 0.75
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
    
    @objc func didTapConfirm() {
        successImpactGenerator()
        resetButton.showCheckmark()
        self.picker.isUserInteractionEnabled = false
        delegate?.didPickDuration(duration: selectedDuration)
    }
}


//MARK: SCROLLVIEW DELEGATE

extension TimePickerViewController: UIScrollViewDelegate {
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

extension TimePickerViewController: ContinueButtonDelegate {
    func didFinishCheckmark() {
        dimissVC()
    }
}
