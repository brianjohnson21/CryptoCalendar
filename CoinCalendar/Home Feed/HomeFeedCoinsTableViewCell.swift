//
//  HomeFeedCoinsTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/1/21.
//

import UIKit

protocol HomeFeedCoinsTableViewCellDelegate: class {
    func didTapOnCoin(coinTapped: Coin)
}

class HomeFeedCoinsTableViewCell: UITableViewCell {

    weak var delegate: HomeFeedCoinsTableViewCellDelegate?
    let sectionTitleLabel = UILabel()
    var globalContactListCollectionViewFlowLayout = UICollectionViewFlowLayout()
    var globalContactListCollectionView: UICollectionView!
    var homeFeedCoinCollectionViewCell = "homeFeedCoinCollectionViewCell"
    
    var coins = [Coin]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        setupViews()
        setupGlobalCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension HomeFeedCoinsTableViewCell {
    func setupViews() {
        
        sectionTitleLabel.text = "Biggest Gainers (24h)"
        sectionTitleLabel.textAlignment = .left
        sectionTitleLabel.font = .sofiaBold(ofSize: 16)
        sectionTitleLabel.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0)//.keyEventHeadlineColorModeLight
        sectionTitleLabel.numberOfLines = 0
        sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sectionTitleLabel)
        sectionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        sectionTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        
    }
    
    func setupGlobalCollectionView() {
        
        // MARK: Setup Collection View Flow Layout
        
        globalContactListCollectionViewFlowLayout.scrollDirection = .horizontal
        globalContactListCollectionViewFlowLayout.itemSize = CGSize(width: 140, height: 146)
        globalContactListCollectionViewFlowLayout.minimumLineSpacing = 10
        globalContactListCollectionViewFlowLayout.minimumInteritemSpacing = 10
        globalContactListCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0 , left: 10, bottom: 0, right: 10)
        globalContactListCollectionViewFlowLayout.estimatedItemSize = CGSize.zero
                
        
        // MARK: Setup Collection View
        
        globalContactListCollectionView = UICollectionView(frame: self.contentView.frame, collectionViewLayout: globalContactListCollectionViewFlowLayout)
        globalContactListCollectionView.layer.masksToBounds = false
        globalContactListCollectionView.tag = 1
        globalContactListCollectionView.dataSource = self
        globalContactListCollectionView.delegate = self
        globalContactListCollectionView.alpha = 1.0
        globalContactListCollectionView.register(HomeFeedCoinCollectionViewCell.self, forCellWithReuseIdentifier: homeFeedCoinCollectionViewCell)
        globalContactListCollectionView.allowsMultipleSelection = true
        globalContactListCollectionView.allowsSelection = true
        globalContactListCollectionView.backgroundColor = .clear
        globalContactListCollectionView.bounces = true
        globalContactListCollectionView.contentInset = .zero
        globalContactListCollectionView.isPagingEnabled = false
        globalContactListCollectionView.isScrollEnabled = true
        globalContactListCollectionView.showsVerticalScrollIndicator = false
        globalContactListCollectionView.showsHorizontalScrollIndicator = false
        globalContactListCollectionView.sizeToFit()
        globalContactListCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        globalContactListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(globalContactListCollectionView)
        globalContactListCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        globalContactListCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        globalContactListCollectionView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 18).isActive = true
        //globalContactListCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        globalContactListCollectionView.heightAnchor.constraint(equalToConstant: 146).isActive = true
                
    }
}

//MARK: COLLECTIONVIEW DELEGATE & DATASOURCE

extension HomeFeedCoinsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeFeedCoinCollectionViewCell, for: indexPath) as! HomeFeedCoinCollectionViewCell
        
        let coin = coins[indexPath.row]
        
        if let coinSymbol = coin.symbol {
            cell.coinImageView.image = UIImage(named: "\(coinSymbol)")
        } else {
            cell.coinImageView.image = nil
            cell.coinImageView.backgroundColor = .red
        }
        
        cell.coinNameLabel.text = coin.name
        
        //let roundedPrice = coin.price?.rounded()
        
        if let coinPrice = coin.price {
//            if coinPrice < 1.0 {
//                cell.coinPriceLabel.text = "$\(coinPrice)"
//            } else {
//                cell.coinPriceLabel.text = "$\(coinPrice.rounded(toPlaces: 2))"
//            }
            
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
            
        }
                
        cell.upDownImageView.image = coin.percentChange24Hours ?? 0 > 0.0 ? UIImage(named: "greenArrowUp") : UIImage(named: "redArrowDown")
        cell.upDownLabel.text = "\(coin.percentChange24Hours ?? 0)%"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapOnCoin(coinTapped: coins[indexPath.row])
    }
}

public enum RoundingPrecision {
    case ones
    case tenths
    case hundredths
}

// Round to the specific decimal place
public func preciseRound(
    _ value: Double,
    precision: RoundingPrecision = .ones) -> Double
{
    switch precision {
    case .ones:
        return round(value)
    case .tenths:
        return round(value * 10) / 10.0
    case .hundredths:
        return round(value * 100) / 100.0
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
