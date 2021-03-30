//
//  SortFilterViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/29/21.
//

import Foundation
import UIKit

extension SortFilterViewController {
    
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
        
        mainContainer.backgroundColor = .white
        mainContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainContainer.layer.cornerRadius = 15
        mainContainer.layer.masksToBounds = true
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(mainContainer)
        mainContainer.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 71).isActive = true
        mainContainer.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 0).isActive = true
        mainContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        mainContainer.heightAnchor.constraint(equalToConstant: self.view.frame.height - 71).isActive = true
        mainContainer.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        
        keyLine.backgroundColor = .white
        keyLine.layer.cornerRadius = 4/2
        keyLine.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(keyLine)
        keyLine.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor).isActive = true
        keyLine.bottomAnchor.constraint(equalTo: mainContainer.topAnchor, constant: -6).isActive = true
        keyLine.widthAnchor.constraint(equalToConstant: 34).isActive = true
        keyLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
        keyLine.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        
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
        
        navTitleLabel.text = "Filter & Sort"
        navTitleLabel.textAlignment = .center
        navTitleLabel.font = .sofiaMedium(ofSize: 17)
        navTitleLabel.textColor = .keyEventHeadlineColorModeLight
        navTitleLabel.numberOfLines = 0
        navTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(navTitleLabel)
        navTitleLabel.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        navTitleLabel.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -5).isActive = true
        
        
    }
    
    func setupTableView() {
        mainFeedTableView = UITableView(frame: self.view.frame, style: .plain)
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.tag = 2
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(SortCoinTableViewCell.self, forCellReuseIdentifier: sortCoinTableViewCell)
        mainFeedTableView.allowsMultipleSelection = true
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 200, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor).isActive = true
        mainFeedTableView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor).isActive = true
        mainFeedTableView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        
        whiteGradient.isUserInteractionEnabled = false
        whiteGradient.image = UIImage(named: "whiteGradient")
        whiteGradient.contentMode = .scaleAspectFill
        whiteGradient.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(whiteGradient)
        whiteGradient.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor).isActive = true
        whiteGradient.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor).isActive = true
        whiteGradient.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor).isActive = true
        whiteGradient.heightAnchor.constraint(equalToConstant: 119).isActive = true
        
        resetButton.addTarget(self, action: #selector(didTapReset), for: .touchUpInside)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.titleLabel?.font = .sofiaBold(ofSize: 16)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.backgroundColor = .themePurple
        resetButton.layer.cornerRadius = 8
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(resetButton)
        resetButton.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 26).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -26).isActive = true
        resetBottom = resetButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 100)
        resetBottom.isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension SortFilterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sortCoinTableViewCell, for: indexPath) as! SortCoinTableViewCell
        cell.coinImageView.image = UIImage(named: coins[indexPath.row][0])
        cell.blockChainLabel.text = coins[indexPath.row][0]
        cell.coinLabel.text = coins[indexPath.row][1]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SortCoinTableViewCell
        cell.activateFilter()
        coinsSelected.append(coins[indexPath.row][0])
        showHideResetButton(showReset: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SortCoinTableViewCell
        if let blockText = cell.blockChainLabel.text {
            if let index = coinsSelected.firstIndex(of: blockText) {
                coinsSelected.remove(at: index)
            }
        }
        cell.deactivateFilter()
        
        if coinsSelected.count < 1 {
            showHideResetButton(showReset: false)
        }
                 
    }
    
    
}
