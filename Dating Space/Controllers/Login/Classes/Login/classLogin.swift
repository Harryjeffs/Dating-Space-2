//
//  classLogin.swift
//  Dating Space
//
//  Created by Harry Jeffs on 22/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import SwiftyJSON
import Firebase
import FBSDKCoreKit
import PushNotifications

class login {
    var db : Firestore!
    func createNewUser(_ auth: AuthDataResult,  success : @escaping (_: Bool) -> Void){
        db = Firestore.firestore()
        print("Users details from facebook", auth.additionalUserInfo?.profile ?? "")
        self.db.collection("users").document(auth.user.uid).setData([
            "friends": [
                "name": "none",
                "uid" : "none"
            ],
            "friend_count" : 0,
            "uuid": auth.user.uid,
            "display_name": auth.user.displayName as Any,
            "user_data": auth.additionalUserInfo?.profile as Any,
            "admin" : false,
            "date_created": NSDate().timeIntervalSince1970,
            "user_settings" : [
                "banned": false,
                "looking_for": "male",
                "location": [
                    "lat" : userDetails.data.currentLocation.coordinate.latitude,
                    "lng" : userDetails.data.currentLocation.coordinate.longitude
                ]
            ]
        ]){ err in
            if let error = err{
                //EZAlertController - alert we couldnt register the user.
                print("Error registering user:", error)
                success(false)
            }else{
                //Perform a segue to the home screen
                //Assign user.uniqueID = auth.user.uid
                userDetails.data.uniqueID = auth.user.uid
                self.generateUserData()
                success(true)
            }
        }
    }
    
    func generateUserData(){
        db = Firestore.firestore()
        
        let params = ["fields": "id, first_name, last_name, middle_name, name, email"]
        GraphRequest(graphPath: "me/friends", parameters: params).start { (connection, result , error) -> Void in
            if error != nil {
                print(error!)
            }
            else {
                if let friendsData = result{
                    let data = JSON(friendsData)
                    if let friends = data["data"].arrayObject{
                        let friendData = ["friend_count": data["summary"]["total_count"].int ?? 0,"friends": friends] as [String : Any]
                        self.db.collection("users").document(userDetails.data.uniqueID).setData(friendData, merge: true)
                    }
                }
            }
        }
    }
    func populateUserData(){
        db = Firestore.firestore()
        if let userId = Auth.auth().currentUser?.uid{
            db.collection("users").document(userId).getDocument { (document, error) in
                if let document = document, document.exists {
                    print(JSON(document.data()))
                    if let jsonData = try? JSONSerialization.data(withJSONObject:document.data()!){
                        let converted = try? JSONDecoder().decode(currentUser.self, from: jsonData)
                        userDetails.data.info = converted
                    }
                } else {
                    print("Document does not exist")
                }
            }
        }
    }
}
