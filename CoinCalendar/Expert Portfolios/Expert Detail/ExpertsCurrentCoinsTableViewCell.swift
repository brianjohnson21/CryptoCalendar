//
//  ExpertsCurrentCoinsTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import UIKit

protocol ExpertsCurrentCoinsTableViewCellDelegate: class {
    func currentCoinsIno()
}

class ExpertsCurrentCoinsTableViewCell: UITableViewCell {
    
    weak var delegate: ExpertsCurrentCoinsTableViewCellDelegate?
    var titleLabel = UILabel()
    var infoImageView = UIImageView()
    var infoButton = UIButton()
    var coinsContainer = UIView()
    var coinImagesContainer = UIView()
    var dataContainer = UIView()
    
    var coinIconFeedContainer = UIView()
    var coinIconFeedTableView = UITableView()
    var coinIconFeedTableViewCell = "coinIconFeedTableViewCell"
    var coinTitleLabel = UILabel()
    
    var dataHeadersScrollView = UIScrollView()
    var coinHealthContainer = UIView()
    var coinHealthLabel = UILabel()
    
    var priceScoreContainer = UIView()
    var priceScoreLabel = UILabel()
    
    var volatilityContainer = UIView()
    var volatilityLabel = UILabel()
    
    var mainFeedContainer = UIScrollView()
    var mainFeedTableView = UITableView()
    var expertCurrentCoinMarketFeedTableViewCell = "expertCurrentCoinMarketFeedTableViewCell"
    
    var entryLabel = UILabel()
    var currentLabel = UILabel()
    var percetLabel = UILabel()
    var dividerLine = UIView()
    
    var currentCoins: [[String]] = [["ADA", "Cardano", "$1.05", "$1.35", "10.24%", "20"], ["BTC", "Bitcoin", "$18,450.19", "$57,857.11", "2.24%", "30"], ["TFUEL", "Theta Fuel", "$0.012", "$0.309", "9.53%", "15"], ["UNI", "Uniswap", "$26.98", "$32.10", "7.49%", "10"], ["ENJ", "Enjin Coin", "$1.42", "$2.60", "17.56%", "15"]]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .white
        self.selectionStyle = .none
        setupViews()
        setupCoinTable()
        setupHeaders()
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension ExpertsCurrentCoinsTableViewCell {
    func setupViews() {
        titleLabel.text = "Live Portfolio"
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.font = .sofiaSemiBold(ofSize: 18)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36).isActive = true
        
        infoImageView.image = UIImage(named: "info")
        infoImageView.contentMode = .scaleAspectFill
        infoImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoImageView)
        infoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21).isActive = true
        infoImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0).isActive = true
        infoImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        infoImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        infoButton.addTarget(self, action: #selector(didTapInfo), for: .touchUpInside)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoButton)
        infoButton.leadingAnchor.constraint(equalTo: infoImageView.leadingAnchor, constant: -10).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        infoButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: infoImageView.bottomAnchor, constant: 5).isActive = true
        
        coinsContainer.backgroundColor = .clear
        coinsContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinsContainer)
        coinsContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        coinsContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        coinsContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        coinsContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 13).isActive = true
        
        coinImagesContainer.backgroundColor = .white
        coinImagesContainer.translatesAutoresizingMaskIntoConstraints = false
        coinsContainer.addSubview(coinImagesContainer)
        coinImagesContainer.leadingAnchor.constraint(equalTo: coinsContainer.leadingAnchor, constant: 15).isActive = true
        coinImagesContainer.topAnchor.constraint(equalTo: coinsContainer.topAnchor, constant: 0).isActive = true
        coinImagesContainer.widthAnchor.constraint(equalToConstant: 43).isActive = true
        coinImagesContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        coinTitleLabel.text = "Coin"
        coinTitleLabel.textAlignment = .center
        coinTitleLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        coinTitleLabel.font = .sofiaMedium(ofSize: 16)
        coinTitleLabel.numberOfLines = 0
        coinTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        coinImagesContainer.addSubview(coinTitleLabel)
        coinTitleLabel.centerXAnchor.constraint(equalTo: coinImagesContainer.centerXAnchor).isActive = true
        coinTitleLabel.centerYAnchor.constraint(equalTo: coinImagesContainer.centerYAnchor).isActive = true
                        
    }
    
    func setupCoinTable() {
        
        coinIconFeedContainer.backgroundColor = .clear
        coinIconFeedContainer.translatesAutoresizingMaskIntoConstraints = false
        coinsContainer.addSubview(coinIconFeedContainer)
        coinIconFeedContainer.leadingAnchor.constraint(equalTo: coinImagesContainer.leadingAnchor, constant: -12).isActive = true
        coinIconFeedContainer.trailingAnchor.constraint(equalTo: coinImagesContainer.trailingAnchor, constant: 0).isActive = true
        coinIconFeedContainer.topAnchor.constraint(equalTo: coinImagesContainer.bottomAnchor).isActive = true
        coinIconFeedContainer.bottomAnchor.constraint(equalTo: coinsContainer.bottomAnchor).isActive = true
        //coinIconFeedContainer.widthAnchor.constraint(equalToConstant: 43).isActive = true
        
        coinIconFeedTableView = UITableView(frame: self.frame, style: .grouped)
        coinIconFeedTableView.tag = 1
        coinIconFeedTableView.alpha = 1.0
        coinIconFeedTableView.isScrollEnabled = false
        coinIconFeedTableView.backgroundColor = .clear
        coinIconFeedTableView.delegate = self
        coinIconFeedTableView.dataSource = self
        coinIconFeedTableView.register(CoinIconFeedTableViewCell.self, forCellReuseIdentifier: coinIconFeedTableViewCell)
        coinIconFeedTableView.allowsMultipleSelection = false
        coinIconFeedTableView.contentInset = .zero
        coinIconFeedTableView.showsVerticalScrollIndicator = false
        coinIconFeedTableView.separatorStyle = .none
        coinIconFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        coinIconFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        coinIconFeedContainer.addSubview(coinIconFeedTableView)
        coinIconFeedTableView.fillSuperview()
    }
    
    func setupHeaders() {
        //
        dataHeadersScrollView.tag = 3
        dataHeadersScrollView.showsHorizontalScrollIndicator = false
        dataHeadersScrollView.layer.zPosition = 100
        dataHeadersScrollView.backgroundColor = .clear
        dataHeadersScrollView.contentSize = CGSize(width: self.frame.width * 1.1, height: 50)
        dataHeadersScrollView.delegate = self
        dataHeadersScrollView.translatesAutoresizingMaskIntoConstraints = false
        coinsContainer.addSubview(dataHeadersScrollView)
        dataHeadersScrollView.leadingAnchor.constraint(equalTo: coinImagesContainer.trailingAnchor, constant: 0).isActive = true
        dataHeadersScrollView.trailingAnchor.constraint(equalTo: coinsContainer.trailingAnchor, constant: 0).isActive = true
        dataHeadersScrollView.topAnchor.constraint(equalTo: coinsContainer.topAnchor, constant: 0).isActive = true
        dataHeadersScrollView.heightAnchor.constraint(equalToConstant: 50).isActive = true
                
        coinHealthContainer.tag = 1
        //coinHealthContainer.addTarget(self, action: #selector(didSelectCoinHeahlth), for: .touchUpInside)
        coinHealthContainer.backgroundColor = .clear
        coinHealthContainer.translatesAutoresizingMaskIntoConstraints = false
        dataHeadersScrollView.addSubview(coinHealthContainer)
        coinHealthContainer.leadingAnchor.constraint(equalTo: dataHeadersScrollView.leadingAnchor, constant: 143).isActive = true //106
        coinHealthContainer.centerYAnchor.constraint(equalTo: dataHeadersScrollView.centerYAnchor, constant: 0).isActive = true
        coinHealthContainer.widthAnchor.constraint(equalToConstant: 59).isActive = true
        coinHealthContainer.heightAnchor.constraint(equalToConstant: 123).isActive = true
        
        priceScoreContainer.tag = 2
        //priceScoreContainer.addTarget(self, action: #selector(didSelectCoinHeahlth), for: .touchUpInside)
        priceScoreContainer.backgroundColor = .clear
        priceScoreContainer.translatesAutoresizingMaskIntoConstraints = false
        dataHeadersScrollView.addSubview(priceScoreContainer)
        priceScoreContainer.leadingAnchor.constraint(equalTo: coinHealthContainer.trailingAnchor, constant: 0).isActive = true
        priceScoreContainer.centerYAnchor.constraint(equalTo: dataHeadersScrollView.centerYAnchor, constant: 0).isActive = true
        priceScoreContainer.widthAnchor.constraint(equalToConstant: 94).isActive = true
        priceScoreContainer.heightAnchor.constraint(equalToConstant: 109).isActive = true
        
        //
        volatilityContainer.tag = 3
        //volatilityContainer.addTarget(self, action: #selector(didSelectCoinHeahlth), for: .touchUpInside)
        volatilityContainer.backgroundColor = .clear
        volatilityContainer.translatesAutoresizingMaskIntoConstraints = false
        dataHeadersScrollView.addSubview(volatilityContainer)
        volatilityContainer.leadingAnchor.constraint(equalTo: priceScoreContainer.trailingAnchor, constant: 0).isActive = true
        volatilityContainer.centerYAnchor.constraint(equalTo: dataHeadersScrollView.centerYAnchor, constant: 0).isActive = true
        volatilityContainer.widthAnchor.constraint(equalToConstant: 79).isActive = true
        volatilityContainer.heightAnchor.constraint(equalToConstant: 109).isActive = true
                
        createSectionLabel(label: entryLabel, string: "Entry", cointainer: coinHealthContainer)
        createSectionLabel(label: currentLabel, string: "Current", cointainer: priceScoreContainer)
        createSectionLabel(label: percetLabel, string: "%", cointainer: volatilityContainer)
    }
    
    func createSectionLabel(label: UILabel, string: String, cointainer: UIView) {
        label.text = string
        label.textAlignment = .right
        label.textColor = UIColor.black.withAlphaComponent(0.6)
        label.font = .sofiaMedium(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        cointainer.addSubview(label)
        label.trailingAnchor.constraint(equalTo: cointainer.trailingAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: cointainer.centerYAnchor, constant: 0).isActive = true
    }
    
    func setupTableView() {

        mainFeedContainer.tag = 0
        mainFeedContainer.delegate = self
        mainFeedContainer.showsHorizontalScrollIndicator = false
        mainFeedContainer.contentSize = CGSize(width: 375 * 1.1, height: 309)
        mainFeedContainer.backgroundColor = .clear
        mainFeedContainer.translatesAutoresizingMaskIntoConstraints = false
        coinsContainer.addSubview(mainFeedContainer)
        mainFeedContainer.leadingAnchor.constraint(equalTo: coinImagesContainer.trailingAnchor, constant: 0).isActive = true
        mainFeedContainer.trailingAnchor.constraint(equalTo: coinsContainer.trailingAnchor, constant: 0).isActive = true
        mainFeedContainer.topAnchor.constraint(equalTo: dataHeadersScrollView.bottomAnchor, constant: 0).isActive = true
        //mainFeedContainer.bottomAnchor.constraint(equalTo: coinsContainer.bottomAnchor, constant: 0).isActive = true
        mainFeedContainer.heightAnchor.constraint(equalToConstant: 310).isActive = true
        
        mainFeedTableView = UITableView(frame: self.frame, style: .grouped)
        mainFeedTableView.tag = 2
        mainFeedTableView.alpha = 1.0
        mainFeedTableView.isScrollEnabled = false
        mainFeedTableView.backgroundColor = .white
        mainFeedTableView.delegate = self
        mainFeedTableView.dataSource = self
        mainFeedTableView.register(ExpertCurrentCoinMarketFeedTableViewCell.self, forCellReuseIdentifier: expertCurrentCoinMarketFeedTableViewCell)
        mainFeedTableView.allowsMultipleSelection = false
        mainFeedTableView.contentInset = .zero
        mainFeedTableView.showsVerticalScrollIndicator = false
        mainFeedTableView.separatorStyle = .none
        mainFeedTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        mainFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        mainFeedContainer.addSubview(mainFeedTableView)
        mainFeedTableView.leadingAnchor.constraint(equalTo: mainFeedContainer.leadingAnchor).isActive = true
        mainFeedTableView.topAnchor.constraint(equalTo: mainFeedContainer.topAnchor).isActive = true
        mainFeedTableView.heightAnchor.constraint(equalToConstant: 310).isActive = true
        mainFeedTableView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        
        dividerLine.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        dividerLine.layer.cornerRadius = 1/2
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dividerLine)
        dividerLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension ExpertsCurrentCoinsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCoins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: coinIconFeedTableViewCell, for: indexPath) as! CoinIconFeedTableViewCell
            cell.coinImageView.image = UIImage(named: currentCoins[indexPath.row][0])
            cell.contentView.backgroundColor = .white
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: expertCurrentCoinMarketFeedTableViewCell, for: indexPath) as! ExpertCurrentCoinMarketFeedTableViewCell
            cell.coinNameLabel.text = currentCoins[indexPath.row][0]
            cell.blockChainNameLabel.text = currentCoins[indexPath.row][1]
            cell.coinHealthLabel.text = currentCoins[indexPath.row][2]
            cell.coinRankLabel.text = currentCoins[indexPath.row][3]
            cell.percentChangeLabel.text = currentCoins[indexPath.row][4]
            cell.percentChangeLabel.textColor = UIColor(red: 36/255, green: 157/255, blue: 48/255, alpha: 1.0)
            cell.priceScoreLabel.text = "\(currentCoins[indexPath.row][5])%"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}

//MARK: SCROLLVIEW DELEGATE

extension ExpertsCurrentCoinsTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                
        //mainFeedContainer.tag = 0
        if scrollView.tag == 0 {
            let xOffset = scrollView.contentOffset.x
            dataHeadersScrollView.contentOffset.x = xOffset
            
//            if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
//                    scrollView.contentOffset.y = 0
//            }
            scrollView.touchesShouldCancel(in: scrollView)
            
        }
        
        //dataHeadersScrollView.tag = 3
        if scrollView.tag == 3 {
            let xOffset = scrollView.contentOffset.x
            mainFeedContainer.contentOffset.x = xOffset
        }
        
    }
}

//MARK: ACTIONS

extension ExpertsCurrentCoinsTableViewCell {
    @objc func didTapInfo() {        
        delegate?.currentCoinsIno()
    }
}
