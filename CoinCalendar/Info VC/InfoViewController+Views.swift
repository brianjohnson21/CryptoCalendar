//
//  InfoViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/6/21.
//

import Foundation
import UIKit

extension InfoViewController {
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
        mainContainer.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 0).isActive = true
        mainContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        mainContainer.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        if isLivePortfolio {
            mainContainer.heightAnchor.constraint(equalToConstant: self.view.frame.height - 250).isActive = true
            mainContainer.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 250).isActive = true
        } else if isWatchlist {
            mainContainer.heightAnchor.constraint(equalToConstant: self.view.frame.height - 580).isActive = true
            mainContainer.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 580).isActive = true
        } else {
            mainContainer.heightAnchor.constraint(equalToConstant: self.view.frame.height - 71).isActive = true
            mainContainer.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 71).isActive = true
        }
        
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
        navView.backgroundColor = .green
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOffset = CGSize(width: 0, height: 2)
        navView.layer.shadowOpacity = 0
        navView.layer.shadowRadius = 4
        navView.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.addSubview(navView)
        navView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: mainContainer.topAnchor).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        navTitleLabel.isHidden = true
        navTitleLabel.text = "Filter & Sort"
        navTitleLabel.textAlignment = .center
        navTitleLabel.font = .sofiaMedium(ofSize: 17)
        navTitleLabel.textColor = .keyEventHeadlineColorModeLight
        navTitleLabel.numberOfLines = 0
        navTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(navTitleLabel)
        navTitleLabel.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        navTitleLabel.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -5).isActive = true
        
        //
        
        let dismissButton = UIButton()
        dismissButton.addTarget(self, action: #selector(dimissVC), for: .touchUpInside)
        dismissButton.backgroundColor = .clear
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(dismissButton)
        dismissButton.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: mainContainer.topAnchor).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        
    }
    
    func setupTableView() {
        mainFeedTableView = UITableView(frame: self.view.frame, style: .plain)
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.tag = 2
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: infoTableViewCell)
        mainFeedTableView.allowsMultipleSelection = true
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        if isLivePortfolio || isWatchlist {
            mainFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            mainFeedTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 100, right: 0)
        }
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
    }
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLivePortfolio {
            return liveCoinsExpo.count
        } else if isWatchlist {
            return watchListExpo.count
        } else {
            return expos.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: infoTableViewCell, for: indexPath) as! InfoTableViewCell
        if isLivePortfolio {
            cell.infoTitleLabel.text = liveCoinsExpo[indexPath.row][0]
            let infoDetailLabelText = liveCoinsExpo[indexPath.row][1]
            cell.infoDetailLabel.setupLineHeight(myText: infoDetailLabelText, myLineSpacing: 8)
            
            if indexPath.row == expos.count - 1 {
                cell.dividerLine.isHidden = true
            } else {
                cell.dividerLine.isHidden = false
            }
        } else if isWatchlist {
            cell.infoTitleLabel.text = watchListExpo[indexPath.row][0]
            let infoDetailLabelText = watchListExpo[indexPath.row][1]
            cell.infoDetailLabel.setupLineHeight(myText: infoDetailLabelText, myLineSpacing: 8)
            cell.dividerLine.isHidden = true
        } else {
            cell.infoTitleLabel.text = expos[indexPath.row][0]
            let infoDetailLabelText = expos[indexPath.row][1]
            cell.infoDetailLabel.setupLineHeight(myText: infoDetailLabelText, myLineSpacing: 8)
            
            if indexPath.row == expos.count - 1 {
                cell.dividerLine.isHidden = true
            } else {
                cell.dividerLine.isHidden = false
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
