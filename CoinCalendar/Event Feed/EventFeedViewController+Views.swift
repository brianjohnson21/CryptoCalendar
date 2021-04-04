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
        
        sortButton.addTarget(self, action: #selector(didTapSortFilter), for: .touchUpInside)
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
            title: "Popular",
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
                color: .themeColorOne),
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

        segmentioControl.valueDidChange = { segmentio, segmentIndex in
            self.lightImpactGenerator()
            print("Selected item: ", segmentIndex)
//            let segmentedIndex = IndexPath(item: segmentIndex, section: 0)
//            self.workoutLibraryTableView.reloadData()

//            let sectionIndex = IndexSet(integer: 1)

            //self.mainFeedCollectionView.reloadData()
            //self.workoutLibraryTableView.reloadSections(sectionIndex, with: .automatic)

            //self.workoutLibraryTableView.reloadSections(NSIndexSet(index: 1) as IndexSet, with: .none)

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
        
        loadingContainer.isHidden = true
        loadingContainer.alpha = 0
        loadingContainer.backgroundColor = .white
        loadingContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loadingContainer)
        loadingContainer.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        loadingContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        loadingContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        loadingContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let checkAnimation = Animation.named("loadingBlocks")
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
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension EventFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainFeedCardTableViewCell, for: indexPath) as! MainFeedCardTableViewCell
        cell.headlineLabel.text = "Headline of key event"
        let detailText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
        cell.detailLabel.setupLineHeight(myText: detailText, myLineSpacing: 3)
        cell.dateLabel.text = "1/6/21"
        cell.cryptoImageView.image = UIImage(named: "Cardano")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 43
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MainFeedListHeaderView()
        headerView.headerLabel.text = "January 1"
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lightImpactGenerator()
        let eventOptionsVC =  EventOptionsViewController()//PickerViewController() //EventOptionsViewController()
        eventOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(eventOptionsVC, animated: false, completion: nil)
    }
    
}
