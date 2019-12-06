//
//  notificationsViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 26/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import Firebase
import OneSignal
import SwiftyJSON
import CyaneaOctopus

class notificationsViewController: UITableViewController {

    var db: Firestore!
    var notificationCount = 0
    var notificationUnreadCount = 0
    var notificationData = [notificationCellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications() // To remove all delivered notifications
        center.removeAllPendingNotificationRequests() // To remove all pending notifications which are not delivered yet but scheduled.
        
        view.backgroundColor = .white
        self.title = "Notifications"
        
        overrideUserInterfaceStyle = .light
        
        self.tableView.register(notificationCell.self, forCellReuseIdentifier: "notificationCell")

        db = Firestore.firestore()
        
        db.collection("notifications").whereField("receiving_user_id", arrayContains: userDetails.data.uniqueID)
        .addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            self.notificationData.removeAll()
            self.notificationUnreadCount = 0
            
            self.notificationCount = documents.count
            
            for i in 0...self.notificationCount - 1{
                if let jsonData = try? JSONSerialization.data(withJSONObject: documents[i].data()){
                    if let converted = try? JSONDecoder().decode(notificationCellData.self, from: jsonData){
                        if !converted.notificationRead{
                            self.notificationUnreadCount += 1
                        }
                        self.notificationData.append(converted)
                    }
                }
            }
            self.tabBarController?.tabBar.items?[1].badgeValue = String(self.notificationUnreadCount)
            self.tableView.reloadData()
        }
    }
}

//Delegate
extension notificationsViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationCount
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

//Datasource
extension notificationsViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell") as! notificationCell
        
        cell.accessoryType = .disclosureIndicator
        
        cell.placeholderImage.backgroundColor = UIColor.randomFlatColor()
        cell.mainTitle.text = notification_data().getMessage(type: notificationTypes(rawValue: notificationData[indexPath.row].message)!, name: notificationData[indexPath.row].arguments)
        cell.timeSinceLabel.text =  (NSDate(timeIntervalSince1970: notificationData[indexPath.row].timestamp) as Date).timeAgo(numericDates: false)
        
        return cell
    }
}
// MARK: - CurrentUser
struct notificationCellData: Codable {
    let postId: String
    let timestamp: Double
    let notificationId: String
    let message: String
    let notificationRead: Bool
    let arguments: String
    let receivingUserId: [String]
    
    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case timestamp = "timestamp"
        case notificationId = "notification_id"
        case message = "message"
        case notificationRead = "notification_read"
        case arguments = "arguments"
        case receivingUserId = "receiving_user_id"
    }
}
