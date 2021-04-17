//
//  InviteFriendsViewController.swift
//  CoinCalendar
//
//  Created by Stephen Mata on 4/16/21.
//

import UIKit
import Contacts
import MessageUI
import Lottie
import UICircularProgressRing

class InviteFriendsViewController: UIViewController {
    
    //HEADER
    var topGradientImageView = UIImageView()
    var backArrowImageView = UIImageView()
    var emojiLabel = UILabel()
    var messageLabel = UILabel()
    var detailLabel = UILabel()
    var timeRemainingRing = UICircularProgressRing()
    var timeRemainingLabel = UILabel()
    var backButton = UIButton()
    
    var searchLottie = AnimationView()
    var searchButton = UIButton()
    var inSearchMode = false
    var blackOpacityLayer = UIView()
    var containerView = UIView()
    var inviteTitleLabel = UILabel()
    var dismissImageView = UIImageView()
    var dismissButton = UIButton()
    var searchContainer = UIView()
    var searchTop: NSLayoutConstraint!
    var searchTextField = UITextField()
    var findFriendsImageView = UIImageView()
    
    let tableView = UITableView()
    
    var contactStore = CNContactStore()
    
    var orderedContacts = [String: [CNContact]]()
    var sortedContactKeys = [String]()
    
    var selectedContacts = [Int]()
    var selectedIndex: IndexPath!
    var sentInvites = 0
    var invitesRequired = 3
    var unlockedRewardView = SingleOptionAlertView()
    
    var loadingView = UIView()
    var loadingLottie = AnimationView()
    
    var registeredUsers: [String] = ["(916) 849-5437", "(562) 754-2689", "(562) 310-4222"]
    var rewardMessage = "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor incididunt ut."
    //reqDetailLabel.setupLineHeight(myText: "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor incididunt ut.", myLineSpacing: 4)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        //self.navigationController?.navigationBar.isHidden = true
        setupHeader()
        setupTableView()
                
        checkStatus { [unowned self] orderedContacts in
            
            self.orderedContacts = orderedContacts
            self.sortedContactKeys = Array(self.orderedContacts.keys).sorted(by: <)
            
            if self.sortedContactKeys.first == "#" {
                self.sortedContactKeys.removeFirst()
                self.sortedContactKeys.append("#")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                UIView.animate(withDuration: 0.5, animations: {
                    self.loadingView.alpha = 0
                }) { (success) in
                    self.loadingView.isHidden = true
                }
            }
        }
        
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeround), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @objc func appMovedToForeround() {
        hideTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        hideTabBar()
        edgesForExtendedLayout = UIRectEdge.bottom
        extendedLayoutIncludesOpaqueBars = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        showTabBar()
    }
    
    func checkStatus(completionHandler: @escaping ([String: [CNContact]]) -> ()) {
            print("status = \(CNContactStore.authorizationStatus(for: .contacts))")
            switch CNContactStore.authorizationStatus(for: .contacts) {
                
            case .notDetermined:
                /// This case means the user is prompted for the first time for allowing contacts
                Contacts.requestAccess { [unowned self] bool, error in
                    self.checkStatus(completionHandler: completionHandler)
                }
                
            case .authorized:
                /// Authorization granted by user for this app.
                DispatchQueue.main.async {
                    self.fetchContacts(completionHandler: completionHandler)
                }
                
            case .denied, .restricted:
                /// User has denied the current app to access the contacts.
                let productName = Bundle.main.infoDictionary!["CFBundleName"]!
                let alert = UIAlertController(title: "Permission denied", message: "\(productName) does not have access to contacts. Please, allow the application to access to your contacts.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Settings", style: .destructive, handler: { (action) in
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(settingsURL)
                    }
                }))
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            @unknown default:
                fatalError()
            }
        }
    
    func fetchContacts(completionHandler: @escaping ([String: [CNContact]]) -> ()) {
        Contacts.fetchContactsGroupedByAlphabets { [unowned self] result in
            switch result {
                
            case .success(let orderedContacts):
                completionHandler(orderedContacts)
                
            case .error(let error):
                print("------ error")
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func contact(at indexPath: IndexPath) -> Contact? {
        //        if searchController.isActive {
        //            return Contact(contact: filteredContacts[indexPath.row])
        //        }
        let key: String = sortedContactKeys[indexPath.section]
        if let contact = orderedContacts[key]?[indexPath.row] {
            return Contact(contact: contact)
        }
        return nil
    }
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension InviteFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        //        if searchController.isActive { return 1 }
        return sortedContactKeys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if searchController.isActive { return filteredContacts.count }
        if let contactsForSection = orderedContacts[sortedContactKeys[section]] {
            return contactsForSection.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        //        if searchController.isActive { return 0 }
        tableView.scrollToRow(at: IndexPath(row: 0, section: index), at: .top , animated: false)
        return sortedContactKeys.firstIndex(of: title)!
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        //        if searchController.isActive { return nil }
        return sortedContactKeys
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = InviteFriendsSectionHeaderView()
        headerView.letterLabel.text = "\(sortedContactKeys[section])"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as! ContactsTableViewCell
        cell.backgroundColor = .clear
        
        guard let contactsToDisplay = contact(at: indexPath) else { return cell }
        
        cell.contactNameLabel.text = contactsToDisplay.displayName
        
        if selectedContacts.contains(indexPath.row) {
            cell.selectedState()
        } else {
            cell.deselectedState()
        }
        
        
        if let phNumber = contactsToDisplay.phones.first?.number {
            if registeredUsers.contains(phNumber) {
                cell.bigPlusImageView.image = UIImage(named: "lynkBlueRed")
                selectedContacts.append(indexPath.row)
            } else {
                cell.bigPlusImageView.image = UIImage(named: "plus-circle1.5")
            }
        }
        
        cell.phoneNumberLabel.text = contactsToDisplay.phones.first?.number
        
        if contactsToDisplay.firstName != "" {
            if let firstCharacter = contactsToDisplay.firstName.character(at: 0) {
                                
                if contactsToDisplay.lastName != "" {
                    if let lastCharacter = contactsToDisplay.lastName.character(at: 0) {
                        cell.nameCircleLabel.text = "\(firstCharacter)\(lastCharacter)"
                    }
                } else {
                    cell.nameCircleLabel.text = "\(firstCharacter)"
                }
            }
        } else {
            cell.nameCircleLabel.text = "#"
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lightImpactGenerator()
        selectedIndex = indexPath
        let cell = tableView.cellForRow(at: indexPath) as! ContactsTableViewCell
        if !selectedContacts.contains(indexPath.row) {
            displayMessageInterface(numberToMessage: cell.phoneNumberLabel.text ?? "")
        } else {
            errorImpactGenerator()
        }
    }

}

//MARK: SCROLLVIEW DELEGATE

extension InviteFriendsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.view.endEditing(true)
        
        if scrollView.contentOffset.y > 0 {
            
            let scrollViewPosition = scrollView.contentOffset.y
            
            let opacityCeiling: CGFloat = 0.75
            let opacityDistance: CGFloat = 40
            
            let shadowState = (scrollViewPosition * opacityCeiling) / opacityDistance  //If I want to increase the distance change 40 and if I want to increase the opacity, change the 0.2
            
            if shadowState <= opacityCeiling {
                //discountNavigationView.layer.shadowOpacity = Float(shadowState)
            } else {
                //discountNavigationView.layer.shadowOpacity = Float(opacityCeiling)
            }
            
        } else {
            
//            discountNavigationView.layer.shadowOpacity = 0
        }
    }
    
}

extension InviteFriendsViewController: MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        if result == .sent {
            print("Message was sent!!!")
            sentInvites += 1
            
            timeRemainingRing.startProgress(to: CGFloat(sentInvites), duration: 2.0)
            timeRemainingLabel.text = "\(sentInvites)/\(invitesRequired)"
            
            if sentInvites == invitesRequired {
                unlockedRewardView.animateViewsin()
                print("🤯🤯🤯")
            } else {
                print("☠️☠️☠️")
            }
            
            
            print("user has not been selected before")
            selectedContacts.append(selectedIndex.row)
            
            let cell = tableView.cellForRow(at: selectedIndex) as? ContactsTableViewCell
            cell?.selectedState()
            
        } else {
            print("Message was not sent!!!")
        }
        
        controller.dismiss(animated: true) {
            print("Go back to Subscription")
        }
        
    }
    
    func displayMessageInterface(numberToMessage: String) {
                
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = [numberToMessage]
        
        //let squadupLink = www.squadupapp.com
        //        composeVC.body = "Download Squad Up and use code 20OFF to get 20% off your first purchase!"
        
        let urlToShare = "https://www.lynkup.com/"

        composeVC.body = "Download Lynk and use code 20OFF to get 50% off your first subscription!\n\n\(urlToShare)"
        
        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
            
        } else {
            print("Can't send messages.")
        }
        
    }
    
}

//MARK: TEXTFIELD DELEGATE

extension InviteFriendsViewController: UITextFieldDelegate {
    
    @objc func animateViewsIn() {
        UIView.animate(withDuration: 0.5, animations: {
            self.containerView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.blackOpacityLayer.alpha = 0.75
            //self.searchTextField.becomeFirstResponder()
        }) { (success) in
            //
        }
    }
    
    @objc func animateViewsOut() {
        lightImpactGenerator()
        UIView.animate(withDuration: 0.5, animations: {
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.blackOpacityLayer.alpha = 0
            self.view.endEditing(true)
        }) { (success) in
            self.dismiss(animated: false) {
                //
            }
        }
    }
    
}

//MARK: ACTIONS

extension InviteFriendsViewController {
    @objc func searchTapped() {
        
        lightImpactGenerator()
        
        if inSearchMode {
            searchLottie.play(fromFrame: 29, toFrame: 50, loopMode: .playOnce, completion: nil)
            searchTop.constant = 30
            inSearchMode = false
        } else {
            searchLottie.play(fromFrame: 0, toFrame: 15, loopMode: .playOnce, completion: nil)
            searchTop.constant = 70
            inSearchMode = true
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            
            if self.inSearchMode {
                self.searchContainer.alpha = 1.0
                self.searchTextField.becomeFirstResponder()
            } else {
                self.searchContainer.alpha = 0
                self.view.endEditing(true)
            }
            
            self.view.layoutIfNeeded()
        }) { (success) in
            
        }
    }
    
    @objc func didTapBack() {
        lightImpactGenerator()
        self.navigationController?.popViewController(animated: true)
    }
    
}
