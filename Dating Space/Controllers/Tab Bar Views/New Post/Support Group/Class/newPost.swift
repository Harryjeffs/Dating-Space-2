//
//  newPost.swift
//  Dating Space
//
//  Created by Harry Jeffs on 27/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import Firebase

class newPost {
    
    var db : Firestore!
    var documentID: String = ""
    
    func createDatabase(_ success: @escaping(_: Bool) -> Void ){
        db = Firestore.firestore()
        self.db.collection("users").document(UUID().uuidString).setData([
            "friends": [
                "name": "none",
                "uid" : "none"
            ],
            "friend_count" : 0,
            "uuid": "auth.user.uid",
            "display_name": "auth.user.displayName as Any",
            "user_data": "auth.additionalUserInfo?.profile as Any",
            "admin" : false,
            "user_settings" : [
                "banned": false,
                "looking_for": "male",
                "location": [
                    "lat" : userDetails.data.currentLocation.coordinate.latitude,
                    "lng" : userDetails.data.currentLocation.coordinate.longitude
                ]
            ]
        ]){ err in
            if let _ = err{
                //EZAlertController - alert we couldnt register the user.
                success(false)
            }else{
                //Perform a segue to the home screen
                //Assign user.uniqueID = auth.user.uid
                //userDetails.data.uniqueID = auth.user.uid
                //self.generateUserData()
                success(true)
            }
        }
        //return documentID
    }
}
