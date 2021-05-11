//
//  EventFeedViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import Foundation
import UIKit
import Segmentio
import Lottie

extension EventFeedViewController {
    
    func modifyConstraints() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            navHeight = 110
            
        case .iphone78() :
            navHeight = 110
            
        case .iphone78Plus() :
            navHeight = 110
            
        case .iphone11Max() :
            navHeight = 136
            
        case .iphone12AndPro() :
            navHeight = 136
            
        case .iphone12ProMax() :
            navHeight = 136
            
        case .iphone12Mini() :
            navHeight = 136
            
        default:
            navHeight = 136
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
        userProfileImageContainer.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -45).isActive = true //-5
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
        
        titleLabel.text = "Key Events"
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        titleLabel.font = .sofiaBold(ofSize: 24)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: userProfileImageContainer.leadingAnchor, constant: 0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        
        /*
         userGreetingLabel.text = "Good morning,"
         userGreetingLabel.textAlignment = .left
         userGreetingLabel.textColor = UIColor.black.withAlphaComponent(0.3)
         userGreetingLabel.font = .sofiaRegular(ofSize: 12)
         userGreetingLabel.numberOfLines = 0
         userGreetingLabel.translatesAutoresizingMaskIntoConstraints = false
         navView.addSubview(userGreetingLabel)
         userGreetingLabel.leadingAnchor.constraint(equalTo: userProfileImageContainer.trailingAnchor, constant: 6).isActive = true
         userGreetingLabel.topAnchor.constraint(equalTo: userProfileImageContainer.topAnchor, constant: 5).isActive = true
         
         userNameLabel.text = User.current.name
         userNameLabel.textAlignment = .left
         userNameLabel.textColor = .black
         userNameLabel.font = .sofiaSemiBold(ofSize: 12)
         userNameLabel.numberOfLines = 0
         userNameLabel.translatesAutoresizingMaskIntoConstraints = false
         navView.addSubview(userNameLabel)
         userNameLabel.leadingAnchor.constraint(equalTo: userGreetingLabel.leadingAnchor, constant: 0).isActive = true
         userNameLabel.topAnchor.constraint(equalTo: userGreetingLabel.bottomAnchor, constant: 3).isActive = true
         */
        
        infoImageView.image = UIImage(named: "thiccinfo")
        infoImageView.contentMode = .scaleAspectFill
        infoImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(infoImageView)
        infoImageView.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -18).isActive = true
        infoImageView.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        infoImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        infoImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        infoButton.addTarget(self, action: #selector(showMoreInfo), for: .touchUpInside)
        infoButton.backgroundColor = .clear
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(infoButton)
        infoButton.leadingAnchor.constraint(equalTo: infoImageView.leadingAnchor, constant: -5).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: infoImageView.trailingAnchor, constant: 5).isActive = true
        infoButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: infoImageView.bottomAnchor, constant: 5).isActive = true
        
        sortImageView.image = UIImage(named: "thiccSort")
        sortImageView.contentMode = .scaleAspectFill
        sortImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(sortImageView)
        sortImageView.trailingAnchor.constraint(equalTo: infoImageView.leadingAnchor, constant: -21.5).isActive = true
        sortImageView.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        sortImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        sortImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        sortButton.addTarget(self, action: #selector(didTapSortFilter), for: .touchUpInside)
        sortButton.backgroundColor = .clear
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(sortButton)
        sortButton.leadingAnchor.constraint(equalTo: sortImageView.leadingAnchor, constant: -5).isActive = true
        sortButton.trailingAnchor.constraint(equalTo: sortImageView.trailingAnchor, constant: 5).isActive = true
        sortButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        sortButton.bottomAnchor.constraint(equalTo: sortImageView.bottomAnchor, constant: 5).isActive = true
        
        bellImageView.image = UIImage(named: "thiccBellBlue")
        bellImageView.contentMode = .scaleAspectFill
        bellImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(bellImageView)
        bellImageView.trailingAnchor.constraint(equalTo: sortImageView.leadingAnchor, constant: -21.5).isActive = true
        bellImageView.centerYAnchor.constraint(equalTo: userProfileImageContainer.centerYAnchor, constant: 0).isActive = true
        bellImageView.heightAnchor.constraint(equalToConstant: 29).isActive = true
        bellImageView.widthAnchor.constraint(equalToConstant: 29).isActive = true
        
        alertsButton.addTarget(self, action: #selector(goToAlerts), for: .touchUpInside)
        alertsButton.backgroundColor = .clear
        alertsButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(alertsButton)
        alertsButton.leadingAnchor.constraint(equalTo: bellImageView.leadingAnchor, constant: -5).isActive = true
        alertsButton.trailingAnchor.constraint(equalTo: bellImageView.trailingAnchor, constant: 5).isActive = true
        alertsButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        alertsButton.bottomAnchor.constraint(equalTo: bellImageView.bottomAnchor, constant: 5).isActive = true
        
        profileButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        profileButton.backgroundColor = .clear
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(profileButton)
        profileButton.leadingAnchor.constraint(equalTo: navView.leadingAnchor).isActive = true
        profileButton.topAnchor.constraint(equalTo: navView.topAnchor).isActive = true
        profileButton.bottomAnchor.constraint(equalTo: userProfileImageContainer.bottomAnchor).isActive = true
        profileButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        setupSegmentio()
                
    }
    
    func setupSegmentio() {
        
        segmentContainer.isUserInteractionEnabled = true
        segmentContainer.backgroundColor = .clear
        segmentContainer.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(segmentContainer)
        segmentContainer.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 10).isActive = true
        segmentContainer.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -20).isActive = true
        segmentContainer.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
        segmentContainer.heightAnchor.constraint(equalToConstant: 37).isActive = true


        let segmentioViewRect = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: 48)
        segmentioControl = Segmentio(frame: segmentioViewRect)
        segmentioControl.backgroundColor = .themeColorOne
        segmentioControl.selectedSegmentioIndex = 0

        var content = [SegmentioItem]()

        let featuredItem = SegmentioItem(
            title: "All",
            image: nil
        )

        let womenItem = SegmentioItem(
            title: "Important",
            image: nil
        )

        let curvesItem = SegmentioItem(
            title: "New",
            image: nil
        )

        let menItem = SegmentioItem(
            title: "Watchlist",
            image: nil
        )

        content.append(featuredItem)
        content.append(womenItem)
        content.append(curvesItem)
        content.append(menItem)

        segmentioControl.setup(content: [featuredItem, womenItem, curvesItem, menItem], style: .onlyLabel, options: SegmentioOptions.init(
            backgroundColor: UIColor.clear,
            segmentPosition: .dynamic,
            scrollEnabled: false,
            indicatorOptions: SegmentioIndicatorOptions(
                type: .bottom,
                ratio: 0.65,
                height: 2,
                color: .coinBaseBlue),
            horizontalSeparatorOptions: nil,
            verticalSeparatorOptions: nil,
            imageContentMode: .scaleAspectFill,
            labelTextAlignment: NSTextAlignment.center,
            labelTextNumberOfLines: 0,
            segmentStates: SegmentioStates(
                defaultState: SegmentioState(
                    backgroundColor: .clear,
                    titleFont: UIFont(name: "SofiaPro-SemiBold", size: 15)!,
                    titleTextColor: UIColor.keyEventHeadlineColorModeLight.withAlphaComponent(0.75)
                ),
                selectedState: SegmentioState(
                    backgroundColor: .clear,
                    titleFont: UIFont(name: "SofiaPro-SemiBold", size: 15)!,
                    titleTextColor: UIColor.keyEventHeadlineColorModeLight
                ),
                highlightedState: SegmentioState(
                    backgroundColor: .clear,
                    titleFont: UIFont(name: "SofiaPro-SemiBold", size: 15)!,
                    titleTextColor: UIColor.keyEventHeadlineColorModeLight
                )
            ),
            animationDuration: 0.25))

        segmentioControl.valueDidChange = { [weak self] segmentio, segmentIndex in
            self?.lightImpactGenerator()
            print("Selected item: ", segmentIndex)
            self?.selectedSegment = segmentIndex
            
            switch segmentIndex {
            case 0:
                self?.watchListEmptyState.hidViews()
                self?.newEventsEmptyState.hidViews()
                self?.importantEmptyState.hidViews()
                
                if self?.filteredCoins.count == 0 {
                    if let allPostsCount = self?.posts.count {
                        if allPostsCount < 1 {
                            self?.allEventsEmptyState.showViews()
                        }
                    }
                } else {
                    var source: [Post]!
                    source = self?.posts.filter({self?.filteredCoins.contains($0.coinSymbol ?? "") as! Bool})
                    if source.count > 0 {
                        self?.allEventsEmptyState.hidViews()
                    } else {
                        self?.allEventsEmptyState.showViews()
                    }
                    //print("\(source.count) - 😇😇😇")
                }
                
            case 1:
                self?.allEventsEmptyState.hidViews()
                self?.watchListEmptyState.hidViews()
                self?.newEventsEmptyState.hidViews()
                
                if self?.filteredCoins.count == 0 {
                    if let importantPostsCount = self?.importantPosts.count {
                        if importantPostsCount < 1 {
                            self?.importantEmptyState.showViews()
                        }
                    }
                } else {
                    var source: [Post]!
                    source = self?.importantPosts.filter({self?.filteredCoins.contains($0.coinSymbol ?? "") as! Bool})
                    if source.count > 0 {
                        self?.importantEmptyState.hidViews()
                    } else {
                        self?.importantEmptyState.showViews()
                    }
                    //print("\(source.count) - 😇😇😇")
                }
                
            case 2:
                self?.allEventsEmptyState.hidViews()
                self?.watchListEmptyState.hidViews()
                self?.importantEmptyState.hidViews()
                                
                if self?.filteredCoins.count == 0 {
                    if let newPostsCount = self?.newPosts.count {
                        if newPostsCount < 1 {
                            self?.newEventsEmptyState.showViews()
                        }
                    }
                } else {
                    var source: [Post]!
                    source = self?.newPosts.filter({self?.filteredCoins.contains($0.coinSymbol ?? "") as! Bool})
                    if source.count > 0 {
                        self?.newEventsEmptyState.hidViews()
                    } else {
                        self?.newEventsEmptyState.showViews()
                    }
                    //print("\(source.count) - 😇😇😇")
                }
                
                
            default:
                self?.allEventsEmptyState.hidViews()
                self?.newEventsEmptyState.hidViews()
                self?.importantEmptyState.hidViews()
                
                if self?.filteredCoins.count == 0 {
                    if let watchListPostsCount = self?.watchlistPosts.count {
                        if watchListPostsCount < 1 {
                            self?.watchListEmptyState.showViews()
                        }
                    }
                } else {
                    var source: [Post]!
                    source = self?.watchlistPosts.filter({self?.filteredCoins.contains($0.coinSymbol ?? "") as! Bool})
                    if source.count > 0 {
                        self?.watchListEmptyState.hidViews()
                    } else {
                        self?.watchListEmptyState.showViews()
                    }
                    //print("\(source.count) - 😇😇😇")
                }
                                
            }
            self?.mainFeedTableView.reloadSections([0], with: .fade)
        }

        let separatorLine = UIView()
        separatorLine.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(separatorLine)
        separatorLine.leadingAnchor.constraint(equalTo: navView.leadingAnchor).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: navView.trailingAnchor).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: segmentContainer.bottomAnchor, constant: -0.1).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true

        segmentioControl.translatesAutoresizingMaskIntoConstraints = false
        segmentContainer.addSubview(segmentioControl)
        segmentioControl.fillSuperview()
        
    }
    
    func setupTableView() {
        mainFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        mainFeedTableView.alpha = 0
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(MainFeedCardTableViewCell.self, forCellReuseIdentifier: mainFeedCardTableViewCell)
        mainFeedTableView.allowsMultipleSelection = false
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 80, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainFeedTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainFeedTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
    }
    
    func setupLaunchTransition() {
        //let launchTransition = LaunchTransitionView()
        launchTransition.delegate = self
        launchTransition.alpha = 1.0
        let window = UIApplication.shared.keyWindow!
        launchTransition.frame = window.bounds
        window.addSubview(launchTransition)
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
        loadingLabel.text = "Updating the feed..."
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
    
    func setupEmptyState() {
        allEventsEmptyState.isUserInteractionEnabled = false
        allEventsEmptyState.layer.zPosition = 100
        allEventsEmptyState.isHidden = true
        allEventsEmptyState.squadUpButton.isHidden = true
        allEventsEmptyState.lockLabel.text = "🤷‍♂️😫"
        allEventsEmptyState.lockTitleLabel.text = "No Events"
        allEventsEmptyState.lockDetailLabel.setupLineHeight(myText: "We have not listed any upcoming\nevents for the coins you have filtered for", myLineSpacing: 4)
        allEventsEmptyState.lockDetailLabel.textAlignment = .center
        allEventsEmptyState.squadUpButton.setTitle("Browse users", for: .normal)
        allEventsEmptyState.backgroundColor = .clear
        allEventsEmptyState.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(allEventsEmptyState)
        allEventsEmptyState.centerXAnchor.constraint(equalTo: mainFeedTableView.centerXAnchor).isActive = true
        allEventsEmptyState.centerYAnchor.constraint(equalTo: mainFeedTableView.centerYAnchor, constant: 0).isActive = true
        allEventsEmptyState.heightAnchor.constraint(equalToConstant: 245).isActive = true
        allEventsEmptyState.widthAnchor.constraint(equalToConstant: 305).isActive = true
        
        newEventsEmptyState.isUserInteractionEnabled = false
        newEventsEmptyState.layer.zPosition = 100
        newEventsEmptyState.isHidden = true
        newEventsEmptyState.squadUpButton.isHidden = true
        newEventsEmptyState.lockLabel.text = "🥳🤩"
        newEventsEmptyState.lockTitleLabel.text = "No New Events"
        newEventsEmptyState.lockDetailLabel.setupLineHeight(myText: "New events for coins that we\nfeature will be added here", myLineSpacing: 4)
        newEventsEmptyState.lockDetailLabel.textAlignment = .center
        newEventsEmptyState.squadUpButton.setTitle("Browse users", for: .normal)
        newEventsEmptyState.backgroundColor = .clear
        newEventsEmptyState.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(newEventsEmptyState)
        newEventsEmptyState.centerXAnchor.constraint(equalTo: mainFeedTableView.centerXAnchor).isActive = true
        newEventsEmptyState.centerYAnchor.constraint(equalTo: mainFeedTableView.centerYAnchor, constant: 0).isActive = true
        newEventsEmptyState.heightAnchor.constraint(equalToConstant: 245).isActive = true
        newEventsEmptyState.widthAnchor.constraint(equalToConstant: 305).isActive = true
        
        importantEmptyState.isUserInteractionEnabled = false
        importantEmptyState.layer.zPosition = 100
        importantEmptyState.isHidden = true
        importantEmptyState.squadUpButton.isHidden = true
        importantEmptyState.lockLabel.text = "🚀🌕"
        importantEmptyState.lockTitleLabel.text = "No Important Events"
        importantEmptyState.lockDetailLabel.setupLineHeight(myText: "Important events for coins that we\nfeature will be added here", myLineSpacing: 4)
        importantEmptyState.lockDetailLabel.textAlignment = .center
        importantEmptyState.squadUpButton.setTitle("Browse users", for: .normal)
        importantEmptyState.backgroundColor = .clear
        importantEmptyState.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(importantEmptyState)
        importantEmptyState.centerXAnchor.constraint(equalTo: mainFeedTableView.centerXAnchor).isActive = true
        importantEmptyState.centerYAnchor.constraint(equalTo: mainFeedTableView.centerYAnchor, constant: 0).isActive = true
        importantEmptyState.heightAnchor.constraint(equalToConstant: 245).isActive = true
        importantEmptyState.widthAnchor.constraint(equalToConstant: 305).isActive = true
        
        watchListEmptyState.isUserInteractionEnabled = false
        watchListEmptyState.layer.zPosition = 100
        watchListEmptyState.isHidden = true
        watchListEmptyState.squadUpButton.isHidden = true
        watchListEmptyState.lockLabel.text = "👀🧐"
        watchListEmptyState.lockTitleLabel.text = "No Watchlist Events"
        watchListEmptyState.lockDetailLabel.setupLineHeight(myText: "Any events you add to your\nwatchlist will show up here", myLineSpacing: 4)
        watchListEmptyState.lockDetailLabel.textAlignment = .center
        watchListEmptyState.squadUpButton.setTitle("Browse users", for: .normal)
        watchListEmptyState.backgroundColor = .clear
        watchListEmptyState.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(watchListEmptyState)
        watchListEmptyState.centerXAnchor.constraint(equalTo: mainFeedTableView.centerXAnchor).isActive = true
        watchListEmptyState.centerYAnchor.constraint(equalTo: mainFeedTableView.centerYAnchor, constant: 0).isActive = true
        watchListEmptyState.heightAnchor.constraint(equalToConstant: 245).isActive = true
        watchListEmptyState.widthAnchor.constraint(equalToConstant: 305).isActive = true
        
        
    }
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension EventFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var source: [Post]!
        
        showAllList = false
        
        if !filteredCoins.isEmpty {
            if segmentioControl.selectedSegmentioIndex == 0 {
                source = self.posts.filter({filteredCoins.contains($0.coinSymbol ?? "")})
                if source.count > 0 {
                    showAllList = false
                } else {
                    showAllList = true
                }
                                
            } else if segmentioControl.selectedSegmentioIndex == 1 {
                source = self.importantPosts.filter({filteredCoins.contains($0.coinSymbol ?? "")})
                if source.count > 0 {
                    showImportantList = false
                } else {
                    showImportantList = true
                }
            } else if segmentioControl.selectedSegmentioIndex == 2 {
                source = self.newPosts.filter({filteredCoins.contains($0.coinSymbol ?? "")})
                if source.count > 0 {
                    showNewlist = false
                } else {
                    showNewlist = true
                }
                                
            } else if segmentioControl.selectedSegmentioIndex == 3 {
                source = self.watchlistPosts.filter({filteredCoins.contains($0.coinSymbol ?? "")})
                if source.count > 0 {
                    showWatchList = false
                } else {
                    showWatchList = true
                }
            }
        } else if segmentioControl.selectedSegmentioIndex == 0 {
            source = self.posts
        } else if segmentioControl.selectedSegmentioIndex == 1 {
            source = self.importantPosts
        } else if segmentioControl.selectedSegmentioIndex == 2 {
            source = self.newPosts
        } else if segmentioControl.selectedSegmentioIndex == 3 {
            source = self.watchlistPosts
        }
        
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainFeedCardTableViewCell, for: indexPath) as! MainFeedCardTableViewCell
        
        var source: [Post]!
        
        if !filteredCoins.isEmpty {
            if segmentioControl.selectedSegmentioIndex == 0 {
                source = self.posts.filter({filteredCoins.contains($0.coinSymbol ?? "")})
            } else if segmentioControl.selectedSegmentioIndex == 1 {
                source = self.importantPosts.filter({filteredCoins.contains($0.coinSymbol ?? "")})
            } else if segmentioControl.selectedSegmentioIndex == 2 {
                source = self.newPosts.filter({filteredCoins.contains($0.coinSymbol ?? "")})
            } else if segmentioControl.selectedSegmentioIndex == 3 {
                source = self.watchlistPosts.filter({filteredCoins.contains($0.coinSymbol ?? "")})
            }
            
        } else if segmentioControl.selectedSegmentioIndex == 0 {
            source = self.posts
        } else if segmentioControl.selectedSegmentioIndex == 1 {
            source = self.importantPosts
        } else if segmentioControl.selectedSegmentioIndex == 2 {
            source = self.newPosts
        } else if segmentioControl.selectedSegmentioIndex == 3 {
            source = self.watchlistPosts
        }
        
        let post = source[indexPath.row]
        
        cell.eventTypeLabel.text = post.type
        cell.headlineLabel.text = post.name
        
        
        if let coinSymbol = post.coinSymbol {
            cell.cryptoImageView.image = UIImage(named: "\(coinSymbol)")
        } else {
            cell.cryptoImageView.image = nil
            cell.cryptoImageView.backgroundColor = .red
        }
        
        if let postVerified = post.isVerified {
            if let postImportant = post.isImportant {
                if postImportant {
                    cell.importantEventImageView.isHidden = false
                } else {
                    cell.importantEventImageView.isHidden = true
                }
                
                if postVerified {
                    cell.verifiedEventImageView.isHidden = false
                } else {
                    cell.verifiedEventImageView.isHidden = true
                }
                
                if postImportant == true && postVerified == false {
                    cell.verifiedEventImageView.isHidden = false
                    cell.importantEventImageView.isHidden = true
                    cell.verifiedEventImageView.image = UIImage(named: "importantEvent")
                    cell.importantEventImageView.image = UIImage(named: "importantEvent")
                } else {
                    cell.verifiedEventImageView.image = UIImage(named: "verifiedEvent")
                    cell.importantEventImageView.image = UIImage(named: "importantEvent")
                }
            }
        }
        
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy"//"MM/dd/yyyy hh:mm a"
        
        // Apply date format
        if let postEventDate = post.eventDate {
            let selectedDate: String = dateFormatter.string(from: postEventDate)
            cell.dateLabel.text = "\(selectedDate)"
        }
        
        //print("\(post.resourceLink) - 🤟🤟🤟")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //return 43
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MainFeedListHeaderView()
        if section == 0 {
            headerView.headerLabel.text = "January 1"
        } else if section == 1 {
            headerView.headerLabel.text = "January 8"
        } else if section == 2 {
            headerView.headerLabel.text = "January 24"
        } else {
            headerView.headerLabel.text = "February 6"
        }
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lightImpactGenerator()
        let eventOptionsVC =  EventOptionsViewController()
        
        var source: [Post]!
        if !filteredCoins.isEmpty {
            source = self.posts.filter({filteredCoins.contains($0.coinSymbol ?? "")})
        } else if segmentioControl.selectedSegmentioIndex == 0 {
            source = self.posts
        } else if segmentioControl.selectedSegmentioIndex == 1 {
            source = self.importantPosts
        } else if segmentioControl.selectedSegmentioIndex == 2 {
            source = self.newPosts
        } else if segmentioControl.selectedSegmentioIndex == 3 {
            source = self.watchlistPosts
            eventOptionsVC.fromWatchList = true
        }
        self.selectedPost = source[indexPath.row]
        eventOptionsVC.post = source[indexPath.row]
        
        eventOptionsVC.delegate = self
        eventOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(eventOptionsVC, animated: false, completion: nil)
    }
    
}
