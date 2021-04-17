//
//  PushParser.swift
//  CoinCalendar
//
//  Created by Dylan Reich on 4/17/21.
//

import Foundation

enum PushFunction: String {
    case message
    case invite
    case userBlocked
}

class PushParser {
    static func parse(dict: [String: Any], body: String) {
//        if let function = dict["function"] as? String {
//
//            var userID: Int?
//
//            if let id = dict["userID"] as? Int {
//                userID = id
//            }
//            switch function {
//            case PushFunction.message.rawValue:
        
        if let objectString = dict["user"] as? String, let data = objectString.data(using: .utf8) { //let json = dict["json"] as? [String: Any],  json["message"
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                
            } catch {
                print(error)
            }
        }
//                break
//            case PushFunction.invite.rawValue:
//                var data: [String: Any]!
//
//                if let inviteDict = dict["invite"] as? [String: Any] {
//                    data = inviteDict
//                } else if let json = dict["json"] as? [String: Any] {
//                    data = json
//                } else {
//                    print("misising something for invite")
//                    return
//                }
//
////                SessionInvite.parseInvite(inviteDict: data, body: body)
//            case PushFunction.userBlocked.rawValue:
//                guard let user = dict["user"] as? User else {
//                    print("user json not present")
//                    return
//                }
//                User.blockedByUser(user: user)
//            default:
//                break
//            }
//        }
    }
}

