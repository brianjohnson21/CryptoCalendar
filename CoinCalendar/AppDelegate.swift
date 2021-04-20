//
//  AppDelegate.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit
import SwiftyStoreKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notificationDelegate = SampleNotificationDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupServices()
        
        return true
    }
    
    func setupServices() {
        SwiftyStoreKit.completeTransactions { (purchases) in
            print("completed transactions")
            print(purchases)
            for purchase in purchases {
                User.purchasedIds.append(purchase.productId)
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        API.sharedInstance.sendToken(token: AToken(token: token)) { (success, _, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard success else {
                print("error sending token")
                return
            }
        }
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        ApplicationDelegate.shared.application(app, open: url, options: options)
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print(userInfo)
        
        if (application.applicationState == .background) {
            completionHandler(.noData)
            return
        }
        
        if let aps = userInfo["aps"] as? [String: Any] {
            if let data = userInfo["data"] as? [String: Any] {
                var body = ""
                if let alert = aps["alert"] as? [String: Any], let bodyText = alert["body"] as? String {
                    body = bodyText
                }
                PushParser.parse(dict: data, body: body)
            }
            
            if let alert = aps["alert"] as? NSDictionary {
                if let message = alert["message"] as? NSString {
                    print(message)
                }
            } else if let alert = aps["alert"] as? NSString {
                print(alert)
                print("cut 3")
            }
        }
        
        completionHandler(.newData)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

