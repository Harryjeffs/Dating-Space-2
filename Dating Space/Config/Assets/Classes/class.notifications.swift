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
    func sendNotification(user_id: [String], type: notificationTypes){
        let template = notificationString()
        OneSignal.postNotification(["template_id": template.approve_post, "include_external_user_ids": user_id, "data": ["name"]])
    }
}
enum notificationTypes{
    case approve_post
    case post_confirmed
    case post_denied
}
struct notificationString {
    var approve_post : String = "536267af-9ab2-4b25-8edb-b55b4f4e46f0"
    var post_confirmed : String = "536267af-9ab2-4b25-8edb-b55b4f4e46f0"
    var post_denied : String = "536267af-9ab2-4b25-8edb-b55b4f4e46f0"
}
