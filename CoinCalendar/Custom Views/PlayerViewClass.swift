//
//  PlayerViewClass.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/10/21.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class PlayerViewClass: UIView {

    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

    var playerLayer: AVPlayerLayer {

        return layer as! AVPlayerLayer
    }

    var player: AVPlayer? {
        get {
            return playerLayer.player
        }

        set {
            playerLayer.player = newValue
        }
    }
}
