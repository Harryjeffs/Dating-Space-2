//
//  class.notifications.swift
//  Dating Space
//
//  Created by Harry Jeffs on 30/11/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import Firebase
import OneSignal

class notifications{
    var db: Firestore!
    
    func sendNotification(user_id: [String], type: notificationTypes, name: String, post_id: String){
        let notifcation = notification_data()
        db = Firestore.firestore()
        
        let notificationMessage = notifcation.getMessage(type: type, name: name)
        let notification_id = UUID.init().uuidString
        
        db.collection("notifications").document(notification_id).setData([
            "notification_id": notification_id,
            "message": type.rawValue,
            "receiving_user_id" : user_id,
            "notification_read" : false,
            "timestamp": NSDate().timeIntervalSince1970,
            "arguments": name,
            "post_id": post_id
        ]) { err in
            if let error = err{
                print(error)
            }else{
                OneSignal.postNotification(notifcation.getData(type: type, post_id: "", message: notificationMessage, users: user_id))
            }
        }
    }
}

class notification_data{
    func getData(type: notificationTypes, post_id: String, message: String, users: [String])-> [String:Any] {
        switch type {
        case .approve_post:
            return ["contents": ["en": message],"data": ["post_id": post_id],"buttons": [["id": "c9558cd1-586b-44ae-9be6-797fe3956191", "text": "Approve"], ["id": "c0508d72-a05b-4f3e-a186-3a6e6b6b38bd", "text": "Disapprove"]], "include_external_user_ids": users]
        case .post_confirmed:
             return ["contents": ["en": message],"data": ["post_id": post_id], "include_external_user_ids": users]
        case .post_denied:
            return ["contents": ["en": message],"data": ["post_id": post_id], "include_external_user_ids": users]
        }
    }
    func getMessage(type: notificationTypes, name: String) -> String{
        var message:String = ""
        
        switch type {
            case .approve_post: message = "{{name}} has created a profile for you! Click to confirm"
            case .post_confirmed: message = "{{name}} has approved your post!"
            case .post_denied: message = "{{name}} has declined your post!"
        }
        return message.replacingOccurrences(of: "{{name}}", with: name)
    }
}

enum notificationTypes : String {
    case approve_post
    case post_confirmed
    case post_denied
}
