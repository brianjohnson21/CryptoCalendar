//
//  PriceVolumeMarketFeedViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/3/21.
//

import Foundation
import UIKit
import Segmentio
import Kingfisher

extension PriceVolumeMarketFeedViewController {
    
    func setupNav() {
        
        navView.layer.zPosition = 150
        navView.isUserInteractionEnabled = true
        navView.layer.masksToBounds = false
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
        
        profileContainer.layer.zPosition = 2
        profileContainer.backgroundColor = .white
        profileContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        profileContainer.layer.cornerRadius = 23
        profileContainer.layer.shadowColor = UIColor.black.cgColor
        profileContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        profileContainer.layer.shadowOpacity = 0.1
        profileContainer.layer.shadowRadius = 4
        profileContainer.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(profileContainer)
        profileContainer.leadingAnchor.constraint(equalTo: navView.leadingAnchor).isActive = true
        profileContainer.trailingAnchor.constraint(equalTo: navView.trailingAnchor).isActive = true
        profileContainer.topAnchor.constraint(equalTo: navView.topAnchor).isActive = true
        profileContainer.heightAnchor.constraint(equalToConstant: 96).isActive = true
        
        userProfileImageContainer.backgroundColor = .clear
        userProfileImageContainer.layer.shadowColor = UIColor.black.cgColor
        userProfileImageContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        userProfileImageContainer.layer.shadowOpacity = 0.1
        userProfileImageContainer.layer.shadowRadius = 4
        userProfileImageContainer.translatesAutoresizingMaskIntoConstraints = false
        profileContainer.addSubview(userProfileImageContainer)
        userProfileImageContainer.leadingAnchor.constraint(equalTo: profileContainer.leadingAnchor, constant: 18).isActive = true
        userProfileImageContainer.topAnchor.constraint(equalTo: profileContainer.topAnchor, constant: 45).isActive = true
        userProfileImageContainer.heightAnchor.constraint(equalToConstant: 39).isActive = true
        userProfileImageContainer.widthAnchor.constraint(equalToConstant: 39).isActive = true
        
        if let imageUrl = User.current.profilePhotoUrl {
            userProfileImageView.kf.setImage(with: URL(string: imageUrl))
        } else {
            userProfileImageView.image = nil
        }
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
        profileContainer.addSubview(userGreetingLabel)
        userGreetingLabel.leadingAnchor.constraint(equalTo: userProfileImageContainer.trailingAnchor, constant: 6).isActive = true
        userGreetingLabel.topAnchor.constraint(equalTo: userProfileImageContainer.topAnchor, constant: 5).isActive = true
        
        userNameLabel.text = User.current.name
        userNameLabel.textAlignment = .left
        userNameLabel.textColor = .black
        userNameLabel.font = .sofiaSemiBold(ofSize: 12)
        userNameLabel.numberOfLines = 0
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileContainer.addSubview(userNameLabel)
        userNameLabel.leadingAnchor.constraint(equalTo: userGreetingLabel.leadingAnchor, constant: 0).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: userGreetingLabel.bottomAnchor, constant: 3).isActive = true
        
        calendarImageView.image = UIImage(named: "info")
        calendarImageView.contentMode = .scaleAspectFill
        calendarImageView.translatesAutoresizingMaskIntoConstraints = false
        profileContainer.addSubview(calendarImageView)
        calendarImageView.trailingAnchor.constraint(equalTo: profileContainer.trailingAnchor, constant: -20).isActive = true
        calendarImageView.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        calendarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        calendarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        sortImageView.image = UIImage(named: "blackBell")
        sortImageView.contentMode = .scaleAspectFill
        sortImageView.translatesAutoresizingMaskIntoConstraints = false
        profileContainer.addSubview(sortImageView)
        sortImageView.trailingAnchor.constraint(equalTo: calendarImageView.leadingAnchor, constant: -20).isActive = true
        sortImageView.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        sortImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sortImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
                
        profileButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        profileButton.backgroundColor = .clear
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(profileButton)
        profileButton.leadingAnchor.constraint(equalTo: profileContainer.leadingAnchor).isActive = true
        profileButton.topAnchor.constraint(equalTo: profileContainer.topAnchor).isActive = true
        profileButton.bottomAnchor.constraint(equalTo: profileContainer.bottomAnchor).isActive = true
        profileButton.trailingAnchor.constraint(equalTo: userGreetingLabel.trailingAnchor).isActive = true
        
        //sortButton.addTarget(self, action: #selector(didTapSortFilter), for: .touchUpInside)
        sortButton.backgroundColor = .clear
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(sortButton)
        sortButton.leadingAnchor.constraint(equalTo: sortImageView.leadingAnchor, constant: -5).isActive = true
        sortButton.trailingAnchor.constraint(equalTo: sortImageView.trailingAnchor, constant: 5).isActive = true
        sortButton.topAnchor.constraint(equalTo: profileContainer.topAnchor, constant: 0).isActive = true
        sortButton.bottomAnchor.constraint(equalTo: sortImageView.bottomAnchor, constant: 5).isActive = true
        
    }
    
    func setupSegmentio() {
        
        //segmentContainer.layer.masksToBounds = true
        segmentContainer.backgroundColor = .coinBaseBlue
        segmentContainer.layer.shadowColor = UIColor.black.cgColor
        segmentContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        segmentContainer.layer.shadowOpacity = 0.25
        segmentContainer.layer.shadowRadius = 4
        segmentContainer.isUserInteractionEnabled = true
        segmentContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        segmentContainer.layer.cornerRadius = 23
        segmentContainer.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(segmentContainer)
        segmentContainer.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 0).isActive = true
        segmentContainer.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: 0).isActive = true
        segmentContainer.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
        segmentContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        segmentContentContainer.backgroundColor = .clear
        segmentContentContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        segmentContentContainer.layer.cornerRadius = 23
        segmentContentContainer.layer.masksToBounds = true
        segmentContentContainer.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(segmentContentContainer)
        segmentContentContainer.fillSuperview()
        
        //
        coinContainer.backgroundColor = .coinBaseBlue
        coinContainer.selectionBubble.isHidden = true
        coinContainer.filterLabel.text = "Coin"
        coinContainer.translatesAutoresizingMaskIntoConstraints = false
        segmentContentContainer.addSubview(coinContainer)
        coinContainer.leadingAnchor.constraint(equalTo: segmentContentContainer.leadingAnchor, constant: 5).isActive = true
        coinContainer.bottomAnchor.constraint(equalTo: segmentContentContainer.bottomAnchor, constant: 0).isActive = true
        coinContainer.widthAnchor.constraint(equalToConstant: 71).isActive = true
        coinContainer.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        blueGradient.isHidden = false
        blueGradient.layer.zPosition = 100
        blueGradient.layer.masksToBounds = true
        blueGradient.isUserInteractionEnabled = false
        blueGradient.image = UIImage(named: "blueVertGradient")
        blueGradient.contentMode = .scaleAspectFill
        blueGradient.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(blueGradient)
        blueGradient.leadingAnchor.constraint(equalTo: coinIconFeedContainer.trailingAnchor, constant: 0).isActive = true
        blueGradient.topAnchor.constraint(equalTo: coinContainer.topAnchor, constant: 0).isActive = true
        blueGradient.bottomAnchor.constraint(equalTo: coinContainer.bottomAnchor, constant: 0).isActive = true
        blueGradient.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        let separatorLine = UIView()
        separatorLine.isHidden = true
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
        coinIconFeedContainer.layer.zPosition = 100
        coinIconFeedContainer.backgroundColor = .clear
        coinIconFeedContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(coinIconFeedContainer)
        coinIconFeedContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        coinIconFeedContainer.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        coinIconFeedContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        coinIconFeedContainer.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        coinIconFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        coinIconFeedTableView.tag = 1
        coinIconFeedTableView.alpha = 1.0
        coinIconFeedTableView.isScrollEnabled = true
        coinIconFeedTableView.backgroundColor = .clear
        coinIconFeedTableView.delegate = self
        coinIconFeedTableView.dataSource = self
        coinIconFeedTableView.register(CoinIconFeedTableViewCell.self, forCellReuseIdentifier: coinIconFeedTableViewCell)
        coinIconFeedTableView.allowsMultipleSelection = false
        coinIconFeedTableView.contentInset = .zero
        coinIconFeedTableView.showsVerticalScrollIndicator = false
        coinIconFeedTableView.separatorStyle = .none
        coinIconFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
        coinIconFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        coinIconFeedContainer.addSubview(coinIconFeedTableView)
        coinIconFeedTableView.leadingAnchor.constraint(equalTo: coinIconFeedContainer.leadingAnchor).isActive = true
        coinIconFeedTableView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        coinIconFeedTableView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        coinIconFeedTableView.topAnchor.constraint(equalTo: coinIconFeedContainer.topAnchor).isActive = true
    }
    
    func setupTableView() {

        mainFeedContainer.tag = 0
        mainFeedContainer.delegate = self
        mainFeedContainer.contentSize = CGSize(width: view.frame.width * 1.025, height: view.frame.height - 200)
        mainFeedContainer.backgroundColor = .clear
        mainFeedContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainFeedContainer)
        mainFeedContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainFeedContainer.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        mainFeedContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainFeedContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width - 70).isActive = true
        
        mainFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        mainFeedTableView.tag = 2
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(SocialMarketFeedTableViewCell.self, forCellReuseIdentifier: socialMarketFeedTableViewCell)
        mainFeedTableView.allowsMultipleSelection = false
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        mainFeedContainer.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: mainFeedContainer.leadingAnchor).isActive = true
        mainFeedTableView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        mainFeedTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: mainFeedContainer.topAnchor).isActive = true
        
        setupSegmentio()
        
        //
        dataHeadersScrollView.tag = 3
        dataHeadersScrollView.showsHorizontalScrollIndicator = false
        dataHeadersScrollView.layer.zPosition = 100
        dataHeadersScrollView.backgroundColor = .clear
        dataHeadersScrollView.contentSize = CGSize(width: view.frame.width * 1.025, height: 33)
        dataHeadersScrollView.delegate = self
        dataHeadersScrollView.translatesAutoresizingMaskIntoConstraints = false
        segmentContentContainer.addSubview(dataHeadersScrollView)
        dataHeadersScrollView.leadingAnchor.constraint(equalTo: coinIconFeedContainer.trailingAnchor, constant: 0).isActive = true
        dataHeadersScrollView.trailingAnchor.constraint(equalTo: segmentContentContainer.trailingAnchor, constant: 0).isActive = true
        dataHeadersScrollView.bottomAnchor.constraint(equalTo: segmentContentContainer.bottomAnchor, constant: 0).isActive = true
        dataHeadersScrollView.heightAnchor.constraint(equalToConstant: 33).isActive = true
                
        coinHealthContainer.tag = 1
        coinHealthContainer.optionSet()
        coinHealthContainer.addTarget(self, action: #selector(didSelectCoinHeahlth), for: .touchUpInside)
        coinHealthContainer.backgroundColor = .clear
        coinHealthContainer.filterLabel.text = "Price"
        coinHealthContainer.translatesAutoresizingMaskIntoConstraints = false
        dataHeadersScrollView.addSubview(coinHealthContainer)
        coinHealthContainer.leadingAnchor.constraint(equalTo: dataHeadersScrollView.leadingAnchor, constant: 5).isActive = true
        coinHealthContainer.centerYAnchor.constraint(equalTo: dataHeadersScrollView.centerYAnchor, constant: 0).isActive = true
        coinHealthContainer.widthAnchor.constraint(equalToConstant: 75).isActive = true
        coinHealthContainer.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        priceScoreContainer.tag = 2
        priceScoreContainer.addTarget(self, action: #selector(didSelectCoinHeahlth), for: .touchUpInside)
        priceScoreContainer.backgroundColor = .clear
        priceScoreContainer.filterLabel.text = "% Change (24h)"
        priceScoreContainer.translatesAutoresizingMaskIntoConstraints = false
        dataHeadersScrollView.addSubview(priceScoreContainer)
        priceScoreContainer.leadingAnchor.constraint(equalTo: coinHealthContainer.trailingAnchor, constant: 5).isActive = true
        priceScoreContainer.centerYAnchor.constraint(equalTo: dataHeadersScrollView.centerYAnchor, constant: 0).isActive = true
        priceScoreContainer.widthAnchor.constraint(equalToConstant: 85).isActive = true
        priceScoreContainer.heightAnchor.constraint(equalToConstant: 33).isActive = true
                
        //
        volatilityContainer.tag = 3
        volatilityContainer.addTarget(self, action: #selector(didSelectCoinHeahlth), for: .touchUpInside)
        volatilityContainer.backgroundColor = .clear
        volatilityContainer.filterLabel.text = "Volume (24h)"
        volatilityContainer.translatesAutoresizingMaskIntoConstraints = false
        dataHeadersScrollView.addSubview(volatilityContainer)
        volatilityContainer.leadingAnchor.constraint(equalTo: priceScoreContainer.trailingAnchor, constant: 5).isActive = true
        volatilityContainer.centerYAnchor.constraint(equalTo: dataHeadersScrollView.centerYAnchor, constant: 0).isActive = true
        volatilityContainer.widthAnchor.constraint(equalToConstant: 75).isActive = true
        volatilityContainer.heightAnchor.constraint(equalToConstant: 33).isActive = true

        //
        coinRankContainer.tag = 4
        coinRankContainer.addTarget(self, action: #selector(didSelectCoinHeahlth), for: .touchUpInside)
        coinRankContainer.backgroundColor = .clear
        coinRankContainer.filterLabel.text = "Market Cap"
        coinRankContainer.translatesAutoresizingMaskIntoConstraints = false
        dataHeadersScrollView.addSubview(coinRankContainer)
        coinRankContainer.leadingAnchor.constraint(equalTo: volatilityContainer.trailingAnchor, constant: 5).isActive = true
        coinRankContainer.centerYAnchor.constraint(equalTo: dataHeadersScrollView.centerYAnchor, constant: 0).isActive = true
        coinRankContainer.widthAnchor.constraint(equalToConstant: 90).isActive = true
        coinRankContainer.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        whiteGradient.isHidden = false
        whiteGradient.layer.zPosition = 100
        whiteGradient.layer.masksToBounds = true
        whiteGradient.isUserInteractionEnabled = false
        whiteGradient.image = UIImage(named: "whiteVertGradient")
        whiteGradient.setImageColor(color: .mainFeedBackgroundColorModeLight)
        whiteGradient.contentMode = .scaleAspectFill
        whiteGradient.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(whiteGradient)
        whiteGradient.leadingAnchor.constraint(equalTo: coinIconFeedContainer.trailingAnchor, constant: 0).isActive = true
        whiteGradient.topAnchor.constraint(equalTo: mainFeedContainer.topAnchor, constant: 0).isActive = true
        whiteGradient.bottomAnchor.constraint(equalTo: coinIconFeedContainer.bottomAnchor, constant: 0).isActive = true
        whiteGradient.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        //
        infoButton.addTarget(self, action: #selector(showMoreInfo), for: .touchUpInside)
        infoButton.backgroundColor = .clear
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(infoButton)
        infoButton.leadingAnchor.constraint(equalTo: calendarImageView.leadingAnchor, constant: -5).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: 0).isActive = true
        infoButton.topAnchor.constraint(equalTo: profileContainer.topAnchor, constant: 0).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: profileContainer.bottomAnchor, constant: 0).isActive = true
    }
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension PriceVolumeMarketFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: coinIconFeedTableViewCell, for: indexPath) as! CoinIconFeedTableViewCell
            let coin = coins[indexPath.row]
            if let coinSymbol = coin.symbol {
                cell.coinImageView.image = UIImage(named: "\(coinSymbol)")
            } else {
                cell.coinImageView.image = nil
                cell.coinImageView.backgroundColor = .red
            }
            return cell
                        
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: socialMarketFeedTableViewCell, for: indexPath) as! SocialMarketFeedTableViewCell

            let coin = coins[indexPath.row]
            
            if let score = coin.priceScore {
                cell.coinHealthLabel.text = "\(score)"
            } else {
                cell.coinHealthLabel.text = "N/A"
            }
            
            if let change = coin.marketCap {
                //let capNumber =
                cell.priceScoreLabel.text = "$\(suffixNumber(number: Double(change)))"//"\(change)"                
                
            } else {
                cell.priceScoreLabel.text = "N/A"
            }
            
            if let score = coin.socialVolume {
                cell.volatilityLabel.text = "\(score)"
            } else {
                cell.volatilityLabel.text = "N/A"
            }
            
            if let score = coin.percentChange24Hours {
                cell.coinRankLabel.text = "\(score)%"
            } else {
                cell.coinRankLabel.text = "N/A"
            }
            return cell
        }
        
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
        let eventOptionsVC =  CoinOptionsViewController()
        eventOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(eventOptionsVC, animated: false, completion: nil)
    }
    
}
