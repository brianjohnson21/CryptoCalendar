//
//  API.swift
//  CoinCalendar
//
//  Created by Dylan Reich on 4/7/21.
//


import Foundation
import Disk

enum MError: Error {
    case endpointsNotCached
}

class API: NSObject {
    
    static let sharedInstance = API()
    
    static let serverUrl = "http://ab299a55fcf5f69aa.awsglobalaccelerator.com/" // "http://localhost:8080/"
    
    func performRequest<T: Codable>(endpoint: String, method: String, authenticated: Bool = true, object: T?, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = URL(string: API.serverUrl + endpoint) else {
            print("error generating url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if authenticated {
            request.addAuthToken()
        }
        
        if let object = object {
            do {
                let encoder = JSONEncoder()
                encoder.dateEncodingStrategy = .iso8601
                let data = try encoder.encode(object)
                request.httpBody = data
            } catch {
                print(error)
                completionHandler(nil, nil, error)
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(nil, response, error)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                if httpStatus.statusCode == 401 && authenticated {
                    DispatchQueue.main.async { [weak self] in
                        self?.setWelcomeScreenAsRoot()
                    }
                }
                completionHandler(data, response, error)
                return
            }
            
            completionHandler(data, response, error)
        }
        task.resume()
    }
    
    func performRequest(endpoint: String, method: String, authenticated: Bool = true, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        return performRequest(endpoint: endpoint, method: method, object: Object.Nil, completionHandler: completionHandler)
    }
    
    func setWelcomeScreenAsRoot() {
        //TODO Stephen
    }
    
    func register(user: UserSignup, completionHandler: @escaping (Bool, User?, Error?) -> ()) {
        performRequest(endpoint: "api/users/register", method: "POST", authenticated: false, object: user) { (data, response, error) in
            guard let data = data, error == nil else {
                completionHandler(false, nil, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(CreateUserResponse.self, from: data)
                
                try Disk.save(LToken(token: response.token), to: .applicationSupport, as: "token")
                
                completionHandler(true, response.user, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func sendSMSVerify(user: UserSignup, completionHandler: @escaping (Bool, SMSLoginRequest?, Error?) -> ()) {
        performRequest(endpoint: "api/signup/verify", method: "POST", authenticated: true, object: user) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(SMSLoginRequest.self, from: data)
                
                completionHandler(true, response, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func sendSMSVerifyLogin(loginRequest: SMSLoginAttempt, completionHandler: @escaping (Bool, User?, Error?, Int?) -> ()) {
        performRequest(endpoint: "api/signup/verifylogin", method: "POST", authenticated: true, object: loginRequest) { (data, response, error) in
            guard let data = data, error == nil, (response as? HTTPURLResponse)?.statusCode != 406 else {
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error, ((response as? HTTPURLResponse)?.statusCode ?? -1))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(CreateUserResponse.self, from: data)
                
                try Disk.save(LToken(token: response.token), to: .applicationSupport, as: "token")
                
                completionHandler(true, response.user, nil, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error, nil)
            }
        }
    }
    
    func updateUser(user: User, completionHandler: @escaping (Bool, User?, Error?) -> ()) {
        performRequest(endpoint: "api/users/update", method: "PUT", authenticated: true, object: user) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let user = try decoder.decode(User.self, from: data)
                
                completionHandler(true, user, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func emailLogin(loginRequest: EmailLoginAttempt, completionHandler: @escaping (Bool, User?, Error?, Int?) -> ()) {
        performRequest(endpoint: "api/signup/emaillogin", method: "POST", authenticated: true, object: loginRequest) { (data, response, error) in
            guard let data = data, error == nil, (response as? HTTPURLResponse)?.statusCode != 406 else {
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error, ((response as? HTTPURLResponse)?.statusCode ?? -1))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(CreateUserResponse.self, from: data)
                
                try Disk.save(LToken(token: response.token), to: .applicationSupport, as: "token")
                
                completionHandler(true, response.user, nil, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error, nil)
            }
        }
    }
    
    func getCoins(completionHandler: @escaping (Bool, [Coin]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/coins/all", method: "GET", authenticated: true) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let coins = try decoder.decode([Coin].self, from: data)
                
                completionHandler(true, coins, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func getCoins(coins: [String], completionHandler: @escaping (Bool, [Coin]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/coins?coins=\(coins.joined(separator: ","))", method: "GET", authenticated: true) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let coins = try decoder.decode([Coin].self, from: data)
                
                completionHandler(true, coins, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func getCoinOfDay(completionHandler: @escaping (Bool, Coin?, Error?) -> ()) {
        performRequest(endpoint: "api/users/coins/coinofday", method: "GET", authenticated: true) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let coin = try decoder.decode(Coin.self, from: data)
                
                completionHandler(true, coin, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func getPosts(completionHandler: @escaping (Bool, [Post]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/posts", method: "GET", authenticated: true) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let posts = try decoder.decode([Post].self, from: data)
                
                completionHandler(true, posts, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func getPortfolios(admin: Admin, completionHandler: @escaping (Bool, [Portfolio]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/portfolio/admin?id=\(admin.id.uuidString)", method: "GET", authenticated: true) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let portfolios = try decoder.decode([Portfolio].self, from: data)
                
                completionHandler(true, portfolios, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func getAdmins(completionHandler: @escaping (Bool, [Admin]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/admins", method: "GET", authenticated: true) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let admins = try decoder.decode([Admin].self, from: data)
                
                completionHandler(true, admins, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func subscribeToAdmin(admin: Admin, completionHandler: @escaping (Bool, [Coin]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/subscriptions?id=\(admin.id.uuidString)", method: "POST", authenticated: true) { (data, response, error) in
            guard let _ = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
//            do {
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .iso8601
//                let coins = try decoder.decode([Coin].self, from: data)
                
                completionHandler(true, nil, nil)
//            } catch {
//                print(error)
//                completionHandler(false, nil, error)
//            }
        }
    }
    
    func unsubscribeFromAdmin(admin: Admin, completionHandler: @escaping (Bool, [Coin]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/subscriptions?id=\(admin.id.uuidString)", method: "DELETE", authenticated: true) { (data, response, error) in
            guard let _ = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
//            do {
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .iso8601
//                let coins = try decoder.decode([Coin].self, from: data)
                
                completionHandler(true, nil, nil)
//            } catch {
//                print(error)
//                completionHandler(false, nil, error)
//            }
        }
    }
    
    func getAdminWatchlist(admin: Admin, completionHandler: @escaping (Bool, [Coin]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/admins/watchlist?id=\(admin.id.uuidString)", method: "GET", authenticated: true) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let coins = try decoder.decode([Coin].self, from: data)
                
                completionHandler(true, coins, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func getWatchlist(completionHandler: @escaping (Bool, [Coin]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/watchlist", method: "GET", authenticated: true) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let coins = try decoder.decode([Coin].self, from: data)
                
                completionHandler(true, coins, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func getAdminPosts(admin: Admin, completionHandler: @escaping (Bool, [Post]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/posts/admin?id=\(admin.id.uuidString)", method: "GET", authenticated: true) { (data, response, error) in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let posts = try decoder.decode([Post].self, from: data)
                
                completionHandler(true, posts, nil)
            } catch {
                print(error)
                completionHandler(false, nil, error)
            }
        }
    }
    
    func sendToken(token: AToken, completionHandler: @escaping (Bool, [User]?, Error?) -> ()) {
        performRequest(endpoint: "api/users/devicetoken", method: "POST", authenticated: true, object: token) { (data, response, error) in
            guard let _ = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                completionHandler(false, nil, error)
                return
            }
//            do {
//                let users = try JSONDecoder().decode([User].self, from: data)
//
//                completionHandler(true, users, nil)
//            } catch {
//                print(error)
//                completionHandler(false, nil, error)
//            }
            completionHandler(true, nil, nil)
        }
    }
}

struct LToken: Codable {
    var token: String!
}

struct AToken: Codable {
    var token: String!
}

final class Object: Codable {
    static var Nil: Object? //this should never be set
}

extension URLRequest {
    mutating func addAuthToken() {
        let lToken = try? Disk.retrieve("token", from: .applicationSupport, as: LToken.self)
        if let lToken = lToken?.token {
            addValue("Bearer \(lToken)", forHTTPHeaderField: "Authorization")
        }
    }
}

