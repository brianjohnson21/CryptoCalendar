//
//  ToastNotificationView.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit

class ToastNotificationView: UIView {

private var isPresented = false
    var toastView: UIView!
    var toastMessageLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //ImpactGenerator.prepare()
    }
    
    func present(withMessage message: String) {
        present(message: message, isError: false)
    }
    
    func presentError(withMessage message: String) {
        present(message: message, isError: true)
    }
    
    private func present(message: String, isError: Bool) {
        if isPresented { return }
        
        if let view = UIApplication.shared.keyWindow {
            isPresented = true
            
            let xPosition = (view.frame.width / 2) - 135
            toastView = UIView(frame: CGRect(x: xPosition, y: -80, width: 270, height: 40))
            toastView.backgroundColor = .pinkTheme//UIColor(red: 6/255, green: 145/255, blue: 201/255, alpha: 1.0)//isError
            //                ? .lightCrimson
            //                : .caribbeanGreen
            toastView.layer.borderWidth = 1
            toastView.alpha = 1
            toastView.layer.cornerRadius = 6
            toastView.layer.borderColor = UIColor.themeColor.withAlphaComponent(0.1).cgColor
            view.addSubview(toastView)
            
            toastView.layer.shadowColor = UIColor.black.cgColor//isError
            //                ? UIColor.lightCrimson.cgColor
            //                : UIColor.caribbeanGreen.cgColor
            toastView.layer.shadowOffset = CGSize(width: 0, height: 15)
            toastView.layer.shadowOpacity = 0.2
            toastView.layer.shadowRadius = 20
            toastView.clipsToBounds = false
            
            toastMessageLabel = UILabel()
            //toastMessageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 17)
            toastMessageLabel.text = message
            toastMessageLabel.font = .sofiaMedium(ofSize: 16)
            toastMessageLabel.textColor = .white
            toastMessageLabel.textAlignment = .center
            toastMessageLabel.translatesAutoresizingMaskIntoConstraints = false
            toastView.addSubview(toastMessageLabel)
            //toastMessageLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 11)
            //toastMessageLabel.topAnchor.constraint(equalTo: toastView.topAnchor, constant: 11).isActive = true
            toastMessageLabel.centerYAnchor.constraint(equalTo: toastView.centerYAnchor).isActive = true
            //toastMessageLabel.autoPinEdge(toSuperviewEdge: .leading)
            toastMessageLabel.leadingAnchor.constraint(equalTo: toastView.leadingAnchor, constant: 0).isActive = true
            //toastMessageLabel.autoPinEdge(toSuperviewEdge: .trailing)
            toastMessageLabel.trailingAnchor.constraint(equalTo: toastView.trailingAnchor, constant: 0).isActive = true
            //toastMessageLabel.autoSetDimension(.height, toSize: 17)
            toastMessageLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
            
            
            
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.toastView.alpha = 1
                self.toastView.transform = CGAffineTransform(translationX: 0, y: 132)
            }) { _ in
                UIView.animate(withDuration: 1.0, delay: 0.75, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                    self.toastView.transform = CGAffineTransform(translationX: 0, y: 0)
                }) { _ in
                    self.toastView.removeFromSuperview()
                    self.isPresented = false
                }
            }
        }
    }
    
}


