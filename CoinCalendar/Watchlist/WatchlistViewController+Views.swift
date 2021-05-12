//
//  WatchlistViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/21/21.
//

import Foundation
import UIKit
import Kingfisher
import Lottie

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
        
        //
        
        watchlistEmptyState.isUserInteractionEnabled = false
        watchlistEmptyState.layer.zPosition = 100
        watchlistEmptyState.isHidden = true
        watchlistEmptyState.squadUpButton.isHidden = true
        watchlistEmptyState.lockLabel.text = "👀🚀"
        watchlistEmptyState.lockTitleLabel.text = "Watchlist Empty"
        watchlistEmptyState.lockDetailLabel.setupLineHeight(myText: "Any coins or expert trader portfolio's\nyou follow will show up here", myLineSpacing: 4)
        watchlistEmptyState.lockDetailLabel.textAlignment = .center
        watchlistEmptyState.squadUpButton.setTitle("Browse users", for: .normal)
        watchlistEmptyState.backgroundColor = .clear
        watchlistEmptyState.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(watchlistEmptyState)
        watchlistEmptyState.centerXAnchor.constraint(equalTo: mainFeedTableView.centerXAnchor).isActive = true
        watchlistEmptyState.centerYAnchor.constraint(equalTo: mainFeedTableView.centerYAnchor, constant: 0).isActive = true
        watchlistEmptyState.heightAnchor.constraint(equalToConstant: 245).isActive = true
        watchlistEmptyState.widthAnchor.constraint(equalToConstant: 305).isActive = true
    }
    
    func setupLoadingIndicator() {
        
        loadingContainer.isHidden = false
        loadingContainer.alpha = 1.0
        loadingContainer.backgroundColor = .white
        loadingContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loadingContainer)
        loadingContainer.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        loadingContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        loadingContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        loadingContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let checkAnimation = Animation.named("doubleSpin")
        loadingLottie.isUserInteractionEnabled = false
        loadingLottie.alpha = 1.0
        loadingLottie.loopMode = .loop
        loadingLottie.animation = checkAnimation
        loadingLottie.contentMode = .scaleAspectFill
        loadingLottie.backgroundColor = .clear
        loadingLottie.translatesAutoresizingMaskIntoConstraints = false
        loadingContainer.addSubview(loadingLottie)
        loadingLottie.centerYAnchor.constraint(equalTo: loadingContainer.centerYAnchor, constant: -75).isActive = true
        loadingLottie.centerXAnchor.constraint(equalTo: loadingContainer.centerXAnchor).isActive = true
        loadingLottie.heightAnchor.constraint(equalToConstant: 80).isActive = true
        loadingLottie.widthAnchor.constraint(equalToConstant: 80).isActive = true
        loadingLottie.play()
        
        let loadingLabel = UILabel()
        loadingLabel.text = "Updating watchlist..."
        loadingLabel.textAlignment = .center
        loadingLabel.font = .sofiaMedium(ofSize: 11)
        loadingLabel.textColor = .keyEventDetailColorModeLight
        loadingLabel.numberOfLines = 0
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingContainer.addSubview(loadingLabel)
        loadingLabel.centerXAnchor.constraint(equalTo: loadingContainer.centerXAnchor).isActive = true
        loadingLabel.topAnchor.constraint(equalTo: loadingLottie.bottomAnchor, constant: 15).isActive = true
        
        //print("😀😀😀 - \(loadingLottie.logHierarchyKeypaths()) - 😀😀😀")
        /*
        var i = 0
        let loadingLayers = ["Shape Layer 1.Ellipse 1.Stroke 1.Color", "Shape Layer 2.Ellipse 1.Stroke 1.Color", "Shape Layer 3.Ellipse 1.Stroke 1.Color"]
        for layer in 1...loadingLayers.count {
            let keyPath = AnimationKeypath(keypath: "\(loadingLayers[layer - 1])")
            if i == 0 {
                let colorProvider = ColorValueProvider(UIColor.white.withAlphaComponent(1.0).lottieColorValue)
                loadingLottie.setValueProvider(colorProvider, keypath: keyPath)
            } else if i == 1 {
                let colorProvider = ColorValueProvider(UIColor.white.withAlphaComponent(0.8).lottieColorValue)
                loadingLottie.setValueProvider(colorProvider, keypath: keyPath)
            } else {
                let colorProvider = ColorValueProvider(UIColor.white.withAlphaComponent(0.6).lottieColorValue)
                loadingLottie.setValueProvider(colorProvider, keypath: keyPath)
            }
            i += 1
        }
        */
    }
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension WatchlistViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        //print("\(myCoins.count) - 🤢🤢🤢")
        if myCoins.count > 0 {
            return 1 + traders.count
        } else {
            return traders.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if myCoins.count > 0 {
            if section == 0 {
                //print("\(myCoins.count) - 😡😡😡")
                return myCoins.count
            } else {
                //print("\(traders.count) - 😶‍🌫️😶‍🌫️😶‍🌫️")
                return traders[section - 1].coins?.count ?? 0
            }
        } else {
            //print("\(traders.count) - 😶‍🌫️😶‍🌫️😶‍🌫️")
            return traders[section].coins?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if myCoins.count > 0 {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: watchlistCoinsTableViewCell, for: indexPath) as! WatchlistCoinsTableViewCell
                
                let coin = myCoins[indexPath.row]
                
                if let coinSymbol = coin.name {
                    cell.coinImageView.image = UIImage(named: "\(coinSymbol)")
                }
                //cell.coinImageView.image = UIImage(named: myCoins[indexPath.row][0])
                cell.blockChainNameLabel.text = coin.name
                cell.coinNameLabel.text = coin.symbol
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
                
                cell.percentChangeLabel.text = "\(coin.percentChange24Hours ?? 0.0)%"
                
                if indexPath.row == myCoins.count - 1 {
                    cell.contentContainer.layer.cornerRadius = 12
                } else {
                    cell.contentContainer.layer.cornerRadius = 0
                }
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: watchlistExpertTableViewCell, for: indexPath) as! WatchlistExpertTableViewCell
                
                let adminCoin = traders[indexPath.row]
                let coin = (adminCoin.coins ?? [])[indexPath.row]
                
                if let coinSymbol = coin.symbol {
                    cell.coinImageView.image = UIImage(named: "\(coinSymbol)")
                }
                cell.blockChainNameLabel.text = coin.name
                cell.coinNameLabel.text = coin.symbol
                cell.coinPriceLabel.text = "$\(coin.price ?? 0.0)"
                cell.percentChangeLabel.text = "\(coin.percentChange24Hours ?? 0.0)%"
                
                if indexPath.row == myCoins.count - 1 {
                    cell.contentContainer.layer.cornerRadius = 12
                } else {
                    cell.contentContainer.layer.cornerRadius = 0
                }
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: watchlistExpertTableViewCell, for: indexPath) as! WatchlistExpertTableViewCell
            
            let adminCoin = traders[indexPath.row]
            let coin = (adminCoin.coins ?? [])[indexPath.row]
            
            if let coinSymbol = coin.symbol {
                cell.coinImageView.image = UIImage(named: "\(coinSymbol)")
            }
            cell.blockChainNameLabel.text = coin.name
            cell.coinNameLabel.text = coin.symbol
            //cell.coinPriceLabel.text = "$\(coin.price ?? 0.0)"
            
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
            
            cell.percentChangeLabel.text = "\(coin.percentChange24Hours ?? 0.0)%"
            
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
        
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(named: "arrow-left")
        arrowImageView.setImageColor(color: .black)
        arrowImageView.transform = view.transform.rotated(by: .pi)
        arrowImageView.contentMode = .scaleAspectFill
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.addSubview(arrowImageView)
        arrowImageView.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -9).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: coinsLabel.centerYAnchor, constant: 0).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        let seeMoreLabel = UILabel()
        seeMoreLabel.text = "See More"
        seeMoreLabel.textAlignment = .left
        seeMoreLabel.textColor = .black
        seeMoreLabel.font = .sofiaRegular(ofSize: 12)
        seeMoreLabel.numberOfLines = 0
        seeMoreLabel.translatesAutoresizingMaskIntoConstraints = false
        roundedView.addSubview(seeMoreLabel)
        seeMoreLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: 0).isActive = true
        seeMoreLabel.centerYAnchor.constraint(equalTo: arrowImageView.centerYAnchor, constant: 0).isActive = true
        
        let headerButton = UIButton()
        headerButton.addTarget(self, action: #selector(goToExpertDetail(sender:)), for: .touchUpInside)
        headerButton.tag = section
        headerButton.backgroundColor = .clear
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(headerButton)
        headerButton.fillSuperview()
        
        if myCoins.count > 0 {
            if section == 0 {
                coinsLabel.text = "Coins"
                arrowImageView.isHidden = true
                seeMoreLabel.isHidden = true
                headerButton.isHidden = true
            } else {
                let trader = traders[section - 1].admin
                coinsLabel.text = trader.name
                arrowImageView.isHidden = false
                seeMoreLabel.isHidden = false
                headerButton.isHidden = false
            }
        } else {
            let trader = traders[section].admin
            coinsLabel.text = trader.name
            arrowImageView.isHidden = false
            seeMoreLabel.isHidden = false
            headerButton.isHidden = false
        }
                
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lightImpactGenerator()
        
        let eventOptionsVC =  WatchlistCoinOptionsViewController()
        eventOptionsVC.delegate = self
        
        if myCoins.count > 0 {
            if indexPath.section == 0 {
                eventOptionsVC.coin = myCoins[indexPath.row]
                let coin = myCoins[indexPath.row]
                
                if let coinPrice = coin.price {
                    eventOptionsVC.coinPrice = "$\(coinPrice.rounded(toPlaces: 2))"
                }
                
                if let coinName = coin.name {
                    eventOptionsVC.coinName = coinName
                }
                
                if let coinSymbol = coin.symbol {
                    eventOptionsVC.coinSymbol = coinSymbol
                }
            } else {
                
                let adminCoin = traders[indexPath.row]
                //let coin = (adminCoin.coins ?? [])[indexPath.row]
                
                eventOptionsVC.coin = (adminCoin.coins ?? [])[indexPath.row]
                let coin = (adminCoin.coins ?? [])[indexPath.row]
                if let coinPrice = coin.price {
                    eventOptionsVC.coinPrice = "$\(coinPrice.rounded(toPlaces: 2))"
                }
                
                if let coinName = coin.name {
                    eventOptionsVC.coinName = coinName
                }
                
                if let coinSymbol = coin.symbol {
                    eventOptionsVC.coinSymbol = coinSymbol
                }
            }
        } else {
            
            let adminCoin = traders[indexPath.row]
            //let coin = (adminCoin.coins ?? [])[indexPath.row]
            
            eventOptionsVC.coin = (adminCoin.coins ?? [])[indexPath.row]
            let coin = (adminCoin.coins ?? [])[indexPath.row]
            if let coinPrice = coin.price {
                eventOptionsVC.coinPrice = "$\(coinPrice.rounded(toPlaces: 2))"
            }
            
            if let coinName = coin.name {
                eventOptionsVC.coinName = coinName
            }
            
            if let coinSymbol = coin.symbol {
                eventOptionsVC.coinSymbol = coinSymbol
            }
            
        }
        
        eventOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(eventOptionsVC, animated: false, completion: nil)
        
    }
}
