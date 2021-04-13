//
//  CoinDetailsViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/12/21.
//

import Foundation
import UIKit

extension CoinDetailsViewController {
    
    func setupNav() {
        navView.backgroundColor = .white
        navView.layer.zPosition = 2
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOffset = CGSize(width: 0, height: 2)
        navView.layer.shadowOpacity = 0
        navView.layer.shadowRadius = 4
        navView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navView)
        navView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        dismissImageView.image = UIImage(named: "arrow-left")
        dismissImageView.setImageColor(color: .black)
        dismissImageView.contentMode = .scaleAspectFill
        dismissImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(dismissImageView)
        dismissImageView.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 14).isActive = true
        dismissImageView.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -15).isActive = true
        dismissImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        dismissImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        dismissButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(dismissButton)
        dismissButton.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 0).isActive = true
        dismissButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: dismissImageView.trailingAnchor, constant: 15).isActive = true
                
        if let coinSymbol = coin?.symbol {
            coinImageView.image = UIImage(named: "\(coinSymbol)")
        }
        coinImageView.alpha = 0
        coinImageView.contentMode = .scaleAspectFill
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(coinImageView)
        coinImageView.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        coinImageView.centerYAnchor.constraint(equalTo: dismissImageView.centerYAnchor).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 38).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 38).isActive = true
        coinImageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
    }
    
    func setupTableView() {
        mainFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.tag = 2
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(CoinDetailCoinTableViewCell.self, forCellReuseIdentifier: coinDetailCoinTableViewCell)
        mainFeedTableView.register(CoinDetailStatTableViewCell.self, forCellReuseIdentifier: coinDetailStatTableViewCell)
        mainFeedTableView.register(MainFeedCardTableViewCell.self, forCellReuseIdentifier: mainFeedCardTableViewCell)
        mainFeedTableView.allowsMultipleSelection = true
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 75, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainFeedTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainFeedTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        
        whiteGradient.alpha = 0.75
        whiteGradient.isUserInteractionEnabled = false
        whiteGradient.image = UIImage(named: "whiteGradient")
        whiteGradient.contentMode = .scaleAspectFill
        whiteGradient.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(whiteGradient)
        whiteGradient.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        whiteGradient.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        whiteGradient.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        whiteGradient.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension CoinDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return marketStats.count
        } else if section == 2 {
            return keyStats.count
        } else if section == 3 {
            return socialStats.count
        } else {
            return events.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CoinDetailsHeader()
        headerView.sectionTitleLabel.text = sections[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: coinDetailCoinTableViewCell, for: indexPath) as! CoinDetailCoinTableViewCell
            if let coinSymbol = coin?.symbol {
                cell.coinImageView.image = UIImage(named: "\(coinSymbol)")
                cell.coinLabel.text = coinSymbol
            }
            if let coinName = coin?.name {
                cell.blockChainLabel.text = coinName
            }
            return cell
        } else if indexPath.section < 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: coinDetailStatTableViewCell, for: indexPath) as! CoinDetailStatTableViewCell
            switch indexPath.section {
            case 1:
                cell.detailImageView.image = UIImage(named: "d\(indexPath.row + 1)")
                cell.detailImageView.setImageColor(color: .coinBaseBlue)
                cell.detailLabel.text = marketStats[indexPath.row]
                cell.statLabel.text = "$1.1 trillion"
            case 2:
                cell.detailImageView.image = UIImage(named: "d\(marketStats.count + 1 + indexPath.row)")
                cell.detailImageView.setImageColor(color: .coinBaseBlue)
                cell.detailLabel.text = keyStats[indexPath.row]
                cell.statLabel.text = "$1.1 trillion"
            case 3:
                cell.detailImageView.image = UIImage(named: "d\(marketStats.count + keyStats.count + 1 + indexPath.row)")
                cell.detailImageView.setImageColor(color: .coinBaseBlue)
                cell.detailLabel.text = socialStats[indexPath.row]
                cell.statLabel.text = "$1.1 trillion"
            default:
                cell.detailImageView.image = UIImage(named: "d\(marketStats.count + keyStats.count + socialStats.count + 1 + indexPath.row)")
                cell.detailImageView.setImageColor(color: .coinBaseBlue)
                cell.detailLabel.text = events[indexPath.row]
                cell.statLabel.text = "$1.1 trillion"
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: mainFeedCardTableViewCell, for: indexPath) as! MainFeedCardTableViewCell
            cell.eventTypeLabel.text = "Release"
            cell.headlineLabel.text = "PolkaPets NFT Launch"
            cell.cryptoImageView.image = UIImage(named: "Cardano")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 101
        } else if indexPath.section == sections.count - 1 {
            return 140
        } else {
            return 62
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 72
        }
    }
    
}
