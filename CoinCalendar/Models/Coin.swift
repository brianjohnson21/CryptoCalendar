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
    
    static func removeSubscriptionToCache(coin: Coin) {
        do {
            var usercoins = try Disk.retrieve("usercoins", from: .caches, as: [Coin].self)
            
            usercoins.removeAll(where: {$0 == coin})
            
            do {
                try Disk.save(usercoins, to: .caches, as: "usercoins")
            } catch {
                print(error)
            }
        } catch {
            print(error)
            print("coin already not present")
        }
    }
}

extension Coin: CustomStringConvertible {
    public var description: String {
        var description = ""
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children {
            if let propertyName = child.label {
                description += "\(propertyName): \(child.value)\n"
            }
        }
        return description
    }
}

extension Coin: Equatable {
    public static func == (lhs: Coin, rhs: Coin) -> Bool {
        return lhs.id == rhs.id
    }
}
