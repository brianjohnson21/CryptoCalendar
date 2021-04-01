//
//  MyAlertsViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/30/21.
//

import Foundation
import UIKit

extension MyAlertsViewController {
    
    func modifyConstraints() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        switch screenHeight {
        case .iphone5() :
            notchOffset = 20
            nvHeight = 140
            backTop = 40
            nvMinimal = 80
            collectionTop = 140
            discordOffset = 1020
            
            piDimensions = 100
            
        case .iphone78() :
            notchOffset = 20
            nvHeight = 140
            backTop = 40
            nvMinimal = 80
            collectionTop = 140
            discordOffset = 1020
            
            piDimensions = 100
            
        case .iphone78Plus() :
            notchOffset = 20
            nvHeight = 140
            backTop = 40
            nvMinimal = 80
            collectionTop = 140
            discordOffset = 971
            
            piDimensions = 130
            
        case .iphone11() :
            backTop = 60
            discordOffset = 882
            nvHeight = 140
            nvMinimal = 100
            
            piDimensions = 130
            
        case .iphone12AndPro() :
            backTop = 60
            discordOffset = 958
            nvHeight = 140
            nvMinimal = 100
            
            piDimensions = 115
            
        case .iphone12ProMax() :
            backTop = 60
            discordOffset = 958
            nvHeight = 140
            nvMinimal = 100
            
            piDimensions = 130
            
        default:
            discordOffset = 958
            notchOffset = 44
            backTop = 60
            nvHeight = 140
            nvMinimal = 100
            
            piDimensions = 100
        }
    }
    
    func setupViews() {
        mainScrollView.delegate = self
        mainScrollView.isScrollEnabled = true
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.backgroundColor = .backgroundTheme
        mainScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * scrollSize)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainScrollView)
        mainScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainScrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -44).isActive = true
        
        gradientView.isUserInteractionEnabled = false
        gradientView.image = UIImage(named: "darkGradient")
        gradientView.contentMode = .scaleAspectFill
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(gradientView)
        gradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        gradientView.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
    }
    
    func setupNav() {
        
        navView.layer.zPosition = 2
        navView.backgroundColor = .white
        navView.layer.shadowColor = UIColor.black.cgColor
        navView.layer.shadowOffset = CGSize(width: 0, height: 2)
        navView.layer.shadowOpacity = 0
        navView.layer.shadowRadius = 4
        navView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navView)
        navView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        navHeight = navView.heightAnchor.constraint(equalToConstant: nvHeight)
        navHeight.isActive = true
        
        backImageView.image = UIImage(named: "arrow-left")
        backImageView.setImageColor(color: .keyEventHeadlineColorModeLight)
        backImageView.contentMode = .scaleAspectFill
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(backImageView)
        backImageView.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 24).isActive = true
        backImageView.topAnchor.constraint(equalTo: navView.topAnchor, constant: backTop).isActive = true
        backImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        backImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        backButton.addTarget(self, action: #selector(didTapGoBack), for: .touchUpInside)
        backButton.backgroundColor = .clear
        backButton.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 0).isActive = true
        backButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
        backButton.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 20).isActive = true
        backButton.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: 10).isActive = true
        
        gamesGamersContainer.backgroundColor = .clear
        gamesGamersContainer.translatesAutoresizingMaskIntoConstraints = false
        navView.addSubview(gamesGamersContainer)
        ggLeading = gamesGamersContainer.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 24)
        ggLeading.isActive = true
        ggCenterY = gamesGamersContainer.centerYAnchor.constraint(equalTo: backImageView.centerYAnchor, constant: 69)
        ggCenterY.isActive = true
        gamesGamersContainer.widthAnchor.constraint(equalToConstant: 208).isActive = true
        gamesGamersContainer.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        gamesLabel.text = "My Alerts"
        gamesLabel.textAlignment = .left
        gamesLabel.textColor = .keyEventHeadlineColorModeLight
        gamesLabel.font = .sofiaBold(ofSize: 26)
        gamesLabel.numberOfLines = 0
        gamesLabel.translatesAutoresizingMaskIntoConstraints = false
        gamesGamersContainer.addSubview(gamesLabel)
        gamesLeading = gamesLabel.leadingAnchor.constraint(equalTo: gamesGamersContainer.leadingAnchor, constant: 0)
        gamesLeading.isActive = true
        gamesLabel.centerYAnchor.constraint(equalTo: gamesGamersContainer.centerYAnchor).isActive = true
        
    }
    
    func setupTableView() {
        mainFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.isScrollEnabled = true
        mainFeedTableView.backgroundColor = .clear
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(MyAlertsTableViewCell.self, forCellReuseIdentifier: myAlertsTableViewCell)
        mainFeedTableView.allowsMultipleSelection = false
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainFeedTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainFeedTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    }
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension MyAlertsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myAlertsTableViewCell, for: indexPath) as! MyAlertsTableViewCell
        cell.alertTitleLabel.text = "Headline of key event"
        cell.alertDetailLabel.text = "7 days before event"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return nvHeight - 20
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            //self.Items.remove(at: indexPath.row)
            self.mainFeedTableView.deleteRows(at: [indexPath], with: .automatic)
            complete(true)
        }
        
        deleteAction.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
                //self.Items.remove(at: indexPath.row)
                self.mainFeedTableView.deleteRows(at: [indexPath], with: .automatic)
            }
            deleteAction.backgroundColor = .red
            return [deleteAction]
        }
    
}
