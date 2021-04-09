//
//  PickerViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import Foundation
import UIKit

extension PickerViewController {
    
    func setupViews() {
        
        
        opacityLayer.backgroundColor = .black
        opacityLayer.alpha = 0
        opacityLayer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(opacityLayer)
        opacityLayer.fillSuperview()
        
        mainScrollView.tag = 1
        mainScrollView.delegate = self
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.backgroundColor = .clear
        mainScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.1)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainScrollView)
        mainScrollView.fillSuperview()
        
        wrapper.backgroundColor = .clear
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(wrapper)
        wrapper.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 0).isActive = true
        wrapper.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 0).isActive = true
        wrapper.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        wrapper.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
        mainContainer.backgroundColor = .white
        mainContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainContainer.layer.cornerRadius = 15
        mainContainer.layer.masksToBounds = true
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        wrapper.addSubview(mainContainer)
        mainContainer.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor, constant: 0).isActive = true
        mainContainer.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 0).isActive = true
        mainContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        mainContainer.heightAnchor.constraint(equalToConstant: 400).isActive = true
        //mainContainer.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        
        keyLine.backgroundColor = .white
        keyLine.layer.cornerRadius = 4/2
        keyLine.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(keyLine)
        keyLine.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor).isActive = true
        keyLine.bottomAnchor.constraint(equalTo: mainContainer.topAnchor, constant: -6).isActive = true
        keyLine.widthAnchor.constraint(equalToConstant: 34).isActive = true
        keyLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
        //keyLine.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        
        navView.layer.zPosition = 2
        navView.backgroundColor = .white
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOffset = CGSize(width: 0, height: 2)
        navView.layer.shadowOpacity = 0
        navView.layer.shadowRadius = 4
        navView.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(navView)
        navView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: mainContainer.topAnchor).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        navTitleLabel.alpha = 0
        navTitleLabel.transform = CGAffineTransform(translationX: 100, y: 0)
        navTitleLabel.text = "Set Alert"
        navTitleLabel.textAlignment = .center
        navTitleLabel.font = .sofiaMedium(ofSize: 17)
        navTitleLabel.textColor = .keyEventHeadlineColorModeLight
        navTitleLabel.numberOfLines = 0
        navTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(navTitleLabel)
        navTitleLabel.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        navTitleLabel.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -5).isActive = true
                
    }
    
    func setupPicker() {
        
        resetButton.alpha = 0
        resetButton.transform = CGAffineTransform(translationX: 100, y: 0)
        resetButton.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
        //resetButton.setTitle("Confirm", for: .normal)
        //resetButton.titleLabel?.font = .sofiaBold(ofSize: 16)
        //resetButton.setTitleColor(.white, for: .normal)
        //resetButton.backgroundColor = .themePurple
        resetButton.delegate = self
        resetButton.continueLabel.text = "Confirm"
        resetButton.purpleBG.backgroundColor = .coinBaseBlue
        resetButton.layer.cornerRadius = 8
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(resetButton)
        resetButton.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 26).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -26).isActive = true
        resetButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -25).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        picker.alpha = 0
        picker.transform = CGAffineTransform(translationX: 100, y: 0)
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(picker)
        picker.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 26).isActive = true
        picker.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -26).isActive = true
        picker.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 20).isActive = true
        picker.bottomAnchor.constraint(equalTo: resetButton.topAnchor, constant: 0).isActive = true
                
        
    }
}

//MARK: PICKER DELEGATE

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: pickerOptions[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.keyEventHeadlineColorModeLight])
        return attributedString
    }
}
