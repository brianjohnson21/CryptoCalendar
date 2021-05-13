//
//  ExpertDetailViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import Foundation
import UIKit
import Kingfisher

extension ExpertDetailViewController {
    func setupNav() {
        
        if let image = admin?.profilePhotoUrl {
            expertImageView.kf.setImage(with: URL(string: image))
        } else {
            expertImageView.image = nil
        }
        //expertImageView.image = UIImage(named: "tempHeadShot")
        expertImageView.contentMode = .scaleAspectFill
        expertImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(expertImageView)
        expertImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        expertImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        expertHeight = expertImageView.heightAnchor.constraint(equalToConstant: 428)
        expertHeight.isActive = true
        expertTop = expertImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0)
        expertTop.isActive = true
        
        navView.layer.zPosition = 3
        navView.isUserInteractionEnabled = true
        navView.backgroundColor = .white
        navView.alpha = 0
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOffset = CGSize(width: 0, height: 2)
        navView.layer.shadowOpacity = 0
        navView.layer.shadowRadius = 4
        navView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navView)
        navView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 83).isActive = true
                
    }
    
    func setupTableView() {
        mainFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.tag = 2
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(ExpertBioTableViewCell.self, forCellReuseIdentifier: expertBioTableViewCell)
        mainFeedTableView.register(ExpertsCurrentCoinsTableViewCell.self, forCellReuseIdentifier: expertsCurrentCoinsTableViewCell)
        mainFeedTableView.register(ExpertWatchlistTableViewCell.self, forCellReuseIdentifier: expertWatchlistTableViewCell)
        mainFeedTableView.register(ExpertPostTableViewCell.self, forCellReuseIdentifier: expertPostTableViewCell)
        mainFeedTableView.allowsMultipleSelection = false
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
        
        whiteGradient.isHidden = true
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
        
        let dismissImageBlack = UIImageView()
        dismissImageBlack.layer.zPosition = 3
        dismissImageBlack.image = UIImage(named: "arrow-left")
        dismissImageBlack.setImageColor(color: .white)
        dismissImageBlack.contentMode = .scaleAspectFill
        dismissImageBlack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dismissImageBlack)
        dismissImageBlack.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 14).isActive = true
        dismissImageBlack.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -10).isActive = true
        dismissImageBlack.heightAnchor.constraint(equalToConstant: 24).isActive = true
        dismissImageBlack.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        dismissImageView.alpha = 0
        dismissImageView.layer.zPosition = 3
        dismissImageView.image = UIImage(named: "arrow-left")
        dismissImageView.setImageColor(color: .black)
        dismissImageView.contentMode = .scaleAspectFill
        dismissImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dismissImageView)
        dismissImageView.leadingAnchor.constraint(equalTo: dismissImageBlack.leadingAnchor, constant: 0).isActive = true
        dismissImageView.topAnchor.constraint(equalTo: dismissImageBlack.topAnchor, constant: 0).isActive = true
        dismissImageView.trailingAnchor.constraint(equalTo: dismissImageBlack.trailingAnchor, constant: 0).isActive = true
        dismissImageView.bottomAnchor.constraint(equalTo: dismissImageBlack.bottomAnchor, constant: 0).isActive = true
        
        dismissButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dismissButton)
        dismissButton.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 0).isActive = true
        dismissButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: dismissImageView.trailingAnchor, constant: 15).isActive = true
        
        userNameLabel.text = admin?.name
        userNameLabel.layer.zPosition = 3
        userNameLabel.alpha = 0
        userNameLabel.textColor = .black
        userNameLabel.font = .sofiaSemiBold(ofSize: 16)
        userNameLabel.textAlignment = .center
        userNameLabel.numberOfLines = 0
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(userNameLabel)
        userNameLabel.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: dismissImageView.centerYAnchor).isActive = true
        userNameLabel.transform = CGAffineTransform(translationX: 0, y: -50)
        
        followUnfollow.layer.cornerRadius = 24/2
        followUnfollow.layer.masksToBounds = true
        followUnfollow.layer.zPosition = 3
        followUnfollow.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(followUnfollow)
        followUnfollow.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -23).isActive = true
        followUnfollow.centerYAnchor.constraint(equalTo: dismissImageView.centerYAnchor, constant: 0).isActive = true
        followUnfollow.heightAnchor.constraint(equalToConstant: 24).isActive = true
        followUnfollow.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        followUnfollowButton.backgroundColor = .clear
        followUnfollowButton.addTarget(self, action: #selector(followTapped), for: .touchUpInside)
        followUnfollowButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(followUnfollowButton)
        followUnfollowButton.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: 0).isActive = true
        followUnfollowButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        followUnfollowButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
        followUnfollowButton.leadingAnchor.constraint(equalTo: followUnfollow.leadingAnchor, constant: 15).isActive = true
    }
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension ExpertDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {            
            return portfolios.count
        } else if section == 2 {
            return watchlistCoins.count
        } else {
            return posts.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: expertBioTableViewCell, for: indexPath) as! ExpertBioTableViewCell
            cell.igButton.addTarget(self, action: #selector(didTapIG), for: .touchUpInside)
            cell.twitterButton.addTarget(self, action: #selector(didTapTwitter), for: .touchUpInside)
            cell.expertNameLabel.text = admin?.name
            let bioText = admin?.bio ?? ""
            cell.expertBioLabel.setupLineHeight(myText: bioText, myLineSpacing: 6)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: expertsCurrentCoinsTableViewCell, for: indexPath) as! ExpertsCurrentCoinsTableViewCell
            cell.delegate = self
            cell.layer.zPosition = 2
            return cell
        } else if indexPath.section == 2  {
            let cell = tableView.dequeueReusableCell(withIdentifier: expertWatchlistTableViewCell, for: indexPath) as! ExpertWatchlistTableViewCell
            let coin = watchlistCoins[indexPath.row]
            
            if let coinSymbol = coin.symbol {
                cell.coinImageView.image = UIImage(named: "\(coinSymbol)")
            }
            cell.coinNameLabel.text = coin.name
            cell.blockChainNameLabel.text = coin.symbol
            //cell.coinPriceLabel.text = "\(coin.price ?? 0.0)"
            
            let coinPrice = coin.price ?? 0.0
            if coinPrice < 1.0 {
                cell.coinPriceLabel.text = "$\(coinPrice)"
            } else {
                let largeNumber = coinPrice.rounded(toPlaces: 2)
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
                if let formNumber = formattedNumber {
                    cell.coinPriceLabel.text = "$\(formNumber)"
                }
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: expertPostTableViewCell, for: indexPath) as! ExpertPostTableViewCell
            cell.contentView.backgroundColor = .green
            let post = posts[indexPath.row]
            
            cell.expertNameLabel.text = post.admin?.name
            let expertMessage = post.name ?? ""
            cell.expertMessageLabel.setupLineHeight(myText: expertMessage, myLineSpacing: 6)
            let dateFormatter: DateFormatter = DateFormatter()
            
            // Set date format
            dateFormatter.dateFormat = "MM/dd/yyyy"//"MM/dd/yyyy hh:mm a"
            
            // Apply date format
            if let postEventDate = post.eventDate {
                let selectedDate: String = dateFormatter.string(from: postEventDate)
                cell.postDateLabel.text = "\(selectedDate)"
            }
            cell.expertImageView.image = UIImage(named: "tempHeadShot")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        if section == 2 {
            headerView.backgroundColor = .white
            let sectionTitleLabel = UILabel()
            sectionTitleLabel.text = "Watchlist"
            sectionTitleLabel.textAlignment = .left
            sectionTitleLabel.textColor = .black
            sectionTitleLabel.font = .sofiaSemiBold(ofSize: 18)
            sectionTitleLabel.numberOfLines = 0
            sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(sectionTitleLabel)
            sectionTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 23).isActive = true
            sectionTitleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 36).isActive = true
            
            let infoImageView = UIImageView()
            infoImageView.image = UIImage(named: "info")
            infoImageView.contentMode = .scaleAspectFill
            infoImageView.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(infoImageView)
            infoImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -21).isActive = true
            infoImageView.centerYAnchor.constraint(equalTo: sectionTitleLabel.centerYAnchor, constant: 0).isActive = true
            infoImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            infoImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            
            let infoButton = UIButton()
            infoButton.addTarget(self, action: #selector(didTapWatchlistInfo), for: .touchUpInside)
            infoButton.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(infoButton)
            infoButton.leadingAnchor.constraint(equalTo: infoImageView.leadingAnchor, constant: -10).isActive = true
            infoButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 0).isActive = true
            infoButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
            infoButton.bottomAnchor.constraint(equalTo: infoImageView.bottomAnchor, constant: 5).isActive = true
        }
        
        if section == 3 {
            headerView.backgroundColor = .white
            let dividerLine = UIView()
            dividerLine.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            dividerLine.layer.cornerRadius = 1/2
            dividerLine.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(dividerLine)
            dividerLine.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 23).isActive = true
            dividerLine.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -23).isActive = true
            dividerLine.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 22).isActive = true
            dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 323
        } else if section == 1 {
            return 0
        } else if section == 2 {
            return 80
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else if indexPath.section == 1 {
            return 430
        } else if indexPath.section == 2 {
            return 57
        } else {
            if posts.count > 0 {
                return UITableView.automaticDimension
            } else {
                return 150
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
        } else if indexPath.section == 2 {
            lightImpactGenerator()
            
            let eventOptionsVC =  CoinOptionsViewController()
            eventOptionsVC.isFromHome = true
            eventOptionsVC.delegate = self                                                
            
            eventOptionsVC.coin = watchlistCoins[indexPath.row]
            let coin = watchlistCoins[indexPath.row]
            if let coinPrice = coin.price {
                eventOptionsVC.coinPrice = "$\(coinPrice.rounded(toPlaces: 2))"
            }
            
            if let coinName = coin.name {
                eventOptionsVC.coinName = coinName
            }
            
            if let coinSymbol = coin.symbol {
                eventOptionsVC.coinSymbol = coinSymbol
            }
            
            eventOptionsVC.modalPresentationStyle = .overFullScreen
            self.present(eventOptionsVC, animated: false, completion: nil)
            
        }
    }
    
    
}
