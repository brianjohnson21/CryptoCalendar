//
//  Extensions.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 3/28/21.
//

import UIKit

extension CGFloat {
    
    static func iphone5() -> CGFloat {
        return 568
    }
    
    static func iphone78() -> CGFloat {
        return 667
    }
    
    static func iphone78Plus() -> CGFloat {
        return 736
    }
    
    static func iphoneX() -> CGFloat {
        return 812
    }
    
    static func iphone11Max() -> CGFloat {
        return 896
    }
    
    //iPhone 12
    
    static func iphone12AndPro() -> CGFloat {
        return 844 // x 390
    }
    
    static func iphone12ProMax() -> CGFloat {
        return 926 // x 428
    }
    
    static func iphone12Mini() -> CGFloat {
        return 812 // x 375
    }
        
}

extension UIFont {
    
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }

    static func sofiaRegular(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SofiaPro", size: size)
    }
    
    static func sofiaLight(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SofiaProLight", size: size)
    }
    
    static func sofiaBold(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SofiaPro-Bold", size: size)
    }
    
    static func sofiaMedium(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SofiaPro-Medium", size: size)
    }
    
    static func sofiaSemiBold(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SofiaPro-SemiBold", size: size)
    }
    
}

extension UIView {
    func addBlurToView() {
        var blurEffect: UIBlurEffect!
        if #available(iOS 10.0, *) {
            blurEffect = UIBlurEffect(style: .light)
        } else {
            blurEffect = UIBlurEffect(style: .light)
        }
        
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.bounds
        blurredEffectView.alpha = 1.0
        blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurredEffectView)
        
    }
    
    func removeBlurFromView() {
        for subview in self.subviews {
            if subview is UIVisualEffectView {
                
                UIView.animate(withDuration: 0.35) {
                    subview.alpha = 0
                } completion: { (success) in
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func animateAndFade(timeInt: TimeInterval, delay: TimeInterval, xValue: CGFloat, yValue: CGFloat, aValue: CGFloat) {
        UIView.animate(withDuration: timeInt, delay: delay, options: [], animations: {
            self.transform = CGAffineTransform(translationX: xValue, y: yValue)
            self.alpha = aValue
        }) { (success) in
            //
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func lightImpactGenerator() {
      let impactGenerator = UIImpactFeedbackGenerator(style: .light)
      impactGenerator.prepare()
      impactGenerator.impactOccurred()
    }
    
    func successImpactGenerator() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func heavyImpactGenerator() {
        let impactGenerator = UIImpactFeedbackGenerator(style: .heavy)
      impactGenerator.prepare()
      impactGenerator.impactOccurred()
    }
    
    func jiggleWiggle(arg: Bool, completion: (Bool) -> ()) {
        UIView.animate(withDuration: 0.15, animations: {
          self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }) { (success) in
          UIView.animate(withDuration: 0.15, animations: {
            self.transform = CGAffineTransform(scaleX: 1.02, y: 1.02)
          }, completion: { (success) in
            UIView.animate(withDuration: 0.15, animations: {
              self.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
            }, completion: { (success) in
              UIView.animate(withDuration: 0.15, animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
              }, completion: { (success) in
                print("animation done 💩💩💩")
                //completion(arg)
              })
            })
          })
        }
        completion(arg)
    }
    
    func badWiggle() {
        UIView.animate(withDuration: 0.08, animations: {
          self.transform = CGAffineTransform(translationX: 20, y: 0)
        }) { (success) in
          UIView.animate(withDuration: 0.08, animations: {
            self.transform = CGAffineTransform(translationX: -20, y: 0)
          }, completion: { (success) in
            UIView.animate(withDuration: 0.08, animations: {
              self.transform = CGAffineTransform(translationX: 10, y: 0)
            }, completion: { (success) in
              UIView.animate(withDuration: 0.08, animations: {
                self.transform = CGAffineTransform(translationX: -10, y: 0)
              }, completion: { (success) in
                UIView.animate(withDuration: 0.08, animations: {
                  self.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: { (success) in
                  print("done")
                })
              })
            })
          })
        }
    }
    
    func addShadow(shadowColor: UIColor, shadowOffset: CGSize, shadowOpacity: Float, shadowRadius: CGFloat, shadowCornerRadius: CGFloat) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.cornerRadius = shadowCornerRadius
    }
    
    
}

extension UIViewController {
    func lightImpactGenerator() {
      let impactGenerator = UIImpactFeedbackGenerator(style: .light)
      impactGenerator.prepare()
      impactGenerator.impactOccurred()
    }
    
    func heavyImpactGenerator() {
        let impactGenerator = UIImpactFeedbackGenerator(style: .heavy)
      impactGenerator.prepare()
      impactGenerator.impactOccurred()
    }
    
    func errorImpactGenerator() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    func successImpactGenerator() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func hideTabBar() {
      var viewFrame = self.tabBarController?.tabBar.frame
      let viewHeight = self.tabBarController?.tabBar.frame
      viewFrame?.origin.y = self.view.frame.size.height + 250//(viewHeight!.size.height)
      UIView.animate(withDuration: 0.25, animations: {
        self.tabBarController?.tabBar.frame = viewFrame!
      })
    }
    
    func showTabBar() {
        var viewFrame = self.tabBarController?.tabBar.frame
        let viewHeight = self.tabBarController?.tabBar.frame
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
                        
        switch screenHeight {
        case .iphone5() :
            viewFrame?.origin.y = 729
        case .iphone78() :
            viewFrame?.origin.y = 618
        case .iphone78Plus() :
            viewFrame?.origin.y = 687
        case .iphone11Max() :
            viewFrame?.origin.y = 815
            
        case .iphone12AndPro() :
            viewFrame?.origin.y = 761
            
        case .iphone12ProMax() :
            viewFrame?.origin.y = 844
            
        default:
            viewFrame?.origin.y = 729
        }
        
        //viewFrame?.origin.y = 815//729.0//self.view.frame.size.height - (viewHeight!.size.height)
        
        //print("\(viewFrame?.origin.y) - 🤟🤟🤟")
        
        UIView.animate(withDuration: 0.35, animations: {
            self.tabBarController?.tabBar.frame = viewFrame!
        })
    }

    func setTabBarHidden(_ hidden: Bool, animated: Bool = true, duration: TimeInterval = 0.3) {
        if animated {
            if let frame = self.tabBarController?.tabBar.frame {
                let factor: CGFloat = hidden ? 1 : -1
                let y = frame.origin.y + (frame.size.height * factor)
                UIView.animate(withDuration: duration, animations: {
                    self.tabBarController?.tabBar.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: frame.height)
                })
                return
            }
        }
        self.tabBarController?.tabBar.isHidden = hidden
    }
    
}

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}

extension UILabel {
    
    func setupLineHeight(myText: String, myLineSpacing: CGFloat) {
        
        let attributedString = NSMutableAttributedString(string: myText)

       // *** Create instance of `NSMutableParagraphStyle`
       let paragraphStyle = NSMutableParagraphStyle()

       // *** set LineSpacing property in points ***
       paragraphStyle.lineSpacing = myLineSpacing // Whatever line spacing you want in points

       // *** Apply attribute to string ***
       attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

       // *** Set Attributed String to your label ***
       self.attributedText = attributedString
        
    }
}

extension String {
 
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
 
    func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
                
        return self[indexPosition]
    }
}

extension UIColor {
    
    //Theme Color
    static let themeColorOne = UIColor(red: 129/255, green: 152/255, blue: 238/255, alpha: 1.0)
    static let coinBaseBlue = UIColor(red: 21/255, green: 82/255, blue: 240/255, alpha: 1.0)
    
    //Light Mode
    static let mainFeedBackgroundColorModeLight = UIColor(red: 253/255, green: 252/255, blue: 255/255, alpha: 1.0)
    static let keyEventHeadlineColorModeLight = UIColor(red: 35/255, green: 34/255, blue: 39/255, alpha: 1.0)
    static let keyEventDetailColorModeLight = UIColor(red: 35/255, green: 34/255, blue: 39/255, alpha: 0.6)
    static let navColorModeLight = UIColor(red: 253/255, green: 252/255, blue: 255/255, alpha: 0.6)
    static let themePurple = UIColor(red: 129/255, green: 152/255, blue: 238/255, alpha: 1.0)
    
    //
    static let burntOrange = UIColor(red: 248/255, green: 79/255, blue: 78/255, alpha: 1.0)
    static let grayPurple = UIColor(red: 117/255, green: 116/255, blue: 141/255, alpha: 1.0)
    static let titleGray = UIColor(red: 83/255, green: 89/255, blue: 91/255, alpha: 1.0)
    static let bootyPurple = UIColor(red: 196/255, green: 32/255, blue: 255/255, alpha: 1.0)
    static let nikeBlack = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
    static let lighterNikeBlack = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
    static let bootyPeach = UIColor(red: 255/255, green: 100/255, blue: 97/255, alpha: 1.0)
    static let themeInActive = UIColor(red: 183/255, green: 191/255, blue: 199/255, alpha: 1.0)
    
    //
    static let liveGreen = UIColor(red: 0/255, green: 255/255, blue: 133/255, alpha: 1.0)
    static let themeGray = UIColor(red: 35/255, green: 34/255, blue: 39/255, alpha: 1.0)
    static let pinkTheme = UIColor(red: 231/255, green: 48/255, blue: 158/255, alpha: 1.0)
    static let backgroundTheme = UIColor(red: 31/255, green: 31/255, blue: 31/255, alpha: 1.0)
    
    //Status colors
    
    static let invisileStatus = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1.0)
    static let onlineStatus = UIColor(red: 65/255, green: 220/255, blue: 61/255, alpha: 1.0)
    static let busyStatus = UIColor(red: 220/255, green: 61/255, blue: 61/255, alpha: 1.0)
    static let awayStatus = UIColor(red: 220/255, green: 185/255, blue: 61/255, alpha: 1.0)
    static let unicornStatus = UIColor(red: 220/255, green: 61/255, blue: 204/255, alpha: 1.0)
    static let manBearPigStatus = UIColor(red: 61/255, green: 182/255, blue: 220/255, alpha: 1.0)
    
    //Use this
    static var themeColor: UIColor {
//        do {
//            let myClass = try Disk.retrieve("myClass", from: .caches, as: Class.self)
//            guard let colorString = myClass.themeColor, let colorInt = Int(colorString) else { return UIColor(red: 255/255, green: 126/255, blue: 124/255, alpha: 1.0) }
//
//            return UIColor(rgb: colorInt)
//        } catch {
//            print(error)
//
//            return UIColor(red: 255/255, green: 126/255, blue: 124/255, alpha: 1.0)
//        }
        
        return UIColor(red: 6/255, green: 174/255, blue: 255/255, alpha: 1.0)//(red: 190/255, green: 203/255, blue: 255/255, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension String {
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start ..< end])
    }
    
    var containsAlphabets: Bool {
        //Checks if all the characters inside the string are alphabets
        let set = CharacterSet.letters
        return self.utf16.contains {
            guard let unicode = UnicodeScalar($0) else { return false }
            return set.contains(unicode)
        }
    }
}

// MARK: - NSAttributedString extensions
public extension String {
    
    /// Regular string.
    var regular: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.systemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Bold string.
    var bold: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Underlined string
    var underline: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    /// Strikethrough string.
    var strikethrough: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])
    }
    
    /// Italic string.
    var italic: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Add color to string.
    ///
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString versions of string colored with given color.
    func colored(with color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color])
    }
}

extension Array where Element: NSAttributedString {
    func joined(separator: NSAttributedString) -> NSAttributedString {
        var isFirst = true
        return self.reduce(NSMutableAttributedString()) {
            (r, e) in
            if isFirst {
                isFirst = false
            } else {
                r.append(separator)
            }
            r.append(e)
            return r
        }
    }
    
    func joined(separator: String) -> NSAttributedString {
        return joined(separator: NSAttributedString(string: separator))
    }
}

final class AnimatedLabel: UILabel {
    typealias OptionalCallback = (() -> Void)
    typealias OptionalFormatBlock = (() -> String)

    var completion: OptionalCallback?
    var animationDuration: AnimationDuration = .brisk
    var decimalPoints: DecimalPoints = .zero
    var countingMethod: CountingMethod = .linear
    var customFormatBlock: OptionalFormatBlock?

    private var currentValue: Float {
        if progress >= totalTime { return destinationValue }
        return startingValue + (update(t: Float(progress / totalTime)) * (destinationValue - startingValue))
    }

    private var rate: Float = 0
    private var startingValue: Float = 0
    private var destinationValue: Float = 0
    private var progress: TimeInterval = 0
    private var lastUpdate: TimeInterval = 0
    private var totalTime: TimeInterval = 0
    private var easingRate: Float = 0
    private var timer: CADisplayLink?

    func count(from: Float, to: Float, duration: AnimationDuration = .strolling) {
        startingValue = from
        destinationValue = to
        timer?.invalidate()
        timer = nil

        if duration.value == 0.0 {
            setTextValue(value: to)
            completion?()
            return
        }

        easingRate = 3.0
        progress = 0.0
        totalTime = duration.value
        lastUpdate = Date.timeIntervalSinceReferenceDate
        rate = 3.0

        addDisplayLink()
    }

    func countFromCurrent(to: Float, duration: AnimationDuration = .strolling) {
        count(from: currentValue, to: to, duration: duration)
    }

    func countFromZero(to: Float, duration: AnimationDuration = .strolling) {
        count(from: 0, to: to, duration: duration)
    }

    func stop() {
        timer?.invalidate()
        timer = nil
        progress = totalTime
        completion?()
    }

    private func addDisplayLink() {
        timer = CADisplayLink(target: self, selector: #selector(self.updateValue(timer:)))
        timer?.add(to: .main, forMode: .default)
        timer?.add(to: .main, forMode: .tracking)
    }

    private func update(t: Float) -> Float {
        var t = t

        switch countingMethod {
        case .linear:
            return t
        case .easeIn:
            return powf(t, rate)
        case .easeInOut:
            var sign: Float = 1
            if Int(rate) % 2 == 0 { sign = -1 }
            t *= 2
            return t < 1 ? 0.5 * powf(t, rate) : (sign*0.5) * (powf(t-2, rate) + sign*2)
        case .easeOut:
            return 1.0-powf((1.0-t), rate);
        }
    }

    @objc private func updateValue(timer: Timer) {
        let now: TimeInterval = Date.timeIntervalSinceReferenceDate
        progress += now - lastUpdate
        lastUpdate = now

        if progress >= totalTime {
            self.timer?.invalidate()
            self.timer = nil
            progress = totalTime
        }

        setTextValue(value: currentValue)
        if progress == totalTime { completion?() }
    }

    private func setTextValue(value: Float) {
        text = String(format: customFormatBlock?() ?? decimalPoints.format, value)
    }

}

enum DecimalPoints {
    case zero, one, two, ridiculous

    var format: String {
        switch self {
        case .zero: return "%.0f/5"
        case .one: return "%.0f%%"
        case .two: return "%.2f"
        case .ridiculous: return "%f"
        }
    }
}

enum CountingMethod {
    case easeInOut, easeIn, easeOut, linear
}

enum AnimationDuration {
    case laborious, plodding, strolling, brisk, noAnimation

    var value: TimeInterval {
        switch self {
        case .laborious: return 4.0
        case .plodding: return 15.0
        case .strolling: return 8.0
        case .brisk: return 2.0
        case .noAnimation: return 0.0
        }
    }
}

//
//  SampleNotificationDelegate.swift
//  NotificationSample
//
//  Created by Lucas Goes Valle on 14/03/18.
//  Copyright © 2018 Lucas Goes Valle. All rights reserved.
//

import Foundation
import UserNotifications
import UserNotificationsUI

class SampleNotificationDelegate: NSObject , UNUserNotificationCenterDelegate {
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound])
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Open Action")
        case "Snooze":
            print("Snooze")
        case "Delete":
            print("Delete")
        default:
            print("default")
        }
        completionHandler()
    }
}

//
//  NotificationService.swift
//  Service
//
//  Created by Lucas Goes Valle on 14/03/18.
//  Copyright © 2018 Lucas Goes Valle. All rights reserved.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here...
            bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
            
            var urlString:String? = nil
            if let urlImageString = request.content.userInfo["imageUrl"] as? String {
                urlString = urlImageString
            }
            
            if urlString != nil, let fileUrl = URL(string: urlString!) {
                print("fileUrl: \(fileUrl)")
                
                guard let imageData = NSData(contentsOf: fileUrl) else {
                    contentHandler(bestAttemptContent)
                    return
                }
                guard let attachment = UNNotificationAttachment.saveImageToDisk(fileIdentifier: "image.jpg", data: imageData, options: nil) else {
                    print("error in UNNotificationAttachment.saveImageToDisk()")
                    contentHandler(bestAttemptContent)
                    return
                }
                
                bestAttemptContent.attachments = [ attachment ]
            }
            
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}

@available(iOSApplicationExtension 10.0, *)
extension UNNotificationAttachment {
    
    static func saveImageToDisk(fileIdentifier: String, data: NSData, options: [NSObject : AnyObject]?) -> UNNotificationAttachment? {
        let fileManager = FileManager.default
        let folderName = ProcessInfo.processInfo.globallyUniqueString
        let folderURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(folderName, isDirectory: true)
        
        do {
            try fileManager.createDirectory(at: folderURL!, withIntermediateDirectories: true, attributes: nil)
            let fileURL = folderURL?.appendingPathComponent(fileIdentifier)
            try data.write(to: fileURL!, options: [])
            let attachment = try UNNotificationAttachment(identifier: fileIdentifier, url: fileURL!, options: options)
            return attachment
        } catch let error {
            print("error \(error)")
        }
        
        return nil
    }
}

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}
