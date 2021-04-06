//
//  HomeFeedCoinsTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/1/21.
//

import UIKit

class HomeFeedCoinsTableViewCell: UITableViewCell {

    let sectionTitleLabel = UILabel()
    
    var globalContactListCollectionViewFlowLayout = UICollectionViewFlowLayout()
    var globalContactListCollectionView: UICollectionView!
    var homeFeedCoinCollectionViewCell = "homeFeedCoinCollectionViewCell"
    
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
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeFeedCoinCollectionViewCell, for: indexPath) as! HomeFeedCoinCollectionViewCell
        cell.coinImageView.image = UIImage(named: "Bitcoin")
        cell.coinNameLabel.text = "Bitcoin"
        cell.coinPriceLabel.text = "$59,027.45"
        cell.upDownImageView.image = UIImage(named: "redArrowDown")
        cell.upDownLabel.text = "1.22%"
        return cell
    }
}
