//
//  User.swift
//  CoinCalendar
//
//  Created by Dylan Reich on 4/7/21.
//

import Foundation
import Disk

final class User: Codable {
    var id: UUID?
    var name: String?
    var email: String?
    var interests: [String]?
    var remainingSubs: Int?
    var profilePhotoUrl: String?
    var watchlist: [String]?
    
    var coins: [Coin] {
        do {
            return try Disk.retrieve("usercoins", from: .caches, as: [Coin].self)
        } catch {
            return []
        }
    }
    
    var watchlistPosts: [Post] {
        do {
            return try Disk.retrieve("userposts", from: .caches, as: [Post].self)
        } catch {
            return []
        }
    }
    
    init() {
        
    }
    
    static var current: User {
        get {
            guard let c = _current else {
                _current = User()
                return _current!
            }
            return c
        }
        
        set {
            if newValue.id != _current?.id {
                print("bad bad error")
                print(newValue)
                print(_current as Any)
                print("wow")
            }
            _current = newValue
        }
    }
    
    private static var _current: User?
    
    static func saveCurrentUser() {
        do {
            try Disk.save(current, to: .caches, as: "currentUser")
        } catch {
            print(error)
        }
    }
    
    static func restoreCurrentUser() -> Bool {
        do {
            let user = try Disk.retrieve("currentUser", from: .caches, as: User.self)
            current = user
            
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    
    
    static func addPostToWatchlist(post: Post) {
        do {
            var userposts = try Disk.retrieve("userposts", from: .caches, as: [Post].self)
            
            userposts.append(post)
            
            do {
                try Disk.save(userposts, to: .caches, as: "userposts")
            } catch {
                print(error)
            }
        } catch {
            print(error)
            do {
                try Disk.save([post], to: .caches, as: "userposts")
            } catch {
                print(error)
            }
        }
    }
}

extension User: CustomStringConvertible {
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

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

final class UserSignup: Codable {
    var id: Int?
    var phone: String?
    var name: String?
    var email: String?
    var facebookId: String?
    var appleId: String?
    var password: String?
    var youtube: String?
    var twitch: String?
    var twitter: String?
    var instagram: String?
    var tiktok: String?
    
    init(phone: String? = nil, name: String? = nil, email: String? = nil, facebookId: String? = nil, appleId: String? = nil, password: String? = nil) {
        self.phone = phone
        self.name = name
        self.email = email
        self.facebookId = facebookId
        self.appleId = appleId
        self.password = password
    }
}

final class CreateUserResponse: Codable {
    var user: User!
    var token: String
}

final class SMSLoginRequest: Codable {
    var id: String!
    
    public func attempt(code: String, phone: String) -> SMSLoginAttempt {
        return SMSLoginAttempt(id: self.id, code: code, phone: phone)
    }
}

final class SMSLoginAttempt: Codable {
    var id: String!
    var code: String!
    var phone: String!
    
    init(id: String, code: String, phone: String) {
        self.id = id
        self.code = code
        self.phone = phone
    }
}

final class SMSLoginAttemptName: Codable {
    var id: String!
    var code: String!
    var phone: String?
    var name: String?
    
    init(id: String, code: String, phone: String?, name: String?) {
        self.id = id
        self.code = code
        self.phone = phone
        self.name = name
    }
}

struct EmailLoginAttempt: Codable {
    var email: String!
}

final class FacebookLoginAttempt: Codable {
    var facebookId: String!
    var token: String!
    
    init(facebookId: String, token: String) {
        self.facebookId = facebookId
        self.token = token
    }
}

struct AppleLoginAttempt: Codable {
    var appleId: String!
}
