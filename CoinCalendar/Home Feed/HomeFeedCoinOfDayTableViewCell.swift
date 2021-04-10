//
//  HomeFeedCoinOfDayTableViewCell.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/1/21.
//

import UIKit
import AVKit
import AVFoundation

class HomeFeedCoinOfDayTableViewCell: UITableViewCell {
    
    var cardContainer = UIView()
    var coinOfDayLabel = UILabel()
    var coinOfDayContainer = UIView()
    var coinOfDayImageView = UIImageView()
    var playerView = PlayerViewClass()
    var player = AVPlayer()
    var promos: [String] = ["space1Vid"]
    
    var coinIconImageView = UIImageView()
    var coinNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        self.contentView.layer.masksToBounds = false
        self.layer.masksToBounds = false
        
        guard let path = Bundle.main.path(forResource: promos[0], ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: VIEWS

extension HomeFeedCoinOfDayTableViewCell {
    func setupViews() {
                
        cardContainer.backgroundColor = .white
        cardContainer.layer.shadowColor = UIColor.black.cgColor
        cardContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardContainer.layer.shadowOpacity = 0.1
        cardContainer.layer.shadowRadius = 2
        cardContainer.layer.cornerRadius = 14
        cardContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cardContainer)
        cardContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        cardContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        cardContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21).isActive = true
        cardContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        
        coinOfDayContainer.backgroundColor = .white
        coinOfDayContainer.layer.cornerRadius = 14
        coinOfDayContainer.layer.masksToBounds = true
        cardContainer.addSubview(coinOfDayContainer)
        coinOfDayContainer.fillSuperview()
        
        coinOfDayImageView.contentMode = .scaleAspectFill
        coinOfDayImageView.translatesAutoresizingMaskIntoConstraints = false
        coinOfDayContainer.addSubview(coinOfDayImageView)
        coinOfDayImageView.fillSuperview()
        
        let coinOfDayLabelText = "COIN\nOF THE\nDAY"
        coinOfDayLabel.setupLineHeight(myText: coinOfDayLabelText, myLineSpacing: 4)
        coinOfDayLabel.textAlignment = .left
        coinOfDayLabel.textColor = .white//.keyEventHeadlineColorModeLight
        coinOfDayLabel.font = .sofiaBold(ofSize: 42)
        coinOfDayLabel.numberOfLines = 0
        coinOfDayLabel.translatesAutoresizingMaskIntoConstraints = false
        cardContainer.addSubview(coinOfDayLabel)
        coinOfDayLabel.leadingAnchor.constraint(equalTo: cardContainer.leadingAnchor, constant: 17).isActive = true
        coinOfDayLabel.bottomAnchor.constraint(equalTo: cardContainer.bottomAnchor, constant: -25).isActive = true
        
        playerView.backgroundColor = .clear
        playerView.translatesAutoresizingMaskIntoConstraints = false
        coinOfDayContainer.addSubview(playerView)
        playerView.fillSuperview()
        
        playerView.playerLayer.player = player
        playerView.player?.isMuted = false//true//muteVideo
        playerView.player?.play()
        playerView.playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { [weak self] _ in
            self?.player.seek(to: CMTime.zero)
            self?.player.play()

        }
        
        coinIconImageView.backgroundColor = .red
        coinIconImageView.layer.zPosition = 100
        coinIconImageView.layer.cornerRadius = 37/2
        coinIconImageView.layer.masksToBounds = true
        coinIconImageView.contentMode = .scaleAspectFill
        coinIconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinIconImageView)
        coinIconImageView.leadingAnchor.constraint(equalTo: coinOfDayLabel.leadingAnchor, constant: 0).isActive = true
        coinIconImageView.topAnchor.constraint(equalTo: coinOfDayContainer.topAnchor, constant: 22).isActive = true
        coinIconImageView.heightAnchor.constraint(equalToConstant: 37).isActive = true
        coinIconImageView.widthAnchor.constraint(equalToConstant: 37).isActive = true
        
        coinNameLabel.textAlignment = .left
        coinNameLabel.textColor = .white//.keyEventHeadlineColorModeLight
        coinNameLabel.font = .sofiaBold(ofSize: 23)
        coinNameLabel.numberOfLines = 0
        coinNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinNameLabel)
        coinNameLabel.leadingAnchor.constraint(equalTo: coinIconImageView.trailingAnchor, constant: 9).isActive = true
        coinNameLabel.centerYAnchor.constraint(equalTo: coinIconImageView.centerYAnchor, constant: 0).isActive = true
    }
}
