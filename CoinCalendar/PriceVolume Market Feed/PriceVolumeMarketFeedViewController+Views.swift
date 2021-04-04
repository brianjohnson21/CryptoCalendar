//
//  PriceVolumeMarketFeedViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/3/21.
//

import Foundation
import UIKit
import Segmentio

extension PriceVolumeMarketFeedViewController {
    
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
        navView.heightAnchor.constraint(equalToConstant: 136).isActive = true
        
        userProfileImageContainer.backgroundColor = .clear
        userProfileImageContainer.layer.shadowColor = UIColor.black.cgColor
        userProfileImageContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        userProfileImageContainer.layer.shadowOpacity = 0.1
        userProfileImageContainer.layer.shadowRadius = 4
        userProfileImageContainer.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(userProfileImageContainer)
        userProfileImageContainer.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 18).isActive = true
        userProfileImageContainer.topAnchor.constraint(equalTo: navView.topAnchor, constant: 45).isActive = true
        userProfileImageContainer.heightAnchor.constraint(equalToConstant: 39).isActive = true
        userProfileImageContainer.widthAnchor.constraint(equalToConstant: 39).isActive = true
        
        userProfileImageView.image = UIImage(named: "STM")
        userProfileImageView.backgroundColor = .clear
        userProfileImageView.layer.cornerRadius = 39/2
        userProfileImageView.layer.masksToBounds = true
        userProfileImageView.contentMode = .scaleAspectFill
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileImageContainer.addSubview(userProfileImageView)
        userProfileImageView.fillSuperview()
        
        userGreetingLabel.text = "Good morning,"
        userGreetingLabel.textAlignment = .left
        userGreetingLabel.textColor = UIColor.black.withAlphaComponent(0.3)
        userGreetingLabel.font = .sofiaRegular(ofSize: 12)
        userGreetingLabel.numberOfLines = 0
        userGreetingLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(userGreetingLabel)
        userGreetingLabel.leadingAnchor.constraint(equalTo: userProfileImageContainer.trailingAnchor, constant: 6).isActive = true
        userGreetingLabel.topAnchor.constraint(equalTo: userProfileImageContainer.topAnchor, constant: 5).isActive = true
        
        userNameLabel.text = "Stephen M."
        userNameLabel.textAlignment = .left
        userNameLabel.textColor = .black
        userNameLabel.font = .sofiaSemiBold(ofSize: 12)
        userNameLabel.numberOfLines = 0
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(userNameLabel)
        userNameLabel.leadingAnchor.constraint(equalTo: userGreetingLabel.leadingAnchor, constant: 0).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: userGreetingLabel.bottomAnchor, constant: 3).isActive = true
        
        profileButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        profileButton.backgroundColor = .clear
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(profileButton)
        profileButton.leadingAnchor.constraint(equalTo: navView.leadingAnchor).isActive = true
        profileButton.topAnchor.constraint(equalTo: navView.topAnchor).isActive = true
        profileButton.bottomAnchor.constraint(equalTo: userProfileImageContainer.bottomAnchor).isActive = true
        profileButton.trailingAnchor.constraint(equalTo: userGreetingLabel.trailingAnchor).isActive = true
        
        calendarImageView.image = UIImage(named: "calendar")
        calendarImageView.contentMode = .scaleAspectFill
        calendarImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(calendarImageView)
        calendarImageView.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -20).isActive = true
        calendarImageView.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        calendarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        calendarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        sortImageView.image = UIImage(named: "Sort")
        sortImageView.contentMode = .scaleAspectFill
        sortImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(sortImageView)
        sortImageView.trailingAnchor.constraint(equalTo: calendarImageView.leadingAnchor, constant: -20).isActive = true
        sortImageView.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        sortImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sortImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //sortButton.addTarget(self, action: #selector(didTapSortFilter), for: .touchUpInside)
        sortButton.backgroundColor = .clear
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(sortButton)
        sortButton.leadingAnchor.constraint(equalTo: sortImageView.leadingAnchor, constant: -5).isActive = true
        sortButton.trailingAnchor.constraint(equalTo: sortImageView.trailingAnchor, constant: 5).isActive = true
        sortButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        sortButton.bottomAnchor.constraint(equalTo: sortImageView.bottomAnchor, constant: 5).isActive = true
        
        setupSegmentio()
        
        
    }
    
    func setupSegmentio() {
        
        segmentContainer.isUserInteractionEnabled = true
        segmentContainer.backgroundColor = .clear
        segmentContainer.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(segmentContainer)
        segmentContainer.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 0).isActive = true
        segmentContainer.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: 0).isActive = true
        segmentContainer.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
        segmentContainer.heightAnchor.constraint(equalToConstant: 37).isActive = true
        
        //
        coinContainer.backgroundColor = .clear
        coinContainer.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(coinContainer)
        coinContainer.leadingAnchor.constraint(equalTo: segmentContainer.leadingAnchor, constant: 5).isActive = true
        coinContainer.bottomAnchor.constraint(equalTo: segmentContainer.bottomAnchor, constant: 0).isActive = true
        coinContainer.topAnchor.constraint(equalTo: segmentContainer.topAnchor, constant: 0).isActive = true
        coinContainer.widthAnchor.constraint(equalToConstant: 53).isActive = true
        
        createSectionLabel(label: coinLabel, string: "Coin", cointainer: coinContainer)
        
        //
        coinHealthContainer.backgroundColor = .clear
        coinHealthContainer.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(coinHealthContainer)
        coinHealthContainer.leadingAnchor.constraint(equalTo: coinContainer.trailingAnchor, constant: 0).isActive = true
        coinHealthContainer.bottomAnchor.constraint(equalTo: segmentContainer.bottomAnchor, constant: 0).isActive = true
        coinHealthContainer.topAnchor.constraint(equalTo: segmentContainer.topAnchor, constant: 0).isActive = true
        coinHealthContainer.widthAnchor.constraint(equalToConstant: 59).isActive = true
        
        createSectionLabel(label: coinHealthLabel, string: "Price", cointainer: coinHealthContainer)
        
        //
        priceScoreContainer.backgroundColor = .clear
        priceScoreContainer.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(priceScoreContainer)
        priceScoreContainer.leadingAnchor.constraint(equalTo: coinHealthContainer.trailingAnchor, constant: 0).isActive = true
        priceScoreContainer.bottomAnchor.constraint(equalTo: segmentContainer.bottomAnchor, constant: 0).isActive = true
        priceScoreContainer.topAnchor.constraint(equalTo: segmentContainer.topAnchor, constant: 0).isActive = true
        priceScoreContainer.widthAnchor.constraint(equalToConstant: 93).isActive = true
        
        createSectionLabel(label: priceScoreLabel, string: "% Change (24h)", cointainer: priceScoreContainer)
        
        //
        volatilityContainer.backgroundColor = .clear
        volatilityContainer.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(volatilityContainer)
        volatilityContainer.leadingAnchor.constraint(equalTo: priceScoreContainer.trailingAnchor, constant: 0).isActive = true
        volatilityContainer.bottomAnchor.constraint(equalTo: segmentContainer.bottomAnchor, constant: 0).isActive = true
        volatilityContainer.topAnchor.constraint(equalTo: segmentContainer.topAnchor, constant: 0).isActive = true
        volatilityContainer.widthAnchor.constraint(equalToConstant: 76).isActive = true
        
        createSectionLabel(label: volatilityLabel, string: "Volume (24h)", cointainer: volatilityContainer)
        
        //
        coinRankContainer.backgroundColor = .clear
        coinRankContainer.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(coinRankContainer)
        coinRankContainer.leadingAnchor.constraint(equalTo: volatilityContainer.trailingAnchor, constant: 0).isActive = true
        coinRankContainer.bottomAnchor.constraint(equalTo: segmentContainer.bottomAnchor, constant: 0).isActive = true
        coinRankContainer.topAnchor.constraint(equalTo: segmentContainer.topAnchor, constant: 0).isActive = true
        coinRankContainer.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        createSectionLabel(label: coinRankLabel, string: "Market Cap", cointainer: coinRankContainer)

        let separatorLine = UIView()
        separatorLine.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(separatorLine)
        separatorLine.leadingAnchor.constraint(equalTo: navView.leadingAnchor).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: navView.trailingAnchor).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: segmentContainer.bottomAnchor, constant: -0.1).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
                
    }
    
    func createSectionLabel(label: UILabel, string: String, cointainer: UIView) {
        label.text = string
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = .sofiaBold(ofSize: 11)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        cointainer.addSubview(label)
        label.centerXAnchor.constraint(equalTo: cointainer.centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: cointainer.centerYAnchor, constant: 0).isActive = true
    }
    
    func setupCoinTable() {
        coinIconFeedContainer.backgroundColor = .green
        coinIconFeedContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(coinIconFeedContainer)
        coinIconFeedContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        coinIconFeedContainer.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        coinIconFeedContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        coinIconFeedContainer.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    func setupTableView() {

        mainFeedContainer.backgroundColor = .clear
        mainFeedContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainFeedContainer)
        mainFeedContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainFeedContainer.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        mainFeedContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainFeedContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width - 70).isActive = true
        
        mainFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(PriceVolumeMarketFeedTableViewCell.self, forCellReuseIdentifier: priceVolumeMarketFeedTableViewCell)
        mainFeedTableView.allowsMultipleSelection = false
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainFeedTableView)
        //mainFeedTableView.leadingAnchor.constraint(equalTo: coinIconFeedContainer.trailingAnchor).isActive = true
        mainFeedTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainFeedTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainFeedTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: mainFeedContainer.topAnchor).isActive = true
    }
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension PriceVolumeMarketFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: priceVolumeMarketFeedTableViewCell, for: indexPath) as! PriceVolumeMarketFeedTableViewCell
        cell.coinImageView.image = UIImage(named: "Cardano")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lightImpactGenerator()
        let eventOptionsVC =  EventOptionsViewController()//PickerViewController() //EventOptionsViewController()
        eventOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(eventOptionsVC, animated: false, completion: nil)
    }
    
}
