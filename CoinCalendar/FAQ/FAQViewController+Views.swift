//
//  FAQViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 5/2/21.
//

import Foundation
import UIKit

extension FAQViewController {
    
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
            
            
        case .iphone78() :
            notchOffset = 20
            nvHeight = 140
            backTop = 40
            nvMinimal = 80
            collectionTop = 140
            
            
        case .iphone78Plus() :
            notchOffset = 20
            nvHeight = 140
            backTop = 40
            nvMinimal = 80
            collectionTop = 140
            
            
        case .iphone11Max() :
            backTop = 60
            nvHeight = 140
            nvMinimal = 100
            
            
        case .iphone12AndPro() :
            backTop = 60
            nvHeight = 140
            nvMinimal = 100
            
            
        case .iphone12ProMax() :
            backTop = 60
            nvHeight = 140
            nvMinimal = 100
            
            
        default:
            notchOffset = 44
            backTop = 60
            nvHeight = 140
            nvMinimal = 100
            
        }
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
        
        backButton.addTarget(self, action: #selector(dimissVC), for: .touchUpInside)
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
        
        gamesLabel.text = "FAQ"
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
    
    func setupViews() {
        
        //TableView
        
        faqTableView = UITableView(frame: self.view.frame, style: .grouped)
        faqTableView.isScrollEnabled = true
        faqTableView.backgroundColor = .clear
        faqTableView.delegate = self
        faqTableView.dataSource = self
        faqTableView.register(FAQTableViewCell.self, forCellReuseIdentifier: faqTableViewCell)
        faqTableView.allowsSelection = true
        faqTableView.allowsMultipleSelection = false
        faqTableView.contentInset = .zero
        faqTableView.showsVerticalScrollIndicator = true
        faqTableView.separatorStyle = .none
        faqTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        faqTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(faqTableView)
        faqTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        faqTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        faqTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        faqTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension FAQViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: faqTableViewCell, for: indexPath) as! FAQTableViewCell
        
        let questionString = questions[indexPath.row]
        cell.questionLabel.setupLineHeight(myText: questionString, myLineSpacing: 4)
        let answerString = answers[indexPath.row]
        cell.faqLabel.setupLineHeight(myText: answerString, myLineSpacing: 4)        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return nvHeight
    }
    
}
