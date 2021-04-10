//
//  Coin.swift
//  CoinCalendar
//
//  Created by Dylan Reich on 4/7/21.
//

import Foundation
import Disk

class Coin: Codable {
    var id: UUID?
    var name: String?
    var symbol: String?
    var coinDescription: String?
    var isCoinOfDay: Bool?
    var price: Double?
    var averageSentiment24Hours: Double?
    var socialVolume: Int?
    var socialScore24Hours: Int?
    var healthScore: Double?
    var priceScore: Double?
    var socialScore: Int?
    var volatility: Double?
    var volumeRank: Int?
    var altRank: Int?
    var percentChangeRank: Int?
    var percentChange24Hours: Double?
    var marketCap: Int?
    
    static func addSubscriptionToCache(coin: Coin) {
        do {
            var usercoins = try Disk.retrieve("usercoins", from: .caches, as: [Coin].self)
            
            usercoins.append(coin)
            
            do {
                try Disk.save(usercoins, to: .caches, as: "usercoins")
            } catch {
                print(error)
            }
        } catch {
            print(error)
            do {
                try Disk.save([coin], to: .caches, as: "usercoins")
            } catch {
                print(error)
            }
        }
    }
}
