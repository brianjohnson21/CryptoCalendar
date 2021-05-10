//
//  Portfolio.swift
//  CoinCalendar
//
//  Created by Dylan Reich on 5/10/21.
//

import Foundation

class Portfolio: Codable {
    var id: UUID!
    var adminId: UUID?
    var coinId: UUID?
    var exchange: String?
    var coinSymbol: String?
    var coinName: String?
    var price: Double?
    var portfolioDate: Date?
    var updatedDate: Date?
}

extension Portfolio: CustomStringConvertible {
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

extension Portfolio: Equatable {
    public static func == (lhs: Portfolio, rhs: Portfolio) -> Bool {
        return lhs.id == rhs.id
    }
}
