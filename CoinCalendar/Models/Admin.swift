//
//  Admin.swift
//  CoinCalendar
//
//  Created by Dylan Reich on 4/7/21.
//

import Foundation

struct Admin: Codable {
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
