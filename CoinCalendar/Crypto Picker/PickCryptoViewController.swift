//
//  PickCryptoViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/31/21.
//

import UIKit

class PickCryptoViewController: UIViewController {

    var navView = UIView()
    var navHeight: NSLayoutConstraint!
    var titleLabel = UILabel()
    var detailLabel = UILabel()
    
    var globalContactListCollectionViewFlowLayout = UICollectionViewFlowLayout()
    var globalContactListCollectionView: UICollectionView!
    var pickCryptoCollectionViewCell = "pickCryptoCollectionViewCell"
    
    var coinsSelected: [String] = []
    var coins: [[String]] = [["Cardano", "ADA"],
                             ["Theta Fuel", "TFUEL"],
                             ["Bitcoin", "BTC"],
                             ["Polkadot", "DOT"],
                             ["SushiSwap", "SUSHI"],
                             ["Ethereum", "ETH"],
                             ["Chainlink", "LINK"],
                             ["Enjin", "ENJ"],
                             ["Litecoin", "LTC"],
                             ["Uniswap", "UNI"],
                             ["XRP", "XRP"],
                             ["Cardano", "ADA"],
                             ["Theta Fuel", "TFUEL"],
                             ["Bitcoin", "BTC"],
                             ["Polkadot", "DOT"],
                             ["SushiSwap", "SUSHI"],
                             ["Ethereum", "ETH"],
                             ["Chainlink", "LINK"],
                             ["Enjin", "ENJ"],
                             ["Litecoin", "LTC"],
                             ["Uniswap", "UNI"],
                             ["XRP", "XRP"],
                             ["Cardano", "ADA"],
                             ["Theta Fuel", "TFUEL"],
                             ["Bitcoin", "BTC"],
                             ["Polkadot", "DOT"],
                             ["SushiSwap", "SUSHI"],
                             ["Ethereum", "ETH"],
                             ["Chainlink", "LINK"],
                             ["Enjin", "ENJ"],
                             ["Litecoin", "LTC"],
                             ["Uniswap", "UNI"],
                             ["XRP", "XRP"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNav()
        setupGlobalCollectionView()
    }

}

//MARK: SCROLLVIEW DELEGATE

extension PickCryptoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                    
        let yAxis = scrollView.contentOffset.y// + notchOffset
        
        if yAxis <= 60 {
            let navShadow: Float = Float((0.3 * yAxis) / 60)
            navView.layer.shadowOpacity = navShadow
        } else {
            navView.layer.shadowOpacity = 0.3
        }
        
    }
}
