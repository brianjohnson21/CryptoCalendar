//
//  WatchlistViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/21/21.
//

import Foundation
import UIKit

extension WatchlistViewController {
    
    func modifyConstraints() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            navHeight = 70
            
        case .iphone78() :
            navHeight = 70
            
        case .iphone78Plus() :
            navHeight = 70
            
        case .iphone11Max() :
            navHeight = 96
            
        case .iphone12AndPro() :
            navHeight = 96
            
        case .iphone12ProMax() :
            navHeight = 96
            
        case .iphone12Mini() :
            navHeight = 96
            
        default:
            navHeight = 96
        }
    }
    
    func setupNav() {
        
        navView.isUserInteractionEnabled = true
        navView.backgroundColor = .navColorModeLight
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOffset = CGSize(width: 0, height: 2)
        navView.layer.shadowOpacity = 0
        navView.layer.shadowRadius = 4
        navView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navView)
        navView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        navView.heightAnchor.constraint(equalToConstant: navHeight).isActive = true
        
        userProfileImageContainer.isHidden = true
        userProfileImageContainer.backgroundColor = .clear
        userProfileImageContainer.layer.shadowColor = UIColor.black.cgColor
        userProfileImageContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        userProfileImageContainer.layer.shadowOpacity = 0.1
        userProfileImageContainer.layer.shadowRadius = 4
        userProfileImageContainer.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(userProfileImageContainer)
        userProfileImageContainer.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 18).isActive = true
        //userProfileImageContainer.topAnchor.constraint(equalTo: navView.topAnchor, constant: 45).isActive = true
        userProfileImageContainer.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -5).isActive = true
        userProfileImageContainer.heightAnchor.constraint(equalToConstant: 39).isActive = true
        userProfileImageContainer.widthAnchor.constraint(equalToConstant: 39).isActive = true
        
        if let imageUrl = User.current.profilePhotoUrl {
            userProfileImageView.kf.setImage(with: URL(string: imageUrl))
        } else {
            userProfileImageView.image = UIImage.init(named: "profileImagePH")
            userProfileImageView.backgroundColor = UIColor(red: 42/255, green: 42/255, blue: 42/255, alpha: 1.0)
        }
        userProfileImageView.layer.cornerRadius = 39/2
        userProfileImageView.layer.masksToBounds = true
        userProfileImageView.contentMode = .scaleAspectFill
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileImageContainer.addSubview(userProfileImageView)
        userProfileImageView.fillSuperview()
        
        titleLabel.text = "My Watchlist"
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        titleLabel.font = .sofiaBold(ofSize: 24)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: userProfileImageContainer.leadingAnchor, constant: 0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 2).isActive = true
        
        calendarImageView.image = UIImage(named: "avatar")
        calendarImageView.contentMode = .scaleAspectFit
        calendarImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(calendarImageView)
        calendarImageView.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -18).isActive = true
        calendarImageView.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        calendarImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        calendarImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
                
        infoButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        infoButton.backgroundColor = .clear
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(infoButton)
        infoButton.leadingAnchor.constraint(equalTo: calendarImageView.leadingAnchor, constant: -5).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        infoButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
        
        let separatorLine = UIView()
        separatorLine.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(separatorLine)
        separatorLine.leadingAnchor.constraint(equalTo: navView.leadingAnchor).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: navView.trailingAnchor).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -0.1).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupTableView() {
        mainFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(WatchlistCoinsTableViewCell.self, forCellReuseIdentifier: watchlistCoinsTableViewCell)
        mainFeedTableView.register(WatchlistExpertTableViewCell.self, forCellReuseIdentifier: watchlistExpertTableViewCell)
        mainFeedTableView.allowsMultipleSelection = false
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 23, left: 0, bottom: 80, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainFeedTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainFeedTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
    }
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension WatchlistViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myCoins.count
        } else {
            return expertCoins.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: watchlistCoinsTableViewCell, for: indexPath) as! WatchlistCoinsTableViewCell
            cell.coinImageView.image = UIImage(named: myCoins[indexPath.row][0])
            cell.blockChainNameLabel.text = myCoins[indexPath.row][1]
            cell.coinNameLabel.text = myCoins[indexPath.row][0]
            cell.coinPriceLabel.text = myCoins[indexPath.row][2]
            cell.percentChangeLabel.text = myCoins[indexPath.row][3]
            
            if indexPath.row == myCoins.count - 1 {
                cell.contentContainer.layer.cornerRadius = 12
            } else {
                cell.contentContainer.layer.cornerRadius = 0
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: watchlistExpertTableViewCell, for: indexPath) as! WatchlistExpertTableViewCell
            cell.coinImageView.image = UIImage(named: expertCoins[indexPath.row][0])
            cell.blockChainNameLabel.text = expertCoins[indexPath.row][1]
            cell.coinNameLabel.text = expertCoins[indexPath.row][0]
            cell.coinPriceLabel.text = expertCoins[indexPath.row][2]
            cell.percentChangeLabel.text = expertCoins[indexPath.row][4]
            
            if indexPath.row == myCoins.count - 1 {
                cell.contentContainer.layer.cornerRadius = 12
            } else {
                cell.contentContainer.layer.cornerRadius = 0
            }
            return cell
        }
            
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 49
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        let roundedView = UIView()
        roundedView.backgroundColor = .white
        roundedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        roundedView.layer.cornerRadius = 12
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(roundedView)
        roundedView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
        roundedView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16).isActive = true
        roundedView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        roundedView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        
        let coinsLabel = UILabel()
        coinsLabel.textAlignment = .left
        coinsLabel.textColor = .black
        coinsLabel.font = .sofiaSemiBold(ofSize: 21)
        coinsLabel.numberOfLines = 0
        coinsLabel.translatesAutoresizingMaskIntoConstraints = false
        roundedView.addSubview(coinsLabel)
        coinsLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 10).isActive = true
        coinsLabel.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 13).isActive = true
        
        if section == 0 {
            coinsLabel.text = "Coins"
        } else {
            coinsLabel.text = "John Horne"
        }
        
        return headerView
    }
}
