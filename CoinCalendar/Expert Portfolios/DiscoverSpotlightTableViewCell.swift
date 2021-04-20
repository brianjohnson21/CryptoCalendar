//
//  DiscoverSpotlightTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import UIKit

protocol DiscoverSpotlightTableViewCellDelegate: class {
    func didSelectExpertFromSpotlight()
}

class DiscoverSpotlightTableViewCell: UITableViewCell {
    
    weak var delegate: DiscoverSpotlightTableViewCellDelegate?
    var titleLabel = UILabel()
    var globalContactListCollectionViewFlowLayout = UICollectionViewFlowLayout()
    var globalContactListCollectionView: UICollectionView!
    var spotlightCollectionViewCell = "spotlightCollectionViewCell"
    
    var spotlightExperts: [[String]] = [["spotlightOne", "John Horne"], ["spotlightTwo", "Clive Miller"], ["tempHeadShot", "Jason Estrada"]]

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

extension DiscoverSpotlightTableViewCell {
    
    func setupViews() {
        titleLabel.text = "Spotlight"
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.font = .sofiaSemiBold(ofSize: 15)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26).isActive = true
    }
    
    func setupGlobalCollectionView() {
                
        // MARK: Setup Collection View Flow Layout
        
        globalContactListCollectionViewFlowLayout.scrollDirection = .horizontal
        globalContactListCollectionViewFlowLayout.itemSize = CGSize(width: 333, height: 352)
        globalContactListCollectionViewFlowLayout.minimumLineSpacing = 11
        globalContactListCollectionViewFlowLayout.minimumInteritemSpacing = 11
        globalContactListCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0 , left: 23, bottom: 0, right: 23)
        globalContactListCollectionViewFlowLayout.estimatedItemSize = CGSize.zero
                        
        // MARK: Setup Collection View
        
        globalContactListCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: globalContactListCollectionViewFlowLayout)
        globalContactListCollectionView.tag = 1
        globalContactListCollectionView.dataSource = self
        globalContactListCollectionView.delegate = self
        globalContactListCollectionView.alpha = 1.0
        globalContactListCollectionView.register(SpotlightCollectionViewCell.self, forCellWithReuseIdentifier: spotlightCollectionViewCell)
        globalContactListCollectionView.allowsMultipleSelection = false
        globalContactListCollectionView.allowsSelection = true
        globalContactListCollectionView.backgroundColor = .clear
        globalContactListCollectionView.bounces = true
        globalContactListCollectionView.contentInset = .zero
        globalContactListCollectionView.isPagingEnabled = false
        globalContactListCollectionView.isScrollEnabled = true
        globalContactListCollectionView.showsVerticalScrollIndicator = false
        globalContactListCollectionView.showsHorizontalScrollIndicator = false
        globalContactListCollectionView.sizeToFit()
        globalContactListCollectionView.layer.masksToBounds = false
        globalContactListCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        globalContactListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(globalContactListCollectionView)
        globalContactListCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        globalContactListCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        globalContactListCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 27).isActive = true
        globalContactListCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
         
    }
}

//MARK: COLLECTIONVIEW DELEGATE & DATASOURCE

extension DiscoverSpotlightTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: spotlightCollectionViewCell, for: indexPath) as! SpotlightCollectionViewCell
        cell.expertImageView.image = UIImage(named: spotlightExperts[indexPath.row][0])
        cell.greenRedArrow.image = UIImage(named: "greenArrowDownThree")
        cell.percentLabel.text = "252%"
        cell.expertNameLabel.text = spotlightExperts[indexPath.row][1]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectExpertFromSpotlight()
    }
}
