//
//  DiscoverSpotlightTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/18/21.
//

import UIKit
import Kingfisher

protocol DiscoverSpotlightTableViewCellDelegate: class {
    func didSelectExpertFromSpotlight(expert: Admin)
}

class DiscoverSpotlightTableViewCell: UITableViewCell {
    
    weak var delegate: DiscoverSpotlightTableViewCellDelegate?
    var titleLabel = UILabel()
    var globalContactListCollectionViewFlowLayout = UICollectionViewFlowLayout()
    var globalContactListCollectionView: UICollectionView!
    var spotlightCollectionViewCell = "spotlightCollectionViewCell"
    var cellHeight: CGFloat = 352
    var cellWidth: CGFloat = 333
    
//    var spotlightExperts: [[String]] = [["spotlightOne", "John Horne", "172"], ["spotlightTwo", "Clive Miller", "198"], ["tempHeadShot", "Jason Estrada", "252"]]
    
    var spotlightExperts = [Admin]()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        modifyConstraints()
        setupViews()
        setupGlobalCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension DiscoverSpotlightTableViewCell {
    
    func modifyConstraints() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        switch screenHeight {
        case .iphone5() :
            cellHeight = 352
            cellWidth = 333
            
        case .iphone78() :
            cellHeight = 348
            cellWidth = 329
            
        case .iphone78Plus() :
            cellHeight = 389
            cellWidth = 368
            
        case .iphone11Max() :
            cellHeight = 389
            cellWidth = 368
            
        case .iphone12AndPro() :
            cellHeight = 364
            cellWidth = 344
            
        case .iphone12ProMax() :
            cellHeight = 404
            cellWidth = 382
            
        case .iphone12Mini() :
            cellHeight = 348
            cellWidth = 329
            
        default:
            cellHeight = 352
            cellWidth = 333
        }
    }
    
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
        globalContactListCollectionViewFlowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
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
        return spotlightExperts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: spotlightCollectionViewCell, for: indexPath) as! SpotlightCollectionViewCell
        
        let trader = spotlightExperts[indexPath.row]
        
        if let image = trader.profilePhotoUrl {
            cell.expertImageView.kf.setImage(with: URL(string: image))
        } else {
            cell.expertImageView.image = nil
        }
        
//        cell.expertImageView.image = UIImage(named: spotlightExperts[indexPath.row][0])
        cell.greenRedArrow.image = UIImage(named: "greenArrowDownThree")
        cell.expertNameLabel.text = trader.name
        cell.percentLabel.text = "255%"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectExpertFromSpotlight(expert: spotlightExperts[indexPath.row])
    }
}
