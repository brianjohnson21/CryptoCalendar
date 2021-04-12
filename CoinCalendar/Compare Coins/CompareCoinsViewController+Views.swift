//
//  CompareCoinsViewController+Views.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/11/21.
//

import Foundation
import UIKit

extension CompareCoinsViewController {
    
    func setupCompareContainer() {
        
        if let coinSymbol = comparedCoins[0].symbol {
            compareContainer.coinOneImageView.image = UIImage(named: coinSymbol)
            compareContainer.coinOneShortNameLabel.text = coinSymbol
            compareContainer.shortNameOneLabel.text = coinSymbol
        }
        
        if let coinSymbol = comparedCoins[1].symbol {
            compareContainer.coinTwoImageView.image = UIImage(named: coinSymbol)
            compareContainer.coinTwoShortNameLabel.text = coinSymbol
            compareContainer.shortNameTwoLabel.text = coinSymbol
        }
        
        compareContainer.backgroundColor = .white
        compareContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(compareContainer)
        compareContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        compareContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        compareBottom = compareContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -83)
        compareBottom.isActive = true
        compareHeight = compareContainer.heightAnchor.constraint(equalToConstant: 57)
        compareHeight.isActive = true
        
        //
        
        downArrow.alpha = 0
        downArrow.image = UIImage(named: "downArrowWhite")
        downArrow.setImageColor(color: .keyEventHeadlineColorModeLight)
        downArrow.contentMode = .scaleAspectFill
        downArrow.translatesAutoresizingMaskIntoConstraints = false
        compareContainer.addSubview(downArrow)
        downArrow.centerXAnchor.constraint(equalTo: compareContainer.centerXAnchor, constant: 0).isActive = true
        downArrow.topAnchor.constraint(equalTo: compareContainer.topAnchor, constant: 45).isActive = true
        downArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        downArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        dismissButton.backgroundColor = .clear
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        compareContainer.addSubview(dismissButton)
        dismissButton.leadingAnchor.constraint(equalTo: downArrow.leadingAnchor, constant: -20).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: downArrow.trailingAnchor, constant: 20).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: downArrow.bottomAnchor, constant: 20).isActive = true
        dismissButton.topAnchor.constraint(equalTo: compareContainer.topAnchor, constant: 0).isActive = true
    }
    
    func setupCompareTable() {
                        
        compareFeedTableView = UITableView(frame: self.view.frame, style: .grouped)
        compareFeedTableView.tag = 1
        compareFeedTableView.alpha = 0
        compareFeedTableView.isScrollEnabled = true
        compareFeedTableView.backgroundColor = .clear
        compareFeedTableView.delegate = self
        compareFeedTableView.dataSource = self
        compareFeedTableView.register(CompareTableViewCell.self, forCellReuseIdentifier: compareTableViewCell)
        compareFeedTableView.allowsMultipleSelection = false
        compareFeedTableView.contentInset = .zero
        compareFeedTableView.showsVerticalScrollIndicator = false
        compareFeedTableView.separatorStyle = .none
        compareFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        compareFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        compareContainer.addSubview(compareFeedTableView)
        compareFeedTableView.leadingAnchor.constraint(equalTo: compareContainer.leadingAnchor).isActive = true
        compareFeedTableView.trailingAnchor.constraint(equalTo: compareContainer.trailingAnchor).isActive = true
        compareFeedTableView.bottomAnchor.constraint(equalTo: compareContainer.bottomAnchor).isActive = true
        compareFeedTableView.topAnchor.constraint(equalTo: compareContainer.topContainer.bottomAnchor).isActive = true
    }
    
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension CompareCoinsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyMetrics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: compareTableViewCell, for: indexPath) as! CompareTableViewCell
        cell.keyMetricLabel.text = keyMetrics[indexPath.row]
        cell.leftLabel.text = "$1.20"
        cell.rightLabel.text = "$35.50"
        if indexPath.row == 6 {
            
            if let volatility = comparedCoins[0].volatility {
                if volatility < 0.025 {
                    cell.leftVolatility.image = UIImage(named: "lowVolatiity")
                } else if volatility < 0.05 {
                    cell.leftVolatility.image = UIImage(named: "medVolatiity")
                } else if volatility < 0.075 {
                    cell.leftVolatility.image = UIImage(named: "highVolatiity")
                } else {
                    cell.leftVolatility.image = UIImage(named: "veryHighVolatiity")
                }
            } else {
                cell.leftVolatility.image = nil
            }
            
            if let volatility = comparedCoins[1].volatility {
                if volatility < 0.025 {
                    cell.rightVolatility.image = UIImage(named: "lowVolatiity")
                } else if volatility < 0.05 {
                    cell.rightVolatility.image = UIImage(named: "medVolatiity")
                } else if volatility < 0.075 {
                    cell.rightVolatility.image = UIImage(named: "highVolatiity")
                } else {
                    cell.rightVolatility.image = UIImage(named: "veryHighVolatiity")
                }
            } else {
                cell.rightVolatility.image = nil
            }
            
            cell.rightVolatility.isHidden = false
            cell.leftVolatility.isHidden = false
            cell.rightLabel.isHidden = true
            cell.leftLabel.isHidden = true
        } else {
            cell.rightVolatility.isHidden = true
            cell.leftVolatility.isHidden = true
            cell.rightLabel.isHidden = false
            cell.leftLabel.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    
}
