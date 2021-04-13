//
//  Post.swift
//  CoinCalendar
//
//  Created by Dylan Reich on 4/13/21.
//

import Foundation

struct Post: Codable {
    var id: UUID!
    var admin: Admin?
    var coinId: UUID?
    var name: String?
    var type: String?
    var coinSymbol: String?
    var coinName: String?
    var resourceLink: String?
    var isFeatured: Bool?
    var isImportant: Bool?
    var isVerified: Bool?
    var eventDate: Date?
    var postDate: Date?
    var updatedDate: Date?
}
