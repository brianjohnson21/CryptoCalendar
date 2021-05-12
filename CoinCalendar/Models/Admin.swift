//
//  Admin.swift
//  CoinCalendar
//
//  Created by Dylan Reich on 4/7/21.
//

import Foundation

class Admin: Codable {
    var id: UUID!
    var name: String?
    var bio: String?
    var ig: String?
    var twitter: String?
    var profilePhotoUrl: String?
    var areSubscribed: Bool
    var subscribers: Int
    var lastSeen: Date?
    var watchlist: [String]?
}

extension Admin: CustomStringConvertible {
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

extension Admin: Equatable {
    public static func == (lhs: Admin, rhs: Admin) -> Bool {
        return lhs.id == rhs.id
    }
}


struct AdminCoin: Codable {
    var admin: Admin
    var coins: [Coin]?
}
